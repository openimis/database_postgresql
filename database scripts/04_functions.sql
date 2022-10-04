CREATE OR REPLACE FUNCTION "public"."udfAPIisValidMaritalStatus"(
	MaritalStatusCode VARCHAR(1)
)
RETURNS BIT
AS $$
DECLARE
	isValid BIT := 0;
	msc VARCHAR(1)[] :=('N'),('W'),('S'),('D'),('M'),(NULL);
	x VARCHAR(1);
BEGIN
FOREACH x in ARRAY msc
	LOOP
	IF MaritalStatusCode = x THEN
		isValid := 1;
	END IF;
END LOOP;
RETURN(isValid);
END
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "public"."udfAvailablePremium"
(
	"theMonth" INT,
	"theYear" INT,
	"theMode" INT,	--1:Product Base, 2:Officer Mode
	"ProdID" INT = 0,
	"LocationId" INT = 0
)
RETURNS TABLE("ProdId" INT, "Allocated" FLOAT,"Officer" VARCHAR(50),"LastName" VARCHAR(50),"OtherNames" VARCHAR(50))
AS $$
DECLARE theDate DATE;
	DaysInMonth INT;
	EndDate DATE;
BEGIN
	SELECT theDate = CAST(CAST(theYear AS VARCHAR(4)) + '-' + CAST(theMonth AS VARCHAR(2)) + '-' + '01' AS DATE);
	SELECT DaysInMonth = DATEDIFF_DAY(theDate,DATEADD_MONTH(1,theDate));
	SELECT EndDate = CAST(CAST(theYear AS VARCHAR(4)) + '-' + CAST(theMonth AS VARCHAR(2)) + '-' + CAST(DaysInMonth AS VARCHAR(2)) AS DATE);

	IF theMode = 1 THEN
		BEGIN
			RETURN QUERY
			WITH Allocation AS
			(
				SELECT PL."ProdID",
				CASE 
				WHEN MONTH(DATEADD_DAY(-1,PL."ExpiryDate")) = theMonth AND YEAR(DATEADD_DAY(-1,PL."ExpiryDate")) = theYear AND (DAY(PL."ExpiryDate")) > 1
					THEN CASE WHEN DATEDIFF_DAY(CASE WHEN PR."PayDate" < theDate THEN theDate ELSE PR."PayDate" END,PL."ExpiryDate") = 0 THEN 1 ELSE DATEDIFF_DAY(CASE WHEN PR."PayDate" < theDate THEN theDate ELSE PR."PayDate" END,PL."ExpiryDate") END  * ((SUM(PR."Amount"))/(CASE WHEN (DATEDIFF_DAY(CASE WHEN PR."PayDate" < PL."EffectiveDate" THEN PL."EffectiveDate" ELSE PR."PayDate" END,PL."ExpiryDate")) <= 0 THEN 1 ELSE DATEDIFF_DAY(CASE WHEN PR."PayDate" < PL."EffectiveDate" THEN PL."EffectiveDate" ELSE PR."PayDate" END,PL."ExpiryDate") END))
				WHEN MONTH(CASE WHEN PR."PayDate" < PL."EffectiveDate" THEN PL."EffectiveDate" ELSE PR."PayDate" END) = theMonth AND YEAR(CASE WHEN PR."PayDate" < PL."EffectiveDate" THEN PL."EffectiveDate" ELSE PR."PayDate" END) = theYear
					THEN ((DaysInMonth + 1 - DAY(CASE WHEN PR."PayDate" < PL."EffectiveDate" THEN PL."EffectiveDate" ELSE PR."PayDate" END)) * ((SUM(PR."Amount"))/CASE WHEN DATEDIFF_DAY(CASE WHEN PR."PayDate" < PL."EffectiveDate" THEN PL."EffectiveDate" ELSE PR."PayDate" END,PL."ExpiryDate") <= 0 THEN 1 ELSE DATEDIFF_DAY(CASE WHEN PR."PayDate" < PL."EffectiveDate" THEN PL."EffectiveDate" ELSE PR."PayDate" END,PL."ExpiryDate") END)) 
				WHEN PL."EffectiveDate" < theDate AND PL."ExpiryDate" > EndDate AND PR."PayDate" < theDate
					THEN DaysInMonth * (SUM(PR."Amount")/CASE WHEN (DATEDIFF_DAY(CASE WHEN PR."PayDate" < PL."EffectiveDate" THEN PL."EffectiveDate" ELSE PR."PayDate" END,DATEADD_DAY(-1,PL."ExpiryDate"))) <= 0 THEN 1 ELSE DATEDIFF_DAY(CASE WHEN PR."PayDate" < PL."EffectiveDate" THEN PL."EffectiveDate" ELSE PR."PayDate" END,PL."ExpiryDate") END)
				END Allocated
				FROM "tblPremium" PR 
				INNER JOIN "tblPolicy" PL ON PR."PolicyID" = PL."PolicyID"
				INNER JOIN "tblFamilies" Fam ON PL."FamilyID" = Fam."FamilyId"
				INNER JOIN "tblVillages" V ON V."VillageId" = Fam."LocationId"
				INNER JOIN "tblWards" W ON W."WardId" = V."WardId"
				INNER JOIN "tblDistricts" D ON D."DistrictId" = W."DistrictId"
				WHERE PR."ValidityTo" IS NULL
				AND PL."ValidityTo" IS NULL
				AND PL."ProdID" = ProdId
				AND PL."PolicyStatus" <> 1
				AND PR."PayDate" <= PL."ExpiryDate"
				AND (D."Region" = "LocationId" OR D."DistrictId" = "LocationId" OR "LocationId" = 0)
				GROUP BY PL."ProdID", PL."ExpiryDate", PR."PayDate",PL."EffectiveDate"
			)
			INSERT INTO Result("ProdId","Allocated")
			SELECT "ProdId", ISNULL(SUM("Allocated"), 0)"Allocated"
			FROM Allocation
			GROUP BY "ProdId";
		END;
	ELSIF theMode = 2 THEN
		BEGIN
			RETURN QUERY
			WITH Allocation AS
			(
				SELECT PL."ProdID",
				CASE 
				WHEN MONTH(DATEADD_DAY(-1,PL."ExpiryDate")) = theMonth AND YEAR(DATEADD_DAY(-1,PL."ExpiryDate")) = theYear AND (DAY(PL."ExpiryDate")) > 1
					THEN CASE WHEN DATEDIFF_DAY(CASE WHEN PR."PayDate" < theDate THEN theDate ELSE PR."PayDate" END,PL."ExpiryDate") = 0 THEN 1 ELSE DATEDIFF_DAY(CASE WHEN PR."PayDate" < theDate THEN theDate ELSE PR."PayDate" END,PL."ExpiryDate") END  * ((SUM(PR."Amount"))/(CASE WHEN (DATEDIFF_DAY(CASE WHEN PR."PayDate" < PL."EffectiveDate" THEN PL."EffectiveDate" ELSE PR."PayDate" END,PL."ExpiryDate")) <= 0 THEN 1 ELSE DATEDIFF_DAY(CASE WHEN PR."PayDate" < PL."EffectiveDate" THEN PL."EffectiveDate" ELSE PR."PayDate" END,PL."ExpiryDate") END))
				WHEN MONTH(CASE WHEN PR."PayDate" < PL."EffectiveDate" THEN PL."EffectiveDate" ELSE PR."PayDate" END) = theMonth AND YEAR(CASE WHEN PR."PayDate" < PL."EffectiveDate" THEN PL."EffectiveDate" ELSE PR."PayDate" END) = theYear
					THEN ((DaysInMonth + 1 - DAY(CASE WHEN PR."PayDate" < PL."EffectiveDate" THEN PL."EffectiveDate" ELSE PR."PayDate" END)) * ((SUM(PR."Amount"))/CASE WHEN DATEDIFF_DAY(CASE WHEN PR."PayDate" < PL."EffectiveDate" THEN PL."EffectiveDate" ELSE PR."PayDate" END,PL."ExpiryDate") <= 0 THEN 1 ELSE DATEDIFF_DAY(CASE WHEN PR."PayDate" < PL."EffectiveDate" THEN PL."EffectiveDate" ELSE PR."PayDate" END,PL."ExpiryDate") END)) 
				WHEN PL."EffectiveDate" < theDate AND PL."ExpiryDate" > EndDate AND PR."PayDate" < theDate
					THEN DaysInMonth * (SUM(PR."Amount")/CASE WHEN (DATEDIFF_DAY(CASE WHEN PR."PayDate" < PL."EffectiveDate" THEN PL."EffectiveDate" ELSE PR."PayDate" END,DATEADD_DAY(-1,PL."ExpiryDate"))) <= 0 THEN 1 ELSE DATEDIFF_DAY(CASE WHEN PR."PayDate" < PL."EffectiveDate" THEN PL."EffectiveDate" ELSE PR."PayDate" END,PL."ExpiryDate") END)
				END Allocated,
				O."Code", O."LastName", O."OtherNames"
				FROM "tblPremium" PR INNER JOIN "tblPolicy" PL ON PR."PolicyID" = PL."PolicyID"
				INNER JOIN "tblFamilies" Fam ON PL."FamilyID" = Fam."FamilyId"
				INNER JOIN "tblVillages" V ON V."VillageId" = Fam."LocationId"
				INNER JOIN "tblWards" W ON W."WardId" = V."WardId"
				INNER JOIN "tblDistricts" D ON D."DistrictId" = W."DistrictId"
				INNER JOIN "tblOfficer" O ON PL."OfficerId" = O."OfficerID"
				WHERE PR."ValidityTo" IS NULL
				AND PL."ValidityTo" IS NULL
				AND O."ValidityTo" IS NULL
				AND (D."Region" = LocationId OR D."DistrictId" = LocationId OR LocationId = 0)
				AND PL."PolicyStatus" <> 1
				AND PR."PayDate" <= PL."ExpiryDate"
				GROUP BY PL."ProdID", PL."ExpiryDate", PR."PayDate",PL."EffectiveDate", O."Code", O."LastName", O."OtherNames"
			)
			INSERT INTO Result("ProdId","Allocated","Officer","LastName","OtherNames")
			SELECT "ProdId", ISNULL(SUM("Allocated"), 0)"Allocated", "Code", "LastName", "OtherNames"
			FROM Allocation
			GROUP BY "ProdId", "Code", "LastName", "OtherNames";
		END; 
	END IF;
END $$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "public"."udfCollectedContribution"(
	DateFrom DATE, 
	DateTo DATE, 
	OfficerId INT
)

RETURNS DECIMAL(18,2)
AS $$
DECLARE
	LegacyOfficer INT;
