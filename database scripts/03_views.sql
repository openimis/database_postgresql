/*
These are all the views. They *should* have the same output as the SQL Server originals.
Also note the view starting on line 600 that has been commented out. In Your Django
managed code the table "tblFeedbackPrompt" no longer exists. The view depends on it.
*/
CREATE OR REPLACE VIEW "public"."tblDistricts" AS
	SELECT "LocationId" "DistrictId", "LocationCode" "DistrictCode", "LocationName" "DistrictName", "ParentLocationId" "Region", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", "RowId"
	FROM "tblLocations"
	WHERE "ValidityTo" IS NULL
	AND "LocationType" = N'D'
;

CREATE OR REPLACE VIEW "public"."tblRegions" AS
	SELECT "LocationId" "RegionId", "LocationCode" "RegionCode", "LocationName" "RegionName", "ValidityFrom", "ValidityTo",
	       "LegacyID", "AuditUserId", "RowId"
	FROM "tblLocations"
	WHERE "ValidityTo" IS NULL
	AND "LocationType" = N'R'
;

CREATE OR REPLACE VIEW "public"."uvwAmountRejected" AS
	SELECT SUM("Details"."Rejected")"amountrejected",MONTH(coalesce("C"."DateTo", "C"."DateFrom"))MonthTime, QUARTER(coalesce("C"."DateTo", "C"."DateFrom"))QuarterTime, YEAR(coalesce("C"."DateTo", "C"."DateFrom"))YearTime
	,"HF"."HFLevel","HF"."HFCode", "HF"."HFName"
	,"HFR"."RegionName" "Region", "HFD"."DistrictName", "Prod"."ProductCode", "Prod"."ProductName", "HFD"."DistrictName" "HFDistrict", "HFR"."RegionName" "HFRegion"

	FROM "tblClaim" "C" 
	LEFT OUTER JOIN

	(SELECT "ClaimID","ProdID", SUM("QtyProvided" * "PriceAsked")"Rejected" FROM "tblClaimItems" WHERE "ValidityTo" IS NULL GROUP BY "ClaimID","ProdID"
	UNION ALL
	SELECT "ClaimID","ProdID",SUM("QtyProvided" * "PriceAsked")"Rejected" FROM "tblClaimServices" WHERE "ValidityTo" IS NULL GROUP BY "ClaimID","ProdID"
	)"Details" ON "C"."ClaimID" = "Details"."ClaimID"

	LEFT OUTER JOIN "tblProduct" "Prod" ON "Details"."ProdID" = "Prod"."ProdID"
	LEFT OUTER JOIN "tblHF" "HF" ON "C"."HFID" = "HF"."HfID"
	LEFT OUTER JOIN "tblDistricts" "HFD" ON "HF"."LocationId" = "HFD"."DistrictId"
	LEFT OUTER JOIN "tblRegions" "HFR" ON "HFR"."RegionId" = "HFD"."Region"

	WHERE "C"."ValidityTo" IS NULL
	AND "Prod"."ValidityTo" IS NULL
	AND "HF"."ValidityTo" IS NULL
	AND "HFD"."ValidityTo" IS NULL

	AND "C"."ClaimStatus" = 1 --Which is rejected

	--AND ISNULL("Details"."Rejected",0) <> 0

	GROUP BY MONTH(coalesce("C"."DateTo", "C"."DateFrom")), QUARTER(coalesce("C"."DateTo", "C"."DateFrom")), YEAR(coalesce("C"."DateTo", "C"."DateFrom"))
	,"HF"."HFLevel","HF"."HFCode", "HF"."HFName"
	, "Prod"."ProductCode", "Prod"."ProductName", "HFD"."DistrictName", "HFR"."RegionName"
;

CREATE OR REPLACE VIEW "public"."uvwAmountValuated" AS
	SELECT SUM("Details"."Valuated")"AmountValuated",MONTH(coalesce("C"."DateTo", "C"."DateFrom"))MonthTime, QUARTER(coalesce("C"."DateTo", "C"."DateFrom"))QuarterTime, YEAR(coalesce("C"."DateTo", "C"."DateFrom"))YearTime
	,"HF"."HFLevel","HF"."HFCode", "HF"."HFName"
	,"HFR"."RegionName" "Region", "HFD"."DistrictName", "Prod"."ProductCode", "Prod"."ProductName", "HFD"."DistrictName" "HFDistrict", "HFR"."RegionName" "HFRegion"

	FROM "tblClaim" "C" 
	LEFT OUTER JOIN

	(SELECT "ClaimID","ProdID", SUM("RemuneratedAmount") "Valuated" FROM "tblClaimItems" WHERE "ValidityTo" IS NULL GROUP BY "ClaimID","ProdID"
	UNION ALL
	SELECT "ClaimID","ProdID",SUM("RemuneratedAmount") "Valuated" FROM "tblClaimServices" WHERE "ValidityTo" IS NULL GROUP BY "ClaimID","ProdID"
	)"Details" ON "C"."ClaimID" = "Details"."ClaimID"


	LEFT OUTER JOIN "tblProduct" "Prod" ON "Details"."ProdID" = "Prod"."ProdID"
	LEFT OUTER JOIN "tblHF" "HF" ON "C"."HFID" = "HF"."HfID"
	LEFT OUTER JOIN "tblDistricts" "HFD" ON "HF"."LocationId" = "HFD"."DistrictId"
	LEFT OUTER JOIN "tblRegions" "HFR" ON "HFD"."Region" = "HFR"."RegionId"

	WHERE "C"."ValidityTo" IS NULL
	--AND Prod.ValidityTo IS NULL
	--AND D.ValidityTo IS NULL
	--AND HF.ValidityTo IS NULL
	--AND HFD.ValidityTo IS NULL
	AND "C"."ClaimStatus" = 16 --Which is Processed and greater

	GROUP BY MONTH(coalesce("C"."DateTo", "C"."DateFrom")), QUARTER(coalesce("C"."DateTo", "C"."DateFrom")), YEAR(coalesce("C"."DateTo", "C"."DateFrom"))
	,"HF"."HFLevel","HF"."HFCode", "HF"."HFName"
	,"Prod"."ProductCode", "Prod"."ProductName", "HFD"."DistrictName", "HFR"."RegionName"
;

CREATE OR REPLACE VIEW "public"."uvwClaimEntered" AS
	SELECT COUNT(1)"TotalClaimEntered",MONTH(coalesce("C"."DateTo", "C"."DateFrom"))MonthTime, QUARTER(coalesce("C"."DateTo", "C"."DateFrom"))QuarterTime, YEAR(coalesce("C"."DateTo", "C"."DateFrom"))YearTime,
	"HF"."HFLevel","HF"."HFCode", "HF"."HFName","HFD"."DistrictName" "HFDistrict", "HFR"."RegionName" "HFRegion"
	FROM "tblClaim" "C"
	
	LEFT OUTER JOIN "tblHF" "HF" ON "C"."HFID" = "HF"."HfID"
	LEFT OUTER JOIN "tblDistricts" "HFD" ON "HF"."LocationId" = "HFD"."DistrictId"
	INNER JOIN "tblRegions" "HFR" ON "HFD"."Region" = "HFR"."RegionId"
	WHERE "C"."ValidityTo" IS NULL 
	GROUP BY MONTH(coalesce("C"."DateTo", "C"."DateFrom")), QUARTER(coalesce("C"."DateTo", "C"."DateFrom")), YEAR(coalesce("C"."DateTo", "C"."DateFrom")),
	"HF"."HFLevel","HF"."HFCode", "HF"."HFName","HFD"."DistrictName", "HFR"."RegionName"
;

CREATE OR REPLACE VIEW "public"."uvwClaimProcessed" AS
	SELECT COUNT(1)TotalClaimProcessed,MONTH(coalesce("C"."DateTo", "C"."DateFrom"))MonthTime, QUARTER(coalesce("C"."DateTo", "C"."DateFrom"))QuarterTime, YEAR(coalesce("C"."DateTo", "C"."DateFrom"))YearTime,
	"HF"."HFLevel","HF"."HFCode", "HF"."HFName","HFD"."DistrictName" "HFDistrict", "HFD"."DistrictName", "Prod"."ProductCode", "Prod"."ProductName", "HFR"."RegionName" "Region", "HFR"."RegionName" "HFRegion"
	FROM "tblClaim" "C"
	LEFT OUTER JOIN
	(SELECT "ClaimID","ProdID" FROM "tblClaimItems" WHERE "ValidityTo" IS NULL AND "ProdID" IS NOT NULL GROUP BY "ClaimID","ProdID"
	UNION
	SELECT "ClaimID","ProdID" FROM "tblClaimServices" WHERE "ValidityTo" IS NULL AND "ProdID" IS NOT NULL GROUP BY "ClaimID","ProdID"
	)"Details" ON "C"."ClaimID" = "Details"."ClaimID"

	LEFT OUTER JOIN "tblHF" "HF" ON "C"."HFID" = "HF"."HfID"
	LEFT OUTER JOIN "tblDistricts" "HFD" ON "HF"."LocationId" = "HFD"."DistrictId"
	LEFT OUTER JOIN "tblProduct" "Prod" ON "Details"."ProdID" = "Prod"."ProdID"
	LEFT OUTER JOIN "tblRegions" "HFR" ON "HFD"."Region" = "HFR"."RegionId"

	WHERE "C"."ValidityTo" IS NULL 
	AND ("C"."ClaimStatus" >= 8)
	GROUP BY MONTH(coalesce("C"."DateTo", "C"."DateFrom")), QUARTER(coalesce("C"."DateTo", "C"."DateFrom")), YEAR(coalesce("C"."DateTo", "C"."DateFrom")),
	"HF"."HFLevel","HF"."HFCode", "HF"."HFName","HFD"."DistrictName" , "Prod"."ProductCode", "Prod"."ProductName", "HFR"."RegionName"
;

CREATE OR REPLACE VIEW "public"."uvwClaimRejected" AS
	SELECT COUNT(1)"TotalClaimRejected",MONTH(coalesce("C"."DateTo", "C"."DateFrom"))MonthTime, QUARTER(coalesce("C"."DateTo", "C"."DateFrom"))QuarterTime, YEAR(coalesce("C"."DateTo", "C"."DateFrom"))YearTime,
	"HF"."HFLevel","HF"."HFCode", "HF"."HFName","HFD"."DistrictName" "HFDistrict", "HFR"."RegionName" "HFRegion"
	FROM "tblClaim" "C"

	LEFT OUTER JOIN "tblHF" "HF" ON "C"."HFID" = "HF"."HfID"
	LEFT OUTER JOIN "tblDistricts" "HFD" ON "HF"."LocationId" = "HFD"."DistrictId"
	INNER JOIN "tblRegions" "HFR" ON "HFD"."Region" = "HFR"."RegionId"
	WHERE "C"."ValidityTo" IS NULL 
	AND "C"."ClaimStatus" = 1

	GROUP BY MONTH(coalesce("C"."DateTo", "C"."DateFrom")), QUARTER(coalesce("C"."DateTo", "C"."DateFrom")), YEAR(coalesce("C"."DateTo", "C"."DateFrom")),
	"HF"."HFLevel","HF"."HFCode", "HF"."HFName","HFD"."DistrictName" , "HFR"."RegionName"