BEGIN
	CREATE TEMPORARY TABLE tblOfficerSub(OldOfficer INT, NewOfficer INT);
	INSERT INTO tblOfficerSub(OldOfficer, NewOfficer) 
	SELECT DISTINCT "OfficerID", "OfficerID";

	LegacyOfficer = (SELECT "OfficerID" FROM "tblOfficer" WHERE "ValidityTo" IS NULL AND "OfficerIDSubst" = "OfficerID");
	WHILE LegacyOfficer IS NOT NULL
		LOOP
			INSERT INTO tblOfficerSub(OldOfficer, NewOfficer) 
			SELECT DISTINCT "OfficerID", LegacyOfficer;
			IF EXISTS(SELECT 1 FROM tblOfficerSub  GROUP BY NewOfficer HAVING COUNT(1) > 1) THEN
				EXIT;
			END IF;
			LegacyOfficer = (SELECT "OfficerID" FROM "tblOfficer" WHERE "ValidityTo" IS NULL AND "OfficerIDSubst" = LegacyOfficer);
		END LOOP;
	RETURN(
	SELECT SUM("Amount")  FROM "tblPremium" PR
	INNER JOIN "tblPolicy" PL ON PL."PolicyID" = PR."PolicyID"
	INNER JOIN tblOfficerSub O ON O.NewOfficer = PL."OfficerID"
	WHERE 
	PL."ValidityTo" IS NULL
	AND PR."ValidityTo" IS NULL
	AND "PayDate" >= DateFrom
	AND "PayDate" <= DateTo
	);
END $$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "public"."udfExpiredPolicies"
(
	theMonth INT,
	theYear INT,
	theMode INT,	--1:Product base, 2: Officer Base
	ProdID INT = 0,
	LocationId INT = 0
)
RETURNS TABLE("ProdId" INT, "ExpiredPolicies" INT, "Officer" VARCHAR(50), "LastName" VARCHAR(50), "OtherNames" VARCHAR(50))
AS $$
DECLARE
	var INT;
BEGIN
	IF theMode = 1 THEN
		RETURN QUERY
		SELECT PL."ProdID" AS "ProdId", COUNT(PL."PolicyID") AS "ExpiredPolicies"
		FROM "tblPolicy" PL 
		INNER JOIN "tblFamilies" F ON F."FamilyId" = PL."FamilyId"
		INNER JOIN "tblVillages" V ON V."VillageId" = F."LocationId"
		INNER JOIN "tblWards" W ON W."WardId" = V."WardId"
		INNER JOIN "tblDistricts" D ON D."DistrictId" = W."DistrictId"
		WHERE PL."ValidityTo" IS NULL 
		AND F."ValidityTo" IS NULL
		AND PL."PolicyStatus" >1  --Uncommented By Rogers for PrimaryIndicator1 Report
		AND MONTH(PL."ExpiryDate") = theMonth AND YEAR(PL."ExpiryDate") = theYear
		AND (PL."ProdID" = ProdID OR ProdID = 0)
		AND (D."Region" = LocationId OR D."DistrictId"= LocationId OR LocationId = 0)
		GROUP BY PL."ProdID";
	ELSIF theMode = 2 THEN
		RETURN QUERY
		SELECT PL."ProdID" AS "ProdID", COUNT(PL."PolicyID") AS "ExpiredPolicies", O."Code" AS "Officer", O."LastName" AS "LastName" ,O."OtherNames" AS "OtherNames"
		FROM "tblPolicy" PL 
		INNER JOIN "tblFamilies" F ON F."FamilyId" = PL."FamilyId"
		INNER JOIN "tblVillages" V ON V."VillageId" = F."LocationId"
		INNER JOIN "tblWards" W ON W."WardId" = V."WardId"
		INNER JOIN "tblDistricts" D ON D."DistrictId" = W."DistrictId"
		INNER JOIN "tblOfficer" O ON PL."OfficerID" = O."OfficerID"
		WHERE PL."ValidityTo" IS NULL 
		AND F."ValidityTo" IS NULL
		AND PL."PolicyStatus" >1  --Uncommented By Rogers for PrimaryIndicator1 Report
		AND MONTH(PL."ExpiryDate") = theMonth AND YEAR(PL."ExpiryDate") = theYear
		AND (PL."ProdID" = ProdID OR ProdID = 0)
		AND (D."Region" = LocationId OR D."DistrictId" = LocationId OR LocationId = 0)
		GROUP BY PL."ProdID",O."Code",O."LastName",O."OtherNames";
	END IF;
	RETURN;
END $$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "public"."udfExpiredPoliciesPhoneStatistics"(
	DateFrom DATE, 
	DateTo DATE, 
	OfficerId INT
)

RETURNS INT
AS $$
DECLARE
	LegacyOfficer INT;
BEGIN
	SELECT "OfficerID" INTO LegacyOfficer FROM "tblOfficer" WHERE "ValidityTo" IS NULL AND "OfficerIDSubst" = "OfficerID";
	CREATE TEMP TABLE tblOfficerSub(OldOfficer INT, NewOfficer INT);
	
	INSERT INTO tblOfficerSub(OldOfficer, NewOfficer) 
	SELECT DISTINCT OfficerID, OfficerID;
	
	WHILE LegacyOfficer IS NOT NULL LOOP
			INSERT INTO tblOfficerSub(OldOfficer, NewOfficer) 
			SELECT DISTINCT OfficerID, LegacyOfficer; 
			IF EXISTS (SELECT 1 FROM tblOfficerSub  GROUP BY NewOfficer HAVING COUNT(1) > 1) THEN
				EXIT;
			END IF;
			SELECT "OfficerID" INTO LegacyOfficer FROM "tblOfficer" WHERE "ValidityTo" IS NULL AND "OfficerIDSubst" = LegacyOfficer;
	END LOOP;
	
	RETURN(
			SELECT COUNT(1) ExpiredPolicies
			FROM "tblPolicy" PL
			LEFT OUTER JOIN (SELECT PL."PolicyID", F."FamilyID", PR."ProdID"
			FROM "tblPolicy" PL 
			INNER JOIN "tblFamilies" F ON F."FamilyId" = PL."FamilyId"
			INNER JOIN "tblProduct" PR ON PR."ProdID" = PL."ProdID" OR PL."ProdID" = PR."ConversionProdID"
			WHERE 
			PL."ValidityTo" IS NULL 
			AND F."ValidityTo" IS NULL
			AND PR."ValidityTo" IS NULL
			AND PL."PolicyStage" = 'R'
			) R ON PL."ProdID" = R."ProdID" AND PL."FamilyID" = R."FamilyID"
			INNER JOIN tblOfficerSub O ON O."NewOfficer" = PL."OfficerID"
			WHERE
			PL."ValidityTo" IS NULL
			AND PL."PolicyStatus" = 8
			AND R."PolicyID" IS NULL
			AND (PL."ExpiryDate" >= DateFrom AND PL."ExpiryDate" <= DateTo)
			
	);
	DROP TABLE tblOfficerSub;
END $$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "public"."udfGetSnapshotIndicators"(
	theDate DATE, 
	OfficerId INT
) RETURNS TABLE("Active" INT, "Expired" INT, "Idle" INT, "Suspended" INT)
AS $$
DECLARE
	Active INT=0;
	Expired INT=0;
	Idle INT=0;
	Suspended INT=0;
	LegacyOfficer INT;
BEGIN
	CREATE TEMP TABLE tblOfficerSub(OldOfficer INT, NewOfficer INT);
	INSERT INTO tblOfficerSub(OldOfficer, NewOfficer)
	SELECT DISTINCT OfficerId, OfficerId;

	SELECT "OfficerID" INTO LegacyOfficer FROM "tblOfficer" WHERE "ValidityTo" IS NULL AND "OfficerIDSubst" = OfficerId;
	WHILE LegacyOfficer IS NOT NULL LOOP
		INSERT INTO tblOfficerSub(OldOfficer, NewOfficer) 
		SELECT DISTINCT OfficerID, LegacyOfficer;
		IF EXISTS(SELECT 1 FROM tblOfficerSub GROUP BY NewOfficer HAVING COUNT(1) > 1) THEN
			EXIT;
		END IF;
		SELECT "OfficerID" INTO LegacyOfficer FROM "tblOfficer" WHERE "ValidityTo" IS NULL AND "OfficerIDSubst" = LegacyOfficer;
	END LOOP;

	SELECT COUNT(DISTINCT P.FamilyID) ActivePolicies INTO Active
	FROM "tblPolicy" P 
	INNER JOIN tblOfficerSub O ON P."OfficerID" = O."NewOfficer"
	WHERE P."ValidityTo" IS NULL AND P."PolicyStatus" = 2 
	AND "ExpiryDate" >= theDate;

	SELECT COUNT(1) "ExpiredPolicies" INTO Expired
		FROM "tblPolicy" PL
		LEFT OUTER JOIN (SELECT PL."PolicyID", F."FamilyID", PR."ProdID"
		FROM "tblPolicy" PL 
		INNER JOIN "tblFamilies" F ON F."FamilyID" = PL."FamilyID"
		INNER JOIN "tblProduct" PR ON PR."ProdID" = PL."ProdID" OR PL."ProdID" = PR."ConversionProdID"
		WHERE 
		PL."ValidityTo" IS NULL 
		AND F."ValidityTo" IS NULL
		AND PR."ValidityTo" IS NULL
		AND PL."PolicyStage" = 'R'
		AND  PL."PolicyStatus" = 2
		) R ON PL."ProdID" = R."ProdID" AND PL."FamilyID" = R."FamilyID"
		INNER JOIN tblOfficerSub O ON PL."OfficerID" = O.NewOfficer
		WHERE
		PL."ValidityTo" IS NULL
		AND PL."PolicyStatus" = 8
		AND R."PolicyID" IS NULL
		AND PL."ExpiryDate" = theDate;
	
	SELECT COUNT(DISTINCT PL."FamilyID") IdlePolicies INTO Idle 
		FROM "tblPolicy" PL 
		INNER JOIN tblOfficerSub O ON PL."OfficerID" = O.NewOfficer
		INNER JOIN "tblProduct" PR ON PR."ProdID" = PL."ProdID"
		LEFT OUTER JOIN (SELECT "FamilyID", "ProdID" FROM "tblPolicy" WHERE "ValidityTo" IS NULL AND "PolicyStatus" =2 AND  "ExpiryDate" >= theDate) ActivePolicies ON ActivePolicies."FamilyID" = PL."FamilyID" AND (ActivePolicies."ProdID" = PL."ProdID" OR ActivePolicies."ProdID" = PR."ConversionProdID")
		WHERE PL."ValidityTo" IS NULL AND PL."PolicyStatus" = 1 
		AND "ExpiryDate" >= theDate
		AND ActivePolicies."ProdID" IS NULL;
	
	SELECT COUNT(DISTINCT PL.FamilyID) SuspendedPolicies INTO Suspended
		FROM "tblPolicy" PL 
		INNER JOIN tblOfficerSub O ON PL."OfficerID" = O.NewOfficer
		INNER JOIN "tblProduct" PR ON PR."ProdID" = PL."ProdID"
		LEFT OUTER JOIN (SELECT "FamilyID", "ProdID" FROM "tblPolicy" WHERE "ValidityTo" IS NULL AND "PolicyStatus" = 2 AND "ExpiryDate" >= theDate) ActivePolicies ON ActivePolicies."FamilyID" = PL."FamilyID" AND (ActivePolicies."ProdID" = PL."ProdID" OR ActivePolicies."ProdID" = PR."ConversionProdID")
		WHERE PL."ValidityTo" IS NULL AND PL."PolicyStatus" = 4
		AND "ExpiryDate" >= theDate
		AND ActivePolicies."ProdID" IS NULL;
		
	RETURN QUERY
	SELECT Active AS "Active", Expired AS "Expired", Idle AS "Idle", Suspended AS "Suspended";
	
	DROP TABLE tblOfficerSub;
END $$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "public"."udfNewlyPremiumCollected"
-- CAREFUL! I had to change the order of input parameters!
(
	theMonth INT,
	theYear INT,
	theMode INT,	--1:Product Base, 2:Officer Base
	ProdID INT = 0,
	LocationId INT = 0
)
RETURNS TABLE("ProdId" INT, "PremiumCollection" FLOAT, "Officer" VARCHAR(50), "LastName" VARCHAR(50), "OtherNames" VARCHAR(50))
AS $$
BEGIN
IF theMode = 1 THEN
	RETURN QUERY
	SELECT PL."ProdID", SUM(PR.Amount) AS "PremiumCollection"
	FROM "tblPolicy" PL 
	INNER JOIN "tblFamilies" Fam ON PL."FamilyID" = Fam."FamilyId"
	INNER JOIN "tblVillages" V ON V."VillageId" = Fam."LocationId"
	INNER JOIN "tblWards" W ON W."WardId" = V."WardId"
	INNER JOIN "tblDistricts" D ON D."DistrictId" = W."DistrictId"
	LEFT OUTER JOIN "tblPremium" PR ON PL."PolicyID" = PR."PolicyID"
	WHERE PR."ValidityTo" IS NULL
	AND (PL."ProdID" = ProdID OR ProdID = 0)
	AND (D."Region" = LocationId OR D."DistrictId" = LocationId OR LocationId = 0)
	AND MONTH(PR."PayDate") = theMonth AND YEAR(PR."PayDate") = theYear
	GROUP BY PL."ProdID";
ELSIF Mode = 2 THEN
	RETURN QUERY
	SELECT PL."ProdID", SUM(PR.Amount) AS "PremiumCollection", O."Code" AS "Officer", O."LastName", O."OtherNames"
	FROM "tblPolicy" PL 
	INNER JOIN "tblFamilies" Fam ON PL."FamilyID" = Fam."FamilyId"
	INNER JOIN "tblVillages" V ON V."VillageId" = Fam."LocationId"
	INNER JOIN "tblWards" W ON W."WardId" = V."WardId"
	INNER JOIN "tblDistricts" D ON D."DistrictId" = W."DistrictId"
	INNER JOIN "tblOfficer" O ON PL."OfficerID" = O."OfficerID"
	LEFT OUTER JOIN "tblPremium" PR ON PL."PolicyID" = PR."PolicyID"
	WHERE PR."ValidityTo" IS NULL
	AND (D."Region" = LocationId OR D."DistrictId" = LocationId OR LocationId = 0)
	AND (PL."ProdID" = ProdID OR ProdID = 0)
	AND (D."Region" = LocationId OR D."DistrictId" = LocationId OR LocationId = 0)
	AND MONTH(PR."PayDate") = theMonth AND YEAR(PR."PayDate") = theYear
	GROUP BY PL."ProdID", O."Code", O."LastName", O."OtherNames";
END IF;
RETURN;
END $$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "public"."udfNewPolicies"
-- CAREFUL! I had to change the order of input parameters!
(
	theMonth INT,
	theYear INT,
	theMode INT,	--1: Product Base, 2: Enrollment Officer Base
	ProdID INT,
	LocationId INT = 0
)
RETURNS TABLE("ProdId" INT, "Male" INT, "Female" INT, "Other" INT, "Officer" VARCHAR(50), "LastName" VARCHAR(50), "OtherNames" VARCHAR(50))
AS $$
BEGIN
IF theMode = 1 THEN
	CREATE TEMP TABLE NewPolicies AS
	SELECT PL."ProdID", I."Gender", I."InsureeID"
	FROM "tblPolicy" PL 
	INNER JOIN "tblFamilies" Fam ON PL."FamilyID" = Fam."FamilyID"
	INNER JOIN "tblVillages" V ON V."VillageId" = Fam."LocationId"
	INNER JOIN "tblWards" W ON W."WardId" = V."WardId"
	INNER JOIN "tblDistricts" D ON D."DistrictId" = W."DistrictId"
	INNER JOIN "tblRegions" R ON R."RegionId" = D."Region"
	INNER JOIN "tblInsuree" I ON I."InsureeID" = Fam."InsureeID"
	WHERE PL."ValidityTo" IS NULL
	AND Fam."ValidityTo" IS NULL
	AND V."ValidityTo" IS NULL
	AND W."ValidityTo" IS NULL
	AND D."ValidityTo" IS NULL
	AND R."ValidityTo" IS NULL
	AND I."ValidityTo" IS NULL
	AND PL."PolicyStatus" > 1
	AND PL."PolicyStage" = N'N'
	AND (PL."ProdID" = ProdID OR ProdID = 0)
	AND (R."RegionId" = LocationId OR D."DistrictId" = LocationId OR LocationId = 0)
	AND MONTH(PL."EnrollDate") = theMonth
	AND YEAR(PL."EnrollDate") = theYear;
	
	RETURN QUERY
	WITH M AS (
		SELECT "ProdID", COUNT("InsureeID")::INT AS "Male" FROM NewPolicies WHERE "Gender" = 'M' GROUP BY "ProdID"
	), F AS (
		SELECT "ProdID", COUNT("InsureeID")::INT AS "Female" FROM NewPolicies WHERE "Gender" = 'F' GROUP BY "ProdID"
	), O AS (
		SELECT "ProdID", COUNT("InsureeID")::INT AS "Other" FROM NewPolicies WHERE "Gender" = 'O' GROUP BY "ProdID"
	) SELECT NewPolicies."ProdID", M."Male", F."Female", O."Other", NULL::VARCHAR(50) AS "Officer", NULL ::VARCHAR(50)as "LastName", NULL::VARCHAR(50) as "OtherNames"
	FROM NewPolicies
	INNER JOIN M ON NewPolicies."ProdID" = M."ProdID"
	INNER JOIN F ON NewPolicies."ProdID" = F."ProdID"
	INNER JOIN O ON NewPolicies."ProdID" = O."ProdID";
	DROP TABLE NewPolicies;
ELSIF theMode = 2 THEN
	CREATE TEMP TABLE NewPolicies AS
	SELECT PL."ProdID", O."Code" AS "Officer", O."LastName", O."OtherNames", I."InsureeID", I."Gender"
	FROM "tblPolicy" PL 
	INNER JOIN "tblFamilies" Fam ON PL."FamilyID" = Fam."FamilyID"
	INNER JOIN "tblVillages" V ON V."VillageId" = Fam."LocationId"
	INNER JOIN "tblWards" W ON W."WardId" = V."WardId"
	INNER JOIN "tblDistricts" D ON D."DistrictId" = W."DistrictId"
	INNER JOIN "tblRegions" R ON R."RegionId" = D."Region"
	INNER JOIN "tblInsuree" I ON I."InsureeID" = Fam."InsureeID"
	INNER JOIN "tblOfficer" O ON O."OfficerID" = PL."OfficerID"
	WHERE PL."ValidityTo" IS NULL
	AND Fam."ValidityTo" IS NULL
	AND V."ValidityTo" IS NULL
	AND W."ValidityTo" IS NULL
	AND D."ValidityTo" IS NULL
	AND R."ValidityTo" IS NULL
	AND I."ValidityTo" IS NULL
	AND O."ValidityTo" IS NULL
	AND PL."PolicyStatus" > 1
	AND PL."PolicyStage" = N'N'
	AND (PL."ProdID" = ProdID OR ProdID = 0)
	AND (R."RegionId" = LocationId OR D."DistrictId" = LocationId OR LocationId = 0)
	AND MONTH(PL."EnrollDate") = theMonth
	AND YEAR(PL."EnrollDate") = theYear;
	
	RETURN QUERY
	WITH M AS (
		SELECT "ProdID", COUNT("InsureeID")::INT AS "Male" FROM NewPolicies WHERE "Gender" = 'M' GROUP BY "ProdID"
	), F AS (
		SELECT "ProdID", COUNT("InsureeID")::INT AS "Female" FROM NewPolicies WHERE "Gender" = 'F' GROUP BY "ProdID"
	), O AS (
		SELECT "ProdID", COUNT("InsureeID")::INT AS "Other" FROM NewPolicies WHERE "Gender" = 'O' GROUP BY "ProdID"
	) SELECT NewPolicies."ProdID", M."Male", F."Female", O."Other", NewPolicies."Officer", NewPolicies."LastName", NewPolicies."OtherNames"
	FROM NewPolicies
	INNER JOIN M ON NewPolicies."ProdID" = M."ProdID"
	INNER JOIN F ON NewPolicies."ProdID" = F."ProdID"
	INNER JOIN O ON NewPolicies."ProdID" = O."ProdID";
	DROP TABLE NewPolicies;
END IF;
RETURN;
END $$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "public"."udfNewPoliciesPhoneStatistics"(
	DateFrom DATE,
	DateTo DATE,
	OfficerId INT
)
RETURNS INT
AS $$
DECLARE
	LegacyOfficer INT;