;

CREATE OR REPLACE VIEW "public"."uvwClaimSent" AS
	SELECT COUNT("C"."ClaimID")ClaimSent,MONTH("C"."DateClaimed")MonthTime, QUARTER("C"."DateClaimed")QuarterTime, YEAR("C"."DateClaimed")YearTime
	,"HF"."HFLevel","HF"."HFCode", "HF"."HFName"
	,"HFR"."RegionName" Region, "HFD"."DistrictName", "Prod"."ProductCode", "Prod"."ProductName", "HFD"."DistrictName" "HFDistrict", "HFR"."RegionName" "HFRegion"

	FROM "tblClaim" "C" 
		INNER JOIN
		(SELECT "ClaimID","ProdID" FROM "tblClaimItems" WHERE "ValidityTo" IS NULL
		UNION 
		SELECT "ClaimID","ProdID" FROM "tblClaimServices" WHERE "ValidityTo" IS NULL
		)"Details" ON "C"."ClaimID" = "Details"."ClaimID"
		INNER JOIN "tblProduct" "Prod" ON "Details"."ProdID" = "Prod"."ProdID"
		INNER JOIN "tblHF" "HF" ON "C"."HFID" = "HF"."HfID"
		INNER JOIN "tblDistricts" "HFD" ON "HF"."LocationId" = "HFD"."DistrictId"
		INNER JOIN "tblRegions" "HFR" ON "HFR"."RegionId" = "HFD"."Region"

		WHERE "C"."ValidityTo" IS NULL
		AND "Prod"."ValidityTo" IS NULL
		AND "HF"."ValidityTo" IS NULL
		AND "HFD"."ValidityTo" IS NULL
		AND "C"."ClaimStatus" > 2 --Which is entered

	GROUP BY MONTH("C"."DateClaimed"), QUARTER("C"."DateClaimed"), YEAR("C"."DateClaimed")
	,"HF"."HFLevel","HF"."HFCode", "HF"."HFName"
	,"Prod"."ProductCode", "Prod"."ProductName", "HFD"."DistrictName", "HFR"."RegionName"
;

CREATE OR REPLACE VIEW "public"."uvwClaimSubmitted" AS
	SELECT COUNT(1)TotalClaimSubmitted,MONTH(coalesce("C"."DateTo", "C"."DateFrom"))MonthTime, QUARTER(coalesce("C"."DateTo", "C"."DateFrom"))QuarterTime, YEAR(coalesce("C"."DateTo", "C"."DateFrom"))YearTime,
	"HF"."HFLevel","HF"."HFCode", "HF"."HFName", "HFD"."DistrictName" "HFDistrict", "HFR"."RegionName" "HFRegion"
	FROM "tblClaim" "C"  LEFT OUTER JOIN "tblHF" "HF" ON "C"."HFID" = "HF"."HfID"
	LEFT OUTER JOIN "tblDistricts" "HFD" ON "HF"."LocationId" = "HFD"."DistrictId"
	INNER JOIN "tblRegions" "HFR" ON "HFR"."RegionId" = "HFD"."Region"
	WHERE "C"."ValidityTo" IS NULL 
	AND ("C"."ClaimStatus" >= 4 OR "C"."ClaimStatus" = 1)
	GROUP BY MONTH(coalesce("C"."DateTo", "C"."DateFrom")), QUARTER(coalesce("C"."DateTo", "C"."DateFrom")), YEAR(coalesce("C"."DateTo", "C"."DateFrom")),
	"HF"."HFLevel","HF"."HFCode", "HF"."HFName","HFD"."DistrictName", "HFR"."RegionName"
;

CREATE OR REPLACE VIEW "public"."uvwClaimValuated" AS
	SELECT COUNT(1)"TotalClaimValuated",MONTH(coalesce("C"."DateTo", "C"."DateFrom"))MonthTime, QUARTER(coalesce("C"."DateTo", "C"."DateFrom"))QuarterTime, YEAR(coalesce("C"."DateTo", "C"."DateFrom"))YearTime,
	"HF"."HFLevel","HF"."HFCode", "HF"."HFName","HFD"."DistrictName" "HFDistrict", "HFD"."DistrictName", "Prod"."ProductCode", "Prod"."ProductName", "HFR"."RegionName" Region, "HFR"."RegionName" "HFRegion"
	FROM "tblClaim" "C"  
	LEFT OUTER JOIN
	(SELECT "ClaimID","ProdID" FROM "tblClaimItems" WHERE "ValidityTo" IS NULL AND "ProdID" IS NOT NULL GROUP BY "ClaimID","ProdID"
	UNION
	SELECT "ClaimID","ProdID" FROM "tblClaimServices" WHERE "ValidityTo" IS NULL AND "ProdID" IS NOT NULL GROUP BY "ClaimID","ProdID"
	)"Details" ON "C"."ClaimID" = "Details"."ClaimID"
	LEFT OUTER JOIN "tblHF" "HF" ON "C"."HFID" = "HF"."HfID"
	LEFT OUTER JOIN "tblDistricts" "HFD" ON "HF"."LocationId" = "HFD"."DistrictId"
	LEFT OUTER JOIN "tblProduct" "Prod" ON "Details"."ProdID" = "Prod"."ProdID"
	LEFT OUTER JOIN "tblRegions" "HFR" ON "HFD"."Region" = "HFR"."RegionId"

	WHERE "C"."ValidityTo" IS NULL 
	AND "C"."ClaimStatus" = 16
	GROUP BY MONTH(coalesce("C"."DateTo", "C"."DateFrom")), QUARTER(coalesce("C"."DateTo", "C"."DateFrom")), YEAR(coalesce("C"."DateTo", "C"."DateFrom")),
	"HF"."HFLevel","HF"."HFCode", "HF"."HFName","HFD"."DistrictName" , "Prod"."ProductCode", "Prod"."ProductName", "HFR"."RegionName"
;

CREATE OR REPLACE VIEW "public"."tblVillages" AS
SELECT "LocationId" "VillageId", "ParentLocationId" "WardId", "LocationCode" "VillageCode", "LocationName" "VillageName","MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId" --, "RowId"
FROM "public"."tblLocations"
WHERE "ValidityTo" IS NULL
AND "LocationType" = N'V'
;

CREATE OR REPLACE VIEW "public"."tblWards" AS
SELECT "LocationId" "WardId", "ParentLocationId" "DistrictId", "LocationCode" "WardCode", "LocationName" "WardName", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId" --, "RowId"
FROM "public"."tblLocations"
WHERE "ValidityTo" IS NULL
AND "LocationType" = N'W'
;

CREATE OR REPLACE VIEW "public"."uvwExpenditureInsureeRange" AS
	WITH "Val" AS
	(
	SELECT "ClaimID", SUM("PriceValuated") "Valuated", "ProdID" FROM "tblClaimItems" WHERE "ValidityTo" IS NULL AND "PriceValuated" IS NOT NULL GROUP BY "ClaimID", "ProdID"
	UNION ALL
	SELECT "ClaimID", SUM("PriceValuated") "Valuated", "ProdID" FROM "tblClaimServices" WHERE "ValidityTo" IS NULL AND "PriceValuated" IS NOT NULL GROUP BY "ClaimID", "ProdID"
	) 
	SELECT SUM("Val"."Valuated")"Valuated","C"."ClaimID" "Insuree", MONTH(coalesce("C"."DateTo", "C"."DateFrom"))MonthTime, QUARTER(coalesce("C"."DateTo", "C"."DateFrom"))QuarterTime, YEAR(coalesce("C"."DateTo", "C"."DateFrom"))YearTime
	,"R"."RegionName" "Region", "D"."DistrictName", "Prod"."ProductCode", "Prod"."ProductName"
	,DATEDIFF_YEAR("I"."DOB",coalesce("C"."DateTo", "C"."DateFrom"))"Age","I"."Gender"

	FROM "Val" INNER JOIN "tblClaim" "C" ON "Val"."ClaimID" = "C"."ClaimID"
	INNER JOIN "tblProduct" "Prod" ON "Val"."ProdID" = "Prod"."ProdID"
	INNER JOIN "tblInsuree" "I" ON "C"."InsureeID" = "I"."InsureeID"
	INNER JOIN "tblFamilies" "F" ON "F"."InsureeID" = "I"."InsureeID"
	INNER JOIN "tblVillages" "V" ON "V"."VillageId" = "F"."LocationId"
	INNER JOIN "tblWards" "W" ON "W"."WardId" = "V"."WardId"
	INNER JOIN "tblDistricts" "D" ON "D"."DistrictId" = "W"."DistrictId"
	INNER JOIN "tblRegions" "R" ON "R"."RegionId" = "D"."Region"

	WHERE "C"."ValidityTo" IS NULL
	 AND "Prod"."ValidityTo" IS NULL
	 AND "I"."ValidityTo" IS NULL
	 AND "F"."ValidityTo" IS NULL
	 AND "D"."ValidityTo" IS NULL

	 GROUP BY "C"."ClaimID", MONTH(coalesce("C"."DateTo", "C"."DateFrom")), QUARTER(coalesce("C"."DateTo", "C"."DateFrom")), YEAR(coalesce("C"."DateTo", "C"."DateFrom"))
	,"R"."RegionName", "D"."DistrictName", "Prod"."ProductCode", "Prod"."ProductName"
	,DATEDIFF_YEAR("I"."DOB",coalesce("C"."DateTo", "C"."DateFrom")),"I"."Gender"
;