BEGIN
	CREATE TEMP TABLE tblOfficerSub(OldOfficer INT, NewOfficer INT);
	INSERT INTO tblOfficerSub(OldOfficer, NewOfficer)
	SELECT DISTINCT OfficerId, OfficerId;

	SELECT OfficerID INTO LegacyOfficer FROM "tblOfficer" WHERE "ValidityTo" IS NULL AND "OfficerIDSubst" = OfficerID;
	WHILE LegacyOfficer IS NOT NULL LOOP
		INSERT INTO tblOfficerSub(OldOfficer, NewOfficer) 
		SELECT DISTINCT OfficerID, LegacyOfficer;
		IF EXISTS(SELECT 1 FROM tblOfficerSub  GROUP BY NewOfficer HAVING COUNT(1) > 1) THEN
			EXIT;
		END IF;
		SELECT OfficerID INTO LegacyOfficer FROM "tblOfficer" WHERE "ValidityTo" IS NULL AND "OfficerIDSubst" = LegacyOfficer;
	END LOOP;

	RETURN (
	SELECT COUNT(1)
	FROM "tblPolicy" PL
	INNER JOIN tblOfficerSub O ON O.NewOfficer = PL.OfficerID
	WHERE PL."ValidityTo" IS NULL AND "PolicyStage" ='N' AND "EnrollDate" >= DateFrom AND "EnrollDate" <=DateTo);
END $$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "public"."udfNewPolicyInsuree"
-- CAREFUL! I had to change the order of input parameters!
(
	theMonth INT,
	theYear INT,
	theMode INT,	--1:Product base 2: Officer Base
	ProdID INT = 0,
	LocationId INT = 0
)
RETURNS TABLE("ProdID" INT, "Male" INT, "Female" INT, "Other" INT, "Officer" VARCHAR(50), "LastName" VARCHAR(50), "OtherNames" VARCHAR(50))
AS $$
BEGIN
IF theMode = 1 THEN
	CREATE TEMP TABLE NewPolicies AS
	SELECT "ProdID", "Gender"
	FROM
	(SELECT PL."ProdID", I."Gender", I."InsureeID"
	FROM "tblPolicy" PL 
	INNER JOIN "tblFamilies" Fam ON PL."FamilyID" = Fam."FamilyID"
	INNER JOIN "tblVillages" V ON V."VillageId" = Fam."LocationId"
	INNER JOIN "tblWards" W ON W."WardId" = V."WardId"
	INNER JOIN "tblDistricts" D ON D."DistrictId" = W."DistrictId"
	INNER JOIN "tblRegions" R ON R."RegionId" = D."Region"
	INNER JOIN "tblInsuree" I ON I."FamilyID" = Fam."FamilyID"
	WHERE PL."ValidityTo" IS NULL
	AND Fam."ValidityTo" IS NULL
	AND V."ValidityTo" IS NULL
	AND W."ValidityTo" IS NULL
	AND D."ValidityTo" IS NULL
	AND R."ValidityTo" IS NULL
	AND I."ValidityTo" IS NULL
	AND PL."PolicyStatus" > 1
	AND PL."PolicyStage" = N'N'
	AND (PL."ProdID" = ProdID OR ProdID = 0)
	AND (R."RegionID" = LocationId OR D."DistrictID" = LocationId OR LocationId = 0)
	AND MONTH(PL."EnrollDate") = theMonth
	AND YEAR(PL."EnrollDate") = theYear) AS innerSelect;
	
	RETURN QUERY
	WITH M AS (
		SELECT "ProdID", COUNT("InsureeID")::INT AS "Male" FROM NewPolicies WHERE "Gender" = 'M' GROUP BY "ProdID"
	), F AS (
		SELECT "ProdID", COUNT("InsureeID")::INT AS "Female" FROM NewPolicies WHERE "Gender" = 'F' GROUP BY "ProdID"
	), O AS (
		SELECT "ProdID", COUNT("InsureeID")::INT AS "Other" FROM NewPolicies WHERE "Gender" = 'O' GROUP BY "ProdID"
	) SELECT NewPolicies."ProdID", M."Male", F."Female", O."Other", NULL::VARCHAR(50) AS "Officer", NULL ::VARCHAR(50)as "LastName", NULL::VARCHAR(50) as "OtherNames"
	FROM NewPolicies
	INNER JOIN M ON NewPolicies."ProdID" = M."ProdID"
	INNER JOIN F ON NewPolicies."ProdID" = F."ProdID"
	INNER JOIN O ON NewPolicies."ProdID" = O."ProdID";
	DROP TABLE NewPolicies;

ELSIF theMode = 2 THEN
	CREATE TEMP TABLE NewPolicies AS
	SELECT "ProdID", "Gender", "Officer", "LastName", "OtherNames"
	FROM
	(SELECT PL."ProdID", I."Gender", O."Code" AS "Officer", O."LastName", O."OtherNames", I."InsureeID"
	FROM "tblPolicy" PL 
	INNER JOIN "tblFamilies" Fam ON PL."FamilyID" = Fam."FamilyID"
	INNER JOIN "tblVillages" V ON V."VillageId" = Fam."LocationId"
	INNER JOIN "tblWards" W ON W."WardId" = V."WardId"
	INNER JOIN "tblDistricts" D ON D."DistrictId" = W."DistrictId"
	INNER JOIN "tblRegions" R ON R."RegionId" = D."Region"
	INNER JOIN "tblInsuree" I ON I."FamilyID" = Fam."FamilyID"
	INNER JOIN "tblOfficer" O ON O."OfficerID" = PL."OfficerID"
	WHERE PL."ValidityTo" IS NULL
	AND Fam."ValidityTo" IS NULL
	AND V."ValidityTo" IS NULL
	AND W."ValidityTo" IS NULL
	AND D."ValidityTo" IS NULL
	AND R."ValidityTo" IS NULL
	AND I."ValidityTo" IS NULL
	AND O."ValidityTo" IS NULL
	AND PL."PolicyStatus" > 1
	AND PL."PolicyStage" = N'N'
	AND (PL."ProdID" = ProdID OR ProdID = 0)
	AND (R."RegionId" = LocationId OR D."DistrictId" = LocationId OR LocationId = 0)
	AND MONTH(PL."EnrollDate") = theMonth
	AND YEAR(PL."EnrollDate") = theYear) AS innerSelect;
	
	RETURN QUERY
	WITH M AS (
		SELECT "ProdID", COUNT("InsureeID")::INT AS "Male" FROM NewPolicies WHERE "Gender" = 'M' GROUP BY "ProdID"
	), F AS (
		SELECT "ProdID", COUNT("InsureeID")::INT AS "Female" FROM NewPolicies WHERE "Gender" = 'F' GROUP BY "ProdID"
	), O AS (
		SELECT "ProdID", COUNT("InsureeID")::INT AS "Other" FROM NewPolicies WHERE "Gender" = 'O' GROUP BY "ProdID"
	) SELECT NewPolicies."ProdID", M."Male", F."Female", O."Other", NewPolicies."Officer", NewPolicies."LastName", NewPolicies."OtherNames"
	FROM NewPolicies
	INNER JOIN M ON NewPolicies."ProdID" = M."ProdID"
	INNER JOIN F ON NewPolicies."ProdID" = F."ProdID"
	INNER JOIN O ON NewPolicies."ProdID" = O."ProdID";
	DROP TABLE NewPolicies;
END IF;
RETURN;
END $$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "public"."udfNumberOfCurrentInsuree"()
RETURNS TABLE("NumberOfCurrentInsuree" INT, "MonthTime" INT, "QuarterTime" INT, "YearTime" INT, "Age" INT, "Gender" CHAR(1), "Region" VARCHAR(20), "InsureeDistrictName" VARCHAR(50), "WardName" VARCHAR(50), "VillageName" VARCHAR(50), "ProdDistrictName" VARCHAR(50), "ProductCode" VARCHAR(15), "ProductName" VARCHAR(100), "OfficeDistrict" VARCHAR(20), "OfficerCode" VARCHAR(15), "LastName" VARCHAR(100), "OtherNames" VARCHAR(100), "ProdRegion" VARCHAR(50))
AS $$
DECLARE
	StartDate DATE;	--= (SELECT MIN(EffectiveDate) FROM "tblPolicy" WHERE "ValidityTo" IS NULL)
	EndDate DATE;	--= (SELECT Max(ExpiryDate) FROM "tblPolicy" WHERE "ValidityTo" IS NULL)
	LastDate DATE;
BEGIN

	StartDate = '2011-01-01';
	EndDate = DATEADD(YEAR,3,NOW());

	CREATE TEMP TABLE tblLastDays(LastDate DATE);

	WHILE StartDate <= EndDate LOOP
	LastDate = EOMONTH(StartDate);
	StartDate = DATEADD_MONTH(1,StartDate);
	INSERT INTO tblLastDays(LastDate) VALUES(LastDate);
	END LOOP;

	RETURN QUERY
	SELECT COUNT(I."InsureeID") AS "NumberOfCurrentInsuree", MONTH(LD.LastDate) AS "MonthTime", DATENAME_Q(LastDate) AS "QuarterTime", YEAR(LD.LastDate) AS "YearTime",
	DATEDIFF_YEAR(I."DOB",NOW()) AS "Age", CAST(I."Gender" AS VARCHAR(1)) AS "Gender", R."RegionName" AS "Region", D."DistrictName" AS "InsureeDistrictName", W."WardName", V."VillageName",
	COALESCE(PD."DistrictName", D."DistrictName") AS "ProdDistrictName", Prod."ProductCode", Prod."ProductName", 
	ODist."DistrictName" AS "OfficerDistrict", O."Code" AS "OfficerCode", O."LastName", O."OtherNames", 
	--COALESCE(ISNULL(PD.DistrictName, R.RegionName) ,PR.RegionName, R.RegionName)ProdRegion
	COALESCE(R."RegionName", PR."RegionName") AS "ProdRegion"
	
	FROM "tblPolicy" PL INNER JOIN "tblInsuree" I ON PL."FamilyID" = I."FamilyID"
	INNER JOIN "tblFamilies" F ON I."FamilyID" = F."FamilyID"
	INNER JOIN "tblVillages" V ON V."VillageID" = F."LocationId"
	INNER JOIN "tblWards" W ON W."WardID" = V."WardID"
	INNER JOIN "tblDistricts" D ON D."DistrictID" = W."DistrictID"
	INNER JOIN "tblProduct" Prod ON PL."ProdID" = Prod."ProdID"
	INNER JOIN "tblOfficer" O ON PL."OfficerID" = O."OfficerID"
	INNER JOIN "tblDistricts" ODist ON O."LocationId" = ODist."DistrictID"
	INNER JOIN "tblInsureePolicy" PIns ON I."InsureeID" = PIns."InsureeID" AND PL."PolicyID" = PIns."PolicyId"
	INNER JOIN "tblRegions" R ON R."RegionId" = D."Region"
	LEFT OUTER JOIN "tblDistricts" PD ON PD."DistrictID" = Prod."LocationId"
	LEFT OUTER JOIN "tblRegions" PR ON PR."RegionId" = Prod."LocationId"
	LEFT JOIN LATERAL (SELECT * FROM tblLastDays) LD On True --LEFT JOIN LATERAL does not seem to work on tables

	WHERE PL."ValidityTo" IS NULL 
	AND I."ValidityTo" IS NULL 
	AND F."ValidityTo" IS NULL
	AND D."ValidityTo" IS NULL
	AND W."ValidityTo" IS NULL
	AND Prod."ValidityTo" IS NULL 
	AND O."ValidityTo" IS NULL
	AND ODist."ValidityTo" IS NULL
	AND PIns."ValidityTo" IS NULL
	AND PIns."EffectiveDate" <= LD.LastDate
	AND PIns."ExpiryDate" > LD.LastDate--= DATEADD(DAY, 1, DATEADD(MONTH,-1,EOMONTH(LD.LastDate,0))) 
	
	GROUP BY MONTH(LD.LastDate),DATENAME_Q(LastDate),YEAR(LD.LastDate),I."DOB",I."Gender", R."RegionName", D."DistrictName", W."WardName", V."VillageName",
	Prod."ProductCode", Prod."ProductName", ODist."DistrictName", O."Code", O."LastName", O."OtherNames", PD."DistrictName", PR."RegionName";
	
	DROP TABLE tblLastDays;
	RETURN;