CREATE OR REPLACE VIEW "public"."uvwHospitalAdmissions" AS
	SELECT  COUNT("C"."ClaimID") AS Admissions, MONTH(coalesce("C"."DateTo", "C"."DateFrom")) AS MonthTime, QUARTER( coalesce("C"."DateTo", "C"."DateFrom")) AS QuarterTime, 
			YEAR(coalesce("C"."DateTo", "C"."DateFrom")) AS YearTime, "HFR"."RegionName" AS Region, "HFD"."DistrictName", "Prod"."ProductCode", "Prod"."ProductName", DATEDIFF_YEAR("I"."DOB",coalesce("C"."DateTo", "C"."DateFrom")) AS "Age", "I"."Gender", "HF"."HFLevel", "HF"."HFCode", "HF"."HFName", "C"."VisitType", "ICD"."ICDCode", "ICD"."ICDName", "HFD"."DistrictName" AS "HFDistrict", "HFR"."RegionName" AS "HFRegion"
	FROM  public."tblClaim" AS "C" 
	LEFT OUTER JOIN (SELECT        "ClaimID", "ProdID"
								   FROM            public."tblClaimItems"
								   WHERE        ("ValidityTo" IS NULL AND "RejectionReason"=0)
								   UNION
								   SELECT        "ClaimID", "ProdID"
								   FROM            public."tblClaimServices"
								   WHERE        ("ValidityTo" IS NULL AND "RejectionReason"=0)) AS "Details" ON "C"."ClaimID" = "Details"."ClaimID" 
	 LEFT OUTER JOIN
							 public."tblProduct" AS "Prod" ON "Details"."ProdID" = "Prod"."ProdID" LEFT OUTER JOIN
							 public."tblInsuree" AS "I" ON "C"."InsureeID" = "I"."InsureeID" LEFT OUTER JOIN
							 public."tblHF" AS "HF" ON "C"."HFID" = "HF"."HfID" LEFT OUTER JOIN
							 public."tblICDCodes" AS "ICD" ON "C"."ICDID" = "ICD"."ICDID" LEFT OUTER JOIN
							 public."tblDistricts" AS "HFD" ON "HF"."LocationId" = "HFD"."DistrictId" LEFT OUTER JOIN
							 public."tblRegions" AS"HFR" ON "HFR"."RegionId" = "HFD"."Region"
	WHERE        ("C"."ValidityTo" IS NULL) AND ("Prod"."ValidityTo" IS NULL) AND ("I"."ValidityTo" IS NULL) AND ("HF"."ValidityTo" IS NULL) AND ("HFD"."ValidityTo" IS NULL) AND (DATEDIFF_DAY(
							 "C"."DateFrom", "C"."DateTo") > 0)
							 AND "C"."ClaimStatus"<>1
	GROUP BY MONTH(coalesce("C"."DateTo", "C"."DateFrom")), QUARTER( coalesce("C"."DateTo", "C"."DateFrom")), YEAR(coalesce("C"."DateTo", "C"."DateFrom")), "Prod"."ProductCode", 
							 "Prod"."ProductName", DATEDIFF_YEAR("I"."DOB", coalesce("C"."DateTo", "C"."DateFrom")), "I"."Gender", "HF"."HFLevel", "HF"."HFCode", "HF"."HFName", "C"."VisitType", "ICD"."ICDCode", 
						   "ICD"."ICDName", "HFD"."DistrictName", "HFR"."RegionName"
;

CREATE OR REPLACE VIEW "public"."uvwHospitalDays" AS
	SELECT        SUM(DATEDIFF_DAY("C"."DateFrom", "C"."DateTo")) AS HospitalDays, MONTH(coalesce("C"."DateTo", "C"."DateFrom")) AS MonthTime, QUARTER( coalesce("C"."DateTo", 
							 "C"."DateFrom")) AS QuarterTime, YEAR(coalesce("C"."DateTo", "C"."DateFrom")) AS YearTime, "HFR"."RegionName" AS "Region", "HFD"."DistrictName", "Prod"."ProductCode", 
							 "Prod"."ProductName", DATEDIFF_YEAR("I"."DOB", coalesce("C"."DateTo", "C"."DateFrom")) AS "Age", "I"."Gender", "HF"."HFLevel", "HF"."HFCode", "HF"."HFName", "C"."VisitType", "ICD"."ICDCode", 
							 "ICD"."ICDName", "HFD"."DistrictName" AS "HFDistrict", "HFR"."RegionName" AS "HFRegion"
	FROM            public."tblClaim" AS "C" LEFT OUTER JOIN
								 (SELECT        "ClaimID", "ProdID"
								   FROM            public."tblClaimItems"
								   WHERE        ("ValidityTo" IS NULL AND "RejectionReason"=0)
								   UNION
								   SELECT        "ClaimID", "ProdID"
								   FROM            public."tblClaimServices"
								   WHERE        ("ValidityTo" IS NULL AND "RejectionReason"=0)) AS "Details" ON "C"."ClaimID" = "Details"."ClaimID" LEFT OUTER JOIN
							 public."tblProduct" AS "Prod" ON "Details"."ProdID" = "Prod"."ProdID" LEFT OUTER JOIN
							 public."tblInsuree" AS "I" ON "C"."InsureeID" = "I"."InsureeID" LEFT OUTER JOIN
							 public."tblHF" AS "HF" ON "C"."HFID" = "HF"."HfID" LEFT OUTER JOIN
							 public."tblICDCodes" AS "ICD" ON "C"."ICDID" = "ICD"."ICDID" LEFT OUTER JOIN
							 public."tblDistricts" AS "HFD" ON "HF"."LocationId" = "HFD"."DistrictId" LEFT OUTER JOIN
							 public."tblRegions" AS"HFR" ON "HFR"."RegionId" = "HFD"."Region"
	WHERE        ("C"."ValidityTo" IS NULL) AND ("Prod"."ValidityTo" IS NULL) AND ("I"."ValidityTo" IS NULL) AND ("HF"."ValidityTo" IS NULL) AND ("HFD"."ValidityTo" IS NULL) AND (DATEDIFF_DAY(
							 "C"."DateFrom", "C"."DateTo") > 0) AND "C"."ClaimStatus" <>1
	GROUP BY MONTH(coalesce("C"."DateTo", "C"."DateFrom")), QUARTER( coalesce("C"."DateTo", "C"."DateFrom")), YEAR(coalesce("C"."DateTo", "C"."DateFrom")), "Prod"."ProductCode", 
							 "Prod"."ProductName", DATEDIFF_YEAR("I"."DOB", coalesce("C"."DateTo", "C"."DateFrom")), "I"."Gender", "HF"."HFLevel", "HF"."HFCode", "HF"."HFName", "C"."VisitType", "ICD"."ICDCode", 
							 "ICD"."ICDName", "HFD"."DistrictName", "HFR"."RegionName"
;

CREATE OR REPLACE VIEW "public"."uvwItemExpenditures" AS
	SELECT SUM("CI"."RemuneratedAmount")"ItemExpenditure",MONTH(coalesce("C"."DateTo","C"."DateFrom"))MonthTime,QUARTER(coalesce("C"."DateTo","C"."DateFrom"))QuarterTime,YEAR(coalesce("C"."DateTo","C"."DateFrom"))YearTime,
	"R"."RegionName" "Region","HFD"."DistrictName","PR"."ProductCode","PR"."ProductName",DATEDIFF_YEAR("I"."DOB",coalesce("C"."DateTo", "C"."DateFrom"))"Age","I"."Gender",
	"Itm"."ItemType","Itm"."ItemCode","Itm"."ItemName",CASE WHEN DATEDIFF_DAY("C"."DateFrom", "C"."DateTo") > 0 THEN N'I' ELSE N'O' END "ItemCareType",
	"HF"."HFLevel","HF"."HFCode","HF"."HFName","C"."VisitType", "ICD"."ICDCode","ICD"."ICDName",
	"DIns"."DistrictName" "IDistrictName" , "W"."WardName", "V"."VillageName", "HFD"."DistrictName" "HFDistrict", "HFR"."RegionName" "HFRegion", "HFR"."RegionName" "ProdRegion"

	FROM "tblClaimItems" "CI"
	INNER JOIN "tblClaim" "C" ON "CI"."ClaimID" = "C"."ClaimID"
	INNER JOIN "tblProduct" "PR" ON "CI"."ProdID" = "PR"."ProdID"
	INNER JOIN "tblInsuree" "I" ON "C"."InsureeID" = "I"."InsureeID"
	INNER JOIN "tblFamilies" "F" ON "I"."FamilyID" = "F"."FamilyID"
	INNER JOIN "tblVillages" "V" ON "V"."VillageId" = "F"."LocationId"
	INNER JOIN "tblWards" "W" ON "W"."WardId" = "V"."WardId"
	INNER JOIN "tblDistricts" "DIns" ON "DIns"."DistrictId" = "W"."DistrictId"
	INNER JOIN "tblItems" "Itm" ON "CI"."ItemID" = "Itm"."ItemID"
	INNER JOIN "tblHF" "HF" ON "C"."HFID" = "HF"."HfID"
	INNER JOIN "tblICDCodes" "ICD" ON "C"."ICDID" = "ICD"."ICDID"
	INNER JOIN "tblDistricts" "HFD" ON "HF"."LocationId" = "HFD"."DistrictId"
	INNER JOIN "tblRegions" "R" ON "DIns"."Region" = "R"."RegionId"
	INNER JOIN "tblRegions" "HFR" ON "HFR"."RegionId" = "HFD"."Region"
	

	WHERE "CI"."ValidityTo" IS NULL
	AND "C"."ValidityTo" IS NULL
	AND "PR"."ValidityTo" IS NULL
	AND "I"."ValidityTo" IS NULL
	AND "I"."ValidityTo" IS NULL
	AND "HF"."ValidityTo" IS NULL
	AND "HFD"."ValidityTo" IS NULL
	AND "C"."ClaimStatus" >= 8		--Consider only Processed(8) and "Valuated"(16) Claims
	--AND coalesce("CI"."PriceValuated",0) > 0
	--Also add a criteria if they want the batch id as well

	GROUP BY MONTH(coalesce("C"."DateTo","C"."DateFrom")),QUARTER(coalesce("C"."DateTo","C"."DateFrom")),YEAR(coalesce("C"."DateTo","C"."DateFrom")),
	"R"."RegionName", "PR"."ProductCode","PR"."ProductName",DATEDIFF_YEAR("I"."DOB",coalesce("C"."DateTo", "C"."DateFrom")),"I"."Gender",
	"Itm"."ItemType","Itm"."ItemCode","Itm"."ItemName",DATEDIFF_DAY("C"."DateFrom", "C"."DateTo"),
	"HF"."HFLevel","HF"."HFCode","HF"."HFName","C"."VisitType", "ICD"."ICDCode","ICD"."ICDName",
	"DIns"."DistrictName", "W"."WardName", "V"."VillageName", "HFD"."DistrictName", "HFR"."RegionName"
;