END $$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "public"."udfNumberOfCurrentPolicies"()
RETURNS TABLE("NumberOfCurrentPolicies" INT, "MonthTime" INT, "QuarterTime" INT, "YearTime" INT, "Age" INT, "Gender" CHAR(1), "Region" VARCHAR(20), "InsureeDistrictName" VARCHAR(50), "WardName" VARCHAR(50), "VillageName" VARCHAR(50), "ProdDistrictName" VARCHAR(50), "ProductCode" VARCHAR(15), "ProductName" VARCHAR(100), "OfficeDistrict" VARCHAR(20), "OfficerCode" VARCHAR(15), "LastName" VARCHAR(100), "OtherNames" VARCHAR(100), "ProdRegion" VARCHAR(50))
AS $$
DECLARE
	StartDate DATE;	--= (SELECT MIN(EffectiveDate) FROM "tblPolicy" WHERE "ValidityTo" IS NULL)
	EndDate DATE;	--= (SELECT Max(ExpiryDate) FROM "tblPolicy" WHERE "ValidityTo" IS NULL)
	LastDate DATE;
	theYear INT;
	MonthCounter INT = 1;
	 Cur CURSOR FOR
		SELECT Years FROM
		(SELECT YEAR("EffectiveDate") Years FROM "tblPolicy" WHERE "ValidityTo" IS NULL AND "EffectiveDate" IS NOT NULL GROUP BY YEAR("EffectiveDate") 
		UNION 
		SELECT YEAR("ExpiryDate") Years FROM "tblPolicy" WHERE "ValidityTo" IS NULL AND "ExpiryDate" IS NOT NULL GROUP BY YEAR("ExpiryDate")
		)Yrs ORDER BY Years;
BEGIN
	CREATE TEMP TABLE tblLastDays(LastDate DATE);

	OPEN Cur;
		FETCH NEXT FROM Cur into theYear;
		WHILE FETCH_STATUS = 0 LOOP
			StartDate = CAST(CAST(Year AS VARCHAR(4))+ '-01-01' AS DATE);
			MonthCounter = 1;
			WHILE YEAR(StartDate) = Year LOOP
				LastDate = EOMONTH(StartDate);
				StartDate = DATEADD(MONTH,1,StartDate);
				INSERT INTO tblLastDays(LastDate) VALUES(LastDate);
			END LOOP;
			FETCH NEXT FROM Cur into theYear;
		END LOOP;
	CLOSE Cur;
	DEALLOCATE Cur;

	RETURN QUERY
	SELECT COUNT("PolicyID") AS "NumberOfCurrentPolicies", MONTH(LD.LastDate) AS "MonthTime", DATENAME_Q(LD.LastDate) AS "QuarterTime", YEAR(LD.LastDate) AS "YearTime",
	DATEDIFF_YEAR(I."DOB",LD.LastDate) AS "Age", I."Gender", R."RegionName" AS "Region", FD."DistrictName" AS "InsureeDistrictName", W."WardName", V."VillageName",
	COALESCE(PD."DistrictName", FD."DistrictName") AS "ProdDistrictName", PR."ProductCode", PR."ProductName", OD."DistrictName" AS "OfficeDistrict", O."Code" AS "OfficerCode", O."LastName", O."OtherNames",
	--COALESCE(ISNULL(PD.DistrictName, R.RegionName) ,PRDR.RegionName, R.RegionName)ProdRegion
	COALESCE(R."RegionName", PRDR."RegionName") AS "ProdRegion"

	FROM "tblPolicy" PL 
	INNER JOIN "tblFamilies" F ON PL."FamilyID" = F."FamilyID"
	INNER JOIN "tblInsuree" I ON F."InsureeID" = I."InsureeID"
	INNER JOIN "tblVillages" V ON V."VillageId" = F."LocationId"
	INNER JOIN "tblWards" W ON W."WardId" = V."WardId"
	INNER JOIN "tblDistricts" FD ON FD."DistrictID" = W."DistrictID"
	INNER JOIN "tblProduct" PR ON PL."ProdID" = PR."ProdID"
	INNER JOIN "tblOfficer" O ON PL."OfficerIdD" = O."OfficerID"
	INNER JOIN "tblDistricts" OD ON OD."DistrictId" = O."LocationId"
	INNER JOIN "tblRegions" R ON R."RegionId" = FD."Region"
	LEFT OUTER JOIN "tblDistricts" PD ON PD."DistrictId" = PR."LocationId"
	LEFT OUTER JOIN "tblRegions" PRDR ON PRDR."Regionid" = PR."LocationId"
	LEFT JOIN LATERAL (SELECT * FROM tblLastDays) LD On True --LEFT JOIN LATERAL does not seem to work on tables
	
	WHERE PL."ValidityTo" IS NULL
	AND F."ValidityTo" IS NULL
	AND I."ValidityTo" IS NULL
	AND F."ValidityTo" IS NULL
	AND FD."ValidityTo" IS NULL
	AND W."ValidityTo" IS NULL
	AND V."ValidityTo" IS NULL
	AND PR."ValidityTo" IS NULL
	AND O."ValidityTo" IS NULL
	AND OD."ValidityTo" IS NULL
	AND PL."EffectiveDate" <= LD.LastDate
	AND PL."ExpiryDate" > LD.LastDate--DATEADD(DAY, 1, DATEADD(MONTH,-1,EOMONTH(LD.LastDate,0))) 
	AND PL."PolicyStatus" > 1

	GROUP BY DATEDIFF_YEAR(I."DOB",LD.LastDate),MONTH(LD.LastDate), DATENAME_Q(LD.LastDate), YEAR(LD.LastDate),
	I."Gender", R."RegionName", FD."DistrictName", W."WardName", V."VillageName", PR."ProductCode", 
	PR."ProductName", OD."DistrictName", O."Code", O."LastName", O."OtherNames", PD."DistrictName", PRDR."RegionName";
	
	DROP TABLE tblLastDays;
	RETURN;
END $$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "public"."udfNumberOfPoliciesExpired"()
	RETURNS TABLE("ExpiredPolicy" INT, "MonthTime" INT, "QuarterTime" INT, "YearTime" INT, "Age" INT, "Gender" CHAR(1), "Region" VARCHAR(20), "InsureeDistrictName" VARCHAR(50), "WardName" VARCHAR(50), "VillageName" VARCHAR(50), "ProdDistrictName" VARCHAR(50), "ProductCode" VARCHAR(15), "ProductName" VARCHAR(100), "OfficeDistrict" VARCHAR(20), "OfficerCode" VARCHAR(15), "LastName" VARCHAR(100), "OtherNames" VARCHAR(100), "ProdRegion" VARCHAR(50))
AS $$
BEGIN
	CREATE TEMP TABLE tbl(MonthId INT, YearId INT);
	
	INSERT INTO tbl
	SELECT DISTINCT MONTH("ExpiryDate"),YEAR("ExpiryDate") FROM "tblPolicy"
	WHERE "ValidityTo" IS NULL
	ORDER BY YEAR("ExpiryDate"),MONTH("ExpiryDate");


	RETURN QUERY
	SELECT COUNT(PL."PolicyID") AS "ExpiredPolicy", MONTH(PL."ExpiryDate") AS "MonthTime", DATENAME_Q(PL."ExpiryDate") AS "QuarterTime", YEAR(PL."ExpiryDate") AS "YearTime",
	DATEDIFF_YEAR(I."DOB",PL."ExpiryDate") AS "Age", I."Gender", R."RegionName" AS "Region", D."DistrictName", W."WardName", V."VillageName",
	D."DistrictName" AS "ProdDistrictName", PR."ProductCode", PR."ProductName", 
	ODist."DistrictName" AS "OfficerDistrict", O."Code" AS OfficerCode, O."LastName", O."OtherNames", R."RegionName" AS "ProdRegion"

	FROM "tblPolicy" PL  INNER JOIN "tblProduct" PR ON PL."ProdID" = PR."ProdID"
	INNER JOIN "tblOfficer" O ON PL."OfficerID" = O."OfficerID"
	INNER JOIN "tblInsuree" I ON PL."FamilyID" = I."FamilyID"
	INNER JOIN "tblFamilies" F ON I."FamilyID" = F."FamilyID"
	INNER JOIN "tblVillages" V ON V."VillageID" = F."LocationId"
	INNER JOIN "tblWards" W ON W."WardId" = V."WardId"
	INNER JOIN "tblDistricts" D ON D."DistrictID" = W."DistrictID"
	INNER JOIN "tblDistricts" ODist ON O."LocationId" = ODist."DistrictID"
	LEFT JOIN LATERAL (SELECT * FROM tbl) t On True --LEFT JOIN LATERAL does not seem to work on tables

	WHERE PL."ValidityTo" IS NULL 
	AND PR."ValidityTo" IS NULL 
	AND I."ValidityTo" IS NULL 
	AND O."ValidityTo" IS NULL
	AND I."IsHead" = 1
	AND MONTH(PL."ExpiryDate") = t.MonthId AND YEAR(PL."ExpiryDate") = t.YearId
	AND PL."PolicyStatus" > 1

	GROUP BY MONTH(PL."ExpiryDate"),DATENAME_Q(PL."ExpiryDate"), YEAR(PL."ExpiryDate"), DATEDIFF_YEAR(I."DOB",PL."ExpiryDate"),
	I."Gender", R."RegionName",D."DistrictName", W."WardName", V."VillageName" ,PR."ProductCode", PR."ProductName", 
	ODist."DistrictName", O."Code", O."LastName", O."OtherNames";

	DROP TABLE tbl;
	RETURN;
END $$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "public"."udfPolicyInsuree"
-- CAREFUL! I had to change the order of input parameters!
(
	LastDay DATE,
	theMode INT,	--1: Product Base 2: Officer Base
	ProdID INT = 0,
	LocationId INT = 0
)
RETURNS TABLE("ProdId" INT, "Male" INT, "Female" INT, "Other" INT, "Officer" VARCHAR(50), "LastName" VARCHAR(50), "OtherNames" VARCHAR(50))
AS $$
BEGIN
IF theMode = 1 THEN
	CREATE TEMP TABLE PolicyInsuree AS
	SELECT "ProdID", "Gender", "InsureeID"
	FROM
	(
		SELECT Prod."ProdID", Ins."Gender", Ins."InsureeID"
		FROM "tblPolicy" PL 
		INNER JOIN "tblProduct" Prod ON Prod."ProdId" = PL."ProdID"
		INNER JOIN "tblFamilies" Fam ON Fam."FamilyId" = PL."FamilyID"
		INNER JOIN "tblInsuree" Ins ON Ins."FamilyId" = Fam."FamilyId"
		INNER JOIN "uvwLocations" L ON L."VillageId" = Fam."LocationId"

		WHERE PL."ValidityTo" IS NULL
		AND Prod."ValidityTo" IS NULL
		AND Fam."ValidityTo" IS NULL
		AND Ins."ValidityTo" IS NULL
		AND PL."PolicyStatus" > 1
		AND PL."EffectiveDate" <= LastDay
		AND PL."ExpiryDate" >  LastDay
		AND (Prod."ProdID" = ProdId OR ProdId = 0)
		AND (L."RegionId" = LocationId OR L."DistrictId" = LocationId OR COALESCE("LocationId", 0) = 0)
	)base;
	RETURN QUERY
	WITH M AS (
		SELECT "ProdID", COUNT("InsureeID")::INT AS "Male" FROM PolicyInsuree WHERE "Gender" = 'M' GROUP BY "ProdID"
	), F AS (
		SELECT "ProdID", COUNT("InsureeID")::INT AS "Female" FROM PolicyInsuree WHERE "Gender" = 'F' GROUP BY "ProdID"
	), O AS (
		SELECT "ProdID", COUNT("InsureeID")::INT AS "Other" FROM PolicyInsuree WHERE "Gender" = 'O' GROUP BY "ProdID"
	) SELECT PolicyInsuree."ProdID" AS "ProdId", M."Male", F."Female", O."Other", NULL::VARCHAR(50) AS "Officer", NULL ::VARCHAR(50)as "LastName", NULL::VARCHAR(50) as "OtherNames"
	FROM PolicyInsuree
	INNER JOIN M ON PolicyInsuree."ProdID" = M."ProdID"
	INNER JOIN F ON PolicyInsuree."ProdID" = F."ProdID"
	INNER JOIN O ON PolicyInsuree."ProdID" = O."ProdID";
	DROP TABLE PolicyInsuree;
ELSIF Mode = 2 THEN
	CREATE TEMP TABLE PolicyInsuree AS
	SELECT "ProdId", "Gender", "InsureeID", "Officer", "LastName", "OtherNames"
	FROM
	(
		SELECT Prod."ProdID", Ins."Gender", Ins."InsureeID", O."Code" AS "Officer", O."LastName", O."OtherNames"
		FROM "tblPolicy" PL 
		INNER JOIN "tblProduct" Prod ON Prod."ProdId" = PL."ProdID"
		INNER JOIN "tblOfficer" O ON O."OfficerId" = PL."OfficerID"
		INNER JOIN "tblFamilies" Fam ON Fam."FamilyId" = PL."FamilyID"
		INNER JOIN "tblInsuree" Ins ON Ins."FamilyId" = Fam."FamilyId"
		INNER JOIN "uvwLocations" L ON L."VillageId" = Fam."LocationId"

		WHERE PL."ValidityTo" IS NULL
		AND Prod."ValidityTo" IS NULL
		AND Fam."ValidityTo" IS NULL
		AND Ins."ValidityTo" IS NULL
		AND PL."PolicyStatus" > 1
		AND PL."EffectiveDate" <= LastDay
		AND PL."ExpiryDate" > LastDay
		AND (Prod."ProdID" = ProdId OR ProdId = 0)
		AND (L."RegionId" = LocationId OR L.DistrictId = LocationId OR COALESCE(LocationId, 0) = 0)
	)base;
	RETURN QUERY
	WITH M AS (
		SELECT "ProdID", COUNT("InsureeID")::INT AS "Male" FROM PolicyInsuree WHERE "Gender" = 'M' GROUP BY "ProdID"
	), F AS (
		SELECT "ProdID", COUNT("InsureeID")::INT AS "Female" FROM PolicyInsuree WHERE "Gender" = 'F' GROUP BY "ProdID"
	), O AS (
		SELECT "ProdID", COUNT("InsureeID")::INT AS "Other" FROM PolicyInsuree WHERE "Gender" = 'O' GROUP BY "ProdID"
	) SELECT PolicyInsuree."ProdID" AS "ProdId", M."Male", F."Female", O."Other", PolicyInsuree."Officer", PolicyInsuree."LastName", PolicyInsuree."OtherNames"
	FROM PolicyInsuree
	INNER JOIN M ON PolicyInsuree."ProdID" = M."ProdID"
	INNER JOIN F ON PolicyInsuree."ProdID" = F."ProdID"
	INNER JOIN O ON PolicyInsuree."ProdID" = O."ProdID";
	DROP TABLE PolicyInsuree;
END IF;
RETURN;
END $$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "public"."udfPolicyRenewal"
-- CAREFUL! I had to change the order of input parameters!
(
	theMonth INT,
	theYear INT,
	theMode INT,	--1: Product Base, 2:Officer Base
	ProdID INT = 0,
	LocationId INT = 0
)
RETURNS TABLE("ProdId" INT, "Renewals" INT, "Officer" VARCHAR(50), "LastName" VARCHAR(50), "OtherNames" VARCHAR(50))
AS $$
BEGIN
IF theMode = 1 THEN
	RETURN QUERY
	SELECT PL."ProdID" AS "ProdId", COUNT(PL."PolicyID") AS "Renewals", NULL::VARCHAR(50) AS "Officer", NULL::VARCHAR(50) AS "LastName", NULL::VARCHAR(50) AS"OtherNames"
	FROM "tblPolicy" PL 
	INNER JOIN "tblFamilies" Fam ON PL."FamilyID" = Fam."FamilyID"
	INNER JOIN "tblVillages" V ON V."VillageId" = Fam."LocationId"
	INNER JOIN "tblWards" W ON W."WardId" = V."WardId"
	INNER JOIN "tblDistricts" D ON D."DistrictId" = W."DistrictId"
	WHERE PL."ValidityTo" IS NULL
	AND Fam."ValidityTo" IS NULL
	AND PL."PolicyStatus" > 1
	AND PL."PolicyStage" = N'R'
	AND (PL."ProdID" = ProdID OR ProdID = 0)
	AND (D."DistrictId" = LocationId OR D."Region" = LocationId OR LocationId = 0)
	AND MONTH(PL."EnrollDate") = theMonth
	AND YEAR(PL."EnrollDate") = theYear
	GROUP BY PL."ProdID";

ELSIF theMode = 2 THEN
	RETURN QUERY
	SELECT PL."ProdID" AS "ProdId", COUNT(PL."PolicyID") AS "Renewals", O."Code" AS "Officer", O."LastName", O."OtherNames"
	FROM "tblPolicy" PL 
	INNER JOIN "tblFamilies" Fam ON PL."FamilyID" = Fam."FamilyID"
	INNER JOIN "tblVillages" V ON V."VillageId" = Fam."LocationId"
	INNER JOIN "tblWards" W ON W."WardId" = V."WardId"
	INNER JOIN "tblDistricts" D ON D."DistrictId" = W."DistrictId"
	INNER JOIN "tblOfficer" O ON O."OfficerId" = PL."OfficerId"

	WHERE PL."ValidityTo" IS NULL
	AND Fam."ValidityTo" IS NULL
	AND PL."PolicyStatus" > 1
	AND PL."PolicyStage" = N'R'
	AND (PL."ProdID" = ProdID OR ProdID = 0)
	AND (D."DistrictId" = LocationId OR D."Region" = LocationId OR LocationId = 0)
	AND MONTH(PL.EnrollDate) = theMonth
	AND YEAR(PL.EnrollDate) = theYear
	GROUP BY PL."ProdID", O."Code" , O."LastName", O."OtherNames";
END IF;
RETURN;
END $$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "public"."udfPremiumComposition"()
RETURNS TABLE("PolicyId" INT, "AssFee" DECIMAL(18,2), "RegFee" DECIMAL(18,2), "PremFee" DECIMAL(18,2) )
AS $$
BEGIN
	RETURN QUERY
	SELECT
		"tblPolicy"."PolicyID",
		CASE WHEN COALESCE("tblProduct"."GeneralAssemblyLumpSum",0) = 0 THEN  (COUNT("tblInsureePolicy"."InsureeId") * COALESCE("tblProduct"."GeneralAssemblyFee",0)) ELSE "tblProduct"."GeneralAssemblyLumpSum" END  as "AssFee",
		CASE WHEN "tblPolicy"."PolicyStage" = 'N' THEN (CASE WHEN COALESCE("tblProduct"."RegistrationLumpSum" ,0) = 0 THEN COUNT("tblInsureePolicy"."InsureeID") * COALESCE("tblProduct"."RegistrationFee",0) ELSE "tblProduct"."RegistrationLumpSum" END) ELSE 0 END as "RegFee",
		CASE WHEN COALESCE("tblProduct"."LumpSum",0) = 0 THEN ( SUM (CASE WHEN (DATEDIFF_YEAR("tblInsuree"."DOB", "tblInsureePolicy"."EffectiveDate") >= 18) THEN 1 ELSE 0 END) * "tblProduct"."PremiumAdult")  + ( SUM (CASE WHEN (DATEDIFF_YEAR("tblInsuree"."DOB", "tblInsureePolicy"."EffectiveDate") < 18) THEN 1 ELSE 0 END) * "tblProduct"."PremiumChild") ELSE "tblProduct"."LumpSum"  END as "PremFee"
	FROM "tblPolicy"
	INNER JOIN "tblInsureePolicy" ON "tblPolicy"."PolicyID" = "tblInsureePolicy"."PolicyID"
	INNER JOIN "tblInsuree" ON "tblInsureePolicy"."InsureeID" = "tblInsuree"."InsureeID"
	INNER JOIN "tblProduct" ON "tblProduct"."ProdID" = "tblPolicy"."ProdID"
	WHERE ("tblInsureePolicy"."ValidityTo" IS NULL)
	AND ("tblPolicy"."ValidityTo" IS NULL)
	AND ("tblInsuree"."ValidityTo" IS NULL)
	AND "tblInsureePolicy"."EffectiveDate" IS NOT NULL 
	AND "tblProduct"."ValidityTo" IS NULL
	GROUP BY "tblPolicy"."PolicyID", "tblProduct"."GeneralAssemblyFee", "tblProduct"."GeneralAssemblyLumpSum", "tblProduct" ."RegistrationFee", "tblProduct" ."RegistrationLumpSum", "tblProduct"."LumpSum", "tblProduct"."PremiumAdult", "tblProduct"."PremiumChild", "tblPolicy"."PolicyStage";