CREATE OR REPLACE VIEW "public"."uvwItemUtilization" AS
	SELECT SUM("CI"."QtyProvided") AS "ItemUtilized", MONTH(coalesce("C"."DateTo", "C"."DateFrom")) AS MonthTime, QUARTER( coalesce("C"."DateTo", "C"."DateFrom")) 
		   AS QuarterTime, YEAR(coalesce("C"."DateTo", "C"."DateFrom")) AS YearTime, "R"."RegionName" AS "Region", "DIns"."DistrictName", "Prod"."ProductCode", "Prod"."ProductName", 
		   DATEDIFF_YEAR("I"."DOB", coalesce("C"."DateTo", "C"."DateFrom")) AS "Age", "I"."Gender", "Itm"."ItemType", "Itm"."ItemCode", "Itm"."ItemName", CASE WHEN DATEDIFF_DAY("C"."DateFrom", 
		   "C"."DateTo") > 0 THEN N'I' ELSE N'O' END AS "ItemCareType", "HF"."HFLevel", "HF"."HFCode", "HF"."HFName", "ICD"."ICDCode", "ICD"."ICDName", "DIns"."DistrictName" AS "IDistrictName", 
		   "W"."WardName", "V"."VillageName", "HFD"."DistrictName" AS "HFDistrict", "C"."VisitType", "HFR"."RegionName" AS "HFRegion", "R"."RegionName" AS "ProdRegion"
	FROM public."tblClaimItems" AS "CI"
	INNER JOIN public."tblClaim" AS "C" ON "C"."ClaimID" = "CI"."ClaimID" 
	LEFT OUTER JOIN public."tblProduct" AS "Prod" ON "CI"."ProdID" = "Prod"."ProdID" 
	INNER JOIN public."tblInsuree" AS "I" ON "C"."InsureeID" = "I"."InsureeID" 
	INNER JOIN public."tblFamilies" AS "F" ON "I"."FamilyID" = "F"."FamilyID" 
	INNER JOIN public."tblVillages" AS "V" ON "V"."VillageId" = "F"."LocationId" 
	INNER JOIN public."tblWards" AS "W" ON "W"."WardId" = "V"."WardId" 
	INNER JOIN public."tblDistricts" AS "DIns" ON "DIns"."DistrictId" = "W"."DistrictId" 
	
	INNER JOIN public."tblItems" AS "Itm" ON "CI"."ItemID" = "Itm"."ItemID" 
	INNER JOIN public."tblHF" AS "HF" ON "C"."HFID" = "HF"."HfID" 
	INNER JOIN public."tblICDCodes" AS "ICD" ON "C"."ICDID" = "ICD"."ICDID" 
	INNER JOIN public."tblDistricts" AS "HFD" ON "HF"."LocationId" = "HFD"."DistrictId" 
	INNER JOIN public."tblRegions" AS "R" ON "R"."RegionId" = "DIns"."Region" 
	INNER JOIN public."tblRegions" AS"HFR" ON "HFR"."RegionId" = "HFD"."Region"

	WHERE ("CI"."ValidityTo" IS NULL) 
	AND ("C"."ValidityTo" IS NULL) 
	AND ("Prod"."ValidityTo" IS NULL)
	AND ("Itm"."ValidityTo" IS NULL) 
	AND ("HF"."ValidityTo" IS NULL) 
	AND ("HFD"."ValidityTo" IS NULL) 
	AND ("C"."ClaimStatus" > 2)
	AND "CI"."RejectionReason"=0
	GROUP BY MONTH(coalesce("C"."DateTo", "C"."DateFrom")), QUARTER( coalesce("C"."DateTo", "C"."DateFrom")), YEAR(coalesce("C"."DateTo", "C"."DateFrom")), "R"."RegionName", 
	"Prod"."ProductCode", "Prod"."ProductName", DATEDIFF_YEAR("I"."DOB", coalesce("C"."DateTo", "C"."DateFrom")), "I"."Gender", "Itm"."ItemType", "Itm"."ItemCode", "Itm"."ItemName", DATEDIFF_DAY(
	"C"."DateFrom", "C"."DateTo"), "HF"."HFLevel", "HF"."HFCode", "HF"."HFName", "ICD"."ICDCode", "ICD"."ICDName", "DIns"."DistrictName", "W"."WardName", "V"."VillageName",  "C"."VisitType"
	,"HFD"."DistrictName", "HFR"."RegionName"
;

CREATE OR REPLACE VIEW "public"."uvwNumberFeedbackAnswerYes" AS
	SELECT COUNT("F"."FeedbackID")"AnsYes", 1 "QuestionId",MONTH("F"."FeedbackDate")MonthTime, QUARTER("F"."FeedbackDate")QuarterTime, YEAR("F"."FeedbackDate")YearTime
	,"HF"."HFLevel","HF"."HFCode", "HF"."HFName"
	,"HFR"."RegionName" "Region", "HFD"."DistrictName", "Prod"."ProductCode", "Prod"."ProductName", "HFD"."DistrictName" "HFDistrict", "HFR"."RegionName" "HFRegion"

	FROM "tblFeedback" "F" INNER JOIN "tblClaim" "C" ON "F"."ClaimID" = "C"."ClaimID"
	INNER JOIN
		(SELECT "ClaimID","ProdID" FROM "tblClaimItems" WHERE "ValidityTo" IS NULL
		UNION 
		SELECT "ClaimID","ProdID" FROM "tblClaimServices" WHERE "ValidityTo" IS NULL
		)"Details" ON "C"."ClaimID" = "Details"."ClaimID"

	INNER JOIN "tblProduct" "Prod" ON "Details"."ProdID" = "Prod"."ProdID"
	INNER JOIN "tblHF" "HF" ON "C"."HFID" = "HF"."HfID"
	INNER JOIN "tblDistricts" "HFD" ON "HF"."LocationId" = "HFD"."DistrictId"
	INNER JOIN "tblRegions" "HFR" ON "HFR"."RegionId" = "HFD"."Region"


	WHERE "F"."ValidityTo" IS NULL
	AND "F"."CareRendered" = TRUE

	GROUP BY MONTH("F"."FeedbackDate"), QUARTER("F"."FeedbackDate"), YEAR("F"."FeedbackDate"),
	"HF"."HFLevel","HF"."HFCode", "HF"."HFName"
	, "Prod"."ProductCode", "Prod"."ProductName", "HFD"."DistrictName", "HFR"."RegionName"

	UNION ALL

	SELECT COUNT("F"."FeedbackID")"AnsYes", 2 "QuestionId",MONTH("F"."FeedbackDate")MonthTime, QUARTER("F"."FeedbackDate")QuarterTime, YEAR("F"."FeedbackDate")YearTime
	,"HF"."HFLevel","HF"."HFCode", "HF"."HFName"
	,"HFR"."RegionName" "Region", "HFD"."DistrictName", "Prod"."ProductCode", "Prod"."ProductName", "HFD"."DistrictName" "HFDistrict", "HFR"."RegionName" "HFRegion"

	FROM "tblFeedback" "F" INNER JOIN "tblClaim" "C" ON "F"."ClaimID" = "C"."ClaimID"
	INNER JOIN
		(SELECT "ClaimID","ProdID" FROM "tblClaimItems" WHERE "ValidityTo" IS NULL
		UNION 
		SELECT "ClaimID","ProdID" FROM "tblClaimServices" WHERE "ValidityTo" IS NULL
		)"Details" ON "C"."ClaimID" = "Details"."ClaimID"

	INNER JOIN "tblProduct" "Prod" ON "Details"."ProdID" = "Prod"."ProdID"
	INNER JOIN "tblHF" "HF" ON "C"."HFID" = "HF"."HfID"
	INNER JOIN "tblDistricts" "HFD" ON "HF"."LocationId" = "HFD"."DistrictId"
	INNER JOIN "tblRegions" "HFR" ON "HFR"."RegionId" = "HFD"."Region"

	WHERE "F"."ValidityTo" IS NULL
	AND "F"."PaymentAsked" = TRUE

	GROUP BY MONTH("F"."FeedbackDate"), QUARTER("F"."FeedbackDate"), YEAR("F"."FeedbackDate"),
	"HF"."HFLevel","HF"."HFCode", "HF"."HFName"
	, "Prod"."ProductCode", "Prod"."ProductName", "HFD"."DistrictName", "HFR"."RegionName"

	UNION ALL

	SELECT COUNT("F"."FeedbackID")"AnsYes", 3 "QuestionId",MONTH("F"."FeedbackDate")MonthTime, QUARTER("F"."FeedbackDate")QuarterTime, YEAR("F"."FeedbackDate")YearTime
	,"HF"."HFLevel","HF"."HFCode", "HF"."HFName"
	,"HFR"."RegionName" "Region", "HFD"."DistrictName", "Prod"."ProductCode", "Prod"."ProductName", "HFD"."DistrictName" "HFDistrict", "HFR"."RegionName" "HFRegion"

	FROM "tblFeedback" "F" INNER JOIN "tblClaim" "C" ON "F"."ClaimID" = "C"."ClaimID"
	INNER JOIN
		(SELECT "ClaimID","ProdID" FROM "tblClaimItems" WHERE "ValidityTo" IS NULL
		UNION 
		SELECT "ClaimID","ProdID" FROM "tblClaimServices" WHERE "ValidityTo" IS NULL
		)"Details" ON "C"."ClaimID" = "Details"."ClaimID"

	INNER JOIN "tblProduct" "Prod" ON "Details"."ProdID" = "Prod"."ProdID"
	INNER JOIN "tblHF" "HF" ON "C"."HFID" = "HF"."HfID"
	INNER JOIN "tblDistricts" "HFD" ON "HF"."LocationId" = "HFD"."DistrictId"
	INNER JOIN "tblRegions" "HFR" ON "HFR"."RegionId" = "HFD"."Region"

	WHERE "F"."ValidityTo" IS NULL
	AND "F"."DrugPrescribed" = TRUE

	GROUP BY MONTH("F"."FeedbackDate"), QUARTER("F"."FeedbackDate"), YEAR("F"."FeedbackDate"),
	"HF"."HFLevel","HF"."HFCode", "HF"."HFName"
	, "Prod"."ProductCode", "Prod"."ProductName", "HFD"."DistrictName", "HFR"."RegionName"

	UNION ALL

	SELECT COUNT("F"."FeedbackID")"AnsYes", 4 "QuestionId",MONTH("F"."FeedbackDate")MonthTime, QUARTER("F"."FeedbackDate")QuarterTime, YEAR("F"."FeedbackDate")YearTime
	,"HF"."HFLevel","HF"."HFCode", "HF"."HFName"
	,"HFR"."RegionName" "Region", "HFD"."DistrictName", "Prod"."ProductCode", "Prod"."ProductName", "HFD"."DistrictName" "HFDistrict", "HFR"."RegionName" "HFRegion"

	FROM "tblFeedback" "F" INNER JOIN "tblClaim" "C" ON "F"."ClaimID" = "C"."ClaimID"
	INNER JOIN
		(SELECT "ClaimID","ProdID" FROM "tblClaimItems" WHERE "ValidityTo" IS NULL
		UNION 
		SELECT "ClaimID","ProdID" FROM "tblClaimServices" WHERE "ValidityTo" IS NULL
		)"Details" ON "C"."ClaimID" = "Details"."ClaimID"

	INNER JOIN "tblProduct" "Prod" ON "Details"."ProdID" = "Prod"."ProdID"
	INNER JOIN "tblHF" "HF" ON "C"."HFID" = "HF"."HfID"
	INNER JOIN "tblDistricts" "HFD" ON "HF"."LocationId" = "HFD"."DistrictId"
	INNER JOIN "tblRegions" "HFR" ON "HFR"."RegionId" = "HFD"."Region"

	WHERE "F"."ValidityTo" IS NULL
	AND "F"."DrugReceived" = TRUE

	GROUP BY MONTH("F"."FeedbackDate"), QUARTER("F"."FeedbackDate"), YEAR("F"."FeedbackDate"),
	"HF"."HFLevel","HF"."HFCode", "HF"."HFName"
	, "Prod"."ProductCode", "Prod"."ProductName", "HFD"."DistrictName", "HFR"."RegionName"