RETURN;
END $$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "public"."udfRenewedPoliciesPhoneStatistics"(
	DateFrom DATE, 
	DateTo DATE, 
	OfficerID INT
)

RETURNS INT
AS $$
DECLARE
	LegacyOfficer INT;
BEGIN
		CREATE TEMP TABLE tblOfficerSub(OldOfficer INT, NewOfficer INT);

		INSERT INTO tblOfficerSub(OldOfficer, NewOfficer) 
		SELECT DISTINCT OfficerID, OfficerID;

		SELECT "OfficerID" INTO LegacyOfficer FROM "tblOfficer" WHERE "ValidityTo" IS NULL AND "OfficerIDSubst" = OfficerID;
		WHILE LegacyOfficer IS NOT NULL LOOP
			INSERT INTO tblOfficerSub(OldOfficer, NewOfficer) 
			SELECT DISTINCT "OfficerID", LegacyOfficer;
			IF EXISTS(SELECT 1 FROM tblOfficerSub  GROUP BY NewOfficer HAVING COUNT(1) > 1) THEN
				EXIT;
			END IF;
			SELECT "OfficerID" INTO LegacyOfficer FROM "tblOfficer" WHERE "ValidityTo" IS NULL AND "OfficerIDSubst" = LegacyOfficer;
		END LOOP;

	RETURN(
	SELECT COUNT(1)
	FROM "tblPolicy" PL
	INNER JOIN tblOfficerSub O ON O.NewOfficer = PL.OfficerID
	WHERE 
	"ValidityTo" IS NULL AND "PolicyStage" ='R' AND "EnrollDate" >= DateFrom AND "EnrollDate" <=DateTo
	);
END $$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "public"."udfSuspendedPolicies"
-- CAREFUL! I had to change the order of input parameters!
(
	theMonth INT,
	theYear INT,
	theMode INT,	--1:Product base 2: Officer Base
	LocationId INT,
	ProdID INT = 0
)
RETURNS TABLE("ProdId" INT, "SuspendedPolicies" INT, "Officer" VARCHAR(50), "LastName" VARCHAR(50), "OtherNames" VARCHAR(50))
AS $$
BEGIN
IF theMode = 1 THEN
	RETURN QUERY
	SELECT  PL."ProdID" AS "ProdId", COUNT(PL."PolicyID") AS "SuspendedPolicies", NULL::VARCHAR(50) AS "Officer", NULL ::VARCHAR(50)as "LastName", NULL::VARCHAR(50) as "OtherNames"
	FROM "tblPolicy" PL 
	INNER JOIN "tblFamilies" F ON F."FamilyID" = PL."FamilyID"
	INNER JOIN "tblVillages" V ON V."VillageId" = F."LocationId"
	INNER JOIN "tblWards" W ON W."WardId" = V."WardId"
	INNER JOIN "tblDistricts" D ON D."DistrictId" = W."DistrictId"
	
	WHERE PL."ValidityTo" IS NULL 
	AND F."ValidityTo" IS NULL
	AND PL."PolicyStatus" = 4
	AND (PL."ProdID" = ProdID OR ProdID = 0)
	AND MONTH(PL."ValidityFrom") = theMonth AND YEAR(PL."ValidityFrom") = theYear 
	AND (D."Region" = LocationId OR D."DistrictId"= LocationId OR LocationId = 0)
	GROUP BY PL."ProdID";
	
ELSIF theMode = 2 THEN
	RETURN QUERY
	SELECT  PL."ProdID" AS "ProdId", COUNT(PL."PolicyID") AS "SuspendedPolicies", O."Code" AS "Officer" ,O."LastName",O."OtherNames"
	FROM "tblPolicy" PL 
	INNER JOIN "tblFamilies" F ON F."FamilyID" = PL."FamilyID"
	INNER JOIN "tblVillages" V ON V."VillageId" = F."LocationId"
	INNER JOIN "tblWards" W ON W."WardId" = V."WardId"
	INNER JOIN "tblDistricts" D ON D."DistrictId" = W."DistrictId"
	INNER JOIN "tblOfficer" O ON PL."OfficerID" = O."OfficerID"
	WHERE PL."ValidityTo" IS NULL
	AND F."ValidityTo" IS NULL
	AND PL."PolicyStatus" = 4
	AND (PL."ProdID" = ProdID OR ProdID = 0)
	AND MONTH(PL."ValidityFrom") = theMonth AND YEAR(PL."ValidityFrom") = theYear 
	AND (D."Region" = LocationId OR D."DistrictId" = LocationId OR LocationId = 0)
	GROUP BY PL."ProdID", O."Code", O."LastName", O."OtherNames";
END IF;
RETURN;
END $$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "public"."udfSuspendedPoliciesPhoneStatistics"(
	DateFrom DATE, 
	DateTo DATE, 
	OfficerId INT
)
RETURNS INT
AS $$
DECLARE
	LegacyOfficer INT;
BEGIN
	CREATE TEMP TABLE tblOfficerSub(OldOfficer INT, NewOfficer INT);
	INSERT INTO tblOfficerSub(OldOfficer, NewOfficer) 
	SELECT DISTINCT OfficerID, OfficerID;

	SELECT "OfficerID" INTO LegacyOfficer FROM "tblOfficer" WHERE "ValidityTo" IS NULL AND "OfficerIDSubst" = OfficerID;
	WHILE LegacyOfficer IS NOT NULL LOOP
		INSERT INTO tblOfficerSub(OldOfficer, NewOfficer)
		SELECT DISTINCT OfficerID, LegacyOfficer;
		IF EXISTS(SELECT 1 FROM tblOfficerSub  GROUP BY NewOfficer HAVING COUNT(1) > 1) THEN
			EXIT;
		END IF;
		SELECT "OfficerID" INTO LegacyOfficer FROM "tblOfficer" WHERE "ValidityTo" IS NULL AND "OfficerIDSubst" = LegacyOfficer;
	END LOOP;

	RETURN(
		SELECT COUNT(1) "SuspendedPolicies"
		FROM "tblPolicy" PL 
		INNER JOIN tblOfficerSub O ON O.NewOfficer = PL."OfficerID"
		WHERE PL."ValidityTo" IS NULL
		AND PL."PolicyStatus" = 4
		AND ("ExpiryDate" >= DateFrom AND "ExpiryDate" <= DateTo)
		
	);
END $$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "public"."udfTotalPolicies"
-- CAREFUL! I had to change the order of input parameters!
(
	LastDay DATE,
	theMode INT,	--1: ON Product, 2: On Officer
	ProdID INT = 0,
	LocationId INT = 0
)
RETURNS TABLE("ProdId" INT, "Male" INT, "Female" INT, "Other" INT, "Officer" VARCHAR(8), "LastName" VARCHAR(50), "OtherNames" VARCHAR(50))
AS $$
BEGIN
IF theMode = 1 THEN
	CREATE TEMP TABLE TotalPolicies AS
	SELECT "ProdId", "Gender", "InsureeID"
	FROM
	(
		SELECT Prod."ProdID", Ins."Gender", Ins."InsureeID"
		FROM "tblPolicy" PL 
		INNER JOIN "tblProduct" Prod ON Prod."ProdID" = PL."ProdID"
		INNER JOIN "tblFamilies" Fam ON Fam."FamilyID" = PL."FamilyID"
		INNER JOIN "tblInsuree" Ins ON Ins."InsureeId" = Fam."InsureeID"
		INNER JOIN "uvwLocations" L ON L."VillageId" = Fam."LocationId"

		WHERE PL."ValidityTo" IS NULL
		AND Prod."ValidityTo" IS NULL
		AND Fam."ValidityTo" IS NULL
		AND Ins."ValidityTo" IS NULL
		AND PL."PolicyStatus" > 1
		AND PL."EffectiveDate" <= LastDay
		AND PL."ExpiryDate" >  LastDay
		AND (Prod."ProdID" = ProdID OR ProdID = 0)
		AND (L."RegionId" = LocationId OR L."DistrictId" = LocationId OR COALESCE(LocationId, 0) = 0 OR LocationId = 0) --LocationId = 0 Added to get Country data
	)Base;
	WITH M AS (
		SELECT "ProdID", COUNT("InsureeID")::INT AS "Male" FROM TotalPolicies WHERE "Gender" = 'M' GROUP BY "ProdID"
	), F AS (
		SELECT "ProdID", COUNT("InsureeID")::INT AS "Female" FROM TotalPolicies WHERE "Gender" = 'F' GROUP BY "ProdID"
	), O AS (
		SELECT "ProdID", COUNT("InsureeID")::INT AS "Other" FROM TotalPolicies WHERE "Gender" = 'O' GROUP BY "ProdID"
	) SELECT TotalPolicies."ProdID" AS "ProdId", M."Male", F."Female", O."Other", NULL::VARCHAR(50) AS "Officer", NULL ::VARCHAR(50)as "LastName", NULL::VARCHAR(50) as "OtherNames"
	FROM TotalPolicies
	INNER JOIN M ON TotalPolicies."ProdID" = M."ProdID"
	INNER JOIN F ON TotalPolicies."ProdID" = F."ProdID"
	INNER JOIN O ON TotalPolicies."ProdID" = O."ProdID";
	DROP TABLE TotalPolicies;
	
ELSIF theMode = 2 THEN
	CREATE TEMP TABLE TotalPolicies AS
	SELECT "ProdID", "Gender", "InsureeId", "Officer", "LastName", "OtherNames"
	FROM
	(
		SELECT Prod."ProdID", Ins."Gender", Ins."InsureeID", O."Code" AS "Officer", O."LastName", O."OtherNames"
		FROM "tblPolicy" PL 
		INNER JOIN "tblProduct" Prod ON Prod."ProdID" = PL."ProdID"
		INNER JOIN "tblOfficer" O ON O."OfficerID" = PL."OfficerID"
		INNER JOIN "tblFamilies" Fam ON Fam."FamilyId" = PL."FamilyID"
		INNER JOIN "tblInsuree" Ins ON Ins."InsureeID" = Fam."InsureeID"
		INNER JOIN "uvwLocations" L ON L."VillageId" = Fam."LocationId"

		WHERE PL."ValidityTo" IS NULL
		AND Prod."ValidityTo" IS NULL
		AND Fam."ValidityTo" IS NULL
		AND Ins."ValidityTo" IS NULL
		AND PL."PolicyStatus" > 1
		AND PL."EffectiveDate" <= LastDay
		AND PL."ExpiryDate" >  LastDay
		AND (Prod."ProdID" = ProdID OR ProdID = 0)
		AND (L."RegionId" = LocationId OR L."DistrictId" = LocationId OR COALESCE(LocationId, 0) = 0 OR LocationId = 0)
	)Base;
	WITH M AS (
		SELECT "ProdID", COUNT("InsureeID")::INT AS "Male" FROM TotalPolicies WHERE "Gender" = 'M' GROUP BY "ProdID"
	), F AS (
		SELECT "ProdID", COUNT("InsureeID")::INT AS "Female" FROM TotalPolicies WHERE "Gender" = 'F' GROUP BY "ProdID"
	), O AS (
		SELECT "ProdID", COUNT("InsureeID")::INT AS "Other" FROM TotalPolicies WHERE "Gender" = 'O' GROUP BY "ProdID"
	) SELECT TotalPolicies."ProdID" AS "ProdId", M."Male", F."Female", O."Other", TotalPolicies."Officer", TotalPolicies."LastName", TotalPolicies."OtherNames"
	FROM TotalPolicies
	INNER JOIN M ON TotalPolicies."ProdID" = M."ProdID"
	INNER JOIN F ON TotalPolicies."ProdID" = F."ProdID"
	INNER JOIN O ON TotalPolicies."ProdID" = O."ProdID";
	DROP TABLE TotalPolicies;
END IF;
RETURN;
END $$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "public"."udfRejectedClaims"
-- CAREFUL! I had to change the order of input parameters!
(
	theMonth INT,
	theYear INT,
	ProdID INT = 0,
	HFID INT = 0,
	LocationId INT = 0
)
RETURNS TABLE("HFID" INT,"ProdID" INT, "ClaimID" INT)
AS $$
BEGIN
	RETURN QUERY
	SELECT Claims."HFID", Claims."ProdID", COUNT("ClaimID")::INT AS "RejectedClaims" FROM
	(
		SELECT C."ClaimID",HF."HfID",CI."ProdID"
		FROM "tblClaim" C 
		INNER JOIN "tblClaimItems" CI ON C."ClaimID" = CI."ClaimID"
		INNER JOIN "tblHF" HF ON C."HFID" = HF."HfID"
		INNER JOIN "uvwLocations" L ON HF."LocationId" = L."LocationId"
		WHERE C."ValidityTo" IS NULL 
		AND CI."ValidityTo" IS NULL 
		AND HF."ValidityTo" IS NULL
		AND C."ClaimStatus" = 1 
		AND (CI."ProdID" = ProdID OR ProdID = 0)
		AND (HF."HfID" = HFID OR HFID = 0)
		AND (L."RegionId" = LocationId OR L."DistrictId" = LocationId OR COALESCE(LocationId, 0) = 0)
		AND MONTH(C."DateFrom") = theMonth 
		AND YEAR(C."DateFrom") = theYear
		GROUP BY C."ClaimID",HF."HfID",CI."ProdID"
		UNION 
		SELECT C."ClaimID",HF."HfID",CS."ProdID"
		FROM "tblClaim" C 
		INNER JOIN "tblClaimServices" CS ON C."ClaimID" = CS."ClaimID"
		INNER JOIN "tblHF" HF ON C."HFID" = HF."HfID"
		INNER JOIN "uvwLocations" L ON HF."LocationId" = L."LocationId"
		WHERE C."ValidityTo" IS NULL 
		AND CS."ValidityTo" IS NULL 
		AND HF."ValidityTo" IS NULL
		AND C."ClaimStatus" = 1 
		AND (CS."ProdID" = ProdID OR ProdID = 0)
		AND (HF."HfID" = HFID OR HFID = 0)
		AND (L."RegionId" = LocationId OR L."DistrictId" = LocationId OR COALESCE(LocationId, 0) = 0)
		AND MONTH(C."DateFrom") = theMonth 
		AND YEAR(C."DateFrom") = theYear
		GROUP BY C."ClaimID",HF."HfID",CS."ProdID"
	)Claims
	GROUP BY Claims."HFID",Claims."ProdID";
END $$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "public"."udfRemunerated"
-- CAREFUL! I had to change the order of input parameters!
(
	theMonth INT,
	theYear INT,
	HFID INT = 0,
	ProdID INT = 0,
	LocationId INT = 0
)
RETURNS TABLE ("ProdID" INT, "HFID" INT, "Remunerated" INT)
AS $$
BEGIN
	RETURN QUERY
	SELECT Remunerated."ProdID", Remunerated."HFID", SUM(Rem) AS "Remunerated" FROM
	(
		SELECT CI."ProdID", HF."HfID", COALESCE(SUM(CI."RemuneratedAmount"), 0) AS Rem
		FROM "tblClaim" C 
		INNER JOIN "tblClaimItems" CI ON C."ClaimID" = CI."ClaimID"
		INNER JOIN "tblHF" HF ON C."HFID" = HF."HfID"
		INNER JOIN "uvwLocations" L ON HF."LocationId" = L."LocationId"   --Changed From DistrictId to HFLocationId 29062017 Rogers
		WHERE C."ValidityTo" IS NULL 
		AND CI."ValidityTo" IS NULL 
		AND HF."ValidityTo" IS NULL 
		AND (CI."ProdID" = ProdID OR ProdID = 0)
		AND (HF."HfID" = HFID OR HFID = 0)
		AND (L."RegionId" = LocationId OR L."DistrictId" = LocationId OR COALESCE(LocationId, 0) = 0)
		AND MONTH(C."DateFrom") = theMonth 
		AND YEAR(C."DateFrom") = theYear
		AND CI."ClaimItemStatus" = 1
		AND C."ClaimStatus" = 16
		GROUP BY CI."ProdID", HF."HfID"
		UNION ALL
		SELECT CS."ProdID", HF."HfID", COALESCE(SUM(CS."RemuneratedAmount"), 0) AS Rem
		FROM "tblClaim" C 
		INNER JOIN "tblClaimServices" CS ON C."ClaimID" = CS."ClaimID"
		INNER JOIN "tblHF" HF ON C."HFID" = HF."HfID"
		INNER JOIN "uvwLocations" L ON HF."LocationId" = L."LocationId"   --Changed From DistrictId to HFLocationId 29062017 Rogers
		WHERE C."ValidityTo" IS NULL 
		AND CS."ValidityTo" IS NULL 
		AND HF."ValidityTo" IS NULL 
		AND (CS."ProdID" = ProdID OR ProdID = 0)
		AND (HF."HfID" = HFID OR HFID = 0)
		AND (L."RegionId" = LocationId OR L."DistrictId" = LocationId OR COALESCE(LocationId, 0) = 0)
		AND MONTH(C."DateFrom") = theMonth 
		AND YEAR(C."DateFrom") = theYear
		AND CS."ClaimServiceStatus" = 1
		AND C."ClaimStatus" = 16
		GROUP BY CS."ProdID", HF."HfID"
	)Remunerated
	GROUP BY Remunerated."ProdID", Remunerated."HFID";
	RETURN;
END $$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "public"."udfTotalClaims"
-- CAREFUL! I had to change the order of input parameters!
(
	theMonth INT,
	theYear INT,
	ProdID INT = 0,
	HFID INT = 0,
	LocationId INT = 0
)
RETURNS TABLE("ProdID" INT, "HFID" INT, "TotalClaims" INT)
AS $$
BEGIN
	RETURN QUERY
	SELECT ClaimStat."ProdID", ClaimStat."HFID", COUNT(ClaimStat."ClaimID")::INT AS "TotalClaims"
	FROM
	(
		SELECT CI."ProdId", HF."HFID", C."ClaimID"
		FROM "tblClaim" C 
		INNER JOIN "tblClaimItems" CI ON CI."ClaimID" = C."ClaimID"
		INNER JOIN "tblHF" HF ON HF."HfID" = C."HFID"
		INNER JOIN "uvwLocations" L ON L."DistrictId" = HF."LocationId"
		WHERE C."ValidityTo" IS NULL
		AND CI."ValidityTo" IS NULL
		AND HF."ValidityTo" IS NULL
		AND MONTH(C."DateFrom") = theMonth
		AND YEAR(C."DateFrom") = theYear
		AND (CI."ProdID" = ProdID OR ProdID = 0)
		AND (HF."HfID" = HFID OR HFID = 0)
		AND (L."RegionId" = LocationId OR L."DistrictId" = LocationId OR COALESCE(LocationId, 0) = 0)
		GROUP BY "ProdId", HF."HFID", C."ClaimID", C."ClaimCode"
		UNION 
		SELECT CS."ProdId", HF."HFID" ,C."ClaimID"
		FROM "tblClaim" C 
		INNER JOIN "tblClaimServices" CS ON CS."ClaimId" = C."ClaimID"
		INNER JOIN "tblHF" HF ON HF."HfID" = C."HFID"
		INNER JOIN "uvwLocations" L ON L."DistrictId" = HF."LocationId"
		WHERE C."ValidityTo" IS NULL
		AND CS."ValidityTo" IS NULL
		AND HF."ValidityTo" IS NULL
		AND MONTH(C."DateFrom") = Month
		AND YEAR(C."DateFrom") = Year
		AND (CS."ProdID" = ProdID OR ProdID = 0)
		AND (HF."HfID" = HFID OR HFID = 0)
		AND (L."RegionId" = LocationId OR L."DistrictId" = LocationId OR COALESCE(LocationId, 0) = 0)
		GROUP BY "ProdId", HF."HfID", C."ClaimID"
	)ClaimStat
	GROUP BY ClaimStat."ProdID", ClaimStat."HFID";
	RETURN;
END $$ LANGUAGE plpgsql;