;

CREATE OR REPLACE VIEW "public"."uvwNumberFeedbackResponded" AS
	SELECT COUNT("F"."FeedbackID")"FeedbackResponded", MONTH("F"."FeedbackDate")MonthTime, QUARTER("F"."FeedbackDate")QuarterTime, YEAR("F"."FeedbackDate")YearTime
	,"HFR"."RegionName" "Region", "HFD"."DistrictName", "Prod"."ProductCode", "Prod"."ProductName"
	,"HF"."HFLevel","HF"."HFCode", "HF"."HFName", "HFD"."DistrictName" "HFDistrict", "HFR"."RegionName" "HFRegion"

	FROM "tblFeedback" "F" INNER JOIN "tblClaim" "C" ON "F"."ClaimID" = "C"."ClaimID"
	INNER JOIN
			(SELECT "ClaimID","ProdID" FROM "tblClaimItems" WHERE "ValidityTo" IS NULL
			UNION 
			SELECT "ClaimID","ProdID" FROM "tblClaimServices" WHERE "ValidityTo" IS NULL
			)"Details" ON "F"."ClaimID" = "Details"."ClaimID"
	INNER JOIN "tblProduct" "Prod" ON "Details"."ProdID" = "Prod"."ProdID"
	INNER JOIN "tblHF" "HF" ON "C"."HFID" = "HF"."HfID"
	INNER JOIN "tblDistricts" "HFD" ON "HF"."LocationId" = "HFD"."DistrictId"
	INNER JOIN "tblRegions" "HFR" ON "HFR"."RegionId" = "HFD"."Region"

	WHERE "F"."ValidityTo" IS NULL
	AND "Prod"."ValidityTo" IS NULL
	
	GROUP BY YEAR("F"."FeedbackDate"),MONTH("F"."FeedbackDate"), QUARTER("F"."FeedbackDate") 
	, "Prod"."ProductCode", "Prod"."ProductName"
	,"HF"."HFLevel","HF"."HFCode", "HF"."HFName", "HFD"."DistrictName", "HFR"."RegionName"
;

CREATE OR REPLACE VIEW "public"."uvwNumberFeedbackSent" AS
	SELECT COUNT("FeedbackPromptID")"FeedbackSent", MONTH("F"."FeedbackPromptDate")MonthTime, QUARTER("F"."FeedbackPromptDate")QuarterTime, YEAR("F"."FeedbackPromptDate")YearTime
	,"HFR"."RegionName" "Region", "HFD"."DistrictName", "Prod"."ProductCode", "Prod"."ProductName"
	,"HF"."HFLevel","HF"."HFCode", "HF"."HFName", "HFD"."DistrictName" "HFDistrict", "HFR"."RegionName" "HFRegion"

	FROM "tblFeedbackPrompt" "F" INNER JOIN "tblClaim" "C" ON "F"."ClaimID" = "C"."ClaimID"
	INNER JOIN
			(SELECT "ClaimID","ProdID" FROM "tblClaimItems" WHERE "ValidityTo" IS NULL
			UNION 
			SELECT "ClaimID","ProdID" FROM "tblClaimServices" WHERE "ValidityTo" IS NULL
			)"Details" ON "F"."ClaimID" = "Details"."ClaimID"
	INNER JOIN "tblProduct" "Prod" ON "Details"."ProdID" = "Prod"."ProdID"
	INNER JOIN "tblHF" "HF" ON "C"."HFID" = "HF"."HfID"
	INNER JOIN "tblDistricts" "HFD" ON "HF"."LocationId" = "HFD"."DistrictId"
	INNER JOIN "tblRegions" "HFR" ON "HFR"."RegionId" = "HFD"."Region"

	WHERE "F"."ValidityTo" IS NULL
	AND "Prod"."ValidityTo" IS NULL
	AND "HFD"."ValidityTo" IS NULL

	GROUP BY YEAR("F"."FeedbackPromptDate"),MONTH("F"."FeedbackPromptDate"), QUARTER("F"."FeedbackPromptDate") 
	, "Prod"."ProductCode", "Prod"."ProductName"
	,"HF"."HFLevel","HF"."HFCode", "HF"."HFName", "HFD"."DistrictName", "HFR"."RegionName"
;

CREATE OR REPLACE VIEW "public"."uvwNumberInsureeAcquired" AS
	SELECT COUNT("I"."InsureeID")"NewInsurees",MONTH("PL"."EnrollDate")MonthTime,DATENAME_Q("PL"."EnrollDate")QuarterTime, YEAR("PL"."EnrollDate")YearTime,
	DATEDIFF_YEAR("I"."DOB",NOW())"Age", "I"."Gender", "R"."RegionName" "Region", "D"."DistrictName" "InsDistrict", "V"."VillageName" "InsVillage", "W"."WardName" "InsWard",
	"D"."DistrictName" "ProdDistrict", "Prod"."ProductCode", "Prod"."ProductName",
	"ODist"."DistrictName" "OfficerDistrict", "O"."Code", "O"."LastName", "O"."OtherNames", "R"."RegionName" "ProdRegion"


	FROM "tblPolicy" "PL" INNER JOIN "tblInsuree" "I" ON "PL"."FamilyID" = "I"."FamilyID"
	INNER JOIN "tblProduct" "Prod" ON "PL"."ProdID" = "Prod"."ProdID"
	INNER JOIN "tblFamilies" "F" ON "PL"."FamilyID" = "F"."FamilyID"
	INNER JOIN "tblVillages" "V" ON "V"."VillageId" = "F"."LocationId"
	INNER JOIN "tblWards" "W" ON "W"."WardId" = "V"."WardId"
	INNER JOIN "tblDistricts" "D" ON "D"."DistrictId" = "W"."DistrictId"
	INNER JOIN "tblOfficer" "O" ON "PL"."OfficerID" = "O"."OfficerID"
	INNER JOIN "tblDistricts" "ODist" ON "O"."LocationId" = "ODist"."DistrictId"
	INNER JOIN "tblInsureePolicy" "InsPL" ON "InsPL"."InsureeID" = "I"."InsureeID" AND "InsPL"."PolicyId" = "PL"."PolicyID"
	INNER JOIN "tblRegions" "R" ON "R"."RegionId" = "D"."Region"
	
	WHERE "PL"."ValidityTo" IS NULL 
	AND "I"."ValidityTo" IS NULL 
	AND "Prod"."ValidityTo" IS NULL 
	AND "F"."ValidityTo" IS NULL
	AND "D"."ValidityTo" IS NULL
	AND "V"."ValidityTo" IS NULL
	AND "W"."ValidityTo" IS NULL
	AND "O"."ValidityTo" IS NULL
	AND "ODist"."ValidityTo" IS NULL
	AND "InsPL"."ValidityTo" IS NULL

	GROUP BY MONTH("PL"."EnrollDate"),DATENAME_Q("PL"."EnrollDate"), YEAR("PL"."EnrollDate"),
	DATEDIFF_YEAR("I"."DOB",NOW()), "I"."Gender", "D"."DistrictName", "V"."VillageName", "W"."WardName",
	"R"."RegionName", "Prod"."ProductCode", "Prod"."ProductName",
	"ODist"."DistrictName", "O"."Code", "O"."LastName", "O"."OtherNames"
;

CREATE OR REPLACE VIEW "public"."uvwNumberOfInsuredHouseholds" AS
	WITH "RowData" AS
	(
		SELECT "F"."FamilyID", (EOMONTH("PL"."EffectiveDate") + "MonthCount".Numbers *INTERVAL '1 month')"ActiveDate", 
		"R"."RegionName" "Region", "D"."DistrictName", "W"."WardName", "V"."VillageName"
		FROM "tblPolicy" "PL" 
		INNER JOIN "tblFamilies" "F" ON "PL"."FamilyID" = "F"."FamilyID"
		INNER JOIN "tblVillages" "V" ON "V"."VillageId" = "F"."LocationId"
		INNER JOIN "tblWards" "W" ON "W"."WardId" = "V"."WardId"
		INNER JOIN "tblDistricts" "D" ON "D"."DistrictId" = "W"."DistrictId"
		INNER JOIN "tblRegions" "R" ON "D"."Region" = "R"."RegionId" 
		LEFT JOIN LATERAL(VALUES (0),(1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11))"MonthCount"(Numbers) On True -- This was a CROSS APPLY in SQL Server; LEFT JOIN LATERAL ... on true seems to do the same thing
		WHERE "PL"."ValidityTo" IS NULL
		AND "F"."ValidityTo" IS NULL
		AND "R"."ValidityTo" IS NULL
		AND "D"."ValidityTo" IS NULL
		AND "W"."ValidityTo" IS NULL
		AND "V"."ValidityTo" IS NULL
		AND "PL"."EffectiveDate" IS NOT NULL
	), "RowData2" AS
	(
		SELECT "FamilyID", "ActiveDate", "Region", "DistrictName", "WardName", "VillageName"
		FROM "RowData"
		GROUP BY "FamilyID", "ActiveDate", "Region", "DistrictName", "WardName", "VillageName"
	)
	SELECT COUNT("FamilyID") "InsuredHouseholds", MONTH("ActiveDate")MonthTime, DATENAME_Q("ActiveDate")QuarterTime, YEAR("ActiveDate")YearTime, "Region", "DistrictName", "WardName", "VillageName"
	FROM "RowData2"
	GROUP BY "ActiveDate", "Region", "DistrictName", "WardName", "VillageName"
;

CREATE OR REPLACE VIEW "public"."uvwNumberPolicyRenewed" AS
	
	SELECT COUNT("PL"."FamilyID")"Renewals", MONTH("PL"."EnrollDate")MonthTime, DATENAME_Q( "PL"."EnrollDate")QuarterTime, YEAR("PL"."EnrollDate")YearTime,
	DATEDIFF_YEAR("I"."DOB", "PL"."EnrollDate")"Age", "I"."Gender", "R"."RegionName" "Region", "FD"."DistrictName" "InsureeDistrictName", "FV"."VillageName", "FW"."WardName",
	"FD"."DistrictName" "Prod""DistrictName", "Prod"."ProductCode", "Prod"."ProductName", "OD"."DistrictName" "OfficeDistrict", "O"."Code" "OfficerCode", "O"."LastName", "O"."OtherNames",
	"R"."RegionName" "ProdRegion"

	FROM "tblPolicy" "PL" INNER JOIN "tblFamilies" "F" ON "PL"."FamilyID" = "F"."FamilyID"
	INNER JOIN "tblInsuree" "I" ON "F"."InsureeID" = "I"."InsureeID"
	INNER JOIN "tblVillages" "FV" ON "FV"."VillageId" = "F"."LocationId"
	INNER JOIN "tblWards" "FW" ON "FW"."WardId" = "FV"."WardId"
	INNER JOIN "tblDistricts" "FD" ON "FD"."DistrictId" = "FW"."DistrictId"
	INNER JOIN "tblProduct" "Prod" ON "PL"."ProdID" = "Prod"."ProdID"
	INNER JOIN "tblOfficer" "O" ON "PL"."OfficerID" = "O"."OfficerID"
	INNER JOIN "tblDistricts" "OD" ON "OD"."DistrictId" = "O"."LocationId"
	INNER JOIN "tblRegions" "R" ON "R"."RegionId" = "FD"."Region"
	
	WHERE "PL"."ValidityTo" IS NULL
	AND "F"."ValidityTo" IS NULL
	AND "I"."ValidityTo" IS NULL
	AND "FD"."ValidityTo" IS NULL
	AND "FW"."ValidityTo" IS NULL
	AND "FV"."ValidityTo" IS NULL
	AND "Prod"."ValidityTo" IS NULL
	AND "O"."ValidityTo" IS NULL
	AND "OD"."ValidityTo" IS NULL
	AND "PL"."PolicyStage" = N'R'

	GROUP BY MONTH("PL"."EnrollDate"), DATENAME_Q( "PL"."EnrollDate"), YEAR("PL"."EnrollDate"),
	DATEDIFF_YEAR("I"."DOB", "PL"."EnrollDate"), "I"."Gender", "R"."RegionName", "FD"."DistrictName", "FV"."VillageName", "FW"."WardName",
	"Prod"."ProductCode", "Prod"."ProductName", "OD"."DistrictName", "O"."Code", "O"."LastName", "O"."OtherNames"
;

CREATE OR REPLACE VIEW "public"."uvwNumberPolicySold" AS
	
	SELECT COUNT("PL"."FamilyID")SoldPolicy, MONTH("PL"."EnrollDate")MonthTime, DATENAME_Q( "PL"."EnrollDate")QuarterTime, YEAR("PL"."EnrollDate")YearTime,
	DATEDIFF_YEAR("I"."DOB", "PL"."EnrollDate")"Age", "I"."Gender", "RD"."RegionName" "Region", "FD"."DistrictName" "InsDistrict", "FV"."VillageName" "InsVillage", "FW"."WardName" "InsWard",
	"FD"."DistrictName" "ProdDistrict", "Prod"."ProductCode", "Prod"."ProductName", "OD"."DistrictName" "OfficerDistrict", "O"."Code", "O"."LastName", "O"."OtherNames", "RD"."RegionName" "ProdRegion"

	FROM "tblPolicy" "PL" INNER JOIN "tblFamilies" "F" ON "PL"."FamilyID" = "F"."FamilyID"
	INNER JOIN "tblInsuree" "I" ON "F"."InsureeID" = "I"."InsureeID"
	INNER JOIN "tblVillages" "FV" ON "FV"."VillageId" = "F"."LocationId"
	INNER JOIN "tblWards" "FW" ON "FW"."WardId" = "FV"."WardId"
	INNER JOIN "tblDistricts" "FD" ON "FD"."DistrictId" = "FW"."DistrictId"
	INNER JOIN "tblProduct" "Prod" ON "PL"."ProdID" = "Prod"."ProdID"
	INNER JOIN "tblOfficer" "O" ON "PL"."OfficerID" = "O"."OfficerID"
	INNER JOIN "tblDistricts" "OD" ON "OD"."DistrictId" = "O"."LocationId"
	INNER JOIN "tblRegions" "RD" ON "RD"."RegionId" = "FD"."Region"
	
	WHERE "PL"."ValidityTo" IS NULL
	AND "F"."ValidityTo" IS NULL
	AND "I"."ValidityTo" IS NULL
	AND "FD"."ValidityTo" IS NULL
	AND "FW"."ValidityTo" IS NULL
	AND "FV"."ValidityTo" IS NULL
	AND "Prod"."ValidityTo" IS NULL
	AND "O"."ValidityTo" IS NULL
	AND "OD"."ValidityTo" IS NULL
	AND "PL"."PolicyStage" = N'N'

	GROUP BY MONTH("PL"."EnrollDate"), DATENAME_Q( "PL"."EnrollDate"), YEAR("PL"."EnrollDate"),
	DATEDIFF_YEAR("I"."DOB", "PL"."EnrollDate"), "I"."Gender", "RD"."RegionName", "FD"."DistrictName", "FV"."VillageName", "FW"."WardName",
	"Prod"."ProductCode", "Prod"."ProductName", "OD"."DistrictName", "O"."Code", "O"."LastName", "O"."OtherNames"
;

CREATE OR REPLACE VIEW "public"."uvwOverallAssessment" AS
	SELECT "Asessment",MONTH("FeedbackDate")MonthTime, QUARTER("FeedbackDate")QuarterTime, YEAR("FeedbackDate")YearTime,"HFR"."RegionName" "Region", "HFD"."DistrictName", "Prod"."ProductCode", "Prod"."ProductName","HF"."HFLevel","HF"."HFCode", "HF"."HFName", "HFD"."DistrictName" "HFDistrict", "HFR"."RegionName" "HFRegion"
	FROM "tblFeedback" "F" INNER JOIN "tblClaim" "C" ON "F"."ClaimID" = "C"."ClaimID"
	INNER JOIN
			(SELECT "ClaimID","ProdID" FROM "tblClaimItems" WHERE "ValidityTo" IS NULL
			UNION 
			SELECT "ClaimID","ProdID" FROM "tblClaimServices" WHERE "ValidityTo" IS NULL
			)"Details" ON "C"."ClaimID" = "Details"."ClaimID"
	INNER JOIN "tblProduct" "Prod" ON "Details"."ProdID" = "Prod"."ProdID"
	INNER JOIN "tblHF" "HF" ON "C"."HFID" = "HF"."HfID"
	INNER JOIN "tblDistricts" "HFD" ON "HF"."LocationId" = "HFD"."DistrictId"
	INNER JOIN "tblRegions" "HFR" ON "HFR"."RegionId" = "HFD"."Region"

	WHERE "F"."ValidityTo" IS NULL
	AND "C"."ValidityTo" IS NULL
	AND "Prod"."ValidityTo" IS NULL
	AND "HF"."ValidityTo" IS NULL
	AND "HFD"."ValidityTo" IS NULL
;

CREATE OR REPLACE VIEW "public"."uvwpremiumcollection" AS
	SELECT SUM("PR"."Amount")"Amount","PR"."PayType","Pay"."PayerType","Pay"."PayerName","R"."RegionName" "Region","FD"."DistrictName","Prod"."ProductCode","Prod"."ProductName",
	"O"."Code","O"."LastName","O"."OtherNames","DO"."DistrictName" "OfficerDistrict",MONTH("PR"."PayDate")MonthTime,DATENAME_Q("PR"."PayDate")QuarterTime,YEAR("PR"."PayDate")YearTime
	FROM "tblPremium" "PR" LEFT OUTER JOIN "tblPayer" "Pay" ON "PR"."PayerID" = "Pay"."PayerID"
	INNER JOIN "tblPolicy" "PL" ON "PR"."PolicyID" = "PL"."PolicyID"
	INNER JOIN "tblProduct" "Prod" ON "PL"."ProdID" = "Prod"."ProdID"
	INNER JOIN "tblOfficer" "O" ON "PL"."OfficerID" = "O"."OfficerID"
	INNER JOIN "tblDistricts" "DO" ON "O"."LocationId" = "DO"."DistrictId"
	INNER JOIN "tblFamilies" "F" ON "PL"."FamilyID" = "F"."FamilyID"
	INNER JOIN "tblVillages" "V" ON "V"."VillageId" = "F"."LocationId"
	INNER JOIN "tblWards" "W" ON "W"."WardId" = "V"."WardId"
	INNER JOIN "tblDistricts" "FD" ON "FD"."DistrictId" = "W"."DistrictId"
	INNER JOIN "tblRegions" "R" ON "R"."RegionId" = "FD"."Region"
	WHERE "PR"."ValidityTo" IS NULL AND "Pay"."ValidityTo" IS NULL AND "PL"."ValidityTo" IS NULL AND "F"."ValidityTo" IS NULL
	GROUP BY "PR"."PayType","Pay"."PayerType","Pay"."PayerName", "R"."RegionName","Prod"."ProductCode","Prod"."ProductName",
	"O"."Code","O"."LastName","O"."OtherNames","DO"."DistrictName",MONTH("PR"."PayDate"),DATENAME_Q("PR"."PayDate"),YEAR("PR"."PayDate"),
	"FD"."DistrictName"
;

CREATE OR REPLACE VIEW "public"."uvwPremiumCollection" AS
	SELECT SUM("PR"."Amount")"Amount","PR"."PayType","Pay"."PayerType","Pay"."PayerName","R"."RegionName" "Region","FD"."DistrictName","Prod"."ProductCode","Prod"."ProductName",
	"O"."Code","O"."LastName","O"."OtherNames","DO"."DistrictName" "OfficerDistrict",MONTH("PR"."PayDate")MonthTime,DATENAME_Q("PR"."PayDate")QuarterTime,YEAR("PR"."PayDate")YearTime
	FROM "tblPremium" "PR" LEFT OUTER JOIN "tblPayer" "Pay" ON "PR"."PayerID" = "Pay"."PayerID"
	INNER JOIN "tblPolicy" "PL" ON "PR"."PolicyID" = "PL"."PolicyID"
	INNER JOIN "tblProduct" "Prod" ON "PL"."ProdID" = "Prod"."ProdID"
	INNER JOIN "tblOfficer" "O" ON "PL"."OfficerID" = "O"."OfficerID"
	INNER JOIN "tblDistricts" "DO" ON "O"."LocationId" = "DO"."DistrictId"
	INNER JOIN "tblFamilies" "F" ON "PL"."FamilyID" = "F"."FamilyID"
	INNER JOIN "tblVillages" "V" ON "V"."VillageId" = "F"."LocationId"
	INNER JOIN "tblWards" "W" ON "W"."WardId" = "V"."WardId"
	INNER JOIN "tblDistricts" "FD" ON "FD"."DistrictId" = "W"."DistrictId"
	INNER JOIN "tblRegions" "R" ON "R"."RegionId" = "FD"."Region"
	WHERE "PR"."ValidityTo" IS NULL AND "Pay"."ValidityTo" IS NULL AND "PL"."ValidityTo" IS NULL AND "F"."ValidityTo" IS NULL
	GROUP BY "PR"."PayType","Pay"."PayerType","Pay"."PayerName", "R"."RegionName","Prod"."ProductCode","Prod"."ProductName",
	"O"."Code","O"."LastName","O"."OtherNames","DO"."DistrictName",MONTH("PR"."PayDate"),DATENAME_Q("PR"."PayDate"),YEAR("PR"."PayDate"),
	"FD"."DistrictName"
;

CREATE OR REPLACE VIEW "public"."uvwServiceUtilization" AS
	SELECT  SUM("CS"."QtyProvided") AS ServiceUtilized, MONTH(coalesce("C"."DateTo", "C"."DateFrom")) AS MonthTime, QUARTER( coalesce("C"."DateTo", "C"."DateFrom")) 
	AS QuarterTime, YEAR(coalesce("C"."DateTo", "C"."DateFrom")) AS YearTime, "R"."RegionName" AS "Region", "DIns"."DistrictName" ,  "Prod"."ProductCode", "Prod"."ProductName", 
	DATEDIFF_YEAR("I"."DOB", coalesce("C"."DateTo", "C"."DateFrom")) AS "Age", "I"."Gender", "S"."ServType", "S"."ServCode", "S"."ServName", CASE WHEN DATEDIFF_DAY("C"."DateFrom", 
	"C"."DateTo") > 0 THEN N'I' ELSE N'O' END AS "ServCareType", "HF"."HFLevel", "HF"."HFCode", "HF"."HFName", "C"."VisitType", "ICD"."ICDCode", "ICD"."ICDName", 
	"DIns"."DistrictName" AS "IDistrictName", "W"."WardName", "V"."VillageName", "HFD"."DistrictName" AS "HFDistrict","HFR"."RegionName" AS "HFRegion", 
	"R"."RegionName" AS "ProdRegion"
	
	FROM public."tblClaimServices" AS "CS" 
	INNER JOIN public."tblClaim" AS "C" ON "CS"."ClaimID" = "C"."ClaimID" 
	LEFT OUTER JOIN public."tblProduct" AS "Prod" ON "CS"."ProdID" = "Prod"."ProdID" 
	INNER JOIN public."tblInsuree" AS "I" ON "C"."InsureeID" = "I"."InsureeID" 
	INNER JOIN public."tblFamilies" AS "F" ON "I"."FamilyID" = "F"."FamilyID" 
	INNER JOIN public."tblVillages" AS "V" ON "V"."VillageId" = "F"."LocationId" 
	INNER JOIN public."tblWards" AS "W" ON "W"."WardId" = "V"."WardId"
	INNER JOIN  public."tblDistricts" AS "DIns" ON "DIns"."DistrictId" = "W"."DistrictId" 
	INNER JOIN public."tblServices" AS "S" ON "CS"."ServiceID" = "S"."ServiceID" 
	INNER JOIN public."tblHF" AS "HF" ON "C"."HFID" = "HF"."HfID" 
	INNER JOIN public."tblICDCodes" AS "ICD" ON "C"."ICDID" = "ICD"."ICDID" 
	INNER JOIN public."tblDistricts" AS "HFD" ON "HF"."LocationId" = "HFD"."DistrictId" -- BY Rogers
	INNER JOIN public."tblRegions" AS "R" ON "R"."RegionId" = "DIns"."Region" 
	INNER JOIN public."tblRegions" AS"HFR" ON "HFR"."RegionId" = "HFD"."Region"

	WHERE ("CS"."ValidityTo" IS NULL) 
	  AND ("C"."ValidityTo" IS NULL) 
	  AND ("Prod"."ValidityTo" IS NULL) 
	  AND ("I"."ValidityTo" IS NULL) 
	  AND ("DIns"."ValidityTo" IS NULL) 
	  AND ("HF"."ValidityTo" IS NULL) 
	  AND ("HFD"."ValidityTo" IS NULL) 
	  AND ("F"."ValidityTo" IS NULL) 
	  AND ("S"."ValidityTo" IS NULL) 
	  AND ("C"."ClaimStatus" > 2)
	  AND "CS"."RejectionReason"=0
	GROUP BY MONTH(coalesce("C"."DateTo", "C"."DateFrom")), QUARTER( coalesce("C"."DateTo", "C"."DateFrom")), YEAR(coalesce("C"."DateTo", "C"."DateFrom")), "R"."RegionName", 
	"Prod"."ProductCode", "Prod"."ProductName", DATEDIFF_YEAR("I"."DOB", coalesce("C"."DateTo", "C"."DateFrom")), "I"."Gender", "S"."ServType", "S"."ServCode", "S"."ServName", DATEDIFF_DAY(
	"C"."DateFrom", "C"."DateTo"), "HF"."HFLevel", "HF"."HFCode", "HF"."HFName", "C"."VisitType", "ICD"."ICDCode", "ICD"."ICDName", "DIns"."DistrictName", "W"."WardName", "V"."VillageName", "HFD"."DistrictName"  ,"HFR"."RegionName"
;

CREATE OR REPLACE VIEW "public"."uvwVisit" AS
	SELECT COUNT("C"."ClaimID") "Visits", MONTH("C"."DateFrom")MonthTime, QUARTER("C"."DateFrom")QuarterTime, YEAR("C"."DateFrom")YearTime
	,"HFR"."RegionName" "Region", "HFD"."DistrictName", "Prod"."ProductCode", "Prod"."ProductName",
	DATEDIFF_YEAR("I"."DOB","C"."DateFrom")"Age","I"."Gender",
	"HF"."HFLevel","HF"."HFCode", "HF"."HFName",
	"C"."VisitType", "ICD"."ICDCode", "ICD"."ICDName", "HFD"."DistrictName" "HFDistrict", "HFR"."RegionName" "HFRegion"
	FROM "tblClaim" "C" 
	LEFT OUTER JOIN
	(SELECT "ClaimID","ProdID" FROM "tblClaimItems" WHERE "ValidityTo" IS NULL AND "RejectionReason" = 0
	UNION 
	SELECT "ClaimID","ProdID" FROM "tblClaimServices" WHERE "ValidityTo" IS NULL AND "RejectionReason" = 0
	)"Details" ON "C"."ClaimID" = "Details"."ClaimID"
	LEFT OUTER JOIN "tblProduct" "Prod" ON "Details"."ProdID" = "Prod"."ProdID"
	LEFT OUTER JOIN "tblInsuree" "I" ON "C"."InsureeID" = "I"."InsureeID"
	LEFT OUTER JOIN "tblHF" "HF" ON "C"."HFID" = "HF"."HfID"
	LEFT OUTER JOIN "tblICDCodes" "ICD" ON "C"."ICDID" = "ICD"."ICDID"
	LEFT OUTER JOIN "tblDistricts" "HFD" ON "HF"."LocationId" = "HFD"."DistrictId"
	LEFT OUTER JOIN "tblRegions" "HFR" ON "HFR"."RegionId" = "HFD"."Region"
	
	WHERE "C"."ValidityTo" IS NULL
	AND "Prod"."ValidityTo" IS NULL
	AND "I"."ValidityTo" IS NULL
	AND "HF"."ValidityTo" IS NULL
	AND "HFD"."ValidityTo" IS NULL
	AND DATEDIFF_DAY("C"."DateFrom","C"."DateTo") = 0

	GROUP BY MONTH("C"."DateFrom"), QUARTER("C"."DateFrom"), YEAR("C"."DateFrom")
	,"Prod"."ProductCode", "Prod"."ProductName",
	DATEDIFF_YEAR("I"."DOB","C"."DateFrom"),"I"."Gender",
	"HF"."HFLevel","HF"."HFCode", "HF"."HFName","C"."VisitType", "ICD"."ICDCode", "ICD"."ICDName", "HFD"."DistrictName", "HFR"."RegionName"
;

CREATE OR REPLACE VIEW "public"."uvwPopulation" AS
	SELECT "RegionName" "Region", "DistrictName" "District","WardName" "Ward", "VillageName" "Village",
	       "MalePopulation" "Male", "FemalePopulation" "Female", "OtherPopulation" "others", "Families" "Households",
	       "date_part"('year'::"text", "now"()) AS "YEAR"
	FROM "tblVillages" "V"
	INNER JOIN "tblWards" "W" ON "V"."WardId" = "W"."WardId"
	INNER JOIN "tblDistricts" "D" ON "D"."DistrictId" = "W"."DistrictId"
	INNER JOIN "tblRegions" "R" ON "R"."RegionId" = "D"."Region"
	WHERE "V"."ValidityTo" IS NULL
	AND "W"."ValidityTo"  IS NULL 
	AND "D"."ValidityTo"   IS NULL
	AND "R"."ValidityTo"   IS NULL
;

CREATE OR REPLACE VIEW "public"."uvwServiceExpenditures" AS
	SELECT SUM("CS"."RemuneratedAmount")"ServiceExpenditure",MONTH(coalesce("C"."DateTo","C"."DateFrom"))MonthTime,QUARTER(coalesce("C"."DateTo","C"."DateFrom"))QuarterTime,YEAR(coalesce("C"."DateTo","C"."DateFrom"))YearTime,
	"R"."RegionName" "Region","HFD"."DistrictName","PR"."ProductCode","PR"."ProductName",DATEDIFF_YEAR("I"."DOB",coalesce("C"."DateTo","C"."DateFrom"))"Age","I"."Gender",
	"S"."ServType","S"."ServCode","S"."ServName",CASE WHEN DATEDIFF_DAY("C"."DateFrom", "C"."DateTo") > 0 THEN N'I' ELSE N'O' END "ServCareType",
	"HF"."HFLevel","HF"."HFCode","HF"."HFName","C"."VisitType", "ICD"."ICDCode", "ICD"."ICDName",
	"DIns"."DistrictName" "IDistrictName" , "W"."WardName", "V"."VillageName", "HFD"."DistrictName" "HFDistrict", "HFR"."RegionName" "HFRegion", "HFR"."RegionName" "ProdRegion"

	FROM "tblClaimServices" "CS" INNER JOIN "tblClaim" "C" ON "CS"."ClaimID" = "C"."ClaimID"
	INNER JOIN "tblProduct" "PR" ON "CS"."ProdID" = "PR"."ProdID"
	INNER JOIN "tblInsuree" "I" ON "C"."InsureeID" = "I"."InsureeID"
	INNER JOIN "tblFamilies" "F" ON "I"."FamilyID" = "F"."FamilyID"
	INNER JOIN "tblVillages" "V" ON "V"."VillageId" = "F"."LocationId"
	INNER JOIN "tblWards" "W" ON "W"."WardId" = "V"."WardId"
	INNER JOIN "tblDistricts" "DIns" ON "DIns"."DistrictId" = "W"."DistrictId"
	INNER JOIN "tblServices" "S" ON "CS"."ServiceID" = "S"."ServiceID"
	INNER JOIN "tblHF" "HF" ON "C"."HFID" = "HF"."HfID"
	INNER JOIN "tblICDCodes" "ICD" ON "C"."ICDID" = "ICD"."ICDID"
	INNER JOIN "tblDistricts" "HFD" ON "HF"."LocationId" = "HFD"."DistrictId"
	INNER JOIN "tblRegions" "R" ON "R"."RegionId" = "DIns"."Region"
	INNER JOIN "tblRegions" "HFR" ON "HFR"."RegionId" = "HFD"."Region"
	
	WHERE "CS"."ValidityTo" IS NULL
	AND "C"."ValidityTo" IS NULL
	AND "PR"."ValidityTo" IS NULL
	AND "I"."ValidityTo" IS NULL
	AND "S"."ValidityTo" IS NULL
	AND "HF"."ValidityTo" IS NULL
	AND "HFD"."ValidityTo" IS NULL

	AND coalesce("CS"."PriceValuated",0) > 0
	--Also add a criteria if they want the batch id as well

	GROUP BY MONTH(coalesce("C"."DateTo","C"."DateFrom")),QUARTER(coalesce("C"."DateTo","C"."DateFrom")),YEAR(coalesce("C"."DateTo","C"."DateFrom")),
	"R"."RegionName", "PR"."ProductCode","PR"."ProductName",DATEDIFF_YEAR("I"."DOB",coalesce("C"."DateTo","C"."DateFrom")),"I"."Gender",
	"S"."ServType","S"."ServCode","S"."ServName",DATEDIFF_DAY("C"."DateFrom", "C"."DateTo"),
	"HF"."HFLevel","HF"."HFCode","HF"."HFName","C"."VisitType", "ICD"."ICDCode", "ICD"."ICDName",
	"DIns"."DistrictName" , "W"."WardName", "V"."VillageName", "HFD"."DistrictName", "HFR"."RegionName"
;
/*
 I had to cast quite a few entries to text in uvwLocations because Postgres doesn't like unions with mixed types*/
CREATE OR REPLACE VIEW "public"."uvwLocations" AS
	SELECT 0 "LocationId", NULL "RegionId", NULL "RegionCode", N'National' "RegionName", NULL "DistrictId", NULL "DistrictCode", NULL "DistrictName", NULL "WardId", NULL "WardCode", NULL"WardName", NULL "VillageId", NULL "VillageCode", NULL "VillageName", NULL "ParentLocationId"
	UNION ALL
	SELECT "RegionId" "LocationId","RegionId", "RegionCode", "RegionName", NULL "DistrictId", NULL "DistrictCode", NULL "DistrictName", NULL "WardId", NULL "WardCode", NULL"WardName", NULL "VillageId", NULL "VillageCode", NULL "VillageName", 0 "ParentLocationId" 
	FROM "tblRegions"
	UNION ALL
	SELECT "D"."DistrictId" "LocationId", "R"."RegionId", "R"."RegionCode", "R"."RegionName", CAST("D"."DistrictId" AS text), "D"."DistrictCode", "D"."DistrictName", NULL "WardId", NULL "WardCode", NULL"WardName", NULL "VillageId", NULL "VillageCode", NULL "VillageName", "Region" "ParentLocationId"
	FROM "tblDistricts" "D"
	INNER JOIN "tblRegions" "R" ON "R"."RegionId" = "D"."Region"
	UNION ALL
	SELECT "W"."WardId" "LocationId", "R"."RegionId", "R"."RegionCode", "R"."RegionName", CAST("D"."DistrictId" AS text), "D"."DistrictCode", "D"."DistrictName", CAST("W"."WardId" AS text), "W"."WardCode", "W"."WardName", NULL "VillageId", NULL "VillageCode", NULL "VillageName", "D"."DistrictId" "ParentLocationId"
	FROM "tblRegions" "R"
	INNER JOIN "tblDistricts" "D" ON "R"."RegionId" = "D"."Region"
	INNER JOIN "tblWards" "W" ON "W"."DistrictId" = "D"."DistrictId"
	UNION ALL
	SELECT "V"."VillageId" "LocationId", "R"."RegionId", "R"."RegionCode", "R"."RegionName", CAST("D"."DistrictId" AS text), "D"."DistrictCode", "D"."DistrictName", CAST("W"."WardId" AS text), "W"."WardCode", "W"."WardName", CAST("V"."VillageId" AS text), "V"."VillageCode", "V"."VillageName", "V"."WardId" "ParentLocationId"
	FROM "tblRegions" "R"
	INNER JOIN "tblDistricts" "D" ON "R"."RegionId" = "D"."Region"
	INNER JOIN "tblWards" "W" ON "W"."DistrictId" = "D"."DistrictId"
	INNER JOIN "tblVillages" "V" ON "V"."WardId" = "W"."WardId"
;

CREATE OR REPLACE VIEW "public"."uvwAmountApproved" AS
	SELECT SUM("Details"."Approved")"AmountApproved",MONTH(coalesce("C"."DateTo", "C"."DateFrom"))MonthTime, QUARTER(coalesce("C"."DateTo", "C"."DateFrom"))QuarterTime, YEAR(coalesce("C"."DateTo", "C"."DateFrom"))YearTime
	,"HF"."HFLevel","HF"."HFCode", "HF"."HFName"
	,"HFR"."RegionName" "Region", "HFD"."DistrictName" "DistrictName", "Prod"."ProductCode", "Prod"."ProductName", "HFD"."DistrictName" "HFDistrict", "HFR"."RegionName" "HFRegion"

	FROM "tblClaim" "C" 
	LEFT OUTER JOIN

	(SELECT "ClaimID","ProdID", SUM("PriceValuated") "Approved" FROM "tblClaimItems" WHERE "ValidityTo" IS NULL GROUP BY "ClaimID","ProdID"
	UNION ALL
	SELECT "ClaimID","ProdID",SUM("PriceValuated") "Approved" FROM "tblClaimServices" WHERE "ValidityTo" IS NULL GROUP BY "ClaimID","ProdID"
	)"Details" ON "C"."ClaimID" = "Details"."ClaimID"


	LEFT OUTER JOIN "tblProduct" "Prod" ON "Details"."ProdID" = "Prod"."ProdID"
	LEFT OUTER JOIN "tblHF" "HF" ON "C"."HFID" = "HF"."HfID"
	LEFT OUTER JOIN "tblDistricts" "HFD" ON "HF"."LocationId" = "HFD"."DistrictId"
	LEFT OUTER JOIN "tblRegions" "HFR" ON "HFR"."RegionId" = "HFD"."Region"

	WHERE "C"."ValidityTo" IS NULL
	AND "C"."ClaimStatus" >= 8 --Which is Processed and greater

	GROUP BY MONTH(coalesce("C"."DateTo", "C"."DateFrom")), QUARTER(coalesce("C"."DateTo", "C"."DateFrom")), YEAR(coalesce("C"."DateTo", "C"."DateFrom"))
	,"HF"."HFLevel","HF"."HFCode", "HF"."HFName"
	, "Prod"."ProductCode", "Prod"."ProductName", "HFD"."DistrictName", "HFR"."RegionName"
;

CREATE OR REPLACE VIEW "public"."uvwAmountClaimed" AS
	SELECT SUM("Details"."Claimed")"AmountClaimed",MONTH(coalesce("C"."DateTo", "C"."DateFrom"))MonthTime, QUARTER(coalesce("C"."DateTo", "C"."DateFrom"))QuarterTime, YEAR(coalesce("C"."DateTo", "C"."DateFrom"))YearTime
	,"HF"."HFLevel","HF"."HFCode", "HF"."HFName"
	,"HFR"."RegionName" "Region", "HFD"."DistrictName", "Prod"."ProductCode", "Prod"."ProductName", "HFD"."DistrictName" "HFDistrict", "HFR"."RegionName" "HFRegion"

	FROM "tblClaim" "C" 
	LEFT OUTER JOIN

	(SELECT "ClaimID","ProdID", SUM("QtyProvided" * "PriceAsked")"Claimed" FROM "tblClaimItems" WHERE "ValidityTo" IS NULL GROUP BY "ClaimID","ProdID"
	UNION ALL
	SELECT "ClaimID","ProdID",SUM("QtyProvided" * "PriceAsked")"Claimed" FROM "tblClaimServices" WHERE "ValidityTo" IS NULL GROUP BY "ClaimID","ProdID"
	)"Details" ON "C"."ClaimID" = "Details"."ClaimID"

	LEFT OUTER JOIN "tblProduct" "Prod" ON "Details"."ProdID" = "Prod"."ProdID"
	LEFT OUTER JOIN "tblHF" "HF" ON "C"."HFID" = "HF"."HfID"
	LEFT OUTER JOIN "tblDistricts" "HFD" ON "HF"."LocationId" = "HFD"."DistrictId"
	LEFT OUTER JOIN "tblRegions" "HFR" ON "HFR"."RegionId" = "HFD"."Region"

	WHERE "C"."ValidityTo" IS NULL
	AND "C"."ClaimStatus" <> 2 --Which is entered

	GROUP BY MONTH(coalesce("C"."DateTo", "C"."DateFrom")), QUARTER(coalesce("C"."DateTo", "C"."DateFrom")), YEAR(coalesce("C"."DateTo", "C"."DateFrom"))
	,"HF"."HFLevel","HF"."HFCode", "HF"."HFName"
	,"Prod"."ProductCode", "Prod"."ProductName", "HFD"."DistrictName", "HFR"."RegionName"
;

