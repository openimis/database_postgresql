-- --
-- -- PostgreSQL database dump
-- --
--
-- -- Dumped from database version 10.12
-- -- Dumped by pg_dump version 10.12
--
-- -- Started on 2020-07-05 14:18:37
--
-- SET statement_timeout = 0;
-- SET lock_timeout = 0;
-- SET idle_in_transaction_session_timeout = 0;
-- SET client_encoding = 'UTF8';
-- SET standard_conforming_strings = on;
-- SELECT pg_catalog.set_config('search_path', '', false);
-- SET check_function_bodies = false;
-- SET xmloption = content;
-- SET client_min_messages = warning;
-- SET row_security = off;
--
-- DROP DATABASE "openimis";
-- --
-- -- TOC entry 3987 (class 1262 OID 16393)
-- -- Name: openimis; Type: DATABASE; Schema: -; Owner: postgres
-- --
--
-- CREATE DATABASE "openimis" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
--
--
-- ALTER DATABASE "openimis" OWNER TO "postgres";
--
-- \connect "openimis"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3988 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA "public"; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA "public" IS 'standard public schema';


--
-- TOC entry 1 (class 3079 OID 12924)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS "plpgsql" WITH SCHEMA "pg_catalog";


--
-- TOC entry 3990 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION "plpgsql"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "plpgsql" IS 'PL/pgSQL procedural language';


--
-- TOC entry 403 (class 1255 OID 21908)
-- Name: dateadd_day(integer, "date"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "public"."dateadd_day"(integer, "date") RETURNS timestamp without time zone
    LANGUAGE "sql" IMMUTABLE
    AS $_$
      SELECT $2 + $1 * INTERVAL '1 day';
$_$;


-- ALTER FUNCTION "public"."dateadd_day"(integer, "date") OWNER TO "postgres";

--
-- TOC entry 401 (class 1255 OID 21906)
-- Name: dateadd_day(integer, timestamp without time zone); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "public"."dateadd_day"(integer, timestamp without time zone) RETURNS timestamp without time zone
    LANGUAGE "sql" IMMUTABLE
    AS $_$ 
      SELECT $2 + $1 * INTERVAL '1 day';
$_$;


-- ALTER FUNCTION "public"."dateadd_day"(integer, timestamp without time zone) OWNER TO "postgres";

--
-- TOC entry 402 (class 1255 OID 21907)
-- Name: dateadd_day(integer, timestamp with time zone); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "public"."dateadd_day"(integer, timestamp with time zone) RETURNS timestamp with time zone
    LANGUAGE "sql" STABLE
    AS $_$
      SELECT $2 + $1 * INTERVAL '1 day';
$_$;


-- ALTER FUNCTION "public"."dateadd_day"(integer, timestamp with time zone) OWNER TO "postgres";

--
-- TOC entry 400 (class 1255 OID 21905)
-- Name: dateadd_month(integer, "date"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "public"."dateadd_month"(integer, "date") RETURNS timestamp without time zone
    LANGUAGE "sql" IMMUTABLE
    AS $_$
      SELECT $2 + ($1 * INTERVAL '1 month');
$_$;


-- ALTER FUNCTION "public"."dateadd_month"(integer, "date") OWNER TO "postgres";

--
-- TOC entry 398 (class 1255 OID 21903)
-- Name: dateadd_month(integer, timestamp without time zone); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "public"."dateadd_month"(integer, timestamp without time zone) RETURNS timestamp without time zone
    LANGUAGE "sql" IMMUTABLE
    AS $_$ 
      SELECT $2 + ($1 * INTERVAL '1 month');
$_$;


-- ALTER FUNCTION "public"."dateadd_month"(integer, timestamp without time zone) OWNER TO "postgres";

--
-- TOC entry 399 (class 1255 OID 21904)
-- Name: dateadd_month(integer, timestamp with time zone); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "public"."dateadd_month"(integer, timestamp with time zone) RETURNS timestamp with time zone
    LANGUAGE "sql" STABLE
    AS $_$
      SELECT $2 + ($1 * INTERVAL '1 month');
$_$;


-- ALTER FUNCTION "public"."dateadd_month"(integer, timestamp with time zone) OWNER TO "postgres";

--
-- TOC entry 410 (class 1255 OID 25749)
-- Name: dateadd_year(integer, "date"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "public"."dateadd_year"(integer, "date") RETURNS timestamp without time zone
    LANGUAGE "sql" IMMUTABLE
    AS $_$
      SELECT $2 + ($1 * INTERVAL '1 year');
$_$;


-- ALTER FUNCTION "public"."dateadd_year"(integer, "date") OWNER TO "postgres";

--
-- TOC entry 407 (class 1255 OID 25747)
-- Name: dateadd_year(integer, timestamp without time zone); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "public"."dateadd_year"(integer, timestamp without time zone) RETURNS timestamp without time zone
    LANGUAGE "sql" IMMUTABLE
    AS $_$ 
      SELECT $2 + ($1 * INTERVAL '1 year');
$_$;


-- ALTER FUNCTION "public"."dateadd_year"(integer, timestamp without time zone) OWNER TO "postgres";

--
-- TOC entry 409 (class 1255 OID 25748)
-- Name: dateadd_year(integer, timestamp with time zone); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "public"."dateadd_year"(integer, timestamp with time zone) RETURNS timestamp with time zone
    LANGUAGE "sql" STABLE
    AS $_$
      SELECT $2 + ($1 * INTERVAL '1 year');
$_$;


-- ALTER FUNCTION "public"."dateadd_year"(integer, timestamp with time zone) OWNER TO "postgres";

--
-- TOC entry 390 (class 1255 OID 21590)
-- Name: datediff_day("date", "date"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "public"."datediff_day"("date", "date") RETURNS integer
    LANGUAGE "sql" IMMUTABLE
    AS $_$
      SELECT ($2::DATE - $1::DATE)::INTEGER;
$_$;


-- ALTER FUNCTION "public"."datediff_day"("date", "date") OWNER TO "postgres";

--
-- TOC entry 389 (class 1255 OID 21587)
-- Name: datediff_day(timestamp without time zone, timestamp without time zone); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "public"."datediff_day"(timestamp without time zone, timestamp without time zone) RETURNS integer
    LANGUAGE "sql" IMMUTABLE
    AS $_$ 
      SELECT DATE_PART('day', $2 - $1)::INTEGER;
$_$;


-- ALTER FUNCTION "public"."datediff_day"(timestamp without time zone, timestamp without time zone) OWNER TO "postgres";

--
-- TOC entry 375 (class 1255 OID 21588)
-- Name: datediff_day(timestamp with time zone, timestamp with time zone); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "public"."datediff_day"(timestamp with time zone, timestamp with time zone) RETURNS integer
    LANGUAGE "sql" STABLE
    AS $_$
      SELECT DATE_PART('day', $2 - $1)::INTEGER;
$_$;


-- ALTER FUNCTION "public"."datediff_day"(timestamp with time zone, timestamp with time zone) OWNER TO "postgres";

--
-- TOC entry 388 (class 1255 OID 21578)
-- Name: datediff_year("date", "date"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "public"."datediff_year"("date", "date") RETURNS integer
    LANGUAGE "sql" IMMUTABLE
    AS $_$
      SELECT (DATE_PART('year', $2) - DATE_PART('year', $1))::INTEGER;
$_$;


-- ALTER FUNCTION "public"."datediff_year"("date", "date") OWNER TO "postgres";

--
-- TOC entry 373 (class 1255 OID 21576)
-- Name: datediff_year(timestamp without time zone, timestamp without time zone); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "public"."datediff_year"(timestamp without time zone, timestamp without time zone) RETURNS integer
    LANGUAGE "sql" IMMUTABLE
    AS $_$ 
      SELECT (DATE_PART('year', $2) - DATE_PART('year', $1))::INTEGER;
$_$;


-- ALTER FUNCTION "public"."datediff_year"(timestamp without time zone, timestamp without time zone) OWNER TO "postgres";

--
-- TOC entry 374 (class 1255 OID 21577)
-- Name: datediff_year(timestamp with time zone, timestamp with time zone); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "public"."datediff_year"(timestamp with time zone, timestamp with time zone) RETURNS integer
    LANGUAGE "sql" STABLE
    AS $_$
      SELECT (DATE_PART('year', $2) - DATE_PART('year', $1))::INTEGER;
$_$;


-- ALTER FUNCTION "public"."datediff_year"(timestamp with time zone, timestamp with time zone) OWNER TO "postgres";

--
-- TOC entry 393 (class 1255 OID 21648)
-- Name: datename_q("date"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "public"."datename_q"("date") RETURNS "text"
    LANGUAGE "sql" IMMUTABLE
    AS $_$
      SELECT to_char($1, 'Q');
$_$;


-- ALTER FUNCTION "public"."datename_q"("date") OWNER TO "postgres";

--
-- TOC entry 391 (class 1255 OID 21646)
-- Name: datename_q(timestamp without time zone); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "public"."datename_q"(timestamp without time zone) RETURNS "text"
    LANGUAGE "sql" IMMUTABLE
    AS $_$ 
      SELECT to_char($1, 'Q');
$_$;


-- ALTER FUNCTION "public"."datename_q"(timestamp without time zone) OWNER TO "postgres";

--
-- TOC entry 392 (class 1255 OID 21647)
-- Name: datename_q(timestamp with time zone); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "public"."datename_q"(timestamp with time zone) RETURNS "text"
    LANGUAGE "sql" STABLE
    AS $_$
      SELECT to_char($1, 'Q');
$_$;


-- ALTER FUNCTION "public"."datename_q"(timestamp with time zone) OWNER TO "postgres";

--
-- TOC entry 396 (class 1255 OID 21668)
-- Name: eomonth("date"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "public"."eomonth"("date") RETURNS timestamp with time zone
    LANGUAGE "sql" IMMUTABLE
    AS $_$
      SELECT date_trunc('month', $1) + interval '1 month' - interval '1 day';
$_$;


-- ALTER FUNCTION "public"."eomonth"("date") OWNER TO "postgres";

--
-- TOC entry 394 (class 1255 OID 21666)
-- Name: eomonth(timestamp without time zone); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "public"."eomonth"(timestamp without time zone) RETURNS timestamp without time zone
    LANGUAGE "sql" IMMUTABLE
    AS $_$ 
      SELECT date_trunc('month', $1) + interval '1 month' - interval '1 day';
$_$;


-- ALTER FUNCTION "public"."eomonth"(timestamp without time zone) OWNER TO "postgres";

--
-- TOC entry 395 (class 1255 OID 21667)
-- Name: eomonth(timestamp with time zone); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "public"."eomonth"(timestamp with time zone) RETURNS timestamp with time zone
    LANGUAGE "sql" STABLE
    AS $_$
      SELECT date_trunc('month', $1) + interval '1 month' - interval '1 day';
$_$;


-- ALTER FUNCTION "public"."eomonth"(timestamp with time zone) OWNER TO "postgres";

--
-- TOC entry 367 (class 1255 OID 21427)
-- Name: month("date"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "public"."month"("date") RETURNS integer
    LANGUAGE "sql" IMMUTABLE
    AS $_$
      SELECT EXTRACT(MONTH FROM $1)::INTEGER;
$_$;


-- ALTER FUNCTION "public"."month"("date") OWNER TO "postgres";

--
-- TOC entry 364 (class 1255 OID 21425)
-- Name: month(timestamp without time zone); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "public"."month"(timestamp without time zone) RETURNS integer
    LANGUAGE "sql" IMMUTABLE
    AS $_$ 
      SELECT EXTRACT(MONTH FROM $1)::INTEGER; 
$_$;


-- ALTER FUNCTION "public"."month"(timestamp without time zone) OWNER TO "postgres";

--
-- TOC entry 366 (class 1255 OID 21426)
-- Name: month(timestamp with time zone); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "public"."month"(timestamp with time zone) RETURNS integer
    LANGUAGE "sql" STABLE
    AS $_$
      SELECT EXTRACT(MONTH FROM $1)::INTEGER;
$_$;


-- ALTER FUNCTION "public"."month"(timestamp with time zone) OWNER TO "postgres";

--
-- TOC entry 372 (class 1255 OID 21433)
-- Name: quarter("date"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "public"."quarter"("date") RETURNS integer
    LANGUAGE "sql" IMMUTABLE
    AS $_$
      SELECT EXTRACT(QUARTER FROM $1)::INTEGER;
$_$;


-- ALTER FUNCTION "public"."quarter"("date") OWNER TO "postgres";

--
-- TOC entry 370 (class 1255 OID 21431)
-- Name: quarter(timestamp without time zone); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "public"."quarter"(timestamp without time zone) RETURNS integer
    LANGUAGE "sql" IMMUTABLE
    AS $_$ 
      SELECT EXTRACT(QUARTER FROM $1)::INTEGER; 
$_$;


-- ALTER FUNCTION "public"."quarter"(timestamp without time zone) OWNER TO "postgres";

--
-- TOC entry 371 (class 1255 OID 21432)
-- Name: quarter(timestamp with time zone); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "public"."quarter"(timestamp with time zone) RETURNS integer
    LANGUAGE "sql" STABLE
    AS $_$
      SELECT EXTRACT(QUARTER FROM $1)::INTEGER;
$_$;


-- ALTER FUNCTION "public"."quarter"(timestamp with time zone) OWNER TO "postgres";

--
-- TOC entry 397 (class 1255 OID 21807)
-- Name: udfAPIisValidMaritalStatus(character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "public"."udfAPIisValidMaritalStatus"("maritalstatuscode" character varying) RETURNS bit
    LANGUAGE "plpgsql"
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
$$;


-- ALTER FUNCTION "public"."udfAPIisValidMaritalStatus"("maritalstatuscode" character varying) OWNER TO "postgres";

--
-- TOC entry 404 (class 1255 OID 21986)
-- Name: udfAvailablePremium(integer, integer, integer, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "public"."udfAvailablePremium"(
    "theMonth" integer,
    "theYear" integer,
    "theMode" integer,
    "ProdID" integer DEFAULT 0,
    "LocationId" integer DEFAULT 0)
    RETURNS TABLE("ProdId" integer, "Allocated" double precision, "Officer" character varying, "LastName" character varying, "OtherNames" character varying)
    LANGUAGE "plpgsql"
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
END $$;


-- ALTER FUNCTION "public"."udfAvailablePremium"("theMonth" integer, "theYear" integer, "theMode" integer, "ProdID" integer, "LocationId" integer) OWNER TO "postgres";

--
-- TOC entry 405 (class 1255 OID 22017)
-- Name: udfCollectedContribution("date", "date", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "public"."udfCollectedContribution"("datefrom" "date", "dateto" "date", "officerid" integer) RETURNS numeric
    LANGUAGE "plpgsql"
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
END $$;


-- ALTER FUNCTION "public"."udfCollectedContribution"("datefrom" "date", "dateto" "date", "officerid" integer) OWNER TO "postgres";

--
-- TOC entry 411 (class 1255 OID 25790)
-- Name: udfExpiredPolicies(integer, integer, integer, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "public"."udfExpiredPolicies"("themonth" integer, "theyear" integer, "themode" integer, "prodid" integer DEFAULT 0, "locationid" integer DEFAULT 0) RETURNS TABLE("ProdId" integer, "ExpiredPolicies" integer, "Officer" character varying, "LastName" character varying, "OtherNames" character varying)
    LANGUAGE "plpgsql"
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
END $$;


-- ALTER FUNCTION "public"."udfExpiredPolicies"("themonth" integer, "theyear" integer, "themode" integer, "prodid" integer, "locationid" integer) OWNER TO "postgres";

--
-- TOC entry 414 (class 1255 OID 25794)
-- Name: udfExpiredPoliciesPhoneStatistics("date", "date", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "public"."udfExpiredPoliciesPhoneStatistics"("datefrom" "date", "dateto" "date", "officerid" integer) RETURNS integer
    LANGUAGE "plpgsql"
    AS $$
DECLARE
	LegacyOfficer INT;
BEGIN
	SELECT "OfficerID" INTO LegacyOfficer FROM "tblOfficer" WHERE "ValidityTo" IS NULL AND "OfficerIDSubst" = OfficerId;
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
END $$;


-- ALTER FUNCTION "public"."udfExpiredPoliciesPhoneStatistics"("datefrom" "date", "dateto" "date", "officerid" integer) OWNER TO "postgres";

--
-- TOC entry 413 (class 1255 OID 25798)
-- Name: udfGetSnapshotIndicators("date", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "public"."udfGetSnapshotIndicators"("thedate" "date", "officerid" integer) RETURNS TABLE("Active" integer, "Expired" integer, "Idle" integer, "Suspended" integer)
    LANGUAGE "plpgsql"
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
	END $$;


-- ALTER FUNCTION "public"."udfGetSnapshotIndicators"("thedate" "date", "officerid" integer) OWNER TO "postgres";

--
-- TOC entry 423 (class 1255 OID 25804)
-- Name: udfNewPolicies(integer, integer, integer, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "public"."udfNewPolicies"("themonth" integer, "theyear" integer, "themode" integer, "prodid" integer, "locationid" integer DEFAULT 0) RETURNS TABLE("ProdId" integer, "Male" integer, "Female" integer, "Other" integer, "Officer" character varying, "LastName" character varying, "OtherNames" character varying)
    LANGUAGE "plpgsql"
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
END $$;


-- ALTER FUNCTION "public"."udfNewPolicies"("themonth" integer, "theyear" integer, "themode" integer, "prodid" integer, "locationid" integer) OWNER TO "postgres";

--
-- TOC entry 412 (class 1255 OID 25932)
-- Name: udfNewPoliciesPhoneStatistics("date", "date", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "public"."udfNewPoliciesPhoneStatistics"("datefrom" "date", "dateto" "date", "officerid" integer) RETURNS integer
    LANGUAGE "plpgsql"
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
END $$;


-- ALTER FUNCTION "public"."udfNewPoliciesPhoneStatistics"("datefrom" "date", "dateto" "date", "officerid" integer) OWNER TO "postgres";

--
-- TOC entry 422 (class 1255 OID 25937)
-- Name: udfNewPolicyInsuree(integer, integer, integer, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "public"."udfNewPolicyInsuree"("themonth" integer, "theyear" integer, "themode" integer, "prodid" integer DEFAULT 0, "locationid" integer DEFAULT 0) RETURNS TABLE("ProdID" integer, "Male" integer, "Female" integer, "Other" integer, "Officer" character varying, "LastName" character varying, "OtherNames" character varying)
    LANGUAGE "plpgsql"
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
	INNER JOIN O ON NewPolicies."ProdID" = F."ProdID";
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
END $$;


-- ALTER FUNCTION "public"."udfNewPolicyInsuree"("themonth" integer, "theyear" integer, "themode" integer, "prodid" integer, "locationid" integer) OWNER TO "postgres";

--
-- TOC entry 415 (class 1255 OID 25800)
-- Name: udfNewlyPremiumCollected(integer, integer, integer, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "public"."udfNewlyPremiumCollected"("themonth" integer, "theyear" integer, "themode" integer, "prodid" integer DEFAULT 0, "locationid" integer DEFAULT 0) RETURNS TABLE("ProdId" integer, "PremiumCollection" double precision, "Officer" character varying, "LastName" character varying, "OtherNames" character varying)
    LANGUAGE "plpgsql"
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
END $$;


-- ALTER FUNCTION "public"."udfNewlyPremiumCollected"("themonth" integer, "theyear" integer, "themode" integer, "prodid" integer, "locationid" integer) OWNER TO "postgres";

--
-- TOC entry 419 (class 1255 OID 25943)
-- Name: udfNumberOfCurrentInsuree(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "public"."udfNumberOfCurrentInsuree"() RETURNS TABLE("NumberOfCurrentInsuree" integer, "MonthTime" integer, "QuarterTime" integer, "YearTime" integer, "Age" integer, "Gender" character, "Region" character varying, "InsureeDistrictName" character varying, "WardName" character varying, "VillageName" character varying, "ProdDistrictName" character varying, "ProductCode" character varying, "ProductName" character varying, "OfficeDistrict" character varying, "OfficerCode" character varying, "LastName" character varying, "OtherNames" character varying, "ProdRegion" character varying)
    LANGUAGE "plpgsql"
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

END $$;


-- ALTER FUNCTION "public"."udfNumberOfCurrentInsuree"() OWNER TO "postgres";

--
-- TOC entry 420 (class 1255 OID 25950)
-- Name: udfNumberOfCurrentPolicies(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "public"."udfNumberOfCurrentPolicies"() RETURNS TABLE("NumberOfCurrentPolicies" integer, "MonthTime" integer, "QuarterTime" integer, "YearTime" integer, "Age" integer, "Gender" character, "Region" character varying, "InsureeDistrictName" character varying, "WardName" character varying, "VillageName" character varying, "ProdDistrictName" character varying, "ProductCode" character varying, "ProductName" character varying, "OfficeDistrict" character varying, "OfficerCode" character varying, "LastName" character varying, "OtherNames" character varying, "ProdRegion" character varying)
    LANGUAGE "plpgsql"
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
END $$;


-- ALTER FUNCTION "public"."udfNumberOfCurrentPolicies"() OWNER TO "postgres";

--
-- TOC entry 421 (class 1255 OID 25951)
-- Name: udfNumberOfPoliciesExpired(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "public"."udfNumberOfPoliciesExpired"() RETURNS TABLE("ExpiredPolicy" integer, "MonthTime" integer, "QuarterTime" integer, "YearTime" integer, "Age" integer, "Gender" character, "Region" character varying, "InsureeDistrictName" character varying, "WardName" character varying, "VillageName" character varying, "ProdDistrictName" character varying, "ProductCode" character varying, "ProductName" character varying, "OfficeDistrict" character varying, "OfficerCode" character varying, "LastName" character varying, "OtherNames" character varying, "ProdRegion" character varying)
    LANGUAGE "plpgsql"
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
END $$;


-- ALTER FUNCTION "public"."udfNumberOfPoliciesExpired"() OWNER TO "postgres";

--
-- TOC entry 426 (class 1255 OID 25954)
-- Name: udfPolicyInsuree("date", integer, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "public"."udfPolicyInsuree"("lastday" "date", "themode" integer, "prodid" integer DEFAULT 0, "locationid" integer DEFAULT 0) RETURNS TABLE("ProdId" integer, "Male" integer, "Female" integer, "Other" integer, "Officer" character varying, "LastName" character varying, "OtherNames" character varying)
    LANGUAGE "plpgsql"
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
END $$;


-- ALTER FUNCTION "public"."udfPolicyInsuree"("lastday" "date", "themode" integer, "prodid" integer, "locationid" integer) OWNER TO "postgres";

--
-- TOC entry 424 (class 1255 OID 25956)
-- Name: udfPolicyRenewal(integer, integer, integer, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "public"."udfPolicyRenewal"("themonth" integer, "theyear" integer, "themode" integer, "prodid" integer DEFAULT 0, "locationid" integer DEFAULT 0) RETURNS TABLE("ProdId" integer, "Renewals" integer, "Officer" character varying, "LastName" character varying, "OtherNames" character varying)
    LANGUAGE "plpgsql"
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
END $$;


-- ALTER FUNCTION "public"."udfPolicyRenewal"("themonth" integer, "theyear" integer, "themode" integer, "prodid" integer, "locationid" integer) OWNER TO "postgres";

--
-- TOC entry 425 (class 1255 OID 25958)
-- Name: udfPremiumComposition(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "public"."udfPremiumComposition"() RETURNS TABLE("PolicyId" integer, "AssFee" numeric, "RegFee" numeric, "PremFee" numeric)
    LANGUAGE "plpgsql"
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
END $$;


-- ALTER FUNCTION "public"."udfPremiumComposition"() OWNER TO "postgres";

--
-- TOC entry 428 (class 1255 OID 25975)
-- Name: udfRejectedClaims(integer, integer, integer, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "public"."udfRejectedClaims"("themonth" integer, "theyear" integer, "prodid" integer DEFAULT 0, "hfid" integer DEFAULT 0, "locationid" integer DEFAULT 0) RETURNS TABLE("HFID" integer, "ProdID" integer, "ClaimID" integer)
    LANGUAGE "plpgsql"
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
END $$;


-- ALTER FUNCTION "public"."udfRejectedClaims"("themonth" integer, "theyear" integer, "prodid" integer, "hfid" integer, "locationid" integer) OWNER TO "postgres";

--
-- TOC entry 429 (class 1255 OID 25976)
-- Name: udfRemunerated(integer, integer, integer, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "public"."udfRemunerated"("themonth" integer, "theyear" integer, "hfid" integer DEFAULT 0, "prodid" integer DEFAULT 0, "locationid" integer DEFAULT 0) RETURNS TABLE("ProdID" integer, "HFID" integer, "Remunerated" integer)
    LANGUAGE "plpgsql"
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
END $$;


-- ALTER FUNCTION "public"."udfRemunerated"("themonth" integer, "theyear" integer, "hfid" integer, "prodid" integer, "locationid" integer) OWNER TO "postgres";

--
-- TOC entry 416 (class 1255 OID 25961)
-- Name: udfRenewedPoliciesPhoneStatistics("date", "date", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "public"."udfRenewedPoliciesPhoneStatistics"("datefrom" "date", "dateto" "date", "officerid" integer) RETURNS integer
    LANGUAGE "plpgsql"
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
END $$;


-- ALTER FUNCTION "public"."udfRenewedPoliciesPhoneStatistics"("datefrom" "date", "dateto" "date", "officerid" integer) OWNER TO "postgres";

--
-- TOC entry 417 (class 1255 OID 25965)
-- Name: udfSuspendedPolicies(integer, integer, integer, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "public"."udfSuspendedPolicies"("themonth" integer, "theyear" integer, "themode" integer, "locationid" integer, "prodid" integer DEFAULT 0) RETURNS TABLE("ProdId" integer, "SuspendedPolicies" integer, "Officer" character varying, "LastName" character varying, "OtherNames" character varying)
    LANGUAGE "plpgsql"
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
END $$;


-- ALTER FUNCTION "public"."udfSuspendedPolicies"("themonth" integer, "theyear" integer, "themode" integer, "locationid" integer, "prodid" integer) OWNER TO "postgres";

--
-- TOC entry 418 (class 1255 OID 25970)
-- Name: udfSuspendedPoliciesPhoneStatistics("date", "date", integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "public"."udfSuspendedPoliciesPhoneStatistics"("datefrom" "date", "dateto" "date", "officerid" integer) RETURNS integer
    LANGUAGE "plpgsql"
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
END $$;


-- ALTER FUNCTION "public"."udfSuspendedPoliciesPhoneStatistics"("datefrom" "date", "dateto" "date", "officerid" integer) OWNER TO "postgres";

--
-- TOC entry 430 (class 1255 OID 25977)
-- Name: udfTotalClaims(integer, integer, integer, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "public"."udfTotalClaims"("themonth" integer, "theyear" integer, "prodid" integer DEFAULT 0, "hfid" integer DEFAULT 0, "locationid" integer DEFAULT 0) RETURNS TABLE("ProdID" integer, "HFID" integer, "TotalClaims" integer)
    LANGUAGE "plpgsql"
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
END $$;


-- ALTER FUNCTION "public"."udfTotalClaims"("themonth" integer, "theyear" integer, "prodid" integer, "hfid" integer, "locationid" integer) OWNER TO "postgres";

--
-- TOC entry 427 (class 1255 OID 25973)
-- Name: udfTotalPolicies("date", integer, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "public"."udfTotalPolicies"("lastday" "date", "themode" integer, "prodid" integer DEFAULT 0, "locationid" integer DEFAULT 0) RETURNS TABLE("ProdId" integer, "Male" integer, "Female" integer, "Other" integer, "Officer" character varying, "LastName" character varying, "OtherNames" character varying)
    LANGUAGE "plpgsql"
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
END $$;


-- ALTER FUNCTION "public"."udfTotalPolicies"("lastday" "date", "themode" integer, "prodid" integer, "locationid" integer) OWNER TO "postgres";

--
-- TOC entry 408 (class 1255 OID 25059)
-- Name: uspGetPolicyPeriod(integer, "date", bit, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "public"."uspGetPolicyPeriod"("prodid" integer, "enroldate" "date", "hascycles" bit DEFAULT B'0'::"bit", "policystage" character varying DEFAULT 'N'::"bpchar") RETURNS TABLE("StartDate" "date", "ExpiryDate" "date", "HasCycle" bit)
    LANGUAGE "plpgsql"
    AS $$
	DECLARE
		StartCycle1 DATE;
		StartCycle2 DATE;
		StartCycle3 DATE;
		StartCycle4 DATE;
		-- I select the start cycles into these sc* variables so I can construct a proper date with them. Selecting text (e.g. 06-01) directly into date variable throws errors
		sc1 VARCHAR(5);
		sc2 VARCHAR(5);
		sc3 VARCHAR(5);
		sc4 VARCHAR(5);
		GracePeriod INT;
		StartDate DATE;
		InsurancePeriod INT;
		AdministratorPeriod INT;
		ExpiryDate DATE;
	BEGIN
	--Add administration period to the enrolment date and then check the cycle
	
	SELECT "AdministrationPeriod" INTO AdministratorPeriod FROM "tblProduct" WHERE "ProdID" = ProdId;
	AdministratorPeriod = COALESCE(AdministratorPeriod,0);
	IF PolicyStage = N'N' THEN
		EnrolDate = DATEADD_MONTH(AdministratorPeriod, EnrolDate);
	END IF;

--Check if they work on cycles
	IF EXISTS(SELECT 1 FROM "tblProduct" WHERE "ProdID" = ProdId AND "StartCycle1" IS NOT NULL) THEN
		HasCycles = B'1';
		
		SELECT "StartCycle1", "StartCycle2", "StartCycle3", "StartCycle4", "GracePeriod", "InsurancePeriod"
		INTO sc1, sc2, sc3, sc4, GracePeriod, InsurancePeriod
		FROM "tblProduct" WHERE "ProdID" = ProdId;
		
		StartCycle1 = to_date(CONCAT(YEAR(EnrolDate)::VARCHAR(4), sc1), 'YYYYDD-MM');
		StartCycle2 = to_date(CONCAT(YEAR(EnrolDate)::VARCHAR(4), COALESCE(NULLIF(sc2,''),sc1)), 'YYYYDD-MM');
		StartCycle3 = to_date(CONCAT(YEAR(EnrolDate)::VARCHAR(4), COALESCE(NULLIF(sc3,''),COALESCE(NULLIF(sc2,''),sc1))), 'YYYYDD-MM');
		StartCycle4 = to_date(CONCAT(YEAR(EnrolDate)::VARCHAR(4), COALESCE(NULLIF(sc4,''),COALESCE(NULLIF(sc3,''),COALESCE(NULLIF(sc2,''),sc1)))), 'YYYYDD-MM');

		IF EnrolDate < DATEADD_MONTH(GracePeriod,StartCycle1) THEN
			StartDate = StartCycle1;
		ELSIF EnrolDate < DATEADD_MONTH(GracePeriod,StartCycle2) THEN
			StartDate = StartCycle2;
		ELSIF EnrolDate < DATEADD_MONTH(GracePeriod,StartCycle3) THEN
			StartDate = StartCycle3;
		ELSIF EnrolDate < DATEADD_MONTH(GracePeriod,StartCycle4) THEN
			StartDate = StartCycle4;
		ELSE
			StartDate = DATEADD_YEAR(1,StartCycle1);
		END IF;

	ELSE	--They don't work on cycles so get the enrolment date as start date and derive expiry date from product period
		
		HasCycles = B'0';
		
		SELECT "InsurancePeriod" INTO InsurancePeriod FROM "tblProduct" WHERE "ProdID" = ProdId;
		StartDate = EnrolDate;
	END IF;
	
	ExpiryDate = DATEADD_DAY(-1, DATEADD_MONTH(InsurancePeriod, StartDate));
	RETURN QUERY
	SELECT StartDate, ExpiryDate, HasCycles;
END $$;


-- ALTER FUNCTION "public"."uspGetPolicyPeriod"("prodid" integer, "enroldate" "date", "hascycles" bit, "policystage" character varying) OWNER TO "postgres";

--
-- TOC entry 406 (class 1255 OID 22629)
-- Name: uspPolicyValue(integer, integer, integer, character, "date", integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "public"."uspPolicyValue"("familyid" integer DEFAULT 0, "prodid" integer DEFAULT 0, "policyid" integer DEFAULT 0, "policystage" character DEFAULT NULL::"bpchar", "enrolldate" "date" DEFAULT NULL::"date", "previouspolicyid" integer DEFAULT 0, "errorcode" integer DEFAULT 0) RETURNS numeric
    LANGUAGE "plpgsql"
    AS $$
	DECLARE
		ExpiryDate DATE;
		HasCycle BIT;
		StartDate DATE;
		MinDiscountDateR DATE;
		MinDiscountDateN DATE;
		PreviousExpiryDate DATE = NULL;
		LumpSum DECIMAL(18,2) = 0;
		PremiumAdult DECIMAL(18,2) = 0;
		PremiumChild DECIMAL(18,2) = 0;
		RegistrationLumpSum DECIMAL(18,2) = 0;
		RegistrationFee DECIMAL(18,2) = 0;
		GeneralAssemblyLumpSum DECIMAL(18,2) = 0;
		GeneralAssemblyFee DECIMAL(18,2) = 0;
		Threshold SMALLINT = 0;
		MemberCount INT = 0;
		AdultMembers INT =0;
		ChildMembers INT = 0;
		OAdultMembers INT =0;
		OChildMembers INT = 0;
		Registration DECIMAL(18,2) = 0;
		GeneralAssembly DECIMAL(18,2) = 0;
		Contribution DECIMAL(18,2) = 0;
		PolicyValue DECIMAL(18,2) = 0;
		ExtraAdult INT = 0;
		ExtraChild INT = 0;
		AddonAdult DECIMAL(18,2) = 0;
		AddonChild DECIMAL(18,2) = 0;
		DiscountPeriodR INT = 0;
		DiscountPercentR DECIMAL(18,2) =0;
		DiscountPeriodN INT = 0;
		DiscountPercentN DECIMAL(18,2) =0;
		ValidityTo DATE = NULL;
		LegacyId INT = NULL;

	BEGIN
	/*
	********ERROR CODE***********
	-1	:	Policy does not exists at the time of enrolment
	-2	:	Policy was deleted at the time of enrolment
	*/
	ErrorCode = 0;

		IF EnrollDate IS NULL THEN
			EnrollDate = NOW();
		END IF;

	--This means you are calculating existing policy
		IF PolicyId > 0 THEN
			SELECT "FamilyId", "ProdId", "PolicyStage", "EnrollDate", "ExpiryDate" 
			INTO FamilyId, ProdId, PolicyStage, EnrollDate, ExpiryDate FROM "tblPolicy" WHERE "PolicyID" = PolicyId LIMIT 1;
		END IF;

	/*--Get all the required fiedls from product (Valide product at the enrollment time)--*/
		SELECT "LumpSum", "PremiumAdult", "PremiumChild", "RegistrationLumpSum", "RegistrationFee", "GeneralAssemblyLumpSum", "GeneralAssemblyFee", "Threshold", "MemberCount", "ValidityTo", "LegacyID", "RenewalDiscountPeriod", "RenewalDiscountPerc", "EnrolmentDiscountPeriod", "EnrolmentDiscountPerc" 
		INTO LumpSum, PremiumAdult, PremiumChild, RegistrationLumpSum, RegistrationFee, GeneralAssemblyLumpSum, GeneralAssemblyFee, Threshold, MemberCount, ValidityTo, LegacyId, DiscountPeriodR, DiscountPercentR, DiscountPeriodN, DiscountPercentN 
		FROM "tblProduct"
		WHERE ("ProdID" = ProdId OR "LegacyID" = ProdId) 
		AND DATE("ValidityFrom") <= EnrollDate 
		ORDER BY "ValidityFrom" Desc LIMIT 1;

		IF NOT FOUND THEN	--No policy found
			ErrorCode = -1;
			RETURN ErrorCode;
		END IF;
		IF NOT ValidityTo IS NULL AND LegacyId IS NULL THEN	--Policy is deleted by the time of enrollment
			ErrorCode = -2;
			RETURN ErrorCode;
		END IF;

/* ISNULL = COALESCE had to be moved outside the SELECT statement */
		LumpSum = COALESCE(LumpSum,0);
		PremiumAdult = COALESCE(PremiumAdult,0);
		PremiumChild = COALESCE(PremiumChild,0);
		RegistrationLumpSum = COALESCE(RegistrationLumpSum,0);
		RegistrationFee = COALESCE(RegistrationFee,0);
		GeneralAssemblyLumpSum = COALESCE(GeneralAssemblyLumpSum,0);
		GeneralAssemblyFee = COALESCE(GeneralAssemblyFee,0);
		Threshold = COALESCE(Threshold,0);
		MemberCount = COALESCE(MemberCount,0);
		DiscountPeriodR = COALESCE(DiscountPeriodR,0);
		DiscountPercentR = COALESCE(DiscountPercentR,0);
		DiscountPeriodN = COALESCE(DiscountPeriodN,0);
		DiscountPercentN = COALESCE(DiscountPercentN,0);

	/*
		Relationships to be excluded from the normal family Count
		7: Others
	*/

	--Get only valid insurees according to the maximum members of the product from the family

	CREATE TEMP TABLE tempTblInsuree AS SELECT * FROM "tblInsuree" WHERE "FamilyID" = FamilyId AND "ValidityTo" IS NULL;

	CREATE TEMP TABLE TempIns AS
	SELECT ROW_NUMBER() OVER(ORDER BY "ValidityFrom") Number, * FROM tempTblInsuree;
	DELETE FROM tempTblInsuree USING tempTblInsuree I INNER JOIN TempIns T ON I."InsureeID" = T."InsureeID" WHERE Number > MemberCount;


	--Get the number of adults, Children, OtherAdult and Other Children from the family
		AdultMembers = (SELECT COUNT("InsureeID") FROM tempTblInsuree WHERE DATEDIFF_YEAR("DOB",NOW()) >= 18 AND COALESCE("Relationship",0) <> 7 AND "ValidityTo" IS NULL AND "FamilyID" = FamilyId);
		ChildMembers = (SELECT COUNT("InsureeID") FROM tempTblInsuree WHERE DATEDIFF_YEAR("DOB",NOW()) < 18 AND COALESCE("Relationship",0) <> 7  AND "ValidityTo" IS NULL AND "FamilyID" = FamilyId);
		OAdultMembers = (SELECT COUNT("InsureeID") FROM tempTblInsuree WHERE DATEDIFF_YEAR("DOB",NOW()) >= 18 AND COALESCE("Relationship",0) = 7 AND "ValidityTo" IS NULL AND "FamilyID" = FamilyId);
		OChildMembers = (SELECT COUNT("InsureeID") FROM tempTblInsuree WHERE DATEDIFF_YEAR("DOB",NOW()) < 18 AND COALESCE("Relationship",0) = 7 AND "ValidityTo" IS NULL AND "FamilyID" = FamilyId);


	--Get extra members in family
		IF Threshold > 0 AND AdultMembers > Threshold THEN
			ExtraAdult = AdultMembers - Threshold;
		END IF;
		IF Threshold > 0 AND ChildMembers > (Threshold - AdultMembers + ExtraAdult) THEN
			ExtraChild = ChildMembers - ((Threshold - AdultMembers + ExtraAdult));
		END IF;

	--Get the Contribution
		IF LumpSum > 0 THEN
			Contribution = LumpSum;
		ELSE
			Contribution = (AdultMembers * PremiumAdult) + (ChildMembers * PremiumChild);
		END IF;

	--Get the Assembly
		IF GeneralAssemblyLumpSum > 0 THEN
			GeneralAssembly = GeneralAssemblyLumpSum;
		ELSE
			GeneralAssembly = (AdultMembers + ChildMembers + OAdultMembers + OChildMembers) * GeneralAssemblyFee;
		END IF;

	--Get the Registration
		IF PolicyStage = N'N' THEN	--Don't calculate if it's renewal
			IF RegistrationLumpSum > 0 THEN
				Registration = RegistrationLumpSum;
			ELSE
				Registration = (AdultMembers + ChildMembers  + OAdultMembers + OChildMembers) * RegistrationFee;
			END IF;
		END IF;

	/* Any member above the maximum member count  or with excluded relationship calculate the extra addon amount */

		AddonAdult = (ExtraAdult + OAdultMembers) * PremiumAdult;
		AddonChild = (ExtraChild + OChildMembers) * PremiumChild;

		Contribution = Contribution + AddonAdult + AddonChild;
		
		--Line below was a mistake, All adults and children are already included in GeneralAssembly and Registration
		--SET @GeneralAssembly += (@OAdultMembers + @OChildMembers + @ExtraAdult + @ExtraChild) * @GeneralAssemblyFee;
		
		--IF @PolicyStage = N'N'
		--	SET @Registration += (@OAdultMembers + @OChildMembers + @ExtraAdult + @ExtraChild) * @RegistrationFee;


	PolicyValue = Contribution + GeneralAssembly + Registration;

	--The total policy value is calculated, So if the enroldate is earlier than the discount period then apply discount
	--CREATE TEMP TABLE tblPeriod AS SELECT "StartDate", "ExpiryDate", "HasCycle" 
	--FROM uspGetPolicyPeriod(ProdId, EnrollDate, HasCycle, PolicyStage);
	CREATE TEMP TABLE tblPeriod AS SELECT * FROM "uspGetPolicyPeriod"(ProdId, EnrollDate, HasCycle, PolicyStage);

	StartDate = (SELECT "StartDate" FROM tblPeriod);

	IF PolicyStage = N'N' THEN
		MinDiscountDateN = DATEADD_MONTH(-(DiscountPeriodN),StartDate);
		IF EnrollDate <= MinDiscountDateN AND HasCycle = 1 THEN
			PolicyValue = PolicyValue - (PolicyValue * 0.01 * DiscountPercentN);
		END IF;
	ELSIF PolicyStage = N'R' THEN
		IF PreviousPolicyId > 0 THEN
			SELECT "ExpiryDate" INTO PreviousExpiryDate FROM "tblPolicy" WHERE "ValidityTo" IS NULL AND "tblPolicy"."PolicyID" = PreviousPolicyId;
			PreviousExpiryDate = DATEADD_DAY(1, PreviousExpiryDate);
		ELSE
			PreviousExpiryDate = StartDate;
		END IF;
		MinDiscountDateR = DATEADD_MONTH(-(DiscountPeriodR),PreviousExpiryDate);
		IF EnrollDate <= MinDiscountDateR THEN
			PolicyValue = PolicyValue - (PolicyValue * 0.01 * DiscountPercentR);
		END IF;
	END IF;
	DROP TABLE tempTblInsuree;
	DROP TABLE TempIns;
	DROP TABLE tblPeriod;
	RETURN PolicyValue;
END $$;


-- ALTER FUNCTION "public"."uspPolicyValue"("familyid" integer, "prodid" integer, "policyid" integer, "policystage" character, "enrolldate" "date", "previouspolicyid" integer, "errorcode" integer) OWNER TO "postgres";

--
-- TOC entry 431 (class 1255 OID 23620)
-- Name: uspSSRSPolicyStatus(timestamp without time zone, timestamp without time zone, integer, integer, integer, integer, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "public"."uspSSRSPolicyStatus"("rangefrom" timestamp without time zone, "rangeto" timestamp without time zone, "OfficerID" integer DEFAULT 0, "RegionID" integer DEFAULT 0, "DistrictID" integer DEFAULT 0, "villageid" integer DEFAULT 0, "wardid" integer DEFAULT 0, "policystatus" integer DEFAULT 0) RETURNS TABLE("PolicyID" integer, "FamilyID" integer, "RenewalDate" "date", "policyvalue" numeric, "InsureeID" integer, "ProductID" integer, "productcode" character varying, "productname" character varying, "ProductFromDate" "date", "ProductToDate" "date", "DistrictName" character varying, "VillageName" character varying, "WardName" character varying, "CHFID" character varying, "InsLastName" character varying, "InsOtherNames" character varying, "InsDOB" "date", "ConvProdID" integer, "OffID" integer, "OffCode" character varying, "OffLastName" character varying, "OffOtherNames" character varying, "OffPhone" character varying, "OffSubstID" integer, "OffWorkTo" "date")
    LANGUAGE "plpgsql"
    AS $$
-- I got fed up with getting errors because sometimes variable names are the same as column names of the table we're working on. This setting makes it so whenever nothing is specified postgres assumes we're using the variable (and not the column of a table).
#variable_conflict use_variable
	/*
	There is no equivalent to "SET NOCOUNT ON" in PostgreSQL, but Stack Overflow claims it's not needed?
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	*/

	DECLARE
		--items record;
		"RenewalID" int;
		"PolicyID" int;
		"FamilyID" int;
		"RenewalDate" date;
		"InsureeID" int;
		"ProductID" int;
		ProductCode varchar(8);
		ProductName varchar(100);
		"ProductFromDate" date;
		"ProductToDate" date;
		"DistrictName" varchar(50);
		"VillageName" varchar(50);
		"WardName" varchar(50);
		"CHFID" varchar(12);
		"InsLastName" varchar(100);
		"InsOtherNames" varchar(100);
		"InsDOB" date;
		"ConvProdID" int;
		"OffCode" varchar(15);
		"OffLastName" varchar(50);
		"OffOtherNames" varchar(50);
		"OffPhone" varchar(50);
		"OffSubstID" int;
		"OffWorkTo" date;
		"OffID" INT;
		SMSStatus smallint;
		iCount int;
		tempRow RECORD;
		PolicyValue DECIMAL(18,4) = 0;
		
	BEGIN
	
	CREATE TEMP TABLE tblResult(
		"PolicyID" INT, "FamilyID" INT, "RenewalDate" DATE, "PolicyValue" NUMERIC(18,4), "InsureeID" INT, "ProductID" INT, "ProductCode" VARCHAR(8), "ProductName" VARCHAR(100), "DateFrom" DATE, "DateTo" DATE, "DistrictName" VARCHAR(50), "VillageName" VARCHAR(50), "WardName" VARCHAR(50), "CHFID" VARCHAR(12), "LastName" VARCHAR(100), "OtherNames" VARCHAR(100), "DOB" DATE, "ConversionProdId" INT, "OfficerID" INT, "Code" VARCHAR(15), "OffLastName" VARCHAR(50), "OffOtherNames" VARCHAR(50), "Phone" VARCHAR(50), "OfficerIdSubst" INT, "WorksTo" DATE);
	
	<< loop1 >>
	FOR tempRow IN
		SELECT PL."PolicyID", PL."FamilyID", DATEADD_DAY(1, PL."ExpiryDate") AS "RenewalDate", 
			F."InsureeID", Prod."ProdID", Prod."ProductCode", Prod."ProductName",
			Prod."DateFrom", Prod."DateTo", D."DistrictName", V."VillageName", W."WardName", I."CHFID", I."LastName", I."OtherNames", I."DOB", Prod."ConversionProdID", 
			O."OfficerID", O."Code", O."LastName" "OffLastName", O."OtherNames" "OffOtherNames", O."Phone", O."OfficerIDSubst", O."WorksTo",
			PL."PolicyValue"
			FROM "tblPolicy" PL INNER JOIN "tblFamilies" F ON PL."FamilyID" = F."FamilyID"
			INNER JOIN "tblInsuree" I ON F."InsureeID" = I."InsureeID"
			INNER JOIN "tblProduct" Prod ON PL."ProdID" = Prod."ProdID"
			INNER JOIN "tblVillages" V ON V."VillageId" = F."LocationId"
			INNER JOIN "tblWards" W ON W."WardId" = V."WardId"
			INNER JOIN "tblDistricts" D ON D."DistrictId" = W."DistrictId"
			INNER JOIN "tblRegions" R ON R."RegionId" = D."Region"
			INNER JOIN "tblOfficer" O ON PL."OfficerID" = O."OfficerID"
			AND PL."ExpiryDate" BETWEEN RangeFrom AND RangeTo
			WHERE PL."ValidityTo" IS NULL
			AND F."ValidityTo" IS NULL
			AND R."ValidityTo" IS NULL
			AND D."ValidityTo" IS NULL
			AND V."ValidityTo" IS NULL
			AND W."ValidityTo" IS NULL
			AND I."ValidityTo" IS NULL
			AND O."ValidityTo" IS NULL
			AND PL."ExpiryDate" BETWEEN RangeFrom AND RangeTo
			--AND (O."OfficerId" = @"OfficerId" OR @"OfficerId" = 0)
			AND (R."RegionId" = "RegionID" OR "RegionID" = 0)
			AND (D."DistrictId" = "DistrictID" OR "DistrictID" = 0)
			AND (V."VillageId" = "VillageId"  OR "VillageId" = 0)
			AND (W."WardId" = WardID OR WardID = 0)
			AND (PL."PolicyStatus" = PolicyStatus OR PolicyStatus = 0)
			AND (PL."PolicyStatus" > 1)	--Do not renew Idle policies
			ORDER BY "RenewalDate" DESC  --Added by Rogers
		LOOP
			SELECT tempRow."PolicyID", tempRow."FamilyID", tempRow."RenewalDate", tempRow."InsureeID", tempRow."ProdID", tempRow."ProductCode", tempRow."ProductName", tempRow."DateFrom", tempRow."DateTo", tempRow."DistrictName", tempRow."VillageName", tempRow."WardName", tempRow."CHFID", tempRow."LastName", tempRow."OtherNames", tempRow."DOB", tempRow."ConversionProdID", tempRow."OfficerID", tempRow."Code", tempRow."OffLastName", tempRow."OffOtherNames", tempRow."Phone", tempRow."OfficerIDSubst", tempRow."WorksTo", tempRow."PolicyValue"
			INTO "PolicyID","FamilyID","RenewalDate","InsureeID","ProductID", ProductCode,ProductName,"ProductFromDate","ProductToDate","DistrictName","VillageName","WardName","CHFID","InsLastName","InsOtherNames","InsDOB","ConvProdID","OffID", "OffCode","OffLastName","OffOtherNames","OffPhone","OffSubstID","OffWorkTo",PolicyValue;
			--GET ProductCode or the substitution
			IF COALESCE("ConvProdID",0) > 0 THEN
				iCount = 0;
				WHILE "ConvProdID" <> 0 AND iCount < 20 LOOP	--this to prevent a recursive loop by wrong datra entries
					--get new product info 
					"ProductID" = "ConvProdID";
					SELECT "ConversionProdID" INTO "ConvProdID" FROM "tblProduct" WHERE "ProdID" = "ProductID";
					IF COALESCE("ConvProdID",0) = 0 THEN
						SELECT "ProductCode", "ProductName", "DateFrom", "DateTo"
						INTO ProductCode, ProductName, "ProductFromDate", "ProductToDate" 
						FROM "tblProduct" WHERE "ProdID" = "ProductID";
					END IF;
					iCount = iCount + 1;
				END LOOP;
			END IF;

			IF COALESCE("OffID" ,0) > 0 THEN
				--GET Officer"Code" or the substitution
				IF COALESCE("OffSubstID",0) > 0 THEN
					iCount = 0;
					WHILE "OffSubstID" <> 0 AND iCount < 20 AND "OffWorkTo" < @"RenewalDate" LOOP	--this to prevent a recursive loop by wrong datra entries 
						--get new product info 
						"OffID" = "OffSubstID";
						SELECT "OfficerIDSubst" INTO "OffSubstID" FROM "tblOfficer"  WHERE "OfficerID"  = "OffID";
						IF COALESCE("OffSubstID",0) = 0 THEN
							SELECT "Code", "LastName", "OtherNames", "Phone", "WorksTo"
							INTO "OffCode", "OffLastName", "OffOtherNames", "OffPhone", "OffWorkTo"
							FROM "tblOfficer"  WHERE "OfficerID"  = "OffID";
						END IF;
						iCount = iCount + 1;
					END LOOP;
				END IF;
			END IF;

			--"Code" added by Hiren to check if the policy has another following policy
			CONTINUE loop1 WHEN EXISTS (SELECT * FROM "tblPolicy" 
								WHERE "tblPolicy"."FamilyID" = "FamilyID" 
								AND ("tblPolicy"."ProdID" = "ProductID" OR "tblPolicy"."ProdID" = "ConvProdID") 
								AND "tblPolicy"."StartDate" >= "RenewalDate"
								AND "tblPolicy"."ValidityTo" IS NULL
								LIMIT 1
								);
			--Added by Rogers to check if the policy is alread in a family
			CONTINUE loop1 WHEN EXISTS(SELECT FROM tblResult WHERE tblResult."FamilyID" = "FamilyID" AND tblResult."ProductID" = "ProductID" OR tblResult."ProductID" = "ConvProdID" LIMIT 1);
			PolicyValue = "uspPolicyValue"("FamilyID", "ProductID", 0, CAST('R' AS CHAR(1)), "RenewalDate", "PolicyID", 0);

			INSERT INTO tblResult ("PolicyID", "FamilyID", "RenewalDate", "PolicyValue", "InsureeID", "ProductID", "ProductCode", "ProductName", "DateFrom", "DateTo", "DistrictName", "VillageName", "WardName", "CHFID", "LastName", "OtherNames", "DOB", "ConversionProdId", "OfficerID", "Code", "OffLastName", "OffOtherNames", "Phone", "OfficerIdSubst", "WorksTo")
			VALUES("PolicyID", "FamilyID", "RenewalDate", PolicyValue, "InsureeID", "ProductID", ProductCode, ProductName, "ProductFromDate", "ProductToDate", "DistrictName", "VillageName", "WardName", "CHFID", "InsLastName", "InsOtherNames", "InsDOB", "ConvProdID", "OffID", "OffCode", "OffLastName", "OffOtherNames", "OffPhone", "OffSubstID", "OffWorkTo");
			/* These next few lines are a hack. Whenever I just return this query
			   as a whole after the for loop, I just get a table where every row 
			   is replaced with the last row of the table. Copying every row 
			   individually gives the correct result but I have to empty the table 
			   every iteration. At least it works. */
			RETURN QUERY
			SELECT "PolicyID", "FamilyID", "RenewalDate", PolicyValue, "InsureeID", "ProductID", ProductCode, ProductName, "ProductFromDate", "ProductToDate", "DistrictName", "VillageName", "WardName", "CHFID", "InsLastName", "InsOtherNames", "InsDOB", "ConvProdID", "OffID", "OffCode", "OffLastName", "OffOtherNames", "OffPhone", "OffSubstID", "OffWorkTo"
			FROM tblResult
			WHERE ("OfficerID" = "OffID" OR "OfficerID" = 0);
			TRUNCATE tblresult;
		END LOOP;
		/* This is the query that doesn't work. I'll keep it here, just in case 
		   You notice what I'm doing wrong. */
		/*RETURN QUERY
		SELECT "PolicyID", "FamilyID", "RenewalDate", PolicyValue, "InsureeID", "ProductID", ProductCode, ProductName, "ProductFromDate", "ProductToDate", "DistrictName", "VillageName", "WardName", "CHFID", "InsLastName", "InsOtherNames", "InsDOB", "ConvProdID", "OffID", "OffCode", "OffLastName", "OffOtherNames", "OffPhone", "OffSubstID", "OffWorkTo"
		FROM tblResult
		WHERE ("OfficerID" = "OffID" OR "OfficerID" = 0);*/
		DROP TABLE tblResult;
		RETURN;
END $$;


-- ALTER FUNCTION "public"."uspSSRSPolicyStatus"("rangefrom" timestamp without time zone, "rangeto" timestamp without time zone, "OfficerID" integer, "RegionID" integer, "DistrictID" integer, "villageid" integer, "wardid" integer, "policystatus" integer) OWNER TO "postgres";

--
-- TOC entry 369 (class 1255 OID 21430)
-- Name: year("date"); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "public"."year"("date") RETURNS integer
    LANGUAGE "sql" IMMUTABLE
    AS $_$
      SELECT EXTRACT(YEAR FROM $1)::INTEGER;
$_$;


-- ALTER FUNCTION "public"."year"("date") OWNER TO "postgres";

--
-- TOC entry 365 (class 1255 OID 21428)
-- Name: year(timestamp without time zone); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "public"."year"(timestamp without time zone) RETURNS integer
    LANGUAGE "sql" IMMUTABLE
    AS $_$ 
      SELECT EXTRACT(YEAR FROM $1)::INTEGER; 
$_$;


-- ALTER FUNCTION "public"."year"(timestamp without time zone) OWNER TO "postgres";

--
-- TOC entry 368 (class 1255 OID 21429)
-- Name: year(timestamp with time zone); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "public"."year"(timestamp with time zone) RETURNS integer
    LANGUAGE "sql" STABLE
    AS $_$
      SELECT EXTRACT(YEAR FROM $1)::INTEGER;
$_$;


-- ALTER FUNCTION "public"."year"(timestamp with time zone) OWNER TO "postgres";

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 283 (class 1259 OID 20929)
-- Name: tblBatchRun; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblBatchRun" (
    "ValidityFrom" timestamp with time zone NOT NULL,
    "ValidityTo" timestamp with time zone,
    "LegacyID" integer,
    "RunID" integer NOT NULL,
    "RunDate" timestamp with time zone NOT NULL,
    "AuditUserID" integer NOT NULL,
    "RunYear" integer NOT NULL,
    "RunMonth" smallint NOT NULL,
    "LocationId" integer
);


-- ALTER TABLE "public"."tblBatchRun" OWNER TO "postgres";

--
-- TOC entry 282 (class 1259 OID 20927)
-- Name: tblBatchRun_RunID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "public"."tblBatchRun_RunID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- ALTER TABLE "public"."tblBatchRun_RunID_seq" OWNER TO "postgres";

--
-- TOC entry 4000 (class 0 OID 0)
-- Dependencies: 282
-- Name: tblBatchRun_RunID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "public"."tblBatchRun_RunID_seq" OWNED BY "public"."tblBatchRun"."RunID";


--
-- TOC entry 358 (class 1259 OID 25554)
-- Name: tblCeilingInterpretation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblCeilingInterpretation" (
    "CeilingIntCode" character(1) NOT NULL,
    "CeilingIntDesc" character varying(100) NOT NULL,
    "AltLanguage" character varying(100),
    "SortOrder" integer
);


-- ALTER TABLE "public"."tblCeilingInterpretation" OWNER TO "postgres";

--
-- TOC entry 289 (class 1259 OID 20977)
-- Name: tblClaim; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblClaim" (
    "ValidityFrom" timestamp with time zone NOT NULL,
    "ValidityTo" timestamp with time zone,
    "LegacyID" integer,
    "ClaimID" integer NOT NULL,
    "ClaimUUID" character varying(36) NOT NULL,
    "ClaimCategory" character varying(1),
    "ClaimCode" character varying(8) NOT NULL,
    "DateFrom" "date" NOT NULL,
    "DateTo" "date",
    "ClaimStatus" smallint NOT NULL,
    "Adjustment" "text",
    "Claimed" numeric(18,2),
    "Approved" numeric(18,2),
    "Reinsured" numeric(18,2),
    "Valuated" numeric(18,2),
    "DateClaimed" "date" NOT NULL,
    "DateProcessed" "date",
    "Feedback" boolean NOT NULL,
    "Explanation" "text",
    "FeedbackStatus" smallint,
    "ReviewStatus" smallint,
    "ApprovalStatus" smallint,
    "RejectionReason" smallint,
    "AuditUserID" integer NOT NULL,
    "ValidityFromReview" timestamp with time zone,
    "ValidityToReview" timestamp with time zone,
    "SubmitStamp" timestamp with time zone,
    "ProcessStamp" timestamp with time zone,
    "Remunerated" numeric(18,2),
    "GuaranteeId" character varying(50),
    "VisitType" character varying(1),
    "AuditUserIDReview" integer,
    "AuditUserIDSubmit" integer,
    "AuditUserIDProcess" integer,
    "Adjuster" integer,
    "ClaimAdminId" integer,
    "RunID" integer,
    "FeedbackID" integer,
    "HFID" integer NOT NULL,
    "ICDID" integer NOT NULL,
    "ICDID1" integer,
    "ICDID2" integer,
    "ICDID3" integer,
    "ICDID4" integer,
    "InsureeID" integer NOT NULL,
    "RowID" "bytea"
);


-- ALTER TABLE "public"."tblClaim" OWNER TO "postgres";

--
-- TOC entry 291 (class 1259 OID 20992)
-- Name: tblClaimAdmin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblClaimAdmin" (
    "ValidityFrom" timestamp with time zone NOT NULL,
    "ValidityTo" timestamp with time zone,
    "LegacyID" integer,
    "ClaimAdminId" integer NOT NULL,
    "ClaimAdminUUID" character varying(36) NOT NULL,
    "ClaimAdminCode" character varying(8),
    "LastName" character varying(100),
    "OtherNames" character varying(100),
    "DOB" "date",
    "EmailId" character varying(200),
    "Phone" character varying(50),
    "HasLogin" boolean,
    "AuditUserId" integer,
    "HFId" integer,
    "RowId" "bytea"
);


-- ALTER TABLE "public"."tblClaimAdmin" OWNER TO "postgres";

--
-- TOC entry 290 (class 1259 OID 20990)
-- Name: tblClaimAdmin_ClaimAdminId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "public"."tblClaimAdmin_ClaimAdminId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- ALTER TABLE "public"."tblClaimAdmin_ClaimAdminId_seq" OWNER TO "postgres";

--
-- TOC entry 4001 (class 0 OID 0)
-- Dependencies: 290
-- Name: tblClaimAdmin_ClaimAdminId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "public"."tblClaimAdmin_ClaimAdminId_seq" OWNED BY "public"."tblClaimAdmin"."ClaimAdminId";


--
-- TOC entry 294 (class 1259 OID 21013)
-- Name: tblClaimDedRem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblClaimDedRem" (
    "ValidityFrom" timestamp with time zone NOT NULL,
    "ValidityTo" timestamp with time zone,
    "LegacyID" integer,
    "ExpenditureID" integer NOT NULL,
    "DedG" numeric(18,2),
    "DedOP" numeric(18,2),
    "DedIP" numeric(18,2),
    "RemG" numeric(18,2),
    "RemOP" numeric(18,2),
    "RemIP" numeric(18,2),
    "RemConsult" numeric(18,2),
    "RemSurgery" numeric(18,2),
    "RemDelivery" numeric(18,2),
    "RemHospitalization" numeric(18,2),
    "RemAntenatal" numeric(18,2),
    "AuditUserID" integer NOT NULL,
    "ClaimID" integer NOT NULL,
    "InsureeID" integer,
    "PolicyID" integer
);


-- ALTER TABLE "public"."tblClaimDedRem" OWNER TO "postgres";

--
-- TOC entry 293 (class 1259 OID 21011)
-- Name: tblClaimDedRem_ExpenditureID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "public"."tblClaimDedRem_ExpenditureID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- ALTER TABLE "public"."tblClaimDedRem_ExpenditureID_seq" OWNER TO "postgres";

--
-- TOC entry 4002 (class 0 OID 0)
-- Dependencies: 293
-- Name: tblClaimDedRem_ExpenditureID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "public"."tblClaimDedRem_ExpenditureID_seq" OWNED BY "public"."tblClaimDedRem"."ExpenditureID";


--
-- TOC entry 296 (class 1259 OID 21021)
-- Name: tblClaimItems; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblClaimItems" (
    "ValidityFrom" timestamp with time zone NOT NULL,
    "ValidityTo" timestamp with time zone,
    "LegacyID" integer,
    "ClaimItemID" integer NOT NULL,
    "ClaimItemStatus" smallint NOT NULL,
    "Availability" boolean NOT NULL,
    "QtyProvided" numeric(18,2) NOT NULL,
    "QtyApproved" numeric(18,2),
    "PriceAsked" numeric(18,2) NOT NULL,
    "PriceAdjusted" numeric(18,2),
    "PriceApproved" numeric(18,2),
    "PriceValuated" numeric(18,2),
    "Explanation" "text",
    "Justification" "text",
    "RejectionReason" smallint,
    "AuditUserID" integer NOT NULL,
    "ValidityFromReview" timestamp with time zone,
    "ValidityToReview" timestamp with time zone,
    "AuditUserIDReview" integer,
    "LimitationValue" numeric(18,2),
    "Limitation" character varying(1),
    "RemuneratedAmount" numeric(18,2),
    "DeductableAmount" numeric(18,2),
    "ExceedCeilingAmount" numeric(18,2),
    "PriceOrigin" character varying(1),
    "ExceedCeilingAmountCategory" numeric(18,2),
    "ClaimID" integer NOT NULL,
    "ItemID" integer NOT NULL,
    "PolicyID" integer,
    "ProdID" integer
);


-- ALTER TABLE "public"."tblClaimItems" OWNER TO "postgres";

--
-- TOC entry 295 (class 1259 OID 21019)
-- Name: tblClaimItems_ClaimItemID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "public"."tblClaimItems_ClaimItemID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- ALTER TABLE "public"."tblClaimItems_ClaimItemID_seq" OWNER TO "postgres";

--
-- TOC entry 4003 (class 0 OID 0)
-- Dependencies: 295
-- Name: tblClaimItems_ClaimItemID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "public"."tblClaimItems_ClaimItemID_seq" OWNED BY "public"."tblClaimItems"."ClaimItemID";


--
-- TOC entry 299 (class 1259 OID 21037)
-- Name: tblClaimServices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblClaimServices" (
    "ValidityFrom" timestamp with time zone NOT NULL,
    "ValidityTo" timestamp with time zone,
    "LegacyID" integer,
    "ClaimServiceID" integer NOT NULL,
    "ClaimServiceStatus" smallint NOT NULL,
    "QtyProvided" numeric(18,2) NOT NULL,
    "QtyApproved" numeric(18,2),
    "PriceAsked" numeric(18,2) NOT NULL,
    "PriceAdjusted" numeric(18,2),
    "PriceApproved" numeric(18,2),
    "PriceValuated" numeric(18,2),
    "Explanation" "text",
    "Justification" "text",
    "RejectionReason" smallint,
    "AuditUserID" integer NOT NULL,
    "ValidityFromReview" timestamp with time zone,
    "ValidityToReview" timestamp with time zone,
    "AuditUserIDReview" integer,
    "LimitationValue" numeric(18,2),
    "Limitation" character varying(1),
    "RemuneratedAmount" numeric(18,2),
    "DeductableAmount" numeric(18,2),
    "ExceedCeilingAmount" numeric(18,2),
    "PriceOrigin" character varying(1),
    "ExceedCeilingAmountCategory" numeric(18,2),
    "ClaimID" integer NOT NULL,
    "PolicyID" integer,
    "ProdID" integer,
    "ServiceID" integer NOT NULL
);


-- ALTER TABLE "public"."tblClaimServices" OWNER TO "postgres";

--
-- TOC entry 298 (class 1259 OID 21035)
-- Name: tblClaimServices_ClaimServiceID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "public"."tblClaimServices_ClaimServiceID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- ALTER TABLE "public"."tblClaimServices_ClaimServiceID_seq" OWNER TO "postgres";

--
-- TOC entry 4004 (class 0 OID 0)
-- Dependencies: 298
-- Name: tblClaimServices_ClaimServiceID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "public"."tblClaimServices_ClaimServiceID_seq" OWNED BY "public"."tblClaimServices"."ClaimServiceID";


--
-- TOC entry 288 (class 1259 OID 20975)
-- Name: tblClaim_ClaimID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "public"."tblClaim_ClaimID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- ALTER TABLE "public"."tblClaim_ClaimID_seq" OWNER TO "postgres";

--
-- TOC entry 4005 (class 0 OID 0)
-- Dependencies: 288
-- Name: tblClaim_ClaimID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "public"."tblClaim_ClaimID_seq" OWNED BY "public"."tblClaim"."ClaimID";


--
-- TOC entry 258 (class 1259 OID 20706)
-- Name: tblConfirmationTypes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblConfirmationTypes" (
    "ConfirmationTypeCode" character varying(3) NOT NULL,
    "ConfirmationType" character varying(50) NOT NULL,
    "SortOrder" integer,
    "AltLanguage" character varying(50)
);


-- ALTER TABLE "public"."tblConfirmationTypes" OWNER TO "postgres";

--
-- TOC entry 357 (class 1259 OID 25546)
-- Name: tblControlNumber; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblControlNumber" (
    "ControlNumberID" bigint NOT NULL,
    "RequestedDate" timestamp with time zone,
    "ReceivedDate" timestamp with time zone,
    "RequestOrigin" character varying(50),
    "ResponseOrigin" character varying(50),
    "Status" integer,
    "LegacyID" bigint,
    "ValidityFrom" timestamp with time zone,
    "ValidityTo" timestamp with time zone,
    "AuditedUserID" integer,
    "PaymentID" bigint,
    "ControlNumber" character varying(50),
    "IssuedDate" timestamp with time zone,
    "Comment" character varying
);


-- ALTER TABLE "public"."tblControlNumber" OWNER TO "postgres";

--
-- TOC entry 356 (class 1259 OID 25533)
-- Name: tblControls; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblControls" (
    "FieldName" character varying(50) NOT NULL,
    "Adjustibility" character varying(1) NOT NULL,
    "Usage" character varying(200) NOT NULL
);


-- ALTER TABLE "public"."tblControls" OWNER TO "postgres";

--
-- TOC entry 248 (class 1259 OID 20570)
-- Name: tblLocations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblLocations" (
    "ValidityFrom" timestamp with time zone NOT NULL,
    "ValidityTo" timestamp with time zone,
    "LegacyID" integer,
    "LocationId" integer NOT NULL,
    "LocationUUID" character varying(36) NOT NULL,
    "LocationCode" character varying(8),
    "LocationName" character varying(50),
    "LocationType" character varying(1) NOT NULL,
    "MalePopulation" integer,
    "FemalePopulation" integer,
    "OtherPopulation" integer,
    "Families" integer,
    "AuditUserId" integer,
    "ParentLocationId" integer,
    "RowId" "text" NULL
);


-- ALTER TABLE "public"."tblLocations" OWNER TO "postgres";

--
-- TOC entry 311 (class 1259 OID 21421)
-- Name: tblDistricts; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW "public"."tblDistricts" AS
 SELECT "tblLocations"."LocationId" AS "DistrictId",
    "tblLocations"."LocationCode" AS "DistrictCode",
    "tblLocations"."LocationName" AS "DistrictName",
    "tblLocations"."ParentLocationId" AS "Region",
    "tblLocations"."ValidityFrom",
    "tblLocations"."ValidityTo",
    "tblLocations"."LegacyID",
    "tblLocations"."AuditUserId"
   FROM "public"."tblLocations"
  WHERE (("tblLocations"."ValidityTo" IS NULL) AND (("tblLocations"."LocationType")::"bpchar" = 'D'::"bpchar"));


-- ALTER TABLE "public"."tblDistricts" OWNER TO "postgres";

--
-- TOC entry 259 (class 1259 OID 20711)
-- Name: tblEducations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblEducations" (
    "EducationId" smallint NOT NULL,
    "Education" character varying(50) NOT NULL,
    "SortOrder" integer,
    "AltLanguage" character varying(50)
);


-- ALTER TABLE "public"."tblEducations" OWNER TO "postgres";

--
-- TOC entry 355 (class 1259 OID 25527)
-- Name: tblEmailSettings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblEmailSettings" (
    "EmailId" character varying(200) NOT NULL,
    "EmailPassword" character varying(200) NOT NULL,
    "SMTPHost" character varying(200) NOT NULL,
    "Port" integer NOT NULL,
    "EnableSSL" bit(1) NOT NULL
);


-- ALTER TABLE "public"."tblEmailSettings" OWNER TO "postgres";

--
-- TOC entry 354 (class 1259 OID 25519)
-- Name: tblExtracts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblExtracts" (
    "ExtractID" integer NOT NULL,
    "ExtractDirection" smallint NOT NULL,
    "ExtractType" smallint NOT NULL,
    "ExtractSequence" integer NOT NULL,
    "ExtractDate" timestamp with time zone NOT NULL,
    "ExtractFileName" character varying(255),
    "ExtractFolder" character varying(255),
    "LocationId" integer NOT NULL,
    "HFID" integer,
    "AppVersionBackend" numeric(3,1) NOT NULL,
    "ValidityFrom" timestamp with time zone NOT NULL,
    "ValidityTo" timestamp with time zone,
    "LegacyID" integer,
    "AuditUserID" integer NOT NULL,
    "RowID" bigint,
    "ExtractUUID" "uuid" NOT NULL
);


-- ALTER TABLE "public"."tblExtracts" OWNER TO "postgres";

--
-- TOC entry 261 (class 1259 OID 20718)
-- Name: tblFamilies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblFamilies" (
    "FamilyID" integer NOT NULL,
    "FamilyUUID" character varying(36) NOT NULL,
    "LegacyID" integer,
    "Poverty" boolean,
    "FamilyAddress" character varying(200),
    "isOffline" boolean,
    "Ethnicity" character varying(1),
    "ConfirmationNo" character varying(12),
    "ValidityFrom" timestamp with time zone NOT NULL,
    "ValidityTo" timestamp with time zone,
    "AuditUserID" integer NOT NULL,
    "ConfirmationType" character varying(3),
    "FamilyType" character varying(2),
    "InsureeID" integer NOT NULL,
    "LocationId" integer,
    "RowID" "text",
    "Source" VARCHAR(50) NULL,
    "SourceVersion" VARCHAR(15) NULL
);


-- ALTER TABLE "public"."tblFamilies" OWNER TO "postgres";

--
-- TOC entry 260 (class 1259 OID 20716)
-- Name: tblFamilies_FamilyID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "public"."tblFamilies_FamilyID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- ALTER TABLE "public"."tblFamilies_FamilyID_seq" OWNER TO "postgres";

--
-- TOC entry 4006 (class 0 OID 0)
-- Dependencies: 260
-- Name: tblFamilies_FamilyID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "public"."tblFamilies_FamilyID_seq" OWNED BY "public"."tblFamilies"."FamilyID";

CREATE TABLE "public"."tblFamilySMS" (
    FamilyID INT NOT NULL,
    ApprovalOfSMS BOOLEAN,
    LanguageOfSMS VARCHAR(5),
    ValidityFrom TIMESTAMPTZ NOT NULL,
    ValidityTo TIMESTAMPTZ,
    CONSTRAINT UC_FamilySMS UNIQUE (FamilyID, ValidityTo)
);


-- ALTER TABLE "public"."tblFamilySMS" OWNER TO "postgres";

--
-- TOC entry 262 (class 1259 OID 20726)
-- Name: tblFamilyTypes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblFamilyTypes" (
    "FamilyTypeCode" character varying(2) NOT NULL,
    "FamilyType" character varying(50) NOT NULL,
    "SortOrder" integer,
    "AltLanguage" character varying(50)
);


-- -- ALTER TABLE "public"."tblFamilyTypes" OWNER TO "postgres";

--
-- TOC entry 301 (class 1259 OID 21048)
-- Name: tblFeedback; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblFeedback" (
    "ValidityFrom" timestamp with time zone NOT NULL,
    "ValidityTo" timestamp with time zone,
    "LegacyID" integer,
    "FeedbackID" integer NOT NULL,
    "FeedbackUUID" character varying(36) NOT NULL,
    "CareRendered" boolean,
    "PaymentAsked" boolean,
    "DrugPrescribed" boolean,
    "DrugReceived" boolean,
    "Asessment" smallint,
    "CHFOfficerCode" integer,
    "FeedbackDate" timestamp with time zone,
    "AuditUserID" integer NOT NULL,
    "ClaimID" integer
);


-- -- ALTER TABLE "public"."tblFeedback" OWNER TO "postgres";

--
-- TOC entry 343 (class 1259 OID 25387)
-- Name: tblFeedbackPrompt; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblFeedbackPrompt" (
    "ClaimID" integer,
    "FeedbackPromptDate" "date" NOT NULL,
    "FeedbackPromptID" integer NOT NULL,
    "LegacyID" integer,
    "OfficerID" integer,
    "PhoneNumber" character varying(25),
    "SMSStatus" smallint DEFAULT 0,
    "ValidityFrom" timestamp with time zone,
    "ValidityTo" timestamp with time zone,
    "AuditUserID" integer
);


-- -- ALTER TABLE "public"."tblFeedbackPrompt" OWNER TO "postgres";

--
-- TOC entry 300 (class 1259 OID 21046)
-- Name: tblFeedback_FeedbackID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "public"."tblFeedback_FeedbackID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- -- ALTER TABLE "public"."tblFeedback_FeedbackID_seq" OWNER TO "postgres";

--
-- TOC entry 4007 (class 0 OID 0)
-- Dependencies: 300
-- Name: tblFeedback_FeedbackID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "public"."tblFeedback_FeedbackID_seq" OWNED BY "public"."tblFeedback"."FeedbackID";


--
-- TOC entry 353 (class 1259 OID 25513)
-- Name: tblFromPhone; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblFromPhone" (
    "FromPhoneId" integer NOT NULL,
    "DocType" character varying(3) NOT NULL,
    "DocName" character varying(200) NOT NULL,
    "DocStatus" character varying(3),
    "LandedDate" timestamp with time zone NOT NULL,
    "OfficerCode" character varying(8),
    "CHFID" character varying(12),
    "PhotoSumittedDate" timestamp with time zone,
    "ClaimId" integer,
    CONSTRAINT "chk_DocType" CHECK (((("DocType")::"bpchar" = 'C'::"bpchar") OR (("DocType")::"bpchar" = 'F'::"bpchar") OR (("DocType")::"bpchar" = 'R'::"bpchar") OR (("DocType")::"bpchar" = 'E'::"bpchar")))
);


-- -- ALTER TABLE "public"."tblFromPhone" OWNER TO "postgres";

--
-- TOC entry 263 (class 1259 OID 20731)
-- Name: tblGender; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblGender" (
    "Code" character varying(1) NOT NULL,
    "Gender" character varying(50),
    "AltLanguage" character varying(50),
    "SortOrder" integer
);


-- -- ALTER TABLE "public"."tblGender" OWNER TO "postgres";

--
-- TOC entry 241 (class 1259 OID 20537)
-- Name: tblHF; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblHF" (
    "ValidityFrom" timestamp with time zone NOT NULL,
    "ValidityTo" timestamp with time zone,
    "LegacyID" integer,
    "HfID" integer NOT NULL,
    "HfUUID" character varying(36) NOT NULL,
    "HFCode" character varying(8) NOT NULL,
    "HFName" character varying(100) NOT NULL,
    "AccCode" character varying(25),
    "HFLevel" character varying(1) NOT NULL,
    "HFAddress" character varying(100),
    "Phone" character varying(50),
    "Fax" character varying(50),
    "eMail" character varying(50),
    "HFCareType" character varying(1) NOT NULL,
    "OffLine" boolean NOT NULL,
    "AuditUserID" integer NOT NULL,
    "PLItemID" integer,
    "LegalForm" character varying(1) NOT NULL,
    "LocationId" integer NOT NULL,
    "PLServiceID" integer,
    "HFSublevel" character varying(1),
    "RowID" "bytea"
);


-- -- ALTER TABLE "public"."tblHF" OWNER TO "postgres";

--
-- TOC entry 243 (class 1259 OID 20547)
-- Name: tblHFCatchment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblHFCatchment" (
    "HFCatchmentId" integer NOT NULL,
    "LegacyId" integer,
    "Catchment" integer,
    "ValidityFrom" timestamp with time zone,
    "ValidityTo" timestamp with time zone,
    "AuditUserId" integer,
    "HFID" integer NOT NULL,
    "LocationId" integer NOT NULL
);


-- -- ALTER TABLE "public"."tblHFCatchment" OWNER TO "postgres";

--
-- TOC entry 242 (class 1259 OID 20545)
-- Name: tblHFCatchment_HFCatchmentId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "public"."tblHFCatchment_HFCatchmentId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- ALTER TABLE "public"."tblHFCatchment_HFCatchmentId_seq" OWNER TO "postgres";

--
-- TOC entry 4008 (class 0 OID 0)
-- Dependencies: 242
-- Name: tblHFCatchment_HFCatchmentId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "public"."tblHFCatchment_HFCatchmentId_seq" OWNED BY "public"."tblHFCatchment"."HFCatchmentId";


--
-- TOC entry 246 (class 1259 OID 20563)
-- Name: tblHFSublevel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblHFSublevel" (
    "HFSublevel" character varying(1) NOT NULL,
    "HFSublevelDesc" character varying(50),
    "SortOrder" integer,
    "AltLanguage" character varying(50)
);


-- ALTER TABLE "public"."tblHFSublevel" OWNER TO "postgres";

--
-- TOC entry 240 (class 1259 OID 20535)
-- Name: tblHF_HfID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "public"."tblHF_HfID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- ALTER TABLE "public"."tblHF_HfID_seq" OWNER TO "postgres";

--
-- TOC entry 4009 (class 0 OID 0)
-- Dependencies: 240
-- Name: tblHF_HfID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "public"."tblHF_HfID_seq" OWNED BY "public"."tblHF"."HfID";


--
-- TOC entry 352 (class 1259 OID 25497)
-- Name: tblHealthStatus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblHealthStatus" (
    "HealthStatusID" integer NOT NULL,
    "InsureeID" integer NOT NULL,
    "Description" character varying(255),
    "ValidityFrom" timestamp with time zone,
    "ValidityTo" timestamp with time zone,
    "AuditUserID" integer,
    "LegacyID" integer
);


-- ALTER TABLE "public"."tblHealthStatus" OWNER TO "postgres";

--
-- TOC entry 235 (class 1259 OID 20507)
-- Name: tblICDCodes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblICDCodes" (
    "ValidityFrom" timestamp with time zone NOT NULL,
    "ValidityTo" timestamp with time zone,
    "LegacyID" integer,
    "ICDID" integer NOT NULL,
    "ICDCode" character varying(255) NOT NULL,
    "ICDName" character varying(255) NOT NULL,
    "AuditUserID" integer NOT NULL,
    "RowID" "bytea"
);


-- ALTER TABLE "public"."tblICDCodes" OWNER TO "postgres";

--
-- TOC entry 234 (class 1259 OID 20505)
-- Name: tblICDCodes_ICDID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "public"."tblICDCodes_ICDID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- ALTER TABLE "public"."tblICDCodes_ICDID_seq" OWNER TO "postgres";

--
-- TOC entry 4010 (class 0 OID 0)
-- Dependencies: 234
-- Name: tblICDCodes_ICDID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "public"."tblICDCodes_ICDID_seq" OWNED BY "public"."tblICDCodes"."ICDID";


--
-- TOC entry 360 (class 1259 OID 25569)
-- Name: tblIMISDefaults; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblIMISDefaults" (
    "DefaultID" integer NOT NULL,
    "PolicyRenewalInterval" integer,
    "FTPHost" character varying(50),
    "FTPUser" character varying(50),
    "FTPPassword" character varying(20),
    "FTPPort" integer,
    "FTPEnrollmentFolder" character varying(255),
    "AssociatedPhotoFolder" character varying(255),
    "FTPClaimFolder" character varying(255),
    "FTPFeedbackFolder" character varying(255),
    "FTPPolicyRenewalFolder" character varying(255),
    "FTPPhoneExtractFolder" character varying(255),
    "FTPOffLineExtractFolder" character varying(255),
    "AppVersionBackEnd" numeric(3,1),
    "AppVersionEnquire" numeric(3,1),
    "AppVersionEnroll" numeric(3,1),
    "AppVersionRenewal" numeric(3,1),
    "AppVersionFeedback" numeric(3,1),
    "AppVersionClaim" numeric(3,1),
    "OffLineHF" integer,
    "WinRarFolder" character varying(255),
    "DatabaseBackupFolder" character varying(255),
    "OfflineCHF" integer,
    "SMSLink" character varying(500),
    "SMSIP" character varying(15),
    "SMSUserName" character varying(15),
    "SMSPassword" character varying(50),
    "SMSSource" character varying(15),
    "SMSDlr" integer,
    "SMSType" integer,
    "AppVersionFeedbackRenewal" numeric(3,1),
    "AppVersionImis" numeric(3,1),
    "APIKey" character varying(100),
    "ActivationOption" smallint DEFAULT 2 NOT NULL,
    "BypassReviewClaim" boolean DEFAULT true NOT NULL);


-- ALTER TABLE "public"."tblIMISDefaults" OWNER TO "postgres";

--
-- TOC entry 362 (class 1259 OID 25582)
-- Name: tblIMISDefaultsPhone; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblIMISDefaultsPhone" (
    "RuleName" character varying(100),
    "RuleValue" boolean,
    "Usage" character varying(200) NULL
);


-- ALTER TABLE "public"."tblIMISDefaultsPhone" OWNER TO "postgres";

--
-- TOC entry 351 (class 1259 OID 25492)
-- Name: tblIdentificationTypes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblIdentificationTypes" (
    "IdentificationCode" character varying(1) NOT NULL,
    "IdentificationTypes" character varying(50) NOT NULL,
    "AltLanguage" character varying(50),
    "SortOrder" integer
);


-- ALTER TABLE "public"."tblIdentificationTypes" OWNER TO "postgres";

--
-- TOC entry 265 (class 1259 OID 20738)
-- Name: tblInsuree; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblInsuree" (
    "InsureeID" integer NOT NULL,
    "AuditUserID" integer NOT NULL,
    "CHFID" character varying(12),
    "CardIssued" boolean NOT NULL,
    "CurrentAddress" character varying(200),
    "CurrentVillage" integer,
    "DOB" "date" NOT NULL,
    "Education" smallint,
    "Email" character varying(100),
    "FamilyID" integer NOT NULL,
    "Gender" character varying(1),
    "GeoLocation" character varying(250),
    "HFID" integer,
    "InsureeUUID" character varying(36) NOT NULL,
    "IsHead" boolean NOT NULL,
    "LastName" character varying(100) NOT NULL,
    "LegacyID" integer,
    "Marital" character varying(1),
    "OtherNames" character varying(100) NOT NULL,
    "Phone" character varying(50),
    "PhotoDate" "date",
    "PhotoID" integer,
    "Profession" smallint,
    "Relationship" smallint,
    "RowID" "bytea",
    "TypeOfId" character varying(1),
    "ValidityFrom" timestamp with time zone NOT NULL,
    "ValidityTo" timestamp with time zone,
    "Vulnerability" boolean,
    "isOffline" boolean,
    "passport" character varying(25),
    "Source" character varying(50) NULL,
    "SourceVersion" character varying(15) NULL
);


-- ALTER TABLE "public"."tblInsuree" OWNER TO "postgres";

--
-- TOC entry 267 (class 1259 OID 20751)
-- Name: tblInsureePolicy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblInsureePolicy" (
    "ValidityFrom" timestamp with time zone NOT NULL,
    "ValidityTo" timestamp with time zone,
    "LegacyID" integer,
    "InsureePolicyID" integer NOT NULL,
    "EnrollmentDate" "date",
    "StartDate" "date",
    "EffectiveDate" "date",
    "ExpiryDate" "date",
    "isOffline" boolean,
    "AuditUserID" integer NOT NULL,
    "InsureeID" integer NOT NULL,
    "PolicyId" integer NOT NULL,
    "RowID" "bytea"
);


-- ALTER TABLE "public"."tblInsureePolicy" OWNER TO "postgres";

--
-- TOC entry 266 (class 1259 OID 20749)
-- Name: tblInsureePolicy_InsureePolicyID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "public"."tblInsureePolicy_InsureePolicyID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- ALTER TABLE "public"."tblInsureePolicy_InsureePolicyID_seq" OWNER TO "postgres";

--
-- TOC entry 4011 (class 0 OID 0)
-- Dependencies: 266
-- Name: tblInsureePolicy_InsureePolicyID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "public"."tblInsureePolicy_InsureePolicyID_seq" OWNED BY "public"."tblInsureePolicy"."InsureePolicyID";


--
-- TOC entry 264 (class 1259 OID 20736)
-- Name: tblInsuree_InsureeID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "public"."tblInsuree_InsureeID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- ALTER TABLE "public"."tblInsuree_InsureeID_seq" OWNER TO "postgres";

--
-- TOC entry 4012 (class 0 OID 0)
-- Dependencies: 264
-- Name: tblInsuree_InsureeID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "public"."tblInsuree_InsureeID_seq" OWNED BY "public"."tblInsuree"."InsureeID";


--
-- TOC entry 237 (class 1259 OID 20515)
-- Name: tblItems; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblItems" (
    "ItemID" integer NOT NULL,
    "ItemUUID" character varying(36) NOT NULL,
    "LegacyID" integer,
	"Quantity" decimal(18,2),
    "ItemCode" character varying(6) NOT NULL,
    "ItemName" character varying(100) NOT NULL,
    "ItemType" character varying(1) NOT NULL,
    "ItemPackage" character varying(255),
    "ItemPrice" numeric(18,2) NOT NULL,
    "ItemCareType" character varying(1) NOT NULL,
    "ItemFrequency" smallint,
    "ItemPatCat" smallint NOT NULL,
    "ValidityFrom" timestamp with time zone NOT NULL,
    "ValidityTo" timestamp with time zone,
    "AuditUserID" integer NOT NULL,
    "RowID" "bytea"
);


-- ALTER TABLE "public"."tblItems" OWNER TO "postgres";

--
-- TOC entry 236 (class 1259 OID 20513)
-- Name: tblItems_ItemID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "public"."tblItems_ItemID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- ALTER TABLE "public"."tblItems_ItemID_seq" OWNER TO "postgres";

--
-- TOC entry 4013 (class 0 OID 0)
-- Dependencies: 236
-- Name: tblItems_ItemID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "public"."tblItems_ItemID_seq" OWNED BY "public"."tblItems"."ItemID";


--
-- TOC entry 218 (class 1259 OID 20325)
-- Name: tblLanguages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblLanguages" (
    "LanguageCode" character varying(5) NOT NULL,
    "LanguageName" character varying(50) NOT NULL,
    "SortOrder" integer,
    "CountryCode" character varying(10) NULL
);

INSERT INTO "public"."tblLanguages" ("LanguageCode", "LanguageName", "SortOrder") VALUES (N'en', N'English', NULL);


-- ALTER TABLE "public"."tblLanguages" OWNER TO "postgres";

--
-- TOC entry 244 (class 1259 OID 20553)
-- Name: tblLegalForms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblLegalForms" (
    "LegalFormCode" character varying(1) NOT NULL,
    "LegalForms" character varying(50) NOT NULL,
    "SortOrder" integer,
    "AltLanguage" character varying(50)
);


-- ALTER TABLE "public"."tblLegalForms" OWNER TO "postgres";

--
-- TOC entry 247 (class 1259 OID 20568)
-- Name: tblLocations_LocationId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "public"."tblLocations_LocationId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- ALTER TABLE "public"."tblLocations_LocationId_seq" OWNER TO "postgres";

--
-- TOC entry 4014 (class 0 OID 0)
-- Dependencies: 247
-- Name: tblLocations_LocationId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "public"."tblLocations_LocationId_seq" OWNED BY "public"."tblLocations"."LocationId";


--
-- TOC entry 344 (class 1259 OID 25399)
-- Name: tblLogins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblLogins" (
    "LoginId" integer NOT NULL,
    "UserId" integer,
    "LogTime" timestamp with time zone,
    "LogAction" integer
);


-- ALTER TABLE "public"."tblLogins" OWNER TO "postgres";

--
-- TOC entry 222 (class 1259 OID 20348)
-- Name: tblOfficer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblOfficer" (
    "ValidityFrom" timestamp with time zone NOT NULL,
    "ValidityTo" timestamp with time zone,
    "LegacyID" integer,
    "OfficerID" integer NOT NULL,
    "OfficerUUID" character varying(36) NOT NULL,
    "Code" character varying(8) NOT NULL,
    "LastName" character varying(100) NOT NULL,
    "OtherNames" character varying(100) NOT NULL,
    "LocationId" integer,
    "AuditUserID" integer NOT NULL,
    "DOB" "date",
    "EmailId" character varying(200),
    "HasLogin" boolean,
    "OfficerIDSubst" integer,
    "permanentaddress" character varying(100),
    "Phone" character varying(50),
    "PhoneCommunication" boolean,
    "RowID" "text",
    "VEOCode" character varying(8),
    "VEODOB" "date",
    "VEOLastName" character varying(100),
    "VEOOtherNames" character varying(100),
    "VEOPhone" character varying(25),
    "WorksTo" timestamp with time zone
);


-- ALTER TABLE "public"."tblOfficer" OWNER TO "postgres";

--
-- TOC entry 363 (class 1259 OID 25585)
-- Name: tblOfficerVillages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblOfficerVillages" (
    "OfficerVillageId" integer NOT NULL,
    "OfficerId" integer,
    "LocationId" integer,
    "ValidityFrom" timestamp with time zone,
    "ValidityTo" timestamp with time zone,
    "LegacyID" integer,
    "AuditUserID" integer,
    "RowId" "text"  -- NOT NULL
);


-- ALTER TABLE "public"."tblOfficerVillages" OWNER TO "postgres";

CREATE SEQUENCE "public"."tblOfficerVillages_OfficerVillageId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- ALTER TABLE "public"."tblOfficerVillages_OfficerVillageId_seq" OWNER TO "postgres";

ALTER SEQUENCE "public"."tblOfficerVillages_OfficerVillageId_seq" OWNED BY "public"."tblOfficerVillages"."OfficerVillageId";



--
-- TOC entry 221 (class 1259 OID 20346)
-- Name: tblOfficer_OfficerID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "public"."tblOfficer_OfficerID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- ALTER TABLE "public"."tblOfficer_OfficerID_seq" OWNER TO "postgres";

--
-- TOC entry 4015 (class 0 OID 0)
-- Dependencies: 221
-- Name: tblOfficer_OfficerID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "public"."tblOfficer_OfficerID_seq" OWNED BY "public"."tblOfficer"."OfficerID";


--
-- TOC entry 275 (class 1259 OID 20823)
-- Name: tblPLItems; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblPLItems" (
    "PLItemID" integer NOT NULL,
    "PLItemUUID" uuid NOT NULL,
    "PLItemName" character varying(100) NOT NULL,
    "DatePL" "date" NOT NULL,
    "ValidityFrom" timestamp with time zone NOT NULL,
    "ValidityTo" timestamp with time zone,
    "LegacyID" integer,
    "AuditUserID" integer NOT NULL,
    "LocationId" integer,
    "RowID" timestamp NULL
);


-- ALTER TABLE "public"."tblPLItems" OWNER TO "postgres";

--
-- TOC entry 277 (class 1259 OID 20833)
-- Name: tblPLItemsDetail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblPLItemsDetail" (
    "PLItemDetailID" integer NOT NULL,
    "PriceOverule" numeric(18,2),
    "ValidityFrom" timestamp with time zone NOT NULL,
    "ValidityTo" timestamp with time zone,
    "LegacyID" integer,
    "AuditUserID" integer NOT NULL,
    "ItemID" integer NOT NULL,
    "PLItemID" integer NOT NULL,
    "RowID" "bytea"
);


-- ALTER TABLE "public"."tblPLItemsDetail" OWNER TO "postgres";

--
-- TOC entry 276 (class 1259 OID 20831)
-- Name: tblPLItemsDetail_PLItemDetailID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "public"."tblPLItemsDetail_PLItemDetailID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- ALTER TABLE "public"."tblPLItemsDetail_PLItemDetailID_seq" OWNER TO "postgres";

--
-- TOC entry 4016 (class 0 OID 0)
-- Dependencies: 276
-- Name: tblPLItemsDetail_PLItemDetailID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "public"."tblPLItemsDetail_PLItemDetailID_seq" OWNED BY "public"."tblPLItemsDetail"."PLItemDetailID";


--
-- TOC entry 274 (class 1259 OID 20821)
-- Name: tblPLItems_PLItemID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "public"."tblPLItems_PLItemID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- ALTER TABLE "public"."tblPLItems_PLItemID_seq" OWNER TO "postgres";

--
-- TOC entry 4017 (class 0 OID 0)
-- Dependencies: 274
-- Name: tblPLItems_PLItemID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "public"."tblPLItems_PLItemID_seq" OWNED BY "public"."tblPLItems"."PLItemID";


--
-- TOC entry 279 (class 1259 OID 20841)
-- Name: tblPLServices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblPLServices" (
    "PLServiceID" integer NOT NULL,
    "PLServiceUUID" uuid NOT NULL,
    "PLServName" character varying(100) NOT NULL,
    "DatePL" "date" NOT NULL,
    "ValidityFrom" timestamp with time zone NOT NULL,
    "ValidityTo" timestamp with time zone,
    "LegacyID" integer,
    "AuditUserID" integer NOT NULL,
    "LocationId" integer,
    "RowID" "bytea"
);


-- ALTER TABLE "public"."tblPLServices" OWNER TO "postgres";

--
-- TOC entry 281 (class 1259 OID 20851)
-- Name: tblPLServicesDetail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblPLServicesDetail" (
    "PLServiceDetailID" integer NOT NULL,
    "PriceOverule" numeric(18,2),
    "ValidityFrom" timestamp with time zone NOT NULL,
    "ValidityTo" timestamp with time zone,
    "LegacyID" integer,
    "AuditUserID" integer NOT NULL,
    "ServiceID" integer NOT NULL,
    "PLServiceID" integer NOT NULL,
    "RowID" "bytea"
);


-- ALTER TABLE "public"."tblPLServicesDetail" OWNER TO "postgres";

--
-- TOC entry 280 (class 1259 OID 20849)
-- Name: tblPLServicesDetail_PLServiceDetailID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "public"."tblPLServicesDetail_PLServiceDetailID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- ALTER TABLE "public"."tblPLServicesDetail_PLServiceDetailID_seq" OWNER TO "postgres";

--
-- TOC entry 4018 (class 0 OID 0)
-- Dependencies: 280
-- Name: tblPLServicesDetail_PLServiceDetailID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "public"."tblPLServicesDetail_PLServiceDetailID_seq" OWNED BY "public"."tblPLServicesDetail"."PLServiceDetailID";


--
-- TOC entry 278 (class 1259 OID 20839)
-- Name: tblPLServices_PLServiceID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "public"."tblPLServices_PLServiceID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- ALTER TABLE "public"."tblPLServices_PLServiceID_seq" OWNER TO "postgres";

--
-- TOC entry 4019 (class 0 OID 0)
-- Dependencies: 278
-- Name: tblPLServices_PLServiceID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "public"."tblPLServices_PLServiceID_seq" OWNED BY "public"."tblPLServices"."PLServiceID";


--
-- TOC entry 303 (class 1259 OID 21236)
-- Name: tblPayer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblPayer" (
    "PayerID" integer NOT NULL,
    "PayerUUID" character varying(36) NOT NULL,
    "LegacyID" integer,
    "PayerType" character varying(1) NOT NULL,
    "PayerName" character varying(100) NOT NULL,
    "PayerAddress" character varying(100),
    "Phone" character varying(50),
    "Fax" character varying(50),
    "eMail" character varying(50),
    "ValidityFrom" timestamp with time zone NOT NULL,
    "ValidityTo" timestamp with time zone,
    "AuditUserID" integer NOT NULL,
    "LocationId" integer,
    "RowID" "text"
);


-- ALTER TABLE "public"."tblPayer" OWNER TO "postgres";

--
-- TOC entry 359 (class 1259 OID 25564)
-- Name: tblPayerType; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblPayerType" (
    "Code" character(1) NOT NULL,
    "PayerType" character varying(50) NOT NULL,
    "AltLanguage" character varying(50),
    "SortOrder" integer
);


-- ALTER TABLE "public"."tblPayerType" OWNER TO "postgres";

--
-- TOC entry 302 (class 1259 OID 21234)
-- Name: tblPayer_PayerID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "public"."tblPayer_PayerID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- ALTER TABLE "public"."tblPayer_PayerID_seq" OWNER TO "postgres";

--
-- TOC entry 4020 (class 0 OID 0)
-- Dependencies: 302
-- Name: tblPayer_PayerID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "public"."tblPayer_PayerID_seq" OWNED BY "public"."tblPayer"."PayerID";


--
-- TOC entry 345 (class 1259 OID 25429)
-- Name: tblPayment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblPayment" (
    "PaymentID" bigserial NOT NULL,
    "PaymentUUID" "uuid" NOT NULL,
    "ExpectedAmount" numeric(18,2),
    "ReceivedAmount" numeric(18,2),
    "OfficerCode" character varying(50),
    "PhoneNumber" character varying(12),
    "RequestDate" timestamp with time zone,
    "ReceivedDate" timestamp with time zone,
    "PaymentStatus" integer,
    "LegacyID" bigint,
    "ValidityFrom" timestamp with time zone,
    "ValidityTo" timestamp with time zone,
    "RowID" timestamp with time zone,
    "AuditedUSerID" integer,
    "TransactionNo" character varying(50),
    "PaymentOrigin" character varying(50),
    "MatchedDate" timestamp with time zone,
    "ReceiptNo" character varying(100),
    "PaymentDate" timestamp with time zone,
    "RejectedReason" character varying(255),
    "DateLastSMS" timestamp with time zone,
    "LanguageName" character varying(10),
    "TypeOfPayment" character varying(50),
    "TransferFee" numeric(18,2),
    "SpReconcReqId" character varying(30) NULL,
    "ReconciliationDate" timestamp NULL,
    "PayerPhoneNumber" character varying(50) NULL,
    "SmsRequired" bit NULL
);


-- ALTER TABLE "public"."tblPayment" OWNER TO "postgres";

--
-- TOC entry 346 (class 1259 OID 25437)
-- Name: tblPaymentDetails; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblPaymentDetails" (
    "PaymentDetailsID" bigserial NOT NULL,
    "PaymentID" bigint NOT NULL,
    "ProductCode" character varying(8),
    "InsuranceNumber" character varying(12),
    "PolicyStage" character varying(1),
    "Amount" numeric(18,2),
    "LegacyID" bigint,
    "ValidityFrom" timestamp with time zone,
    "ValidityTo" timestamp with time zone,
    "RowID" timestamp with time zone,
    "PremiumID" integer,
    "AuditedUserId" integer,
    "enrollmentDate" "date",
    "ExpectedAmount" numeric(18,2)
);


-- ALTER TABLE "public"."tblPaymentDetails" OWNER TO "postgres";

--
-- TOC entry 269 (class 1259 OID 20759)
-- Name: tblPhotos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblPhotos" (
    "PhotoID" integer NOT NULL,
    "PhotoUUID" character varying(36) NOT NULL,
    "InsureeID" integer,
    "CHFID" character varying(12),
    "PhotoFolder" character varying(255) NOT NULL,
    "PhotoFileName" character varying(250),
    "OfficerID" integer NOT NULL,
    "PhotoDate" "date" NOT NULL,
    "ValidityFrom" timestamp with time zone NOT NULL,
    "ValidityTo" timestamp with time zone,
    "AuditUserID" integer,
    "RowID" "text"
);


-- ALTER TABLE "public"."tblPhotos" OWNER TO "postgres";

--
-- TOC entry 268 (class 1259 OID 20757)
-- Name: tblPhotos_PhotoID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "public"."tblPhotos_PhotoID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- ALTER TABLE "public"."tblPhotos_PhotoID_seq" OWNER TO "postgres";

--
-- TOC entry 4021 (class 0 OID 0)
-- Dependencies: 268
-- Name: tblPhotos_PhotoID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "public"."tblPhotos_PhotoID_seq" OWNED BY "public"."tblPhotos"."PhotoID";


--
-- TOC entry 273 (class 1259 OID 20794)
-- Name: tblPolicy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblPolicy" (
    "ValidityFrom" timestamp with time zone NOT NULL,
    "ValidityTo" timestamp with time zone,
    "LegacyID" integer,
    "PolicyID" integer NOT NULL,
    "PolicyUUID" character varying(36) NOT NULL,
    "PolicyStage" character varying(1),
    "PolicyStatus" smallint,
    "PolicyValue" numeric(18,2),
    "EnrollDate" "date" NOT NULL,
    "StartDate" "date" NOT NULL,
    "EffectiveDate" "date",
    "ExpiryDate" "date",
    "isOffline" boolean,
    "AuditUserID" integer NOT NULL,
    "FamilyID" integer NOT NULL,
    "OfficerID" integer,
    "ProdID" integer NOT NULL,
    "RowID" "bytea",
    "Source" character varying(50) NULL,
    "SourceVersion" character varying(15) NULL
);


-- ALTER TABLE "public"."tblPolicy" OWNER TO "postgres";

--
-- TOC entry 348 (class 1259 OID 25467)
-- Name: tblPolicyRenewalDetails; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblPolicyRenewalDetails" (
    "RenewalDetailID" SERIAL NOT NULL,
    "RenewalID" integer NOT NULL,
    "InsureeID" integer NOT NULL,
    "ValidityFrom" timestamp with time zone NOT NULL,
    "ValidityTo" timestamp with time zone,
    "LegacyID" integer,
    "AuditCreateUser" integer NOT NULL
);


-- ALTER TABLE "public"."tblPolicyRenewalDetails" OWNER TO "postgres";

--
-- TOC entry 347 (class 1259 OID 25442)
-- Name: tblPolicyRenewals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblPolicyRenewals" (
    "RenewalID" SERIAL NOT NULL,
    "RenewalPromptDate" "date" NOT NULL,
    "RenewalDate" "date" NOT NULL,
    "NewOfficerID" integer,
    "PhoneNumber" character varying(25),
    "SMSStatus" smallint NOT NULL,
    "InsureeID" integer NOT NULL,
    "PolicyID" integer NOT NULL,
    "NewProdID" integer NOT NULL,
    "RenewalWarnings" smallint,
    "ValidityFrom" timestamp with time zone NOT NULL,
    "ValidityTo" timestamp with time zone,
    "LegacyID" integer,
    "AuditCreateUser" integer,
    "ResponseStatus" integer,
    "ResponseDate" timestamp with time zone,
    "RenewalUUID" "uuid" NOT NULL
);


-- ALTER TABLE "public"."tblPolicyRenewals" OWNER TO "postgres";

--
-- TOC entry 272 (class 1259 OID 20792)
-- Name: tblPolicy_PolicyID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "public"."tblPolicy_PolicyID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- ALTER TABLE "public"."tblPolicy_PolicyID_seq" OWNER TO "postgres";

--
-- TOC entry 4022 (class 0 OID 0)
-- Dependencies: 272
-- Name: tblPolicy_PolicyID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "public"."tblPolicy_PolicyID_seq" OWNED BY "public"."tblPolicy"."PolicyID";


--
-- TOC entry 305 (class 1259 OID 21246)
-- Name: tblPremium; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblPremium" (
    "PremiumId" integer NOT NULL,
    "PremiumUUID" character varying(36) NOT NULL,
    "LegacyID" integer,
    "Amount" numeric(18,2) NOT NULL,
    "Receipt" character varying(50) NOT NULL,
    "PayDate" "date" NOT NULL,
    "PayType" character varying(1) NOT NULL,
    "isPhotoFee" boolean,
    "isOffline" boolean,
    "ReportingId" integer,
    "ValidityFrom" timestamp with time zone NOT NULL,
    "ValidityTo" timestamp with time zone,
    "AuditUserID" integer NOT NULL,
    "PayerID" integer,
    "PolicyID" integer NOT NULL,
    "CreatedDate" date DEFAULT CURRENT_DATE NOT NULL,
    "RowID" "text",
    "Source" character varying(50) NULL,
    "SourceVersion" character varying(15) NULL
);


-- ALTER TABLE "public"."tblPremium" OWNER TO "postgres";

--
-- TOC entry 304 (class 1259 OID 21244)
-- Name: tblPremium_PremiumId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "public"."tblPremium_PremiumId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- ALTER TABLE "public"."tblPremium_PremiumId_seq" OWNER TO "postgres";

--
-- TOC entry 4023 (class 0 OID 0)
-- Dependencies: 304
-- Name: tblPremium_PremiumId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "public"."tblPremium_PremiumId_seq" OWNED BY "public"."tblPremium"."PremiumId";


--
-- TOC entry 253 (class 1259 OID 20651)
-- Name: tblProduct; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblProduct" (
    "ValidityFrom" timestamp with time zone NOT NULL,
    "ValidityTo" timestamp with time zone,
    "LegacyID" integer,
    "ProdID" integer NOT NULL,
    "ProdUUID" character varying(36) NOT NULL,
    "ProductCode" character varying(8) NOT NULL,
    "ProductName" character varying(100) NOT NULL,
    "DateFrom" timestamp with time zone NOT NULL,
    "DateTo" timestamp with time zone NOT NULL,
    "LumpSum" numeric(18,2) NOT NULL,
    "MemberCount" smallint NOT NULL,
    "PremiumAdult" numeric(18,2),
    "PremiumChild" numeric(18,2),
    "DedInsuree" numeric(18,2),
    "DedOPInsuree" numeric(18,2),
    "DedIPInsuree" numeric(18,2),
    "MaxInsuree" numeric(18,2),
    "MaxOPInsuree" numeric(18,2),
    "MaxIPInsuree" numeric(18,2),
    "PeriodRelPrices" character varying(1),
    "PeriodRelPricesOP" character varying(1),
    "PeriodRelPricesIP" character varying(1),
    "AccCodePremiums" character varying(25),
    "AccCodeRemuneration" character varying(25),
    "DedTreatment" numeric(18,2),
    "DedOPTreatment" numeric(18,2),
    "DedIPTreatment" numeric(18,2),
    "MaxTreatment" numeric(18,2),
    "MaxOPTreatment" numeric(18,2),
    "MaxIPTreatment" numeric(18,2),
    "DedPolicy" numeric(18,2),
    "DedOPPolicy" numeric(18,2),
    "DedIPPolicy" numeric(18,2),
    "MaxPolicy" numeric(18,2),
    "MaxOPPolicy" numeric(18,2),
    "MaxIPPolicy" numeric(18,2),
    "GracePeriod" integer NOT NULL,
    "AuditUserID" integer NOT NULL,
    "MaxNoConsultation" integer,
    "MaxNoSurgery" integer,
    "MaxNoDelivery" integer,
    "MaxNoHospitalizaion" integer,
    "MaxNoVisits" integer,
    "MaxAmountConsultation" numeric(18,2),
    "MaxAmountSurgery" numeric(18,2),
    "MaxAmountDelivery" numeric(18,2),
    "MaxAmountHospitalization" numeric(18,2),
    "GracePeriodRenewal" integer,
    "MaxInstallments" integer,
    "WaitingPeriod" integer,
    "Threshold" integer,
    "RenewalDiscountPerc" integer,
    "RenewalDiscountPeriod" integer,
    "MaxPolicyExtraMember" numeric(18,2),
    "MaxPolicyExtraMemberIP" numeric(18,2),
    "MaxPolicyExtraMemberOP" numeric(18,2),
    "MaxCeilingPolicy" numeric(18,2),
    "MaxCeilingPolicyIP" numeric(18,2),
    "MaxCeilingPolicyOP" numeric(18,2),
    "EnrolmentDiscountPerc" integer,
    "EnrolmentDiscountPeriod" integer,
    "MaxAmountAntenatal" numeric(18,2),
    "MaxNoAntenatal" integer,
    "CeilingInterpretation" character varying(1),
    "LocationId" integer,
    "AdministrationPeriod" integer,
    "ConversionProdID" integer,
    "GeneralAssemblyFee" numeric(18,2),
    "GeneralAssemblyLumpSum" numeric(18,2),
    "InsurancePeriod" smallint NOT NULL,
    "Level1" character varying(1),
    "Level2" character varying(1),
    "Level3" character varying(1),
    "Level4" character varying(1),
    "Sublevel1" character varying(1),
    "Sublevel2" character varying(1),
    "Sublevel3" character varying(1),
    "Sublevel4" character varying(1),
    "RegistrationFee" numeric(18,2),
    "RegistrationLumpSum" numeric(18,2),
    "RowID" "text",
    "ShareContribution" numeric(5,2),
    "StartCycle1" character varying(5),
    "StartCycle2" character varying(5),
    "StartCycle3" character varying(5),
    "StartCycle4" character varying(5),
    "WeightAdjustedAmount" numeric(5,2),
    "WeightInsuredPopulation" numeric(5,2),
    "WeightNumberFamilies" numeric(5,2),
    "WeightNumberInsuredFamilies" numeric(5,2),
    "WeightNumberVisits" numeric(5,2),
    "WeightPopulation" numeric(5,2),
    "Recurrence" smallint
);


-- ALTER TABLE "public"."tblProduct" OWNER TO "postgres";

--
-- TOC entry 255 (class 1259 OID 20661)
-- Name: tblProductItems; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblProductItems" (
    "ValidityFrom" timestamp with time zone NOT NULL,
    "ValidityTo" timestamp with time zone,
    "LegacyID" integer,
    "ProdItemID" integer NOT NULL,
    "LimitationType" character varying(1),
    "PriceOrigin" character varying(1),
    "LimitAdult" numeric(18,2),
    "LimitChild" numeric(18,2),
    "WaitingPeriodAdult" integer,
    "WaitingPeriodChild" integer,
    "LimitNoAdult" integer,
    "LimitNoChild" integer,
    "LimitationTypeR" character varying(1),
    "LimitationTypeE" character varying(1),
    "LimitAdultR" numeric(18,2),
    "LimitAdultE" numeric(18,2),
    "LimitChildR" numeric(18,2),
    "LimitChildE" numeric(18,2),
    "CeilingExclusionAdult" character varying(1),
    "CeilingExclusionChild" character varying(1),
    "AuditUserID" integer NOT NULL,
    "ItemID" integer NOT NULL,
    "ProdID" integer NOT NULL,
    "RowID" "text"
);


-- ALTER TABLE "public"."tblProductItems" OWNER TO "postgres";

--
-- TOC entry 254 (class 1259 OID 20659)
-- Name: tblProductItems_ProdItemID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "public"."tblProductItems_ProdItemID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- ALTER TABLE "public"."tblProductItems_ProdItemID_seq" OWNER TO "postgres";

--
-- TOC entry 4024 (class 0 OID 0)
-- Dependencies: 254
-- Name: tblProductItems_ProdItemID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "public"."tblProductItems_ProdItemID_seq" OWNED BY "public"."tblProductItems"."ProdItemID";


--
-- TOC entry 257 (class 1259 OID 20669)
-- Name: tblProductServices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblProductServices" (
    "ValidityFrom" timestamp with time zone NOT NULL,
    "ValidityTo" timestamp with time zone,
    "LegacyID" integer,
    "ProdServiceID" integer NOT NULL,
    "LimitationType" character varying(1) NOT NULL,
    "PriceOrigin" character varying(1) NOT NULL,
    "LimitAdult" numeric(18,2),
    "LimitChild" numeric(18,2),
    "WaitingPeriodAdult" integer,
    "WaitingPeriodChild" integer,
    "LimitNoAdult" integer,
    "LimitNoChild" integer,
    "LimitationTypeR" character varying(1),
    "LimitationTypeE" character varying(1),
    "LimitAdultR" numeric(18,2),
    "LimitAdultE" numeric(18,2),
    "LimitChildR" numeric(18,2),
    "LimitChildE" numeric(18,2),
    "CeilingExclusionAdult" character varying(1),
    "CeilingExclusionChild" character varying(1),
    "AuditUserID" integer NOT NULL,
    "ProdID" integer NOT NULL,
    "ServiceID" integer NOT NULL,
    "RowID" "text"
);


-- ALTER TABLE "public"."tblProductServices" OWNER TO "postgres";

--
-- TOC entry 256 (class 1259 OID 20667)
-- Name: tblProductServices_ProdServiceID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "public"."tblProductServices_ProdServiceID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- ALTER TABLE "public"."tblProductServices_ProdServiceID_seq" OWNER TO "postgres";

--
-- TOC entry 4025 (class 0 OID 0)
-- Dependencies: 256
-- Name: tblProductServices_ProdServiceID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "public"."tblProductServices_ProdServiceID_seq" OWNED BY "public"."tblProductServices"."ProdServiceID";


--
-- TOC entry 252 (class 1259 OID 20649)
-- Name: tblProduct_ProdID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "public"."tblProduct_ProdID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- ALTER TABLE "public"."tblProduct_ProdID_seq" OWNER TO "postgres";

--
-- TOC entry 4026 (class 0 OID 0)
-- Dependencies: 252
-- Name: tblProduct_ProdID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "public"."tblProduct_ProdID_seq" OWNED BY "public"."tblProduct"."ProdID";


--
-- TOC entry 270 (class 1259 OID 20770)
-- Name: tblProfessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblProfessions" (
    "ProfessionId" smallint NOT NULL,
    "Profession" character varying(50) NOT NULL,
    "SortOrder" integer,
    "AltLanguage" character varying(50)
);


-- ALTER TABLE "public"."tblProfessions" OWNER TO "postgres";

--
-- TOC entry 310 (class 1259 OID 21404)
-- Name: tblRegions; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW "public"."tblRegions" AS
 SELECT "tblLocations"."LocationId" AS "RegionId",
    "tblLocations"."LocationCode" AS "RegionCode",
    "tblLocations"."LocationName" AS "RegionName",
    "tblLocations"."ValidityFrom",
    "tblLocations"."ValidityTo",
    "tblLocations"."LegacyID",
    "tblLocations"."AuditUserId"
   FROM "public"."tblLocations"
  WHERE (("tblLocations"."ValidityTo" IS NULL) AND (("tblLocations"."LocationType")::"bpchar" = 'R'::"bpchar"));


-- ALTER TABLE "public"."tblRegions" OWNER TO "postgres";

--
-- TOC entry 285 (class 1259 OID 20937)
-- Name: tblRelDistr; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblRelDistr" (
    "DistrID" integer NOT NULL,
    "DistrType" smallint NOT NULL,
    "DistrCareType" character varying(1) NOT NULL,
    "Period" smallint NOT NULL,
    "DistrPerc" numeric(18,2),
    "ValidityFrom" timestamp with time zone NOT NULL,
    "ValidityTo" timestamp with time zone,
    "LegacyID" integer,
    "AuditUserID" integer NOT NULL,
    "ProdID" integer NOT NULL,
    "RowID" timestamp NULL
);


-- ALTER TABLE "public"."tblRelDistr" OWNER TO "postgres";

--
-- TOC entry 284 (class 1259 OID 20935)
-- Name: tblRelDistr_DistrID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "public"."tblRelDistr_DistrID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- ALTER TABLE "public"."tblRelDistr_DistrID_seq" OWNER TO "postgres";

--
-- TOC entry 4027 (class 0 OID 0)
-- Dependencies: 284
-- Name: tblRelDistr_DistrID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "public"."tblRelDistr_DistrID_seq" OWNED BY "public"."tblRelDistr"."DistrID";


--
-- TOC entry 287 (class 1259 OID 20945)
-- Name: tblRelIndex; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblRelIndex" (
    "ValidityFrom" timestamp with time zone NOT NULL,
    "ValidityTo" timestamp with time zone,
    "LegacyID" integer,
    "RelIndexID" integer NOT NULL,
    "RelType" smallint NOT NULL,
    "RelCareType" character varying(1) NOT NULL,
    "RelYear" integer NOT NULL,
    "RelPeriod" smallint NOT NULL,
    "CalcDate" timestamp with time zone NOT NULL,
    "RelIndex" numeric(18,4),
    "AuditUserID" integer NOT NULL,
    "LocationId" integer,
    "ProdID" integer NOT NULL
);


-- ALTER TABLE "public"."tblRelIndex" OWNER TO "postgres";

--
-- TOC entry 286 (class 1259 OID 20943)
-- Name: tblRelIndex_RelIndexID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "public"."tblRelIndex_RelIndexID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- ALTER TABLE "public"."tblRelIndex_RelIndexID_seq" OWNER TO "postgres";

--
-- TOC entry 4028 (class 0 OID 0)
-- Dependencies: 286
-- Name: tblRelIndex_RelIndexID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "public"."tblRelIndex_RelIndexID_seq" OWNED BY "public"."tblRelIndex"."RelIndexID";


--
-- TOC entry 271 (class 1259 OID 20775)
-- Name: tblRelations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblRelations" (
    "RelationId" smallint NOT NULL,
    "Relation" character varying(50) NOT NULL,
    "SortOrder" integer,
    "AltLanguage" character varying(50)
);


-- ALTER TABLE "public"."tblRelations" OWNER TO "postgres";

--
-- TOC entry 349 (class 1259 OID 25482)
-- Name: tblReporting; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblReporting" (
    "ReportingId" integer NOT NULL,
    "ReportingDate" timestamp with time zone NOT NULL,
    "LocationId" integer NOT NULL,
    "ProdId" integer NOT NULL,
    "PayerId" integer,
    "StartDate" "date" NOT NULL,
    "EndDate" "date" NOT NULL,
    "RecordFound" integer NOT NULL,
    "OfficerID" integer,
    "ReportType" integer,
    "ReportMode" integer,
    "CommissionRate" numeric(18,2),
    "Scope" integer
);


-- ALTER TABLE "public"."tblReporting" OWNER TO "postgres";

--
-- TOC entry 224 (class 1259 OID 20358)
-- Name: tblRole; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblRole" (
    "ValidityFrom" timestamp with time zone NOT NULL,
    "ValidityTo" timestamp with time zone,
    "LegacyID" integer,
    "RoleID" integer NOT NULL,
    "RoleUUID" character varying(36) NOT NULL,
    "RoleName" character varying(50) NOT NULL,
    "AltLanguage" character varying(50),
    "IsSystem" integer NOT NULL,
    "IsBlocked" boolean NOT NULL,
    "AuditUserID" integer
);


-- ALTER TABLE "public"."tblRole" OWNER TO "postgres";

--
-- TOC entry 226 (class 1259 OID 20366)
-- Name: tblRoleRight; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblRoleRight" (
    "ValidityFrom" timestamp with time zone NOT NULL,
    "ValidityTo" timestamp with time zone,
    "LegacyID" integer,
    "RoleRightID" integer NOT NULL,
    "RightID" integer NOT NULL,
    "AuditUserId" integer,
    "RoleID" integer NOT NULL
);


-- ALTER TABLE "public"."tblRoleRight" OWNER TO "postgres";

--
-- TOC entry 225 (class 1259 OID 20364)
-- Name: tblRoleRight_RoleRightID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "public"."tblRoleRight_RoleRightID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- ALTER TABLE "public"."tblRoleRight_RoleRightID_seq" OWNER TO "postgres";

--
-- TOC entry 4029 (class 0 OID 0)
-- Dependencies: 225
-- Name: tblRoleRight_RoleRightID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "public"."tblRoleRight_RoleRightID_seq" OWNED BY "public"."tblRoleRight"."RoleRightID";


--
-- TOC entry 223 (class 1259 OID 20356)
-- Name: tblRole_RoleID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "public"."tblRole_RoleID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- ALTER TABLE "public"."tblRole_RoleID_seq" OWNER TO "postgres";

--
-- TOC entry 4030 (class 0 OID 0)
-- Dependencies: 223
-- Name: tblRole_RoleID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "public"."tblRole_RoleID_seq" OWNED BY "public"."tblRole"."RoleID";


--
-- TOC entry 239 (class 1259 OID 20525)
-- Name: tblServices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblServices" (
    "ServiceID" integer NOT NULL,
    "ServiceUUID" character varying(36) NOT NULL,
    "LegacyID" integer,
    "ServCategory" character varying(1),
    "ServCode" character varying(6) NOT NULL,
    "ServName" character varying(100) NOT NULL,
    "ServType" character varying(1) NOT NULL,
    "ServLevel" character varying(1) NOT NULL,
    "ServPrice" numeric(18,2) NOT NULL,
    "ServCareType" character varying(1) NOT NULL,
    "ServFrequency" smallint,
    "ServPatCat" smallint NOT NULL,
    "ValidityFrom" timestamp with time zone,
    "ValidityTo" timestamp with time zone,
    "AuditUserID" integer,
    "RowID" "bytea"
);


-- ALTER TABLE "public"."tblServices" OWNER TO "postgres";

--
-- TOC entry 238 (class 1259 OID 20523)
-- Name: tblServices_ServiceID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "public"."tblServices_ServiceID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- ALTER TABLE "public"."tblServices_ServiceID_seq" OWNER TO "postgres";

--
-- TOC entry 4031 (class 0 OID 0)
-- Dependencies: 238
-- Name: tblServices_ServiceID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "public"."tblServices_ServiceID_seq" OWNED BY "public"."tblServices"."ServiceID";


--
-- TOC entry 350 (class 1259 OID 25487)
-- Name: tblSubmittedPhotos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblSubmittedPhotos" (
    "PhotoId" integer NOT NULL,
    "ImageName" character varying(50),
    "CHFID" character varying(12),
    "OfficerCode" character varying(8),
    "PhotoDate" "date",
    "RegisterDate" timestamp with time zone
);


-- ALTER TABLE "public"."tblSubmittedPhotos" OWNER TO "postgres";

--
-- TOC entry 229 (class 1259 OID 20384)
-- Name: tblUserRole; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblUserRole" (
    "ValidityFrom" timestamp with time zone NOT NULL,
    "ValidityTo" timestamp with time zone,
    "LegacyID" integer,
    "UserRoleID" integer NOT NULL,
    "AudituserID" integer,
    "RoleID" integer NOT NULL,
    "UserID" integer NOT NULL,
    "Assign" integer NULL
);


-- ALTER TABLE "public"."tblUserRole" OWNER TO "postgres";

--
-- TOC entry 228 (class 1259 OID 20382)
-- Name: tblUserRole_UserRoleID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "public"."tblUserRole_UserRoleID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- ALTER TABLE "public"."tblUserRole_UserRoleID_seq" OWNER TO "postgres";

--
-- TOC entry 4032 (class 0 OID 0)
-- Dependencies: 228
-- Name: tblUserRole_UserRoleID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "public"."tblUserRole_UserRoleID_seq" OWNED BY "public"."tblUserRole"."UserRoleID";


--
-- TOC entry 217 (class 1259 OID 20314)
-- Name: tblUsers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblUsers" (
    "AuditUserID" integer NOT NULL,
    "DummyPwd" character varying(25),
    "EmailId" character varying(200),
    "HFID" integer,
    "IsAssociated" boolean,
    "LanguageID" character varying(5) NOT NULL,
    "LastName" character varying(100) NOT NULL,
    "LegacyID" integer,
    "LoginName" character varying(25) NOT NULL,
    "OtherNames" character varying(100) NOT NULL,
    "PasswordValidity" timestamp with time zone,
    "Phone" character varying(50),
    "PrivateKey" character varying(256),
    "StoredPassword" character varying(256),
    "RoleID" integer,
    "UserID" integer NOT NULL,
    "UserUUID" character varying(36) NOT NULL,
    "ValidityFrom" timestamp with time zone NOT NULL,
    "ValidityTo" timestamp with time zone,
    "password" "bytea"
);

INSERT INTO "public"."tblUsers" ("UserID", "LanguageID", "LastName", "OtherNames", "Phone", "LoginName", "RoleID", "HFID", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserID", "password", "DummyPwd", "EmailId", "StoredPassword", "PrivateKey", "PasswordValidity", "IsAssociated", "UserUUID") VALUES (1, N'en', N'Admin', N'Admin', N'', N'Admin', 1023, NULL, CAST(N'2018-03-19T08:54:48.923' AS timestamptz), NULL, NULL, 2, 'x001699E55A06FA79F4CA0D06EF15096C02000000DF691E2CE66AA7ABDF65B3E6210C1C04CAAE1A3B1FEE5E266B5FAF4F7D4E95109C92E3205F0145CC'::bytea, NULL, N'test@testing.com', N'59E66831C680C19E8736751D5480A7C3291BD8775DF47C19C4D0361FBC1C3438', N'C1C224B03CD9BC7B6A86D77F5DACE40191766C485CD55DC48CAF9AC873335D6F', NULL, NULL, N'281953c0-1c1a-4cf8-b93c-8e8b33c617c2');

-- ALTER TABLE "public"."tblUsers" OWNER TO "postgres";

--
-- TOC entry 251 (class 1259 OID 20585)
-- Name: tblUsersDistricts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."tblUsersDistricts" (
    "UserDistrictID" integer NOT NULL,
    "LegacyID" integer,
    "ValidityFrom" timestamp with time zone NOT NULL,
    "ValidityTo" timestamp with time zone,
    "AuditUserID" integer NOT NULL,
    "LocationId" integer NOT NULL,
    "UserID" integer NOT NULL
);


-- ALTER TABLE "public"."tblUsersDistricts" OWNER TO "postgres";

--
-- TOC entry 250 (class 1259 OID 20583)
-- Name: tblUsersDistricts_UserDistrictID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "public"."tblUsersDistricts_UserDistrictID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- ALTER TABLE "public"."tblUsersDistricts_UserDistrictID_seq" OWNER TO "postgres";

--
-- TOC entry 4033 (class 0 OID 0)
-- Dependencies: 250
-- Name: tblUsersDistricts_UserDistrictID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "public"."tblUsersDistricts_UserDistrictID_seq" OWNED BY "public"."tblUsersDistricts"."UserDistrictID";


--
-- TOC entry 216 (class 1259 OID 20312)
-- Name: tblUsers_UserID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "public"."tblUsers_UserID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- ALTER TABLE "public"."tblUsers_UserID_seq" OWNER TO "postgres";

--
-- TOC entry 4034 (class 0 OID 0)
-- Dependencies: 216
-- Name: tblUsers_UserID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "public"."tblUsers_UserID_seq" OWNED BY "public"."tblUsers"."UserID";


--
-- TOC entry 319 (class 1259 OID 21562)
-- Name: tblVillages; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW "public"."tblVillages" AS
 SELECT "tblLocations"."LocationId" AS "VillageId",
    "tblLocations"."ParentLocationId" AS "WardId",
    "tblLocations"."LocationCode" AS "VillageCode",
    "tblLocations"."LocationName" AS "VillageName",
    "tblLocations"."MalePopulation",
    "tblLocations"."FemalePopulation",
    "tblLocations"."OtherPopulation",
    "tblLocations"."Families",
    "tblLocations"."ValidityFrom",
    "tblLocations"."ValidityTo",
    "tblLocations"."LegacyID",
    "tblLocations"."AuditUserId"
   FROM "public"."tblLocations"
  WHERE (("tblLocations"."ValidityTo" IS NULL) AND (("tblLocations"."LocationType")::"bpchar" = 'V'::"bpchar"));


-- ALTER TABLE "public"."tblVillages" OWNER TO "postgres";

--
-- TOC entry 320 (class 1259 OID 21606)
-- Name: tblWards; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW "public"."tblWards" AS
 SELECT "tblLocations"."LocationId" AS "WardId",
    "tblLocations"."ParentLocationId" AS "DistrictId",
    "tblLocations"."LocationCode" AS "WardCode",
    "tblLocations"."LocationName" AS "WardName",
    "tblLocations"."ValidityFrom",
    "tblLocations"."ValidityTo",
    "tblLocations"."LegacyID",
    "tblLocations"."AuditUserId"
   FROM "public"."tblLocations"
  WHERE (("tblLocations"."ValidityTo" IS NULL) AND (("tblLocations"."LocationType")::"bpchar" = 'W'::"bpchar"));


-- ALTER TABLE "public"."tblWards" OWNER TO "postgres";

--
-- TOC entry 338 (class 1259 OID 21724)
-- Name: uvwAmountApproved; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW "public"."uvwAmountApproved" AS
 SELECT "sum"("Details"."Approved") AS "AmountApproved",
    "public"."month"(COALESCE("C"."DateTo", "C"."DateFrom")) AS "monthtime",
    "public"."quarter"(COALESCE("C"."DateTo", "C"."DateFrom")) AS "quartertime",
    "public"."year"(COALESCE("C"."DateTo", "C"."DateFrom")) AS "yeartime",
    "HF"."HFLevel",
    "HF"."HFCode",
    "HF"."HFName",
    "HFR"."RegionName" AS "Region",
    "HFD"."DistrictName",
    "Prod"."ProductCode",
    "Prod"."ProductName",
    "HFD"."DistrictName" AS "HFDistrict",
    "HFR"."RegionName" AS "HFRegion"
   FROM ((((("public"."tblClaim" "C"
     LEFT JOIN ( SELECT "tblClaimItems"."ClaimID",
            "tblClaimItems"."ProdID",
            "sum"("tblClaimItems"."PriceValuated") AS "Approved"
           FROM "public"."tblClaimItems"
          WHERE ("tblClaimItems"."ValidityTo" IS NULL)
          GROUP BY "tblClaimItems"."ClaimID", "tblClaimItems"."ProdID"
        UNION ALL
         SELECT "tblClaimServices"."ClaimID",
            "tblClaimServices"."ProdID",
            "sum"("tblClaimServices"."PriceValuated") AS "Approved"
           FROM "public"."tblClaimServices"
          WHERE ("tblClaimServices"."ValidityTo" IS NULL)
          GROUP BY "tblClaimServices"."ClaimID", "tblClaimServices"."ProdID") "Details" ON (("C"."ClaimID" = "Details"."ClaimID")))
     LEFT JOIN "public"."tblProduct" "Prod" ON (("Details"."ProdID" = "Prod"."ProdID")))
     LEFT JOIN "public"."tblHF" "HF" ON (("C"."HFID" = "HF"."HfID")))
     LEFT JOIN "public"."tblDistricts" "HFD" ON (("HF"."LocationId" = "HFD"."DistrictId")))
     LEFT JOIN "public"."tblRegions" "HFR" ON (("HFR"."RegionId" = "HFD"."Region")))
  WHERE (("C"."ValidityTo" IS NULL) AND ("C"."ClaimStatus" >= 8))
  GROUP BY ("public"."month"(COALESCE("C"."DateTo", "C"."DateFrom"))), ("public"."quarter"(COALESCE("C"."DateTo", "C"."DateFrom"))), ("public"."year"(COALESCE("C"."DateTo", "C"."DateFrom"))), "HF"."HFLevel", "HF"."HFCode", "HF"."HFName", "Prod"."ProductCode", "Prod"."ProductName", "HFD"."DistrictName", "HFR"."RegionName";


-- ALTER TABLE "public"."uvwAmountApproved" OWNER TO "postgres";

--
-- TOC entry 340 (class 1259 OID 21738)
-- Name: uvwAmountClaimed; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW "public"."uvwAmountClaimed" AS
 SELECT "sum"("Details"."Claimed") AS "AmountClaimed",
    "public"."month"(COALESCE("C"."DateTo", "C"."DateFrom")) AS "monthtime",
    "public"."quarter"(COALESCE("C"."DateTo", "C"."DateFrom")) AS "quartertime",
    "public"."year"(COALESCE("C"."DateTo", "C"."DateFrom")) AS "yeartime",
    "HF"."HFLevel",
    "HF"."HFCode",
    "HF"."HFName",
    "HFR"."RegionName" AS "Region",
    "HFD"."DistrictName",
    "Prod"."ProductCode",
    "Prod"."ProductName",
    "HFD"."DistrictName" AS "HFDistrict",
    "HFR"."RegionName" AS "HFRegion"
   FROM ((((("public"."tblClaim" "C"
     LEFT JOIN ( SELECT "tblClaimItems"."ClaimID",
            "tblClaimItems"."ProdID",
            "sum"(("tblClaimItems"."QtyProvided" * "tblClaimItems"."PriceAsked")) AS "Claimed"
           FROM "public"."tblClaimItems"
          WHERE ("tblClaimItems"."ValidityTo" IS NULL)
          GROUP BY "tblClaimItems"."ClaimID", "tblClaimItems"."ProdID"
        UNION ALL
         SELECT "tblClaimServices"."ClaimID",
            "tblClaimServices"."ProdID",
            "sum"(("tblClaimServices"."QtyProvided" * "tblClaimServices"."PriceAsked")) AS "Claimed"
           FROM "public"."tblClaimServices"
          WHERE ("tblClaimServices"."ValidityTo" IS NULL)
          GROUP BY "tblClaimServices"."ClaimID", "tblClaimServices"."ProdID") "Details" ON (("C"."ClaimID" = "Details"."ClaimID")))
     LEFT JOIN "public"."tblProduct" "Prod" ON (("Details"."ProdID" = "Prod"."ProdID")))
     LEFT JOIN "public"."tblHF" "HF" ON (("C"."HFID" = "HF"."HfID")))
     LEFT JOIN "public"."tblDistricts" "HFD" ON (("HF"."LocationId" = "HFD"."DistrictId")))
     LEFT JOIN "public"."tblRegions" "HFR" ON (("HFR"."RegionId" = "HFD"."Region")))
  WHERE (("C"."ValidityTo" IS NULL) AND ("C"."ClaimStatus" <> 2))
  GROUP BY ("public"."month"(COALESCE("C"."DateTo", "C"."DateFrom"))), ("public"."quarter"(COALESCE("C"."DateTo", "C"."DateFrom"))), ("public"."year"(COALESCE("C"."DateTo", "C"."DateFrom"))), "HF"."HFLevel", "HF"."HFCode", "HF"."HFName", "Prod"."ProductCode", "Prod"."ProductName", "HFD"."DistrictName", "HFR"."RegionName";


-- ALTER TABLE "public"."uvwAmountClaimed" OWNER TO "postgres";

--
-- TOC entry 312 (class 1259 OID 21434)
-- Name: uvwAmountRejected; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW "public"."uvwAmountRejected" AS
 SELECT "sum"("Details"."Rejected") AS "amountrejected",
    "public"."month"(COALESCE("C"."DateTo", "C"."DateFrom")) AS "monthtime",
    "public"."quarter"(COALESCE("C"."DateTo", "C"."DateFrom")) AS "quartertime",
    "public"."year"(COALESCE("C"."DateTo", "C"."DateFrom")) AS "yeartime",
    "HF"."HFLevel",
    "HF"."HFCode",
    "HF"."HFName",
    "HFR"."RegionName" AS "Region",
    "HFD"."DistrictName",
    "Prod"."ProductCode",
    "Prod"."ProductName",
    "HFD"."DistrictName" AS "HFDistrict",
    "HFR"."RegionName" AS "HFRegion"
   FROM ((((("public"."tblClaim" "C"
     LEFT JOIN ( SELECT "tblClaimItems"."ClaimID",
            "tblClaimItems"."ProdID",
            "sum"(("tblClaimItems"."QtyProvided" * "tblClaimItems"."PriceAsked")) AS "Rejected"
           FROM "public"."tblClaimItems"
          WHERE ("tblClaimItems"."ValidityTo" IS NULL)
          GROUP BY "tblClaimItems"."ClaimID", "tblClaimItems"."ProdID"
        UNION ALL
         SELECT "tblClaimServices"."ClaimID",
            "tblClaimServices"."ProdID",
            "sum"(("tblClaimServices"."QtyProvided" * "tblClaimServices"."PriceAsked")) AS "Rejected"
           FROM "public"."tblClaimServices"
          WHERE ("tblClaimServices"."ValidityTo" IS NULL)
          GROUP BY "tblClaimServices"."ClaimID", "tblClaimServices"."ProdID") "Details" ON (("C"."ClaimID" = "Details"."ClaimID")))
     LEFT JOIN "public"."tblProduct" "Prod" ON (("Details"."ProdID" = "Prod"."ProdID")))
     LEFT JOIN "public"."tblHF" "HF" ON (("C"."HFID" = "HF"."HfID")))
     LEFT JOIN "public"."tblDistricts" "HFD" ON (("HF"."LocationId" = "HFD"."DistrictId")))
     LEFT JOIN "public"."tblRegions" "HFR" ON (("HFR"."RegionId" = "HFD"."Region")))
  WHERE (("C"."ValidityTo" IS NULL) AND ("Prod"."ValidityTo" IS NULL) AND ("HF"."ValidityTo" IS NULL) AND ("HFD"."ValidityTo" IS NULL) AND ("C"."ClaimStatus" = 1))
  GROUP BY ("public"."month"(COALESCE("C"."DateTo", "C"."DateFrom"))), ("public"."quarter"(COALESCE("C"."DateTo", "C"."DateFrom"))), ("public"."year"(COALESCE("C"."DateTo", "C"."DateFrom"))), "HF"."HFLevel", "HF"."HFCode", "HF"."HFName", "Prod"."ProductCode", "Prod"."ProductName", "HFD"."DistrictName", "HFR"."RegionName";


-- ALTER TABLE "public"."uvwAmountRejected" OWNER TO "postgres";

--
-- TOC entry 342 (class 1259 OID 21748)
-- Name: uvwAmountValuated; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW "public"."uvwAmountValuated" AS
 SELECT "sum"("Details"."Valuated") AS "AmountValuated",
    "public"."month"(COALESCE("C"."DateTo", "C"."DateFrom")) AS "monthtime",
    "public"."quarter"(COALESCE("C"."DateTo", "C"."DateFrom")) AS "quartertime",
    "public"."year"(COALESCE("C"."DateTo", "C"."DateFrom")) AS "yeartime",
    "HF"."HFLevel",
    "HF"."HFCode",
    "HF"."HFName",
    "HFR"."RegionName" AS "Region",
    "HFD"."DistrictName",
    "Prod"."ProductCode",
    "Prod"."ProductName",
    "HFD"."DistrictName" AS "HFDistrict",
    "HFR"."RegionName" AS "HFRegion"
   FROM ((((("public"."tblClaim" "C"
     LEFT JOIN ( SELECT "tblClaimItems"."ClaimID",
            "tblClaimItems"."ProdID",
            "sum"("tblClaimItems"."RemuneratedAmount") AS "Valuated"
           FROM "public"."tblClaimItems"
          WHERE ("tblClaimItems"."ValidityTo" IS NULL)
          GROUP BY "tblClaimItems"."ClaimID", "tblClaimItems"."ProdID"
        UNION ALL
         SELECT "tblClaimServices"."ClaimID",
            "tblClaimServices"."ProdID",
            "sum"("tblClaimServices"."RemuneratedAmount") AS "Valuated"
           FROM "public"."tblClaimServices"
          WHERE ("tblClaimServices"."ValidityTo" IS NULL)
          GROUP BY "tblClaimServices"."ClaimID", "tblClaimServices"."ProdID") "Details" ON (("C"."ClaimID" = "Details"."ClaimID")))
     LEFT JOIN "public"."tblProduct" "Prod" ON (("Details"."ProdID" = "Prod"."ProdID")))
     LEFT JOIN "public"."tblHF" "HF" ON (("C"."HFID" = "HF"."HfID")))
     LEFT JOIN "public"."tblDistricts" "HFD" ON (("HF"."LocationId" = "HFD"."DistrictId")))
     LEFT JOIN "public"."tblRegions" "HFR" ON (("HFD"."Region" = "HFR"."RegionId")))
  WHERE (("C"."ValidityTo" IS NULL) AND ("C"."ClaimStatus" = 16))
  GROUP BY ("public"."month"(COALESCE("C"."DateTo", "C"."DateFrom"))), ("public"."quarter"(COALESCE("C"."DateTo", "C"."DateFrom"))), ("public"."year"(COALESCE("C"."DateTo", "C"."DateFrom"))), "HF"."HFLevel", "HF"."HFCode", "HF"."HFName", "Prod"."ProductCode", "Prod"."ProductName", "HFD"."DistrictName", "HFR"."RegionName";


-- ALTER TABLE "public"."uvwAmountValuated" OWNER TO "postgres";

--
-- TOC entry 313 (class 1259 OID 21444)
-- Name: uvwClaimEntered; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW "public"."uvwClaimEntered" AS
 SELECT "count"(1) AS "TotalClaimEntered",
    "public"."month"(COALESCE("C"."DateTo", "C"."DateFrom")) AS "monthtime",
    "public"."quarter"(COALESCE("C"."DateTo", "C"."DateFrom")) AS "quartertime",
    "public"."year"(COALESCE("C"."DateTo", "C"."DateFrom")) AS "yeartime",
    "HF"."HFLevel",
    "HF"."HFCode",
    "HF"."HFName",
    "HFD"."DistrictName" AS "HFDistrict",
    "HFR"."RegionName" AS "HFRegion"
   FROM ((("public"."tblClaim" "C"
     LEFT JOIN "public"."tblHF" "HF" ON (("C"."HFID" = "HF"."HfID")))
     LEFT JOIN "public"."tblDistricts" "HFD" ON (("HF"."LocationId" = "HFD"."DistrictId")))
     JOIN "public"."tblRegions" "HFR" ON (("HFD"."Region" = "HFR"."RegionId")))
  WHERE ("C"."ValidityTo" IS NULL)
  GROUP BY ("public"."month"(COALESCE("C"."DateTo", "C"."DateFrom"))), ("public"."quarter"(COALESCE("C"."DateTo", "C"."DateFrom"))), ("public"."year"(COALESCE("C"."DateTo", "C"."DateFrom"))), "HF"."HFLevel", "HF"."HFCode", "HF"."HFName", "HFD"."DistrictName", "HFR"."RegionName";


-- ALTER TABLE "public"."uvwClaimEntered" OWNER TO "postgres";

--
-- TOC entry 314 (class 1259 OID 21449)
-- Name: uvwClaimProcessed; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW "public"."uvwClaimProcessed" AS
 SELECT "count"(1) AS "totalclaimprocessed",
    "public"."month"(COALESCE("C"."DateTo", "C"."DateFrom")) AS "monthtime",
    "public"."quarter"(COALESCE("C"."DateTo", "C"."DateFrom")) AS "quartertime",
    "public"."year"(COALESCE("C"."DateTo", "C"."DateFrom")) AS "yeartime",
    "HF"."HFLevel",
    "HF"."HFCode",
    "HF"."HFName",
    "HFD"."DistrictName" AS "HFDistrict",
    "HFD"."DistrictName",
    "Prod"."ProductCode",
    "Prod"."ProductName",
    "HFR"."RegionName" AS "Region",
    "HFR"."RegionName" AS "HFRegion"
   FROM ((((("public"."tblClaim" "C"
     LEFT JOIN ( SELECT "tblClaimItems"."ClaimID",
            "tblClaimItems"."ProdID"
           FROM "public"."tblClaimItems"
          WHERE (("tblClaimItems"."ValidityTo" IS NULL) AND ("tblClaimItems"."ProdID" IS NOT NULL))
          GROUP BY "tblClaimItems"."ClaimID", "tblClaimItems"."ProdID"
        UNION
         SELECT "tblClaimServices"."ClaimID",
            "tblClaimServices"."ProdID"
           FROM "public"."tblClaimServices"
          WHERE (("tblClaimServices"."ValidityTo" IS NULL) AND ("tblClaimServices"."ProdID" IS NOT NULL))
          GROUP BY "tblClaimServices"."ClaimID", "tblClaimServices"."ProdID") "Details" ON (("C"."ClaimID" = "Details"."ClaimID")))
     LEFT JOIN "public"."tblHF" "HF" ON (("C"."HFID" = "HF"."HfID")))
     LEFT JOIN "public"."tblDistricts" "HFD" ON (("HF"."LocationId" = "HFD"."DistrictId")))
     LEFT JOIN "public"."tblProduct" "Prod" ON (("Details"."ProdID" = "Prod"."ProdID")))
     LEFT JOIN "public"."tblRegions" "HFR" ON (("HFD"."Region" = "HFR"."RegionId")))
  WHERE (("C"."ValidityTo" IS NULL) AND ("C"."ClaimStatus" >= 8))
  GROUP BY ("public"."month"(COALESCE("C"."DateTo", "C"."DateFrom"))), ("public"."quarter"(COALESCE("C"."DateTo", "C"."DateFrom"))), ("public"."year"(COALESCE("C"."DateTo", "C"."DateFrom"))), "HF"."HFLevel", "HF"."HFCode", "HF"."HFName", "HFD"."DistrictName", "Prod"."ProductCode", "Prod"."ProductName", "HFR"."RegionName";


-- ALTER TABLE "public"."uvwClaimProcessed" OWNER TO "postgres";

--
-- TOC entry 315 (class 1259 OID 21454)
-- Name: uvwClaimRejected; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW "public"."uvwClaimRejected" AS
 SELECT "count"(1) AS "TotalClaimRejected",
    "public"."month"(COALESCE("C"."DateTo", "C"."DateFrom")) AS "monthtime",
    "public"."quarter"(COALESCE("C"."DateTo", "C"."DateFrom")) AS "quartertime",
    "public"."year"(COALESCE("C"."DateTo", "C"."DateFrom")) AS "yeartime",
    "HF"."HFLevel",
    "HF"."HFCode",
    "HF"."HFName",
    "HFD"."DistrictName" AS "HFDistrict",
    "HFR"."RegionName" AS "HFRegion"
   FROM ((("public"."tblClaim" "C"
     LEFT JOIN "public"."tblHF" "HF" ON (("C"."HFID" = "HF"."HfID")))
     LEFT JOIN "public"."tblDistricts" "HFD" ON (("HF"."LocationId" = "HFD"."DistrictId")))
     JOIN "public"."tblRegions" "HFR" ON (("HFD"."Region" = "HFR"."RegionId")))
  WHERE (("C"."ValidityTo" IS NULL) AND ("C"."ClaimStatus" = 1))
  GROUP BY ("public"."month"(COALESCE("C"."DateTo", "C"."DateFrom"))), ("public"."quarter"(COALESCE("C"."DateTo", "C"."DateFrom"))), ("public"."year"(COALESCE("C"."DateTo", "C"."DateFrom"))), "HF"."HFLevel", "HF"."HFCode", "HF"."HFName", "HFD"."DistrictName", "HFR"."RegionName";


-- ALTER TABLE "public"."uvwClaimRejected" OWNER TO "postgres";

--
-- TOC entry 316 (class 1259 OID 21459)
-- Name: uvwClaimSent; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW "public"."uvwClaimSent" AS
 SELECT "count"("C"."ClaimID") AS "claimsent",
    "public"."month"("C"."DateClaimed") AS "monthtime",
    "public"."quarter"("C"."DateClaimed") AS "quartertime",
    "public"."year"("C"."DateClaimed") AS "yeartime",
    "HF"."HFLevel",
    "HF"."HFCode",
    "HF"."HFName",
    "HFR"."RegionName" AS "region",
    "HFD"."DistrictName",
    "Prod"."ProductCode",
    "Prod"."ProductName",
    "HFD"."DistrictName" AS "HFDistrict",
    "HFR"."RegionName" AS "HFRegion"
   FROM ((((("public"."tblClaim" "C"
     JOIN ( SELECT "tblClaimItems"."ClaimID",
            "tblClaimItems"."ProdID"
           FROM "public"."tblClaimItems"
          WHERE ("tblClaimItems"."ValidityTo" IS NULL)
        UNION
         SELECT "tblClaimServices"."ClaimID",
            "tblClaimServices"."ProdID"
           FROM "public"."tblClaimServices"
          WHERE ("tblClaimServices"."ValidityTo" IS NULL)) "Details" ON (("C"."ClaimID" = "Details"."ClaimID")))
     JOIN "public"."tblProduct" "Prod" ON (("Details"."ProdID" = "Prod"."ProdID")))
     JOIN "public"."tblHF" "HF" ON (("C"."HFID" = "HF"."HfID")))
     JOIN "public"."tblDistricts" "HFD" ON (("HF"."LocationId" = "HFD"."DistrictId")))
     JOIN "public"."tblRegions" "HFR" ON (("HFR"."RegionId" = "HFD"."Region")))
  WHERE (("C"."ValidityTo" IS NULL) AND ("Prod"."ValidityTo" IS NULL) AND ("HF"."ValidityTo" IS NULL) AND ("HFD"."ValidityTo" IS NULL) AND ("C"."ClaimStatus" > 2))
  GROUP BY ("public"."month"("C"."DateClaimed")), ("public"."quarter"("C"."DateClaimed")), ("public"."year"("C"."DateClaimed")), "HF"."HFLevel", "HF"."HFCode", "HF"."HFName", "Prod"."ProductCode", "Prod"."ProductName", "HFD"."DistrictName", "HFR"."RegionName";


-- ALTER TABLE "public"."uvwClaimSent" OWNER TO "postgres";

--
-- TOC entry 317 (class 1259 OID 21529)
-- Name: uvwClaimSubmitted; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW "public"."uvwClaimSubmitted" AS
 SELECT "count"(1) AS "totalclaimsubmitted",
    "public"."month"(COALESCE("C"."DateTo", "C"."DateFrom")) AS "monthtime",
    "public"."quarter"(COALESCE("C"."DateTo", "C"."DateFrom")) AS "quartertime",
    "public"."year"(COALESCE("C"."DateTo", "C"."DateFrom")) AS "yeartime",
    "HF"."HFLevel",
    "HF"."HFCode",
    "HF"."HFName",
    "HFD"."DistrictName" AS "HFDistrict",
    "HFR"."RegionName" AS "HFRegion"
   FROM ((("public"."tblClaim" "C"
     LEFT JOIN "public"."tblHF" "HF" ON (("C"."HFID" = "HF"."HfID")))
     LEFT JOIN "public"."tblDistricts" "HFD" ON (("HF"."LocationId" = "HFD"."DistrictId")))
     JOIN "public"."tblRegions" "HFR" ON (("HFR"."RegionId" = "HFD"."Region")))
  WHERE (("C"."ValidityTo" IS NULL) AND (("C"."ClaimStatus" >= 4) OR ("C"."ClaimStatus" = 1)))
  GROUP BY ("public"."month"(COALESCE("C"."DateTo", "C"."DateFrom"))), ("public"."quarter"(COALESCE("C"."DateTo", "C"."DateFrom"))), ("public"."year"(COALESCE("C"."DateTo", "C"."DateFrom"))), "HF"."HFLevel", "HF"."HFCode", "HF"."HFName", "HFD"."DistrictName", "HFR"."RegionName";


-- ALTER TABLE "public"."uvwClaimSubmitted" OWNER TO "postgres";

--
-- TOC entry 318 (class 1259 OID 21534)
-- Name: uvwClaimValuated; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW "public"."uvwClaimValuated" AS
 SELECT "count"(1) AS "TotalClaimValuated",
    "public"."month"(COALESCE("C"."DateTo", "C"."DateFrom")) AS "monthtime",
    "public"."quarter"(COALESCE("C"."DateTo", "C"."DateFrom")) AS "quartertime",
    "public"."year"(COALESCE("C"."DateTo", "C"."DateFrom")) AS "yeartime",
    "HF"."HFLevel",
    "HF"."HFCode",
    "HF"."HFName",
    "HFD"."DistrictName" AS "HFDistrict",
    "HFD"."DistrictName",
    "Prod"."ProductCode",
    "Prod"."ProductName",
    "HFR"."RegionName" AS "region",
    "HFR"."RegionName" AS "HFRegion"
   FROM ((((("public"."tblClaim" "C"
     LEFT JOIN ( SELECT "tblClaimItems"."ClaimID",
            "tblClaimItems"."ProdID"
           FROM "public"."tblClaimItems"
          WHERE (("tblClaimItems"."ValidityTo" IS NULL) AND ("tblClaimItems"."ProdID" IS NOT NULL))
          GROUP BY "tblClaimItems"."ClaimID", "tblClaimItems"."ProdID"
        UNION
         SELECT "tblClaimServices"."ClaimID",
            "tblClaimServices"."ProdID"
           FROM "public"."tblClaimServices"
          WHERE (("tblClaimServices"."ValidityTo" IS NULL) AND ("tblClaimServices"."ProdID" IS NOT NULL))
          GROUP BY "tblClaimServices"."ClaimID", "tblClaimServices"."ProdID") "Details" ON (("C"."ClaimID" = "Details"."ClaimID")))
     LEFT JOIN "public"."tblHF" "HF" ON (("C"."HFID" = "HF"."HfID")))
     LEFT JOIN "public"."tblDistricts" "HFD" ON (("HF"."LocationId" = "HFD"."DistrictId")))
     LEFT JOIN "public"."tblProduct" "Prod" ON (("Details"."ProdID" = "Prod"."ProdID")))
     LEFT JOIN "public"."tblRegions" "HFR" ON (("HFD"."Region" = "HFR"."RegionId")))
  WHERE (("C"."ValidityTo" IS NULL) AND ("C"."ClaimStatus" = 16))
  GROUP BY ("public"."month"(COALESCE("C"."DateTo", "C"."DateFrom"))), ("public"."quarter"(COALESCE("C"."DateTo", "C"."DateFrom"))), ("public"."year"(COALESCE("C"."DateTo", "C"."DateFrom"))), "HF"."HFLevel", "HF"."HFCode", "HF"."HFName", "HFD"."DistrictName", "Prod"."ProductCode", "Prod"."ProductName", "HFR"."RegionName";


-- ALTER TABLE "public"."uvwClaimValuated" OWNER TO "postgres";

--
-- TOC entry 321 (class 1259 OID 21610)
-- Name: uvwExpenditureInsureeRange; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW "public"."uvwExpenditureInsureeRange" AS
 WITH "Val" AS (
         SELECT "tblClaimItems"."ClaimID",
            "sum"("tblClaimItems"."PriceValuated") AS "Valuated",
            "tblClaimItems"."ProdID"
           FROM "public"."tblClaimItems"
          WHERE (("tblClaimItems"."ValidityTo" IS NULL) AND ("tblClaimItems"."PriceValuated" IS NOT NULL))
          GROUP BY "tblClaimItems"."ClaimID", "tblClaimItems"."ProdID"
        UNION ALL
         SELECT "tblClaimServices"."ClaimID",
            "sum"("tblClaimServices"."PriceValuated") AS "Valuated",
            "tblClaimServices"."ProdID"
           FROM "public"."tblClaimServices"
          WHERE (("tblClaimServices"."ValidityTo" IS NULL) AND ("tblClaimServices"."PriceValuated" IS NOT NULL))
          GROUP BY "tblClaimServices"."ClaimID", "tblClaimServices"."ProdID"
        )
 SELECT "sum"("Val"."Valuated") AS "Valuated",
    "C"."ClaimID" AS "Insuree",
    "public"."month"(COALESCE("C"."DateTo", "C"."DateFrom")) AS "monthtime",
    "public"."quarter"(COALESCE("C"."DateTo", "C"."DateFrom")) AS "quartertime",
    "public"."year"(COALESCE("C"."DateTo", "C"."DateFrom")) AS "yeartime",
    "R"."RegionName" AS "Region",
    "D"."DistrictName",
    "Prod"."ProductCode",
    "Prod"."ProductName",
    "public"."datediff_year"("I"."DOB", COALESCE("C"."DateTo", "C"."DateFrom")) AS "Age",
    "I"."Gender"
   FROM (((((((("Val"
     JOIN "public"."tblClaim" "C" ON (("Val"."ClaimID" = "C"."ClaimID")))
     JOIN "public"."tblProduct" "Prod" ON (("Val"."ProdID" = "Prod"."ProdID")))
     JOIN "public"."tblInsuree" "I" ON (("C"."InsureeID" = "I"."InsureeID")))
     JOIN "public"."tblFamilies" "F" ON (("F"."InsureeID" = "I"."InsureeID")))
     JOIN "public"."tblVillages" "V" ON (("V"."VillageId" = "F"."LocationId")))
     JOIN "public"."tblWards" "W" ON (("W"."WardId" = "V"."WardId")))
     JOIN "public"."tblDistricts" "D" ON (("D"."DistrictId" = "W"."DistrictId")))
     JOIN "public"."tblRegions" "R" ON (("R"."RegionId" = "D"."Region")))
  WHERE (("C"."ValidityTo" IS NULL) AND ("Prod"."ValidityTo" IS NULL) AND ("I"."ValidityTo" IS NULL) AND ("F"."ValidityTo" IS NULL) AND ("D"."ValidityTo" IS NULL))
  GROUP BY "C"."ClaimID", ("public"."month"(COALESCE("C"."DateTo", "C"."DateFrom"))), ("public"."quarter"(COALESCE("C"."DateTo", "C"."DateFrom"))), ("public"."year"(COALESCE("C"."DateTo", "C"."DateFrom"))), "R"."RegionName", "D"."DistrictName", "Prod"."ProductCode", "Prod"."ProductName", ("public"."datediff_year"("I"."DOB", COALESCE("C"."DateTo", "C"."DateFrom"))), "I"."Gender";


-- ALTER TABLE "public"."uvwExpenditureInsureeRange" OWNER TO "postgres";

--
-- TOC entry 322 (class 1259 OID 21615)
-- Name: uvwHospitalAdmissions; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW "public"."uvwHospitalAdmissions" AS
 SELECT "count"("C"."ClaimID") AS "admissions",
    "public"."month"(COALESCE("C"."DateTo", "C"."DateFrom")) AS "monthtime",
    "public"."quarter"(COALESCE("C"."DateTo", "C"."DateFrom")) AS "quartertime",
    "public"."year"(COALESCE("C"."DateTo", "C"."DateFrom")) AS "yeartime",
    "HFR"."RegionName" AS "region",
    "HFD"."DistrictName",
    "Prod"."ProductCode",
    "Prod"."ProductName",
    "public"."datediff_year"("I"."DOB", COALESCE("C"."DateTo", "C"."DateFrom")) AS "Age",
    "I"."Gender",
    "HF"."HFLevel",
    "HF"."HFCode",
    "HF"."HFName",
    "C"."VisitType",
    "ICD"."ICDCode",
    "ICD"."ICDName",
    "HFD"."DistrictName" AS "HFDistrict",
    "HFR"."RegionName" AS "HFRegion"
   FROM ((((((("public"."tblClaim" "C"
     LEFT JOIN ( SELECT "tblClaimItems"."ClaimID",
            "tblClaimItems"."ProdID"
           FROM "public"."tblClaimItems"
          WHERE (("tblClaimItems"."ValidityTo" IS NULL) AND ("tblClaimItems"."RejectionReason" = 0))
        UNION
         SELECT "tblClaimServices"."ClaimID",
            "tblClaimServices"."ProdID"
           FROM "public"."tblClaimServices"
          WHERE (("tblClaimServices"."ValidityTo" IS NULL) AND ("tblClaimServices"."RejectionReason" = 0))) "Details" ON (("C"."ClaimID" = "Details"."ClaimID")))
     LEFT JOIN "public"."tblProduct" "Prod" ON (("Details"."ProdID" = "Prod"."ProdID")))
     LEFT JOIN "public"."tblInsuree" "I" ON (("C"."InsureeID" = "I"."InsureeID")))
     LEFT JOIN "public"."tblHF" "HF" ON (("C"."HFID" = "HF"."HfID")))
     LEFT JOIN "public"."tblICDCodes" "ICD" ON (("C"."ICDID" = "ICD"."ICDID")))
     LEFT JOIN "public"."tblDistricts" "HFD" ON (("HF"."LocationId" = "HFD"."DistrictId")))
     LEFT JOIN "public"."tblRegions" "HFR" ON (("HFR"."RegionId" = "HFD"."Region")))
  WHERE (("C"."ValidityTo" IS NULL) AND ("Prod"."ValidityTo" IS NULL) AND ("I"."ValidityTo" IS NULL) AND ("HF"."ValidityTo" IS NULL) AND ("HFD"."ValidityTo" IS NULL) AND ("public"."datediff_day"("C"."DateFrom", "C"."DateTo") > 0) AND ("C"."ClaimStatus" <> 1))
  GROUP BY ("public"."month"(COALESCE("C"."DateTo", "C"."DateFrom"))), ("public"."quarter"(COALESCE("C"."DateTo", "C"."DateFrom"))), ("public"."year"(COALESCE("C"."DateTo", "C"."DateFrom"))), "Prod"."ProductCode", "Prod"."ProductName", ("public"."datediff_year"("I"."DOB", COALESCE("C"."DateTo", "C"."DateFrom"))), "I"."Gender", "HF"."HFLevel", "HF"."HFCode", "HF"."HFName", "C"."VisitType", "ICD"."ICDCode", "ICD"."ICDName", "HFD"."DistrictName", "HFR"."RegionName";


-- ALTER TABLE "public"."uvwHospitalAdmissions" OWNER TO "postgres";

--
-- TOC entry 323 (class 1259 OID 21620)
-- Name: uvwHospitalDays; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW "public"."uvwHospitalDays" AS
 SELECT "sum"("public"."datediff_day"("C"."DateFrom", "C"."DateTo")) AS "hospitaldays",
    "public"."month"(COALESCE("C"."DateTo", "C"."DateFrom")) AS "monthtime",
    "public"."quarter"(COALESCE("C"."DateTo", "C"."DateFrom")) AS "quartertime",
    "public"."year"(COALESCE("C"."DateTo", "C"."DateFrom")) AS "yeartime",
    "HFR"."RegionName" AS "Region",
    "HFD"."DistrictName",
    "Prod"."ProductCode",
    "Prod"."ProductName",
    "public"."datediff_year"("I"."DOB", COALESCE("C"."DateTo", "C"."DateFrom")) AS "Age",
    "I"."Gender",
    "HF"."HFLevel",
    "HF"."HFCode",
    "HF"."HFName",
    "C"."VisitType",
    "ICD"."ICDCode",
    "ICD"."ICDName",
    "HFD"."DistrictName" AS "HFDistrict",
    "HFR"."RegionName" AS "HFRegion"
   FROM ((((((("public"."tblClaim" "C"
     LEFT JOIN ( SELECT "tblClaimItems"."ClaimID",
            "tblClaimItems"."ProdID"
           FROM "public"."tblClaimItems"
          WHERE (("tblClaimItems"."ValidityTo" IS NULL) AND ("tblClaimItems"."RejectionReason" = 0))
        UNION
         SELECT "tblClaimServices"."ClaimID",
            "tblClaimServices"."ProdID"
           FROM "public"."tblClaimServices"
          WHERE (("tblClaimServices"."ValidityTo" IS NULL) AND ("tblClaimServices"."RejectionReason" = 0))) "Details" ON (("C"."ClaimID" = "Details"."ClaimID")))
     LEFT JOIN "public"."tblProduct" "Prod" ON (("Details"."ProdID" = "Prod"."ProdID")))
     LEFT JOIN "public"."tblInsuree" "I" ON (("C"."InsureeID" = "I"."InsureeID")))
     LEFT JOIN "public"."tblHF" "HF" ON (("C"."HFID" = "HF"."HfID")))
     LEFT JOIN "public"."tblICDCodes" "ICD" ON (("C"."ICDID" = "ICD"."ICDID")))
     LEFT JOIN "public"."tblDistricts" "HFD" ON (("HF"."LocationId" = "HFD"."DistrictId")))
     LEFT JOIN "public"."tblRegions" "HFR" ON (("HFR"."RegionId" = "HFD"."Region")))
  WHERE (("C"."ValidityTo" IS NULL) AND ("Prod"."ValidityTo" IS NULL) AND ("I"."ValidityTo" IS NULL) AND ("HF"."ValidityTo" IS NULL) AND ("HFD"."ValidityTo" IS NULL) AND ("public"."datediff_day"("C"."DateFrom", "C"."DateTo") > 0) AND ("C"."ClaimStatus" <> 1))
  GROUP BY ("public"."month"(COALESCE("C"."DateTo", "C"."DateFrom"))), ("public"."quarter"(COALESCE("C"."DateTo", "C"."DateFrom"))), ("public"."year"(COALESCE("C"."DateTo", "C"."DateFrom"))), "Prod"."ProductCode", "Prod"."ProductName", ("public"."datediff_year"("I"."DOB", COALESCE("C"."DateTo", "C"."DateFrom"))), "I"."Gender", "HF"."HFLevel", "HF"."HFCode", "HF"."HFName", "C"."VisitType", "ICD"."ICDCode", "ICD"."ICDName", "HFD"."DistrictName", "HFR"."RegionName";


-- ALTER TABLE "public"."uvwHospitalDays" OWNER TO "postgres";

--
-- TOC entry 324 (class 1259 OID 21625)
-- Name: uvwItemExpenditures; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW "public"."uvwItemExpenditures" AS
 SELECT "sum"("CI"."RemuneratedAmount") AS "ItemExpenditure",
    "public"."month"(COALESCE("C"."DateTo", "C"."DateFrom")) AS "monthtime",
    "public"."quarter"(COALESCE("C"."DateTo", "C"."DateFrom")) AS "quartertime",
    "public"."year"(COALESCE("C"."DateTo", "C"."DateFrom")) AS "yeartime",
    "R"."RegionName" AS "Region",
    "HFD"."DistrictName",
    "PR"."ProductCode",
    "PR"."ProductName",
    "public"."datediff_year"("I"."DOB", COALESCE("C"."DateTo", "C"."DateFrom")) AS "Age",
    "I"."Gender",
    "Itm"."ItemType",
    "Itm"."ItemCode",
    "Itm"."ItemName",
        CASE
            WHEN ("public"."datediff_day"("C"."DateFrom", "C"."DateTo") > 0) THEN 'I'::"bpchar"
            ELSE 'O'::"bpchar"
        END AS "ItemCareType",
    "HF"."HFLevel",
    "HF"."HFCode",
    "HF"."HFName",
    "C"."VisitType",
    "ICD"."ICDCode",
    "ICD"."ICDName",
    "DIns"."DistrictName" AS "IDistrictName",
    "W"."WardName",
    "V"."VillageName",
    "HFD"."DistrictName" AS "HFDistrict",
    "HFR"."RegionName" AS "HFRegion",
    "HFR"."RegionName" AS "ProdRegion"
   FROM ((((((((((((("public"."tblClaimItems" "CI"
     JOIN "public"."tblClaim" "C" ON (("CI"."ClaimID" = "C"."ClaimID")))
     JOIN "public"."tblProduct" "PR" ON (("CI"."ProdID" = "PR"."ProdID")))
     JOIN "public"."tblInsuree" "I" ON (("C"."InsureeID" = "I"."InsureeID")))
     JOIN "public"."tblFamilies" "F" ON (("I"."FamilyID" = "F"."FamilyID")))
     JOIN "public"."tblVillages" "V" ON (("V"."VillageId" = "F"."LocationId")))
     JOIN "public"."tblWards" "W" ON (("W"."WardId" = "V"."WardId")))
     JOIN "public"."tblDistricts" "DIns" ON (("DIns"."DistrictId" = "W"."DistrictId")))
     JOIN "public"."tblItems" "Itm" ON (("CI"."ItemID" = "Itm"."ItemID")))
     JOIN "public"."tblHF" "HF" ON (("C"."HFID" = "HF"."HfID")))
     JOIN "public"."tblICDCodes" "ICD" ON (("C"."ICDID" = "ICD"."ICDID")))
     JOIN "public"."tblDistricts" "HFD" ON (("HF"."LocationId" = "HFD"."DistrictId")))
     JOIN "public"."tblRegions" "R" ON (("DIns"."Region" = "R"."RegionId")))
     JOIN "public"."tblRegions" "HFR" ON (("HFR"."RegionId" = "HFD"."Region")))
  WHERE (("CI"."ValidityTo" IS NULL) AND ("C"."ValidityTo" IS NULL) AND ("PR"."ValidityTo" IS NULL) AND ("I"."ValidityTo" IS NULL) AND ("I"."ValidityTo" IS NULL) AND ("HF"."ValidityTo" IS NULL) AND ("HFD"."ValidityTo" IS NULL) AND ("C"."ClaimStatus" >= 8))
  GROUP BY ("public"."month"(COALESCE("C"."DateTo", "C"."DateFrom"))), ("public"."quarter"(COALESCE("C"."DateTo", "C"."DateFrom"))), ("public"."year"(COALESCE("C"."DateTo", "C"."DateFrom"))), "R"."RegionName", "PR"."ProductCode", "PR"."ProductName", ("public"."datediff_year"("I"."DOB", COALESCE("C"."DateTo", "C"."DateFrom"))), "I"."Gender", "Itm"."ItemType", "Itm"."ItemCode", "Itm"."ItemName", ("public"."datediff_day"("C"."DateFrom", "C"."DateTo")), "HF"."HFLevel", "HF"."HFCode", "HF"."HFName", "C"."VisitType", "ICD"."ICDCode", "ICD"."ICDName", "DIns"."DistrictName", "W"."WardName", "V"."VillageName", "HFD"."DistrictName", "HFR"."RegionName";


-- ALTER TABLE "public"."uvwItemExpenditures" OWNER TO "postgres";

--
-- TOC entry 325 (class 1259 OID 21630)
-- Name: uvwItemUtilization; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW "public"."uvwItemUtilization" AS
 SELECT "sum"("CI"."QtyProvided") AS "ItemUtilized",
    "public"."month"(COALESCE("C"."DateTo", "C"."DateFrom")) AS "monthtime",
    "public"."quarter"(COALESCE("C"."DateTo", "C"."DateFrom")) AS "quartertime",
    "public"."year"(COALESCE("C"."DateTo", "C"."DateFrom")) AS "yeartime",
    "R"."RegionName" AS "Region",
    "DIns"."DistrictName",
    "Prod"."ProductCode",
    "Prod"."ProductName",
    "public"."datediff_year"("I"."DOB", COALESCE("C"."DateTo", "C"."DateFrom")) AS "Age",
    "I"."Gender",
    "Itm"."ItemType",
    "Itm"."ItemCode",
    "Itm"."ItemName",
        CASE
            WHEN ("public"."datediff_day"("C"."DateFrom", "C"."DateTo") > 0) THEN 'I'::"bpchar"
            ELSE 'O'::"bpchar"
        END AS "ItemCareType",
    "HF"."HFLevel",
    "HF"."HFCode",
    "HF"."HFName",
    "ICD"."ICDCode",
    "ICD"."ICDName",
    "DIns"."DistrictName" AS "IDistrictName",
    "W"."WardName",
    "V"."VillageName",
    "HFD"."DistrictName" AS "HFDistrict",
    "C"."VisitType",
    "HFR"."RegionName" AS "HFRegion",
    "R"."RegionName" AS "ProdRegion"
   FROM ((((((((((((("public"."tblClaimItems" "CI"
     JOIN "public"."tblClaim" "C" ON (("C"."ClaimID" = "CI"."ClaimID")))
     LEFT JOIN "public"."tblProduct" "Prod" ON (("CI"."ProdID" = "Prod"."ProdID")))
     JOIN "public"."tblInsuree" "I" ON (("C"."InsureeID" = "I"."InsureeID")))
     JOIN "public"."tblFamilies" "F" ON (("I"."FamilyID" = "F"."FamilyID")))
     JOIN "public"."tblVillages" "V" ON (("V"."VillageId" = "F"."LocationId")))
     JOIN "public"."tblWards" "W" ON (("W"."WardId" = "V"."WardId")))
     JOIN "public"."tblDistricts" "DIns" ON (("DIns"."DistrictId" = "W"."DistrictId")))
     JOIN "public"."tblItems" "Itm" ON (("CI"."ItemID" = "Itm"."ItemID")))
     JOIN "public"."tblHF" "HF" ON (("C"."HFID" = "HF"."HfID")))
     JOIN "public"."tblICDCodes" "ICD" ON (("C"."ICDID" = "ICD"."ICDID")))
     JOIN "public"."tblDistricts" "HFD" ON (("HF"."LocationId" = "HFD"."DistrictId")))
     JOIN "public"."tblRegions" "R" ON (("R"."RegionId" = "DIns"."Region")))
     JOIN "public"."tblRegions" "HFR" ON (("HFR"."RegionId" = "HFD"."Region")))
  WHERE (("CI"."ValidityTo" IS NULL) AND ("C"."ValidityTo" IS NULL) AND ("Prod"."ValidityTo" IS NULL) AND ("Itm"."ValidityTo" IS NULL) AND ("HF"."ValidityTo" IS NULL) AND ("HFD"."ValidityTo" IS NULL) AND ("C"."ClaimStatus" > 2) AND ("CI"."RejectionReason" = 0))
  GROUP BY ("public"."month"(COALESCE("C"."DateTo", "C"."DateFrom"))), ("public"."quarter"(COALESCE("C"."DateTo", "C"."DateFrom"))), ("public"."year"(COALESCE("C"."DateTo", "C"."DateFrom"))), "R"."RegionName", "Prod"."ProductCode", "Prod"."ProductName", ("public"."datediff_year"("I"."DOB", COALESCE("C"."DateTo", "C"."DateFrom"))), "I"."Gender", "Itm"."ItemType", "Itm"."ItemCode", "Itm"."ItemName", ("public"."datediff_day"("C"."DateFrom", "C"."DateTo")), "HF"."HFLevel", "HF"."HFCode", "HF"."HFName", "ICD"."ICDCode", "ICD"."ICDName", "DIns"."DistrictName", "W"."WardName", "V"."VillageName", "C"."VisitType", "HFD"."DistrictName", "HFR"."RegionName";


-- ALTER TABLE "public"."uvwItemUtilization" OWNER TO "postgres";

--
-- TOC entry 337 (class 1259 OID 21719)
-- Name: uvwLocations; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW "public"."uvwLocations" AS
 SELECT 0 AS "LocationId",
    NULL::integer AS "RegionId",
    NULL::character varying AS "RegionCode",
    'National'::"bpchar" AS "RegionName",
    NULL::"text" AS "DistrictId",
    NULL::"text" AS "DistrictCode",
    NULL::"text" AS "DistrictName",
    NULL::"text" AS "WardId",
    NULL::"text" AS "WardCode",
    NULL::"text" AS "WardName",
    NULL::"text" AS "VillageId",
    NULL::"text" AS "VillageCode",
    NULL::"text" AS "VillageName",
    NULL::integer AS "ParentLocationId"
UNION ALL
 SELECT "tblRegions"."RegionId" AS "LocationId",
    "tblRegions"."RegionId",
    "tblRegions"."RegionCode",
    "tblRegions"."RegionName",
    NULL::"text" AS "DistrictId",
    NULL::"text" AS "DistrictCode",
    NULL::"text" AS "DistrictName",
    NULL::"text" AS "WardId",
    NULL::"text" AS "WardCode",
    NULL::"text" AS "WardName",
    NULL::"text" AS "VillageId",
    NULL::"text" AS "VillageCode",
    NULL::"text" AS "VillageName",
    0 AS "ParentLocationId"
   FROM "public"."tblRegions"
UNION ALL
 SELECT "D"."DistrictId" AS "LocationId",
    "R"."RegionId",
    "R"."RegionCode",
    "R"."RegionName",
    ("D"."DistrictId")::"text" AS "DistrictId",
    "D"."DistrictCode",
    "D"."DistrictName",
    NULL::"text" AS "WardId",
    NULL::"text" AS "WardCode",
    NULL::"text" AS "WardName",
    NULL::"text" AS "VillageId",
    NULL::"text" AS "VillageCode",
    NULL::"text" AS "VillageName",
    "D"."Region" AS "ParentLocationId"
   FROM ("public"."tblDistricts" "D"
     JOIN "public"."tblRegions" "R" ON (("R"."RegionId" = "D"."Region")))
UNION ALL
 SELECT "W"."WardId" AS "LocationId",
    "R"."RegionId",
    "R"."RegionCode",
    "R"."RegionName",
    ("D"."DistrictId")::"text" AS "DistrictId",
    "D"."DistrictCode",
    "D"."DistrictName",
    ("W"."WardId")::"text" AS "WardId",
    "W"."WardCode",
    "W"."WardName",
    NULL::"text" AS "VillageId",
    NULL::"text" AS "VillageCode",
    NULL::"text" AS "VillageName",
    "D"."DistrictId" AS "ParentLocationId"
   FROM (("public"."tblRegions" "R"
     JOIN "public"."tblDistricts" "D" ON (("R"."RegionId" = "D"."Region")))
     JOIN "public"."tblWards" "W" ON (("W"."DistrictId" = "D"."DistrictId")))
UNION ALL
 SELECT "V"."VillageId" AS "LocationId",
    "R"."RegionId",
    "R"."RegionCode",
    "R"."RegionName",
    ("D"."DistrictId")::"text" AS "DistrictId",
    "D"."DistrictCode",
    "D"."DistrictName",
    ("W"."WardId")::"text" AS "WardId",
    "W"."WardCode",
    "W"."WardName",
    ("V"."VillageId")::"text" AS "VillageId",
    "V"."VillageCode",
    "V"."VillageName",
    "V"."WardId" AS "ParentLocationId"
   FROM ((("public"."tblRegions" "R"
     JOIN "public"."tblDistricts" "D" ON (("R"."RegionId" = "D"."Region")))
     JOIN "public"."tblWards" "W" ON (("W"."DistrictId" = "D"."DistrictId")))
     JOIN "public"."tblVillages" "V" ON (("V"."WardId" = "W"."WardId")));


-- ALTER TABLE "public"."uvwLocations" OWNER TO "postgres";

--
-- TOC entry 326 (class 1259 OID 21635)
-- Name: uvwNumberFeedbackAnswerYes; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW "public"."uvwNumberFeedbackAnswerYes" AS
 SELECT "count"("F"."FeedbackID") AS "AnsYes",
    1 AS "QuestionId",
    "public"."month"("F"."FeedbackDate") AS "monthtime",
    "public"."quarter"("F"."FeedbackDate") AS "quartertime",
    "public"."year"("F"."FeedbackDate") AS "yeartime",
    "HF"."HFLevel",
    "HF"."HFCode",
    "HF"."HFName",
    "HFR"."RegionName" AS "Region",
    "HFD"."DistrictName",
    "Prod"."ProductCode",
    "Prod"."ProductName",
    "HFD"."DistrictName" AS "HFDistrict",
    "HFR"."RegionName" AS "HFRegion"
   FROM (((((("public"."tblFeedback" "F"
     JOIN "public"."tblClaim" "C" ON (("F"."ClaimID" = "C"."ClaimID")))
     JOIN ( SELECT "tblClaimItems"."ClaimID",
            "tblClaimItems"."ProdID"
           FROM "public"."tblClaimItems"
          WHERE ("tblClaimItems"."ValidityTo" IS NULL)
        UNION
         SELECT "tblClaimServices"."ClaimID",
            "tblClaimServices"."ProdID"
           FROM "public"."tblClaimServices"
          WHERE ("tblClaimServices"."ValidityTo" IS NULL)) "Details" ON (("C"."ClaimID" = "Details"."ClaimID")))
     JOIN "public"."tblProduct" "Prod" ON (("Details"."ProdID" = "Prod"."ProdID")))
     JOIN "public"."tblHF" "HF" ON (("C"."HFID" = "HF"."HfID")))
     JOIN "public"."tblDistricts" "HFD" ON (("HF"."LocationId" = "HFD"."DistrictId")))
     JOIN "public"."tblRegions" "HFR" ON (("HFR"."RegionId" = "HFD"."Region")))
  WHERE (("F"."ValidityTo" IS NULL) AND ("F"."CareRendered" = true))
  GROUP BY ("public"."month"("F"."FeedbackDate")), ("public"."quarter"("F"."FeedbackDate")), ("public"."year"("F"."FeedbackDate")), "HF"."HFLevel", "HF"."HFCode", "HF"."HFName", "Prod"."ProductCode", "Prod"."ProductName", "HFD"."DistrictName", "HFR"."RegionName"
UNION ALL
 SELECT "count"("F"."FeedbackID") AS "AnsYes",
    2 AS "QuestionId",
    "public"."month"("F"."FeedbackDate") AS "monthtime",
    "public"."quarter"("F"."FeedbackDate") AS "quartertime",
    "public"."year"("F"."FeedbackDate") AS "yeartime",
    "HF"."HFLevel",
    "HF"."HFCode",
    "HF"."HFName",
    "HFR"."RegionName" AS "Region",
    "HFD"."DistrictName",
    "Prod"."ProductCode",
    "Prod"."ProductName",
    "HFD"."DistrictName" AS "HFDistrict",
    "HFR"."RegionName" AS "HFRegion"
   FROM (((((("public"."tblFeedback" "F"
     JOIN "public"."tblClaim" "C" ON (("F"."ClaimID" = "C"."ClaimID")))
     JOIN ( SELECT "tblClaimItems"."ClaimID",
            "tblClaimItems"."ProdID"
           FROM "public"."tblClaimItems"
          WHERE ("tblClaimItems"."ValidityTo" IS NULL)
        UNION
         SELECT "tblClaimServices"."ClaimID",
            "tblClaimServices"."ProdID"
           FROM "public"."tblClaimServices"
          WHERE ("tblClaimServices"."ValidityTo" IS NULL)) "Details" ON (("C"."ClaimID" = "Details"."ClaimID")))
     JOIN "public"."tblProduct" "Prod" ON (("Details"."ProdID" = "Prod"."ProdID")))
     JOIN "public"."tblHF" "HF" ON (("C"."HFID" = "HF"."HfID")))
     JOIN "public"."tblDistricts" "HFD" ON (("HF"."LocationId" = "HFD"."DistrictId")))
     JOIN "public"."tblRegions" "HFR" ON (("HFR"."RegionId" = "HFD"."Region")))
  WHERE (("F"."ValidityTo" IS NULL) AND ("F"."PaymentAsked" = true))
  GROUP BY ("public"."month"("F"."FeedbackDate")), ("public"."quarter"("F"."FeedbackDate")), ("public"."year"("F"."FeedbackDate")), "HF"."HFLevel", "HF"."HFCode", "HF"."HFName", "Prod"."ProductCode", "Prod"."ProductName", "HFD"."DistrictName", "HFR"."RegionName"
UNION ALL
 SELECT "count"("F"."FeedbackID") AS "AnsYes",
    3 AS "QuestionId",
    "public"."month"("F"."FeedbackDate") AS "monthtime",
    "public"."quarter"("F"."FeedbackDate") AS "quartertime",
    "public"."year"("F"."FeedbackDate") AS "yeartime",
    "HF"."HFLevel",
    "HF"."HFCode",
    "HF"."HFName",
    "HFR"."RegionName" AS "Region",
    "HFD"."DistrictName",
    "Prod"."ProductCode",
    "Prod"."ProductName",
    "HFD"."DistrictName" AS "HFDistrict",
    "HFR"."RegionName" AS "HFRegion"
   FROM (((((("public"."tblFeedback" "F"
     JOIN "public"."tblClaim" "C" ON (("F"."ClaimID" = "C"."ClaimID")))
     JOIN ( SELECT "tblClaimItems"."ClaimID",
            "tblClaimItems"."ProdID"
           FROM "public"."tblClaimItems"
          WHERE ("tblClaimItems"."ValidityTo" IS NULL)
        UNION
         SELECT "tblClaimServices"."ClaimID",
            "tblClaimServices"."ProdID"
           FROM "public"."tblClaimServices"
          WHERE ("tblClaimServices"."ValidityTo" IS NULL)) "Details" ON (("C"."ClaimID" = "Details"."ClaimID")))
     JOIN "public"."tblProduct" "Prod" ON (("Details"."ProdID" = "Prod"."ProdID")))
     JOIN "public"."tblHF" "HF" ON (("C"."HFID" = "HF"."HfID")))
     JOIN "public"."tblDistricts" "HFD" ON (("HF"."LocationId" = "HFD"."DistrictId")))
     JOIN "public"."tblRegions" "HFR" ON (("HFR"."RegionId" = "HFD"."Region")))
  WHERE (("F"."ValidityTo" IS NULL) AND ("F"."DrugPrescribed" = true))
  GROUP BY ("public"."month"("F"."FeedbackDate")), ("public"."quarter"("F"."FeedbackDate")), ("public"."year"("F"."FeedbackDate")), "HF"."HFLevel", "HF"."HFCode", "HF"."HFName", "Prod"."ProductCode", "Prod"."ProductName", "HFD"."DistrictName", "HFR"."RegionName"
UNION ALL
 SELECT "count"("F"."FeedbackID") AS "AnsYes",
    4 AS "QuestionId",
    "public"."month"("F"."FeedbackDate") AS "monthtime",
    "public"."quarter"("F"."FeedbackDate") AS "quartertime",
    "public"."year"("F"."FeedbackDate") AS "yeartime",
    "HF"."HFLevel",
    "HF"."HFCode",
    "HF"."HFName",
    "HFR"."RegionName" AS "Region",
    "HFD"."DistrictName",
    "Prod"."ProductCode",
    "Prod"."ProductName",
    "HFD"."DistrictName" AS "HFDistrict",
    "HFR"."RegionName" AS "HFRegion"
   FROM (((((("public"."tblFeedback" "F"
     JOIN "public"."tblClaim" "C" ON (("F"."ClaimID" = "C"."ClaimID")))
     JOIN ( SELECT "tblClaimItems"."ClaimID",
            "tblClaimItems"."ProdID"
           FROM "public"."tblClaimItems"
          WHERE ("tblClaimItems"."ValidityTo" IS NULL)
        UNION
         SELECT "tblClaimServices"."ClaimID",
            "tblClaimServices"."ProdID"
           FROM "public"."tblClaimServices"
          WHERE ("tblClaimServices"."ValidityTo" IS NULL)) "Details" ON (("C"."ClaimID" = "Details"."ClaimID")))
     JOIN "public"."tblProduct" "Prod" ON (("Details"."ProdID" = "Prod"."ProdID")))
     JOIN "public"."tblHF" "HF" ON (("C"."HFID" = "HF"."HfID")))
     JOIN "public"."tblDistricts" "HFD" ON (("HF"."LocationId" = "HFD"."DistrictId")))
     JOIN "public"."tblRegions" "HFR" ON (("HFR"."RegionId" = "HFD"."Region")))
  WHERE (("F"."ValidityTo" IS NULL) AND ("F"."DrugReceived" = true))
  GROUP BY ("public"."month"("F"."FeedbackDate")), ("public"."quarter"("F"."FeedbackDate")), ("public"."year"("F"."FeedbackDate")), "HF"."HFLevel", "HF"."HFCode", "HF"."HFName", "Prod"."ProductCode", "Prod"."ProductName", "HFD"."DistrictName", "HFR"."RegionName";


-- ALTER TABLE "public"."uvwNumberFeedbackAnswerYes" OWNER TO "postgres";

--
-- TOC entry 327 (class 1259 OID 21640)
-- Name: uvwNumberFeedbackResponded; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW "public"."uvwNumberFeedbackResponded" AS
 SELECT "count"("F"."FeedbackID") AS "FeedbackResponded",
    "public"."month"("F"."FeedbackDate") AS "monthtime",
    "public"."quarter"("F"."FeedbackDate") AS "quartertime",
    "public"."year"("F"."FeedbackDate") AS "yeartime",
    "HFR"."RegionName" AS "Region",
    "HFD"."DistrictName",
    "Prod"."ProductCode",
    "Prod"."ProductName",
    "HF"."HFLevel",
    "HF"."HFCode",
    "HF"."HFName",
    "HFD"."DistrictName" AS "HFDistrict",
    "HFR"."RegionName" AS "HFRegion"
   FROM (((((("public"."tblFeedback" "F"
     JOIN "public"."tblClaim" "C" ON (("F"."ClaimID" = "C"."ClaimID")))
     JOIN ( SELECT "tblClaimItems"."ClaimID",
            "tblClaimItems"."ProdID"
           FROM "public"."tblClaimItems"
          WHERE ("tblClaimItems"."ValidityTo" IS NULL)
        UNION
         SELECT "tblClaimServices"."ClaimID",
            "tblClaimServices"."ProdID"
           FROM "public"."tblClaimServices"
          WHERE ("tblClaimServices"."ValidityTo" IS NULL)) "Details" ON (("F"."ClaimID" = "Details"."ClaimID")))
     JOIN "public"."tblProduct" "Prod" ON (("Details"."ProdID" = "Prod"."ProdID")))
     JOIN "public"."tblHF" "HF" ON (("C"."HFID" = "HF"."HfID")))
     JOIN "public"."tblDistricts" "HFD" ON (("HF"."LocationId" = "HFD"."DistrictId")))
     JOIN "public"."tblRegions" "HFR" ON (("HFR"."RegionId" = "HFD"."Region")))
  WHERE (("F"."ValidityTo" IS NULL) AND ("Prod"."ValidityTo" IS NULL))
  GROUP BY ("public"."year"("F"."FeedbackDate")), ("public"."month"("F"."FeedbackDate")), ("public"."quarter"("F"."FeedbackDate")), "Prod"."ProductCode", "Prod"."ProductName", "HF"."HFLevel", "HF"."HFCode", "HF"."HFName", "HFD"."DistrictName", "HFR"."RegionName";


-- ALTER TABLE "public"."uvwNumberFeedbackResponded" OWNER TO "postgres";

--
-- TOC entry 361 (class 1259 OID 25577)
-- Name: uvwNumberFeedbackSent; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW "public"."uvwNumberFeedbackSent" AS
 SELECT "count"("F"."FeedbackPromptID") AS "FeedbackSent",
    "public"."month"("F"."FeedbackPromptDate") AS "monthtime",
    "public"."quarter"("F"."FeedbackPromptDate") AS "quartertime",
    "public"."year"("F"."FeedbackPromptDate") AS "yeartime",
    "HFR"."RegionName" AS "Region",
    "HFD"."DistrictName",
    "Prod"."ProductCode",
    "Prod"."ProductName",
    "HF"."HFLevel",
    "HF"."HFCode",
    "HF"."HFName",
    "HFD"."DistrictName" AS "HFDistrict",
    "HFR"."RegionName" AS "HFRegion"
   FROM (((((("public"."tblFeedbackPrompt" "F"
     JOIN "public"."tblClaim" "C" ON (("F"."ClaimID" = "C"."ClaimID")))
     JOIN ( SELECT "tblClaimItems"."ClaimID",
            "tblClaimItems"."ProdID"
           FROM "public"."tblClaimItems"
          WHERE ("tblClaimItems"."ValidityTo" IS NULL)
        UNION
         SELECT "tblClaimServices"."ClaimID",
            "tblClaimServices"."ProdID"
           FROM "public"."tblClaimServices"
          WHERE ("tblClaimServices"."ValidityTo" IS NULL)) "Details" ON (("F"."ClaimID" = "Details"."ClaimID")))
     JOIN "public"."tblProduct" "Prod" ON (("Details"."ProdID" = "Prod"."ProdID")))
     JOIN "public"."tblHF" "HF" ON (("C"."HFID" = "HF"."HfID")))
     JOIN "public"."tblDistricts" "HFD" ON (("HF"."LocationId" = "HFD"."DistrictId")))
     JOIN "public"."tblRegions" "HFR" ON (("HFR"."RegionId" = "HFD"."Region")))
  WHERE (("F"."ValidityTo" IS NULL) AND ("Prod"."ValidityTo" IS NULL) AND ("HFD"."ValidityTo" IS NULL))
  GROUP BY ("public"."year"("F"."FeedbackPromptDate")), ("public"."month"("F"."FeedbackPromptDate")), ("public"."quarter"("F"."FeedbackPromptDate")), "Prod"."ProductCode", "Prod"."ProductName", "HF"."HFLevel", "HF"."HFCode", "HF"."HFName", "HFD"."DistrictName", "HFR"."RegionName";


-- ALTER TABLE "public"."uvwNumberFeedbackSent" OWNER TO "postgres";

--
-- TOC entry 328 (class 1259 OID 21654)
-- Name: uvwNumberInsureeAcquired; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW "public"."uvwNumberInsureeAcquired" AS
 SELECT "count"("I"."InsureeID") AS "NewInsurees",
    "public"."month"("PL"."EnrollDate") AS "monthtime",
    "public"."datename_q"("PL"."EnrollDate") AS "quartertime",
    "public"."year"("PL"."EnrollDate") AS "yeartime",
    "public"."datediff_year"(("I"."DOB")::timestamp with time zone, "now"()) AS "Age",
    "I"."Gender",
    "R"."RegionName" AS "Region",
    "D"."DistrictName" AS "InsDistrict",
    "V"."VillageName" AS "InsVillage",
    "W"."WardName" AS "InsWard",
    "D"."DistrictName" AS "ProdDistrict",
    "Prod"."ProductCode",
    "Prod"."ProductName",
    "ODist"."DistrictName" AS "OfficerDistrict",
    "O"."Code",
    "O"."LastName",
    "O"."OtherNames",
    "R"."RegionName" AS "ProdRegion"
   FROM (((((((((("public"."tblPolicy" "PL"
     JOIN "public"."tblInsuree" "I" ON (("PL"."FamilyID" = "I"."FamilyID")))
     JOIN "public"."tblProduct" "Prod" ON (("PL"."ProdID" = "Prod"."ProdID")))
     JOIN "public"."tblFamilies" "F" ON (("PL"."FamilyID" = "F"."FamilyID")))
     JOIN "public"."tblVillages" "V" ON (("V"."VillageId" = "F"."LocationId")))
     JOIN "public"."tblWards" "W" ON (("W"."WardId" = "V"."WardId")))
     JOIN "public"."tblDistricts" "D" ON (("D"."DistrictId" = "W"."DistrictId")))
     JOIN "public"."tblOfficer" "O" ON (("PL"."OfficerID" = "O"."OfficerID")))
     JOIN "public"."tblDistricts" "ODist" ON (("O"."LocationId" = "ODist"."DistrictId")))
     JOIN "public"."tblInsureePolicy" "InsPL" ON ((("InsPL"."InsureeID" = "I"."InsureeID") AND ("InsPL"."PolicyId" = "PL"."PolicyID"))))
     JOIN "public"."tblRegions" "R" ON (("R"."RegionId" = "D"."Region")))
  WHERE (("PL"."ValidityTo" IS NULL) AND ("I"."ValidityTo" IS NULL) AND ("Prod"."ValidityTo" IS NULL) AND ("F"."ValidityTo" IS NULL) AND ("D"."ValidityTo" IS NULL) AND ("V"."ValidityTo" IS NULL) AND ("W"."ValidityTo" IS NULL) AND ("O"."ValidityTo" IS NULL) AND ("ODist"."ValidityTo" IS NULL) AND ("InsPL"."ValidityTo" IS NULL))
  GROUP BY ("public"."month"("PL"."EnrollDate")), ("public"."datename_q"("PL"."EnrollDate")), ("public"."year"("PL"."EnrollDate")), ("public"."datediff_year"(("I"."DOB")::timestamp with time zone, "now"())), "I"."Gender", "D"."DistrictName", "V"."VillageName", "W"."WardName", "R"."RegionName", "Prod"."ProductCode", "Prod"."ProductName", "ODist"."DistrictName", "O"."Code", "O"."LastName", "O"."OtherNames";


-- ALTER TABLE "public"."uvwNumberInsureeAcquired" OWNER TO "postgres";

--
-- TOC entry 329 (class 1259 OID 21669)
-- Name: uvwNumberOfInsuredHouseholds; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW "public"."uvwNumberOfInsuredHouseholds" AS
 WITH "RowData" AS (
         SELECT "F"."FamilyID",
            ("public"."eomonth"("PL"."EffectiveDate") + (("MonthCount"."numbers")::double precision * '1 mon'::interval)) AS "ActiveDate",
            "R"."RegionName" AS "Region",
            "D"."DistrictName",
            "W"."WardName",
            "V"."VillageName"
           FROM (((((("public"."tblPolicy" "PL"
             JOIN "public"."tblFamilies" "F" ON (("PL"."FamilyID" = "F"."FamilyID")))
             JOIN "public"."tblVillages" "V" ON (("V"."VillageId" = "F"."LocationId")))
             JOIN "public"."tblWards" "W" ON (("W"."WardId" = "V"."WardId")))
             JOIN "public"."tblDistricts" "D" ON (("D"."DistrictId" = "W"."DistrictId")))
             JOIN "public"."tblRegions" "R" ON (("D"."Region" = "R"."RegionId")))
             LEFT JOIN LATERAL ( VALUES (0), (1), (2), (3), (4), (5), (6), (7), (8), (9), (10), (11)) "MonthCount"("numbers") ON (true))
          WHERE (("PL"."ValidityTo" IS NULL) AND ("F"."ValidityTo" IS NULL) AND ("R"."ValidityTo" IS NULL) AND ("D"."ValidityTo" IS NULL) AND ("W"."ValidityTo" IS NULL) AND ("V"."ValidityTo" IS NULL) AND ("PL"."EffectiveDate" IS NOT NULL))
        ), "RowData2" AS (
         SELECT "RowData"."FamilyID",
            "RowData"."ActiveDate",
            "RowData"."Region",
            "RowData"."DistrictName",
            "RowData"."WardName",
            "RowData"."VillageName"
           FROM "RowData"
          GROUP BY "RowData"."FamilyID", "RowData"."ActiveDate", "RowData"."Region", "RowData"."DistrictName", "RowData"."WardName", "RowData"."VillageName"
        )
 SELECT "count"("RowData2"."FamilyID") AS "InsuredHouseholds",
    "public"."month"("RowData2"."ActiveDate") AS "monthtime",
    "public"."datename_q"("RowData2"."ActiveDate") AS "quartertime",
    "public"."year"("RowData2"."ActiveDate") AS "yeartime",
    "RowData2"."Region",
    "RowData2"."DistrictName",
    "RowData2"."WardName",
    "RowData2"."VillageName"
   FROM "RowData2"
  GROUP BY "RowData2"."ActiveDate", "RowData2"."Region", "RowData2"."DistrictName", "RowData2"."WardName", "RowData2"."VillageName";


-- ALTER TABLE "public"."uvwNumberOfInsuredHouseholds" OWNER TO "postgres";

--
-- TOC entry 330 (class 1259 OID 21674)
-- Name: uvwNumberPolicyRenewed; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW "public"."uvwNumberPolicyRenewed" AS
 SELECT "count"("PL"."FamilyID") AS "Renewals",
    "public"."month"("PL"."EnrollDate") AS "monthtime",
    "public"."datename_q"("PL"."EnrollDate") AS "quartertime",
    "public"."year"("PL"."EnrollDate") AS "yeartime",
    "public"."datediff_year"("I"."DOB", "PL"."EnrollDate") AS "Age",
    "I"."Gender",
    "R"."RegionName" AS "Region",
    "FD"."DistrictName" AS "InsureeDistrictName",
    "FV"."VillageName",
    "FW"."WardName",
    "FD"."DistrictName" AS "Prod""DistrictName",
    "Prod"."ProductCode",
    "Prod"."ProductName",
    "OD"."DistrictName" AS "OfficeDistrict",
    "O"."Code" AS "OfficerCode",
    "O"."LastName",
    "O"."OtherNames",
    "R"."RegionName" AS "ProdRegion"
   FROM ((((((((("public"."tblPolicy" "PL"
     JOIN "public"."tblFamilies" "F" ON (("PL"."FamilyID" = "F"."FamilyID")))
     JOIN "public"."tblInsuree" "I" ON (("F"."InsureeID" = "I"."InsureeID")))
     JOIN "public"."tblVillages" "FV" ON (("FV"."VillageId" = "F"."LocationId")))
     JOIN "public"."tblWards" "FW" ON (("FW"."WardId" = "FV"."WardId")))
     JOIN "public"."tblDistricts" "FD" ON (("FD"."DistrictId" = "FW"."DistrictId")))
     JOIN "public"."tblProduct" "Prod" ON (("PL"."ProdID" = "Prod"."ProdID")))
     JOIN "public"."tblOfficer" "O" ON (("PL"."OfficerID" = "O"."OfficerID")))
     JOIN "public"."tblDistricts" "OD" ON (("OD"."DistrictId" = "O"."LocationId")))
     JOIN "public"."tblRegions" "R" ON (("R"."RegionId" = "FD"."Region")))
  WHERE (("PL"."ValidityTo" IS NULL) AND ("F"."ValidityTo" IS NULL) AND ("I"."ValidityTo" IS NULL) AND ("FD"."ValidityTo" IS NULL) AND ("FW"."ValidityTo" IS NULL) AND ("FV"."ValidityTo" IS NULL) AND ("Prod"."ValidityTo" IS NULL) AND ("O"."ValidityTo" IS NULL) AND ("OD"."ValidityTo" IS NULL) AND (("PL"."PolicyStage")::"bpchar" = 'R'::"bpchar"))
  GROUP BY ("public"."month"("PL"."EnrollDate")), ("public"."datename_q"("PL"."EnrollDate")), ("public"."year"("PL"."EnrollDate")), ("public"."datediff_year"("I"."DOB", "PL"."EnrollDate")), "I"."Gender", "R"."RegionName", "FD"."DistrictName", "FV"."VillageName", "FW"."WardName", "Prod"."ProductCode", "Prod"."ProductName", "OD"."DistrictName", "O"."Code", "O"."LastName", "O"."OtherNames";


-- ALTER TABLE "public"."uvwNumberPolicyRenewed" OWNER TO "postgres";

--
-- TOC entry 331 (class 1259 OID 21679)
-- Name: uvwNumberPolicySold; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW "public"."uvwNumberPolicySold" AS
 SELECT "count"("PL"."FamilyID") AS "soldpolicy",
    "public"."month"("PL"."EnrollDate") AS "monthtime",
    "public"."datename_q"("PL"."EnrollDate") AS "quartertime",
    "public"."year"("PL"."EnrollDate") AS "yeartime",
    "public"."datediff_year"("I"."DOB", "PL"."EnrollDate") AS "Age",
    "I"."Gender",
    "RD"."RegionName" AS "Region",
    "FD"."DistrictName" AS "InsDistrict",
    "FV"."VillageName" AS "InsVillage",
    "FW"."WardName" AS "InsWard",
    "FD"."DistrictName" AS "ProdDistrict",
    "Prod"."ProductCode",
    "Prod"."ProductName",
    "OD"."DistrictName" AS "OfficerDistrict",
    "O"."Code",
    "O"."LastName",
    "O"."OtherNames",
    "RD"."RegionName" AS "ProdRegion"
   FROM ((((((((("public"."tblPolicy" "PL"
     JOIN "public"."tblFamilies" "F" ON (("PL"."FamilyID" = "F"."FamilyID")))
     JOIN "public"."tblInsuree" "I" ON (("F"."InsureeID" = "I"."InsureeID")))
     JOIN "public"."tblVillages" "FV" ON (("FV"."VillageId" = "F"."LocationId")))
     JOIN "public"."tblWards" "FW" ON (("FW"."WardId" = "FV"."WardId")))
     JOIN "public"."tblDistricts" "FD" ON (("FD"."DistrictId" = "FW"."DistrictId")))
     JOIN "public"."tblProduct" "Prod" ON (("PL"."ProdID" = "Prod"."ProdID")))
     JOIN "public"."tblOfficer" "O" ON (("PL"."OfficerID" = "O"."OfficerID")))
     JOIN "public"."tblDistricts" "OD" ON (("OD"."DistrictId" = "O"."LocationId")))
     JOIN "public"."tblRegions" "RD" ON (("RD"."RegionId" = "FD"."Region")))
  WHERE (("PL"."ValidityTo" IS NULL) AND ("F"."ValidityTo" IS NULL) AND ("I"."ValidityTo" IS NULL) AND ("FD"."ValidityTo" IS NULL) AND ("FW"."ValidityTo" IS NULL) AND ("FV"."ValidityTo" IS NULL) AND ("Prod"."ValidityTo" IS NULL) AND ("O"."ValidityTo" IS NULL) AND ("OD"."ValidityTo" IS NULL) AND (("PL"."PolicyStage")::"bpchar" = 'N'::"bpchar"))
  GROUP BY ("public"."month"("PL"."EnrollDate")), ("public"."datename_q"("PL"."EnrollDate")), ("public"."year"("PL"."EnrollDate")), ("public"."datediff_year"("I"."DOB", "PL"."EnrollDate")), "I"."Gender", "RD"."RegionName", "FD"."DistrictName", "FV"."VillageName", "FW"."WardName", "Prod"."ProductCode", "Prod"."ProductName", "OD"."DistrictName", "O"."Code", "O"."LastName", "O"."OtherNames";


-- ALTER TABLE "public"."uvwNumberPolicySold" OWNER TO "postgres";

--
-- TOC entry 332 (class 1259 OID 21684)
-- Name: uvwOverallAssessment; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW "public"."uvwOverallAssessment" AS
 SELECT "F"."Asessment",
    "public"."month"("F"."FeedbackDate") AS "monthtime",
    "public"."quarter"("F"."FeedbackDate") AS "quartertime",
    "public"."year"("F"."FeedbackDate") AS "yeartime",
    "HFR"."RegionName" AS "Region",
    "HFD"."DistrictName",
    "Prod"."ProductCode",
    "Prod"."ProductName",
    "HF"."HFLevel",
    "HF"."HFCode",
    "HF"."HFName",
    "HFD"."DistrictName" AS "HFDistrict",
    "HFR"."RegionName" AS "HFRegion"
   FROM (((((("public"."tblFeedback" "F"
     JOIN "public"."tblClaim" "C" ON (("F"."ClaimID" = "C"."ClaimID")))
     JOIN ( SELECT "tblClaimItems"."ClaimID",
            "tblClaimItems"."ProdID"
           FROM "public"."tblClaimItems"
          WHERE ("tblClaimItems"."ValidityTo" IS NULL)
        UNION
         SELECT "tblClaimServices"."ClaimID",
            "tblClaimServices"."ProdID"
           FROM "public"."tblClaimServices"
          WHERE ("tblClaimServices"."ValidityTo" IS NULL)) "Details" ON (("C"."ClaimID" = "Details"."ClaimID")))
     JOIN "public"."tblProduct" "Prod" ON (("Details"."ProdID" = "Prod"."ProdID")))
     JOIN "public"."tblHF" "HF" ON (("C"."HFID" = "HF"."HfID")))
     JOIN "public"."tblDistricts" "HFD" ON (("HF"."LocationId" = "HFD"."DistrictId")))
     JOIN "public"."tblRegions" "HFR" ON (("HFR"."RegionId" = "HFD"."Region")))
  WHERE (("F"."ValidityTo" IS NULL) AND ("C"."ValidityTo" IS NULL) AND ("Prod"."ValidityTo" IS NULL) AND ("HF"."ValidityTo" IS NULL) AND ("HFD"."ValidityTo" IS NULL));


-- ALTER TABLE "public"."uvwOverallAssessment" OWNER TO "postgres";

--
-- TOC entry 335 (class 1259 OID 21709)
-- Name: uvwPopulation; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW "public"."uvwPopulation" AS
 SELECT "R"."RegionName" AS "Region",
    "D"."DistrictName" AS "District",
    "W"."WardName" AS "Ward",
    "V"."VillageName" AS "Village",
    "V"."MalePopulation" AS "Male",
    "V"."FemalePopulation" AS "Female",
    "V"."OtherPopulation" AS "others",
    "V"."Families" AS "Households",
    "date_part"('year'::"text", "now"()) AS "YEAR"
   FROM ((("public"."tblVillages" "V"
     JOIN "public"."tblWards" "W" ON (("V"."WardId" = "W"."WardId")))
     JOIN "public"."tblDistricts" "D" ON (("D"."DistrictId" = "W"."DistrictId")))
     JOIN "public"."tblRegions" "R" ON (("R"."RegionId" = "D"."Region")))
  WHERE (("V"."ValidityTo" IS NULL) AND ("W"."ValidityTo" IS NULL) AND ("D"."ValidityTo" IS NULL) AND ("R"."ValidityTo" IS NULL));


-- ALTER TABLE "public"."uvwPopulation" OWNER TO "postgres";

--
-- TOC entry 333 (class 1259 OID 21694)
-- Name: uvwPremiumCollection; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW "public"."uvwPremiumCollection" AS
 SELECT "sum"("PR"."Amount") AS "Amount",
    "PR"."PayType",
    "Pay"."PayerType",
    "Pay"."PayerName",
    "R"."RegionName" AS "Region",
    "FD"."DistrictName",
    "Prod"."ProductCode",
    "Prod"."ProductName",
    "O"."Code",
    "O"."LastName",
    "O"."OtherNames",
    "DO"."DistrictName" AS "OfficerDistrict",
    "public"."month"("PR"."PayDate") AS "monthtime",
    "public"."datename_q"("PR"."PayDate") AS "quartertime",
    "public"."year"("PR"."PayDate") AS "yeartime"
   FROM (((((((((("public"."tblPremium" "PR"
     LEFT JOIN "public"."tblPayer" "Pay" ON (("PR"."PayerID" = "Pay"."PayerID")))
     JOIN "public"."tblPolicy" "PL" ON (("PR"."PolicyID" = "PL"."PolicyID")))
     JOIN "public"."tblProduct" "Prod" ON (("PL"."ProdID" = "Prod"."ProdID")))
     JOIN "public"."tblOfficer" "O" ON (("PL"."OfficerID" = "O"."OfficerID")))
     JOIN "public"."tblDistricts" "DO" ON (("O"."LocationId" = "DO"."DistrictId")))
     JOIN "public"."tblFamilies" "F" ON (("PL"."FamilyID" = "F"."FamilyID")))
     JOIN "public"."tblVillages" "V" ON (("V"."VillageId" = "F"."LocationId")))
     JOIN "public"."tblWards" "W" ON (("W"."WardId" = "V"."WardId")))
     JOIN "public"."tblDistricts" "FD" ON (("FD"."DistrictId" = "W"."DistrictId")))
     JOIN "public"."tblRegions" "R" ON (("R"."RegionId" = "FD"."Region")))
  WHERE (("PR"."ValidityTo" IS NULL) AND ("Pay"."ValidityTo" IS NULL) AND ("PL"."ValidityTo" IS NULL) AND ("F"."ValidityTo" IS NULL))
  GROUP BY "PR"."PayType", "Pay"."PayerType", "Pay"."PayerName", "R"."RegionName", "Prod"."ProductCode", "Prod"."ProductName", "O"."Code", "O"."LastName", "O"."OtherNames", "DO"."DistrictName", ("public"."month"("PR"."PayDate")), ("public"."datename_q"("PR"."PayDate")), ("public"."year"("PR"."PayDate")), "FD"."DistrictName";


-- ALTER TABLE "public"."uvwPremiumCollection" OWNER TO "postgres";

--
-- TOC entry 336 (class 1259 OID 21714)
-- Name: uvwServiceExpenditures; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW "public"."uvwServiceExpenditures" AS
 SELECT "sum"("CS"."RemuneratedAmount") AS "ServiceExpenditure",
    "public"."month"(COALESCE("C"."DateTo", "C"."DateFrom")) AS "monthtime",
    "public"."quarter"(COALESCE("C"."DateTo", "C"."DateFrom")) AS "quartertime",
    "public"."year"(COALESCE("C"."DateTo", "C"."DateFrom")) AS "yeartime",
    "R"."RegionName" AS "Region",
    "HFD"."DistrictName",
    "PR"."ProductCode",
    "PR"."ProductName",
    "public"."datediff_year"("I"."DOB", COALESCE("C"."DateTo", "C"."DateFrom")) AS "Age",
    "I"."Gender",
    "S"."ServType",
    "S"."ServCode",
    "S"."ServName",
        CASE
            WHEN ("public"."datediff_day"("C"."DateFrom", "C"."DateTo") > 0) THEN 'I'::"bpchar"
            ELSE 'O'::"bpchar"
        END AS "ServCareType",
    "HF"."HFLevel",
    "HF"."HFCode",
    "HF"."HFName",
    "C"."VisitType",
    "ICD"."ICDCode",
    "ICD"."ICDName",
    "DIns"."DistrictName" AS "IDistrictName",
    "W"."WardName",
    "V"."VillageName",
    "HFD"."DistrictName" AS "HFDistrict",
    "HFR"."RegionName" AS "HFRegion",
    "HFR"."RegionName" AS "ProdRegion"
   FROM ((((((((((((("public"."tblClaimServices" "CS"
     JOIN "public"."tblClaim" "C" ON (("CS"."ClaimID" = "C"."ClaimID")))
     JOIN "public"."tblProduct" "PR" ON (("CS"."ProdID" = "PR"."ProdID")))
     JOIN "public"."tblInsuree" "I" ON (("C"."InsureeID" = "I"."InsureeID")))
     JOIN "public"."tblFamilies" "F" ON (("I"."FamilyID" = "F"."FamilyID")))
     JOIN "public"."tblVillages" "V" ON (("V"."VillageId" = "F"."LocationId")))
     JOIN "public"."tblWards" "W" ON (("W"."WardId" = "V"."WardId")))
     JOIN "public"."tblDistricts" "DIns" ON (("DIns"."DistrictId" = "W"."DistrictId")))
     JOIN "public"."tblServices" "S" ON (("CS"."ServiceID" = "S"."ServiceID")))
     JOIN "public"."tblHF" "HF" ON (("C"."HFID" = "HF"."HfID")))
     JOIN "public"."tblICDCodes" "ICD" ON (("C"."ICDID" = "ICD"."ICDID")))
     JOIN "public"."tblDistricts" "HFD" ON (("HF"."LocationId" = "HFD"."DistrictId")))
     JOIN "public"."tblRegions" "R" ON (("R"."RegionId" = "DIns"."Region")))
     JOIN "public"."tblRegions" "HFR" ON (("HFR"."RegionId" = "HFD"."Region")))
  WHERE (("CS"."ValidityTo" IS NULL) AND ("C"."ValidityTo" IS NULL) AND ("PR"."ValidityTo" IS NULL) AND ("I"."ValidityTo" IS NULL) AND ("S"."ValidityTo" IS NULL) AND ("HF"."ValidityTo" IS NULL) AND ("HFD"."ValidityTo" IS NULL) AND (COALESCE("CS"."PriceValuated", (0)::numeric) > (0)::numeric))
  GROUP BY ("public"."month"(COALESCE("C"."DateTo", "C"."DateFrom"))), ("public"."quarter"(COALESCE("C"."DateTo", "C"."DateFrom"))), ("public"."year"(COALESCE("C"."DateTo", "C"."DateFrom"))), "R"."RegionName", "PR"."ProductCode", "PR"."ProductName", ("public"."datediff_year"("I"."DOB", COALESCE("C"."DateTo", "C"."DateFrom"))), "I"."Gender", "S"."ServType", "S"."ServCode", "S"."ServName", ("public"."datediff_day"("C"."DateFrom", "C"."DateTo")), "HF"."HFLevel", "HF"."HFCode", "HF"."HFName", "C"."VisitType", "ICD"."ICDCode", "ICD"."ICDName", "DIns"."DistrictName", "W"."WardName", "V"."VillageName", "HFD"."DistrictName", "HFR"."RegionName";


-- ALTER TABLE "public"."uvwServiceExpenditures" OWNER TO "postgres";

--
-- TOC entry 341 (class 1259 OID 21743)
-- Name: uvwServiceUtilization; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW "public"."uvwServiceUtilization" AS
 SELECT "sum"("CS"."QtyProvided") AS "serviceutilized",
    "public"."month"(COALESCE("C"."DateTo", "C"."DateFrom")) AS "monthtime",
    "public"."quarter"(COALESCE("C"."DateTo", "C"."DateFrom")) AS "quartertime",
    "public"."year"(COALESCE("C"."DateTo", "C"."DateFrom")) AS "yeartime",
    "R"."RegionName" AS "Region",
    "DIns"."DistrictName",
    "Prod"."ProductCode",
    "Prod"."ProductName",
    "public"."datediff_year"("I"."DOB", COALESCE("C"."DateTo", "C"."DateFrom")) AS "Age",
    "I"."Gender",
    "S"."ServType",
    "S"."ServCode",
    "S"."ServName",
        CASE
            WHEN ("public"."datediff_day"("C"."DateFrom", "C"."DateTo") > 0) THEN 'I'::"bpchar"
            ELSE 'O'::"bpchar"
        END AS "ServCareType",
    "HF"."HFLevel",
    "HF"."HFCode",
    "HF"."HFName",
    "C"."VisitType",
    "ICD"."ICDCode",
    "ICD"."ICDName",
    "DIns"."DistrictName" AS "IDistrictName",
    "W"."WardName",
    "V"."VillageName",
    "HFD"."DistrictName" AS "HFDistrict",
    "HFR"."RegionName" AS "HFRegion",
    "R"."RegionName" AS "ProdRegion"
   FROM ((((((((((((("public"."tblClaimServices" "CS"
     JOIN "public"."tblClaim" "C" ON (("CS"."ClaimID" = "C"."ClaimID")))
     LEFT JOIN "public"."tblProduct" "Prod" ON (("CS"."ProdID" = "Prod"."ProdID")))
     JOIN "public"."tblInsuree" "I" ON (("C"."InsureeID" = "I"."InsureeID")))
     JOIN "public"."tblFamilies" "F" ON (("I"."FamilyID" = "F"."FamilyID")))
     JOIN "public"."tblVillages" "V" ON (("V"."VillageId" = "F"."LocationId")))
     JOIN "public"."tblWards" "W" ON (("W"."WardId" = "V"."WardId")))
     JOIN "public"."tblDistricts" "DIns" ON (("DIns"."DistrictId" = "W"."DistrictId")))
     JOIN "public"."tblServices" "S" ON (("CS"."ServiceID" = "S"."ServiceID")))
     JOIN "public"."tblHF" "HF" ON (("C"."HFID" = "HF"."HfID")))
     JOIN "public"."tblICDCodes" "ICD" ON (("C"."ICDID" = "ICD"."ICDID")))
     JOIN "public"."tblDistricts" "HFD" ON (("HF"."LocationId" = "HFD"."DistrictId")))
     JOIN "public"."tblRegions" "R" ON (("R"."RegionId" = "DIns"."Region")))
     JOIN "public"."tblRegions" "HFR" ON (("HFR"."RegionId" = "HFD"."Region")))
  WHERE (("CS"."ValidityTo" IS NULL) AND ("C"."ValidityTo" IS NULL) AND ("Prod"."ValidityTo" IS NULL) AND ("I"."ValidityTo" IS NULL) AND ("DIns"."ValidityTo" IS NULL) AND ("HF"."ValidityTo" IS NULL) AND ("HFD"."ValidityTo" IS NULL) AND ("F"."ValidityTo" IS NULL) AND ("S"."ValidityTo" IS NULL) AND ("C"."ClaimStatus" > 2) AND ("CS"."RejectionReason" = 0))
  GROUP BY ("public"."month"(COALESCE("C"."DateTo", "C"."DateFrom"))), ("public"."quarter"(COALESCE("C"."DateTo", "C"."DateFrom"))), ("public"."year"(COALESCE("C"."DateTo", "C"."DateFrom"))), "R"."RegionName", "Prod"."ProductCode", "Prod"."ProductName", ("public"."datediff_year"("I"."DOB", COALESCE("C"."DateTo", "C"."DateFrom"))), "I"."Gender", "S"."ServType", "S"."ServCode", "S"."ServName", ("public"."datediff_day"("C"."DateFrom", "C"."DateTo")), "HF"."HFLevel", "HF"."HFCode", "HF"."HFName", "C"."VisitType", "ICD"."ICDCode", "ICD"."ICDName", "DIns"."DistrictName", "W"."WardName", "V"."VillageName", "HFD"."DistrictName", "HFR"."RegionName";


-- ALTER TABLE "public"."uvwServiceUtilization" OWNER TO "postgres";

--
-- TOC entry 334 (class 1259 OID 21704)
-- Name: uvwVisit; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW "public"."uvwVisit" AS
 SELECT "count"("C"."ClaimID") AS "Visits",
    "public"."month"("C"."DateFrom") AS "monthtime",
    "public"."quarter"("C"."DateFrom") AS "quartertime",
    "public"."year"("C"."DateFrom") AS "yeartime",
    "HFR"."RegionName" AS "Region",
    "HFD"."DistrictName",
    "Prod"."ProductCode",
    "Prod"."ProductName",
    "public"."datediff_year"("I"."DOB", "C"."DateFrom") AS "Age",
    "I"."Gender",
    "HF"."HFLevel",
    "HF"."HFCode",
    "HF"."HFName",
    "C"."VisitType",
    "ICD"."ICDCode",
    "ICD"."ICDName",
    "HFD"."DistrictName" AS "HFDistrict",
    "HFR"."RegionName" AS "HFRegion"
   FROM ((((((("public"."tblClaim" "C"
     LEFT JOIN ( SELECT "tblClaimItems"."ClaimID",
            "tblClaimItems"."ProdID"
           FROM "public"."tblClaimItems"
          WHERE (("tblClaimItems"."ValidityTo" IS NULL) AND ("tblClaimItems"."RejectionReason" = 0))
        UNION
         SELECT "tblClaimServices"."ClaimID",
            "tblClaimServices"."ProdID"
           FROM "public"."tblClaimServices"
          WHERE (("tblClaimServices"."ValidityTo" IS NULL) AND ("tblClaimServices"."RejectionReason" = 0))) "Details" ON (("C"."ClaimID" = "Details"."ClaimID")))
     LEFT JOIN "public"."tblProduct" "Prod" ON (("Details"."ProdID" = "Prod"."ProdID")))
     LEFT JOIN "public"."tblInsuree" "I" ON (("C"."InsureeID" = "I"."InsureeID")))
     LEFT JOIN "public"."tblHF" "HF" ON (("C"."HFID" = "HF"."HfID")))
     LEFT JOIN "public"."tblICDCodes" "ICD" ON (("C"."ICDID" = "ICD"."ICDID")))
     LEFT JOIN "public"."tblDistricts" "HFD" ON (("HF"."LocationId" = "HFD"."DistrictId")))
     LEFT JOIN "public"."tblRegions" "HFR" ON (("HFR"."RegionId" = "HFD"."Region")))
  WHERE (("C"."ValidityTo" IS NULL) AND ("Prod"."ValidityTo" IS NULL) AND ("I"."ValidityTo" IS NULL) AND ("HF"."ValidityTo" IS NULL) AND ("HFD"."ValidityTo" IS NULL) AND ("public"."datediff_day"("C"."DateFrom", "C"."DateTo") = 0))
  GROUP BY ("public"."month"("C"."DateFrom")), ("public"."quarter"("C"."DateFrom")), ("public"."year"("C"."DateFrom")), "Prod"."ProductCode", "Prod"."ProductName", ("public"."datediff_year"("I"."DOB", "C"."DateFrom")), "I"."Gender", "HF"."HFLevel", "HF"."HFCode", "HF"."HFName", "C"."VisitType", "ICD"."ICDCode", "ICD"."ICDName", "HFD"."DistrictName", "HFR"."RegionName";


-- ALTER TABLE "public"."uvwVisit" OWNER TO "postgres";


ALTER TABLE ONLY "public"."tblOfficerVillages" ALTER COLUMN "OfficerVillageId" SET DEFAULT "nextval"('"public"."tblOfficerVillages_OfficerVillageId_seq"'::"regclass");



--
-- TOC entry 3357 (class 2604 OID 20932)
-- Name: tblBatchRun RunID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblBatchRun" ALTER COLUMN "RunID" SET DEFAULT "nextval"('"public"."tblBatchRun_RunID_seq"'::"regclass");


--
-- TOC entry 3360 (class 2604 OID 20980)
-- Name: tblClaim ClaimID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblClaim" ALTER COLUMN "ClaimID" SET DEFAULT "nextval"('"public"."tblClaim_ClaimID_seq"'::"regclass");


--
-- TOC entry 3361 (class 2604 OID 20995)
-- Name: tblClaimAdmin ClaimAdminId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblClaimAdmin" ALTER COLUMN "ClaimAdminId" SET DEFAULT "nextval"('"public"."tblClaimAdmin_ClaimAdminId_seq"'::"regclass");


--
-- TOC entry 3362 (class 2604 OID 21016)
-- Name: tblClaimDedRem ExpenditureID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblClaimDedRem" ALTER COLUMN "ExpenditureID" SET DEFAULT "nextval"('"public"."tblClaimDedRem_ExpenditureID_seq"'::"regclass");


--
-- TOC entry 3363 (class 2604 OID 21024)
-- Name: tblClaimItems ClaimItemID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblClaimItems" ALTER COLUMN "ClaimItemID" SET DEFAULT "nextval"('"public"."tblClaimItems_ClaimItemID_seq"'::"regclass");


--
-- TOC entry 3364 (class 2604 OID 21040)
-- Name: tblClaimServices ClaimServiceID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblClaimServices" ALTER COLUMN "ClaimServiceID" SET DEFAULT "nextval"('"public"."tblClaimServices_ClaimServiceID_seq"'::"regclass");


--
-- TOC entry 3348 (class 2604 OID 20721)
-- Name: tblFamilies FamilyID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblFamilies" ALTER COLUMN "FamilyID" SET DEFAULT "nextval"('"public"."tblFamilies_FamilyID_seq"'::"regclass");


--
-- TOC entry 3365 (class 2604 OID 21051)
-- Name: tblFeedback FeedbackID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblFeedback" ALTER COLUMN "FeedbackID" SET DEFAULT "nextval"('"public"."tblFeedback_FeedbackID_seq"'::"regclass");


--
-- TOC entry 3341 (class 2604 OID 20540)
-- Name: tblHF HfID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblHF" ALTER COLUMN "HfID" SET DEFAULT "nextval"('"public"."tblHF_HfID_seq"'::"regclass");


--
-- TOC entry 3342 (class 2604 OID 20550)
-- Name: tblHFCatchment HFCatchmentId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblHFCatchment" ALTER COLUMN "HFCatchmentId" SET DEFAULT "nextval"('"public"."tblHFCatchment_HFCatchmentId_seq"'::"regclass");


--
-- TOC entry 3338 (class 2604 OID 20510)
-- Name: tblICDCodes ICDID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblICDCodes" ALTER COLUMN "ICDID" SET DEFAULT "nextval"('"public"."tblICDCodes_ICDID_seq"'::"regclass");


--
-- TOC entry 3349 (class 2604 OID 20741)
-- Name: tblInsuree InsureeID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblInsuree" ALTER COLUMN "InsureeID" SET DEFAULT "nextval"('"public"."tblInsuree_InsureeID_seq"'::"regclass");


--
-- TOC entry 3350 (class 2604 OID 20754)
-- Name: tblInsureePolicy InsureePolicyID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblInsureePolicy" ALTER COLUMN "InsureePolicyID" SET DEFAULT "nextval"('"public"."tblInsureePolicy_InsureePolicyID_seq"'::"regclass");


--
-- TOC entry 3339 (class 2604 OID 20518)
-- Name: tblItems ItemID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblItems" ALTER COLUMN "ItemID" SET DEFAULT "nextval"('"public"."tblItems_ItemID_seq"'::"regclass");


--
-- TOC entry 3343 (class 2604 OID 20573)
-- Name: tblLocations LocationId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblLocations" ALTER COLUMN "LocationId" SET DEFAULT "nextval"('"public"."tblLocations_LocationId_seq"'::"regclass");


--
-- TOC entry 3331 (class 2604 OID 20351)
-- Name: tblOfficer OfficerID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblOfficer" ALTER COLUMN "OfficerID" SET DEFAULT "nextval"('"public"."tblOfficer_OfficerID_seq"'::"regclass");


--
-- TOC entry 3353 (class 2604 OID 20826)
-- Name: tblPLItems PLItemID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblPLItems" ALTER COLUMN "PLItemID" SET DEFAULT "nextval"('"public"."tblPLItems_PLItemID_seq"'::"regclass");


--
-- TOC entry 3354 (class 2604 OID 20836)
-- Name: tblPLItemsDetail PLItemDetailID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblPLItemsDetail" ALTER COLUMN "PLItemDetailID" SET DEFAULT "nextval"('"public"."tblPLItemsDetail_PLItemDetailID_seq"'::"regclass");


--
-- TOC entry 3355 (class 2604 OID 20844)
-- Name: tblPLServices PLServiceID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblPLServices" ALTER COLUMN "PLServiceID" SET DEFAULT "nextval"('"public"."tblPLServices_PLServiceID_seq"'::"regclass");


--
-- TOC entry 3356 (class 2604 OID 20854)
-- Name: tblPLServicesDetail PLServiceDetailID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblPLServicesDetail" ALTER COLUMN "PLServiceDetailID" SET DEFAULT "nextval"('"public"."tblPLServicesDetail_PLServiceDetailID_seq"'::"regclass");


--
-- TOC entry 3366 (class 2604 OID 21239)
-- Name: tblPayer PayerID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblPayer" ALTER COLUMN "PayerID" SET DEFAULT "nextval"('"public"."tblPayer_PayerID_seq"'::"regclass");


--
-- TOC entry 3351 (class 2604 OID 20762)
-- Name: tblPhotos PhotoID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblPhotos" ALTER COLUMN "PhotoID" SET DEFAULT "nextval"('"public"."tblPhotos_PhotoID_seq"'::"regclass");


--
-- TOC entry 3352 (class 2604 OID 20797)
-- Name: tblPolicy PolicyID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblPolicy" ALTER COLUMN "PolicyID" SET DEFAULT "nextval"('"public"."tblPolicy_PolicyID_seq"'::"regclass");


--
-- TOC entry 3367 (class 2604 OID 21249)
-- Name: tblPremium PremiumId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblPremium" ALTER COLUMN "PremiumId" SET DEFAULT "nextval"('"public"."tblPremium_PremiumId_seq"'::"regclass");


--
-- TOC entry 3345 (class 2604 OID 20654)
-- Name: tblProduct ProdID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblProduct" ALTER COLUMN "ProdID" SET DEFAULT "nextval"('"public"."tblProduct_ProdID_seq"'::"regclass");


--
-- TOC entry 3346 (class 2604 OID 20664)
-- Name: tblProductItems ProdItemID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblProductItems" ALTER COLUMN "ProdItemID" SET DEFAULT "nextval"('"public"."tblProductItems_ProdItemID_seq"'::"regclass");


--
-- TOC entry 3347 (class 2604 OID 20672)
-- Name: tblProductServices ProdServiceID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblProductServices" ALTER COLUMN "ProdServiceID" SET DEFAULT "nextval"('"public"."tblProductServices_ProdServiceID_seq"'::"regclass");


--
-- TOC entry 3358 (class 2604 OID 20940)
-- Name: tblRelDistr DistrID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblRelDistr" ALTER COLUMN "DistrID" SET DEFAULT "nextval"('"public"."tblRelDistr_DistrID_seq"'::"regclass");


--
-- TOC entry 3359 (class 2604 OID 20948)
-- Name: tblRelIndex RelIndexID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblRelIndex" ALTER COLUMN "RelIndexID" SET DEFAULT "nextval"('"public"."tblRelIndex_RelIndexID_seq"'::"regclass");


--
-- TOC entry 3332 (class 2604 OID 20361)
-- Name: tblRole RoleID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblRole" ALTER COLUMN "RoleID" SET DEFAULT "nextval"('"public"."tblRole_RoleID_seq"'::"regclass");


--
-- TOC entry 3333 (class 2604 OID 20369)
-- Name: tblRoleRight RoleRightID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblRoleRight" ALTER COLUMN "RoleRightID" SET DEFAULT "nextval"('"public"."tblRoleRight_RoleRightID_seq"'::"regclass");


--
-- TOC entry 3340 (class 2604 OID 20528)
-- Name: tblServices ServiceID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblServices" ALTER COLUMN "ServiceID" SET DEFAULT "nextval"('"public"."tblServices_ServiceID_seq"'::"regclass");


--
-- TOC entry 3334 (class 2604 OID 20387)
-- Name: tblUserRole UserRoleID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblUserRole" ALTER COLUMN "UserRoleID" SET DEFAULT "nextval"('"public"."tblUserRole_UserRoleID_seq"'::"regclass");


--
-- TOC entry 3330 (class 2604 OID 20317)
-- Name: tblUsers UserID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblUsers" ALTER COLUMN "UserID" SET DEFAULT "nextval"('"public"."tblUsers_UserID_seq"'::"regclass");


--
-- TOC entry 3344 (class 2604 OID 20588)
-- Name: tblUsersDistricts UserDistrictID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblUsersDistricts" ALTER COLUMN "UserDistrictID" SET DEFAULT "nextval"('"public"."tblUsersDistricts_UserDistrictID_seq"'::"regclass");


--
-- TOC entry 3719 (class 2606 OID 25576)
-- Name: tblIMISDefaults PK_tblIMISDefaults; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblIMISDefaults"
    ADD CONSTRAINT "PK_tblIMISDefaults" PRIMARY KEY ("DefaultID");


--
-- TOC entry 3601 (class 2606 OID 20934)
-- Name: tblBatchRun tblBatchRun_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblBatchRun"
    ADD CONSTRAINT "tblBatchRun_pkey" PRIMARY KEY ("RunID");


--
-- TOC entry 3715 (class 2606 OID 25558)
-- Name: tblCeilingInterpretation tblCeilingInterpretation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblCeilingInterpretation"
    ADD CONSTRAINT "tblCeilingInterpretation_pkey" PRIMARY KEY ("CeilingIntCode");


--
-- TOC entry 3627 (class 2606 OID 21002)
-- Name: tblClaimAdmin tblClaimAdmin_ClaimAdminUUID_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblClaimAdmin"
    ADD CONSTRAINT "tblClaimAdmin_ClaimAdminUUID_key" UNIQUE ("ClaimAdminUUID");


--
-- TOC entry 3630 (class 2606 OID 21000)
-- Name: tblClaimAdmin tblClaimAdmin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblClaimAdmin"
    ADD CONSTRAINT "tblClaimAdmin_pkey" PRIMARY KEY ("ClaimAdminId");


--
-- TOC entry 3638 (class 2606 OID 21018)
-- Name: tblClaimDedRem tblClaimDedRem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblClaimDedRem"
    ADD CONSTRAINT "tblClaimDedRem_pkey" PRIMARY KEY ("ExpenditureID");


--
-- TOC entry 3644 (class 2606 OID 21029)
-- Name: tblClaimItems tblClaimItems_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblClaimItems"
    ADD CONSTRAINT "tblClaimItems_pkey" PRIMARY KEY ("ClaimItemID");


--
-- TOC entry 3654 (class 2606 OID 21045)
-- Name: tblClaimServices tblClaimServices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblClaimServices"
    ADD CONSTRAINT "tblClaimServices_pkey" PRIMARY KEY ("ClaimServiceID");


--
-- TOC entry 3614 (class 2606 OID 20987)
-- Name: tblClaim tblClaim_ClaimUUID_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblClaim"
    ADD CONSTRAINT "tblClaim_ClaimUUID_key" UNIQUE ("ClaimUUID");


--
-- TOC entry 3624 (class 2606 OID 20985)
-- Name: tblClaim tblClaim_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblClaim"
    ADD CONSTRAINT "tblClaim_pkey" PRIMARY KEY ("ClaimID");


--
-- TOC entry 3526 (class 2606 OID 20710)
-- Name: tblConfirmationTypes tblConfirmationTypes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblConfirmationTypes"
    ADD CONSTRAINT "tblConfirmationTypes_pkey" PRIMARY KEY ("ConfirmationTypeCode");


--
-- TOC entry 3713 (class 2606 OID 25553)
-- Name: tblControlNumber tblControlNumber_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblControlNumber"
    ADD CONSTRAINT "tblControlNumber_pkey" PRIMARY KEY ("ControlNumberID");


--
-- TOC entry 3711 (class 2606 OID 25537)
-- Name: tblControls tblControls_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblControls"
    ADD CONSTRAINT "tblControls_pkey" PRIMARY KEY ("FieldName");


--
-- TOC entry 3528 (class 2606 OID 20715)
-- Name: tblEducations tblEducations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblEducations"
    ADD CONSTRAINT "tblEducations_pkey" PRIMARY KEY ("EducationId");


--
-- TOC entry 3709 (class 2606 OID 25526)
-- Name: tblExtracts tblExtracts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblExtracts"
    ADD CONSTRAINT "tblExtracts_pkey" PRIMARY KEY ("ExtractID");


--
-- TOC entry 3535 (class 2606 OID 20725)
-- Name: tblFamilies tblFamilies_FamilyUUID_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblFamilies"
    ADD CONSTRAINT "tblFamilies_FamilyUUID_key" UNIQUE ("FamilyUUID");


--
-- TOC entry 3538 (class 2606 OID 20723)
-- Name: tblFamilies tblFamilies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblFamilies"
    ADD CONSTRAINT "tblFamilies_pkey" PRIMARY KEY ("FamilyID");


--
-- TOC entry 3541 (class 2606 OID 20730)
-- Name: tblFamilyTypes tblFamilyTypes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblFamilyTypes"
    ADD CONSTRAINT "tblFamilyTypes_pkey" PRIMARY KEY ("FamilyTypeCode");


--
-- TOC entry 3687 (class 2606 OID 25392)
-- Name: tblFeedbackPrompt tblFeedbackPrompt_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblFeedbackPrompt"
    ADD CONSTRAINT "tblFeedbackPrompt_pkey" PRIMARY KEY ("FeedbackPromptID");


--
-- TOC entry 3656 (class 2606 OID 21062)
-- Name: tblFeedback tblFeedback_ClaimID_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblFeedback"
    ADD CONSTRAINT "tblFeedback_ClaimID_key" UNIQUE ("ClaimID");


--
-- TOC entry 3659 (class 2606 OID 21055)
-- Name: tblFeedback tblFeedback_FeedbackUUID_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblFeedback"
    ADD CONSTRAINT "tblFeedback_FeedbackUUID_key" UNIQUE ("FeedbackUUID");


--
-- TOC entry 3661 (class 2606 OID 21053)
-- Name: tblFeedback tblFeedback_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblFeedback"
    ADD CONSTRAINT "tblFeedback_pkey" PRIMARY KEY ("FeedbackID");


--
-- TOC entry 3707 (class 2606 OID 25518)
-- Name: tblFromPhone tblFromPhone_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblFromPhone"
    ADD CONSTRAINT "tblFromPhone_pkey" PRIMARY KEY ("FromPhoneId");


--
-- TOC entry 3544 (class 2606 OID 20735)
-- Name: tblGender tblGender_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblGender"
    ADD CONSTRAINT "tblGender_pkey" PRIMARY KEY ("Code");


--
-- TOC entry 3484 (class 2606 OID 20552)
-- Name: tblHFCatchment tblHFCatchment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblHFCatchment"
    ADD CONSTRAINT "tblHFCatchment_pkey" PRIMARY KEY ("HFCatchmentId");


--
-- TOC entry 3494 (class 2606 OID 20567)
-- Name: tblHFSublevel tblHFSublevel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblHFSublevel"
    ADD CONSTRAINT "tblHFSublevel_pkey" PRIMARY KEY ("HFSublevel");


--
-- TOC entry 3473 (class 2606 OID 20544)
-- Name: tblHF tblHF_HfUUID_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblHF"
    ADD CONSTRAINT "tblHF_HfUUID_key" UNIQUE ("HfUUID");


--
-- TOC entry 3480 (class 2606 OID 20542)
-- Name: tblHF tblHF_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblHF"
    ADD CONSTRAINT "tblHF_pkey" PRIMARY KEY ("HfID");


--
-- TOC entry 3705 (class 2606 OID 25501)
-- Name: tblHealthStatus tblHealthStatus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblHealthStatus"
    ADD CONSTRAINT "tblHealthStatus_pkey" PRIMARY KEY ("HealthStatusID");


--
-- TOC entry 3458 (class 2606 OID 20512)
-- Name: tblICDCodes tblICDCodes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblICDCodes"
    ADD CONSTRAINT "tblICDCodes_pkey" PRIMARY KEY ("ICDID");


--
-- TOC entry 3703 (class 2606 OID 25496)
-- Name: tblIdentificationTypes tblIdentificationTypes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblIdentificationTypes"
    ADD CONSTRAINT "tblIdentificationTypes_pkey" PRIMARY KEY ("IdentificationCode");


--
-- TOC entry 3561 (class 2606 OID 20756)
-- Name: tblInsureePolicy tblInsureePolicy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblInsureePolicy"
    ADD CONSTRAINT "tblInsureePolicy_pkey" PRIMARY KEY ("InsureePolicyID");


--
-- TOC entry 3552 (class 2606 OID 20748)
-- Name: tblInsuree tblInsuree_InsureeUUID_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblInsuree"
    ADD CONSTRAINT "tblInsuree_InsureeUUID_key" UNIQUE ("InsureeUUID");


--
-- TOC entry 3557 (class 2606 OID 20746)
-- Name: tblInsuree tblInsuree_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblInsuree"
    ADD CONSTRAINT "tblInsuree_pkey" PRIMARY KEY ("InsureeID");


--
-- TOC entry 3461 (class 2606 OID 20522)
-- Name: tblItems tblItems_ItemUUID_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblItems"
    ADD CONSTRAINT "tblItems_ItemUUID_key" UNIQUE ("ItemUUID");


--
-- TOC entry 3463 (class 2606 OID 20520)
-- Name: tblItems tblItems_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblItems"
    ADD CONSTRAINT "tblItems_pkey" PRIMARY KEY ("ItemID");


--
-- TOC entry 3421 (class 2606 OID 20329)
-- Name: tblLanguages tblLanguages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblLanguages"
    ADD CONSTRAINT "tblLanguages_pkey" PRIMARY KEY ("LanguageCode");


--
-- TOC entry 3487 (class 2606 OID 20557)
-- Name: tblLegalForms tblLegalForms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblLegalForms"
    ADD CONSTRAINT "tblLegalForms_pkey" PRIMARY KEY ("LegalFormCode");


--
-- TOC entry 3497 (class 2606 OID 20577)
-- Name: tblLocations tblLocations_LocationUUID_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblLocations"
    ADD CONSTRAINT "tblLocations_LocationUUID_key" UNIQUE ("LocationUUID");


--
-- TOC entry 3500 (class 2606 OID 20575)
-- Name: tblLocations tblLocations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblLocations"
    ADD CONSTRAINT "tblLocations_pkey" PRIMARY KEY ("LocationId");


--
-- TOC entry 3689 (class 2606 OID 25403)
-- Name: tblLogins tblLogins_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblLogins"
    ADD CONSTRAINT "tblLogins_pkey" PRIMARY KEY ("LoginId");


--
-- TOC entry 3721 (class 2606 OID 25592)
-- Name: tblOfficerVillages tblOfficerVillages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblOfficerVillages"
    ADD CONSTRAINT "tblOfficerVillages_pkey" PRIMARY KEY ("OfficerVillageId");


--
-- TOC entry 3430 (class 2606 OID 20355)
-- Name: tblOfficer tblOfficer_OfficerUUID_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblOfficer"
    ADD CONSTRAINT "tblOfficer_OfficerUUID_key" UNIQUE ("OfficerUUID");


--
-- TOC entry 3432 (class 2606 OID 20353)
-- Name: tblOfficer tblOfficer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblOfficer"
    ADD CONSTRAINT "tblOfficer_pkey" PRIMARY KEY ("OfficerID");


--
-- TOC entry 3588 (class 2606 OID 20838)
-- Name: tblPLItemsDetail tblPLItemsDetail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblPLItemsDetail"
    ADD CONSTRAINT "tblPLItemsDetail_pkey" PRIMARY KEY ("PLItemDetailID");


--
-- TOC entry 3582 (class 2606 OID 20830)
-- Name: tblPLItems tblPLItems_PLItemUUID_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblPLItems"
    ADD CONSTRAINT "tblPLItems_PLItemUUID_key" UNIQUE ("PLItemUUID");


--
-- TOC entry 3584 (class 2606 OID 20828)
-- Name: tblPLItems tblPLItems_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblPLItems"
    ADD CONSTRAINT "tblPLItems_pkey" PRIMARY KEY ("PLItemID");


--
-- TOC entry 3598 (class 2606 OID 20856)
-- Name: tblPLServicesDetail tblPLServicesDetail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblPLServicesDetail"
    ADD CONSTRAINT "tblPLServicesDetail_pkey" PRIMARY KEY ("PLServiceDetailID");


--
-- TOC entry 3592 (class 2606 OID 20848)
-- Name: tblPLServices tblPLServices_PLServiceUUID_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblPLServices"
    ADD CONSTRAINT "tblPLServices_PLServiceUUID_key" UNIQUE ("PLServiceUUID");


--
-- TOC entry 3594 (class 2606 OID 20846)
-- Name: tblPLServices tblPLServices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblPLServices"
    ADD CONSTRAINT "tblPLServices_pkey" PRIMARY KEY ("PLServiceID");


--
-- TOC entry 3717 (class 2606 OID 25568)
-- Name: tblPayerType tblPayerType_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblPayerType"
    ADD CONSTRAINT "tblPayerType_pkey" PRIMARY KEY ("PayerType");


--
-- TOC entry 3665 (class 2606 OID 21243)
-- Name: tblPayer tblPayer_PayerUUID_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblPayer"
    ADD CONSTRAINT "tblPayer_PayerUUID_key" UNIQUE ("PayerUUID");


--
-- TOC entry 3667 (class 2606 OID 21241)
-- Name: tblPayer tblPayer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblPayer"
    ADD CONSTRAINT "tblPayer_pkey" PRIMARY KEY ("PayerID");


--
-- TOC entry 3693 (class 2606 OID 25441)
-- Name: tblPaymentDetails tblPaymentDetails_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblPaymentDetails"
    ADD CONSTRAINT "tblPaymentDetails_pkey" PRIMARY KEY ("PaymentDetailsID");


--
-- TOC entry 3691 (class 2606 OID 25436)
-- Name: tblPayment tblPayment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblPayment"
    ADD CONSTRAINT "tblPayment_pkey" PRIMARY KEY ("PaymentID");


--
-- TOC entry 3564 (class 2606 OID 20769)
-- Name: tblPhotos tblPhotos_PhotoUUID_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblPhotos"
    ADD CONSTRAINT "tblPhotos_PhotoUUID_key" UNIQUE ("PhotoUUID");


--
-- TOC entry 3566 (class 2606 OID 20767)
-- Name: tblPhotos tblPhotos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblPhotos"
    ADD CONSTRAINT "tblPhotos_pkey" PRIMARY KEY ("PhotoID");


--
-- TOC entry 3697 (class 2606 OID 25471)
-- Name: tblPolicyRenewalDetails tblPolicyRenewalDetails_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblPolicyRenewalDetails"
    ADD CONSTRAINT "tblPolicyRenewalDetails_pkey" PRIMARY KEY ("RenewalDetailID");


--
-- TOC entry 3695 (class 2606 OID 25446)
-- Name: tblPolicyRenewals tblPolicyRenewals_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblPolicyRenewals"
    ADD CONSTRAINT "tblPolicyRenewals_pkey" PRIMARY KEY ("RenewalID");


--
-- TOC entry 3575 (class 2606 OID 20801)
-- Name: tblPolicy tblPolicy_PolicyUUID_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblPolicy"
    ADD CONSTRAINT "tblPolicy_PolicyUUID_key" UNIQUE ("PolicyUUID");


--
-- TOC entry 3578 (class 2606 OID 20799)
-- Name: tblPolicy tblPolicy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblPolicy"
    ADD CONSTRAINT "tblPolicy_pkey" PRIMARY KEY ("PolicyID");


--
-- TOC entry 3672 (class 2606 OID 21253)
-- Name: tblPremium tblPremium_PremiumUUID_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblPremium"
    ADD CONSTRAINT "tblPremium_PremiumUUID_key" UNIQUE ("PremiumUUID");


--
-- TOC entry 3674 (class 2606 OID 21251)
-- Name: tblPremium tblPremium_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblPremium"
    ADD CONSTRAINT "tblPremium_pkey" PRIMARY KEY ("PremiumId");


--
-- TOC entry 3519 (class 2606 OID 20666)
-- Name: tblProductItems tblProductItems_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblProductItems"
    ADD CONSTRAINT "tblProductItems_pkey" PRIMARY KEY ("ProdItemID");


--
-- TOC entry 3523 (class 2606 OID 20674)
-- Name: tblProductServices tblProductServices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblProductServices"
    ADD CONSTRAINT "tblProductServices_pkey" PRIMARY KEY ("ProdServiceID");


--
-- TOC entry 3513 (class 2606 OID 20658)
-- Name: tblProduct tblProduct_ProdUUID_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblProduct"
    ADD CONSTRAINT "tblProduct_ProdUUID_key" UNIQUE ("ProdUUID");


--
-- TOC entry 3515 (class 2606 OID 20656)
-- Name: tblProduct tblProduct_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblProduct"
    ADD CONSTRAINT "tblProduct_pkey" PRIMARY KEY ("ProdID");


--
-- TOC entry 3568 (class 2606 OID 20774)
-- Name: tblProfessions tblProfessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblProfessions"
    ADD CONSTRAINT "tblProfessions_pkey" PRIMARY KEY ("ProfessionId");


--
-- TOC entry 3604 (class 2606 OID 20942)
-- Name: tblRelDistr tblRelDistr_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblRelDistr"
    ADD CONSTRAINT "tblRelDistr_pkey" PRIMARY KEY ("DistrID");


--
-- TOC entry 3608 (class 2606 OID 20950)
-- Name: tblRelIndex tblRelIndex_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblRelIndex"
    ADD CONSTRAINT "tblRelIndex_pkey" PRIMARY KEY ("RelIndexID");


--
-- TOC entry 3570 (class 2606 OID 20779)
-- Name: tblRelations tblRelations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblRelations"
    ADD CONSTRAINT "tblRelations_pkey" PRIMARY KEY ("RelationId");


--
-- TOC entry 3699 (class 2606 OID 25486)
-- Name: tblReporting tblReporting_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblReporting"
    ADD CONSTRAINT "tblReporting_pkey" PRIMARY KEY ("ReportingId");


--
-- TOC entry 3437 (class 2606 OID 20371)
-- Name: tblRoleRight tblRoleRight_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblRoleRight"
    ADD CONSTRAINT "tblRoleRight_pkey" PRIMARY KEY ("RoleRightID");


--
-- TOC entry 3434 (class 2606 OID 20363)
-- Name: tblRole tblRole_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblRole"
    ADD CONSTRAINT "tblRole_pkey" PRIMARY KEY ("RoleID");


--
-- TOC entry 3466 (class 2606 OID 20532)
-- Name: tblServices tblServices_ServiceUUID_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblServices"
    ADD CONSTRAINT "tblServices_ServiceUUID_key" UNIQUE ("ServiceUUID");


--
-- TOC entry 3468 (class 2606 OID 20530)
-- Name: tblServices tblServices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblServices"
    ADD CONSTRAINT "tblServices_pkey" PRIMARY KEY ("ServiceID");


--
-- TOC entry 3701 (class 2606 OID 25491)
-- Name: tblSubmittedPhotos tblSubmittedPhotos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblSubmittedPhotos"
    ADD CONSTRAINT "tblSubmittedPhotos_pkey" PRIMARY KEY ("PhotoId");


--
-- TOC entry 3446 (class 2606 OID 20389)
-- Name: tblUserRole tblUserRole_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblUserRole"
    ADD CONSTRAINT "tblUserRole_pkey" PRIMARY KEY ("UserRoleID");


--
-- TOC entry 3508 (class 2606 OID 20590)
-- Name: tblUsersDistricts tblUsersDistricts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblUsersDistricts"
    ADD CONSTRAINT "tblUsersDistricts_pkey" PRIMARY KEY ("UserDistrictID");


--
-- TOC entry 3416 (class 2606 OID 20324)
-- Name: tblUsers tblUsers_UserUUID_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblUsers"
    ADD CONSTRAINT "tblUsers_UserUUID_key" UNIQUE ("UserUUID");


--
-- TOC entry 3418 (class 2606 OID 20322)
-- Name: tblUsers tblUsers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblUsers"
    ADD CONSTRAINT "tblUsers_pkey" PRIMARY KEY ("UserID");



--
-- TOC entry 3599 (class 1259 OID 20969)
-- Name: tblBatchRun_LocationId_e8145c5a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblBatchRun_LocationId_e8145c5a" ON "public"."tblBatchRun" USING "btree" ("LocationId");


--
-- TOC entry 3625 (class 1259 OID 21065)
-- Name: tblClaimAdmin_ClaimAdminUUID_865128b0_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblClaimAdmin_ClaimAdminUUID_865128b0_like" ON "public"."tblClaimAdmin" USING "btree" ("ClaimAdminUUID" "varchar_pattern_ops");


--
-- TOC entry 3628 (class 1259 OID 21163)
-- Name: tblClaimAdmin_HFId_b95da5ef; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblClaimAdmin_HFId_b95da5ef" ON "public"."tblClaimAdmin" USING "btree" ("HFId");


--
-- TOC entry 3634 (class 1259 OID 21139)
-- Name: tblClaimDedRem_ClaimID_273b3ea8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblClaimDedRem_ClaimID_273b3ea8" ON "public"."tblClaimDedRem" USING "btree" ("ClaimID");


--
-- TOC entry 3635 (class 1259 OID 21145)
-- Name: tblClaimDedRem_InsureeID_060ad9ea; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblClaimDedRem_InsureeID_060ad9ea" ON "public"."tblClaimDedRem" USING "btree" ("InsureeID");


--
-- TOC entry 3636 (class 1259 OID 21151)
-- Name: tblClaimDedRem_PolicyID_d317b32a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblClaimDedRem_PolicyID_d317b32a" ON "public"."tblClaimDedRem" USING "btree" ("PolicyID");


--
-- TOC entry 3639 (class 1259 OID 21115)
-- Name: tblClaimItems_ClaimID_dae5ee72; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblClaimItems_ClaimID_dae5ee72" ON "public"."tblClaimItems" USING "btree" ("ClaimID");


--
-- TOC entry 3640 (class 1259 OID 21121)
-- Name: tblClaimItems_ItemID_87f5f3db; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblClaimItems_ItemID_87f5f3db" ON "public"."tblClaimItems" USING "btree" ("ItemID");


--
-- TOC entry 3641 (class 1259 OID 21127)
-- Name: tblClaimItems_PolicyID_46dca31d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblClaimItems_PolicyID_46dca31d" ON "public"."tblClaimItems" USING "btree" ("PolicyID");


--
-- TOC entry 3642 (class 1259 OID 21133)
-- Name: tblClaimItems_ProdID_2972c886; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblClaimItems_ProdID_2972c886" ON "public"."tblClaimItems" USING "btree" ("ProdID");


--
-- TOC entry 3649 (class 1259 OID 21077)
-- Name: tblClaimServices_ClaimID_b01b2746; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblClaimServices_ClaimID_b01b2746" ON "public"."tblClaimServices" USING "btree" ("ClaimID");


--
-- TOC entry 3650 (class 1259 OID 21085)
-- Name: tblClaimServices_PolicyID_ae42a88a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblClaimServices_PolicyID_ae42a88a" ON "public"."tblClaimServices" USING "btree" ("PolicyID");


--
-- TOC entry 3651 (class 1259 OID 21091)
-- Name: tblClaimServices_ProdID_71382956; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblClaimServices_ProdID_71382956" ON "public"."tblClaimServices" USING "btree" ("ProdID");


--
-- TOC entry 3652 (class 1259 OID 21097)
-- Name: tblClaimServices_ServiceID_3b91b421; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblClaimServices_ServiceID_3b91b421" ON "public"."tblClaimServices" USING "btree" ("ServiceID");


--
-- TOC entry 3609 (class 1259 OID 21169)
-- Name: tblClaim_Adjuster_260f1304; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblClaim_Adjuster_260f1304" ON "public"."tblClaim" USING "btree" ("Adjuster");


--
-- TOC entry 3610 (class 1259 OID 21175)
-- Name: tblClaim_ClaimAdminId_0ef46dbe; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblClaim_ClaimAdminId_0ef46dbe" ON "public"."tblClaim" USING "btree" ("ClaimAdminId");


--
-- TOC entry 3611 (class 1259 OID 21064)
-- Name: tblClaim_ClaimCode_5da2c346_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblClaim_ClaimCode_5da2c346_like" ON "public"."tblClaim" USING "btree" ("ClaimCode" "varchar_pattern_ops");


--
-- TOC entry 3612 (class 1259 OID 21063)
-- Name: tblClaim_ClaimUUID_8810870b_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblClaim_ClaimUUID_8810870b_like" ON "public"."tblClaim" USING "btree" ("ClaimUUID" "varchar_pattern_ops");


--
-- TOC entry 3615 (class 1259 OID 21192)
-- Name: tblClaim_HFID_e19ce816; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblClaim_HFID_e19ce816" ON "public"."tblClaim" USING "btree" ("HFID");


--
-- TOC entry 3616 (class 1259 OID 21204)
-- Name: tblClaim_ICDID1_bda229e5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblClaim_ICDID1_bda229e5" ON "public"."tblClaim" USING "btree" ("ICDID1");


--
-- TOC entry 3617 (class 1259 OID 21210)
-- Name: tblClaim_ICDID2_01114040; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblClaim_ICDID2_01114040" ON "public"."tblClaim" USING "btree" ("ICDID2");


--
-- TOC entry 3618 (class 1259 OID 21216)
-- Name: tblClaim_ICDID3_046d79c3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblClaim_ICDID3_046d79c3" ON "public"."tblClaim" USING "btree" ("ICDID3");


--
-- TOC entry 3619 (class 1259 OID 21222)
-- Name: tblClaim_ICDID4_2397d9bd; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblClaim_ICDID4_2397d9bd" ON "public"."tblClaim" USING "btree" ("ICDID4");


--
-- TOC entry 3620 (class 1259 OID 21198)
-- Name: tblClaim_ICDID_e47cee10; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblClaim_ICDID_e47cee10" ON "public"."tblClaim" USING "btree" ("ICDID");


--
-- TOC entry 3621 (class 1259 OID 21228)
-- Name: tblClaim_InsureeID_b81e59ed; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblClaim_InsureeID_b81e59ed" ON "public"."tblClaim" USING "btree" ("InsureeID");


--
-- TOC entry 3622 (class 1259 OID 21181)
-- Name: tblClaim_RunID_a819cd42; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblClaim_RunID_a819cd42" ON "public"."tblClaim" USING "btree" ("RunID");


--
-- TOC entry 3524 (class 1259 OID 20780)
-- Name: tblConfirmationTypes_ConfirmationTypeCode_ec61e83d_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblConfirmationTypes_ConfirmationTypeCode_ec61e83d_like" ON "public"."tblConfirmationTypes" USING "btree" ("ConfirmationTypeCode" "varchar_pattern_ops");


--
-- TOC entry 3529 (class 1259 OID 21333)
-- Name: tblFamilies_ConfirmationType_bcb4c6c3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblFamilies_ConfirmationType_bcb4c6c3" ON "public"."tblFamilies" USING "btree" ("ConfirmationType");


--
-- TOC entry 3530 (class 1259 OID 21334)
-- Name: tblFamilies_ConfirmationType_bcb4c6c3_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblFamilies_ConfirmationType_bcb4c6c3_like" ON "public"."tblFamilies" USING "btree" ("ConfirmationType" "varchar_pattern_ops");


--
-- TOC entry 3531 (class 1259 OID 21340)
-- Name: tblFamilies_FamilyType_bee7213f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblFamilies_FamilyType_bee7213f" ON "public"."tblFamilies" USING "btree" ("FamilyType");


--
-- TOC entry 3532 (class 1259 OID 21341)
-- Name: tblFamilies_FamilyType_bee7213f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblFamilies_FamilyType_bee7213f_like" ON "public"."tblFamilies" USING "btree" ("FamilyType" "varchar_pattern_ops");


--
-- TOC entry 3533 (class 1259 OID 20781)
-- Name: tblFamilies_FamilyUUID_2602bc63_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblFamilies_FamilyUUID_2602bc63_like" ON "public"."tblFamilies" USING "btree" ("FamilyUUID" "varchar_pattern_ops");


--
-- TOC entry 3536 (class 1259 OID 21352)
-- Name: tblFamilies_LocationId_a1cec0d8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblFamilies_LocationId_a1cec0d8" ON "public"."tblFamilies" USING "btree" ("LocationId");


--
-- TOC entry 3539 (class 1259 OID 20782)
-- Name: tblFamilyTypes_FamilyTypeCode_8e75d6dc_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblFamilyTypes_FamilyTypeCode_8e75d6dc_like" ON "public"."tblFamilyTypes" USING "btree" ("FamilyTypeCode" "varchar_pattern_ops");


--
-- TOC entry 3657 (class 1259 OID 21066)
-- Name: tblFeedback_FeedbackUUID_fac958c0_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblFeedback_FeedbackUUID_fac958c0_like" ON "public"."tblFeedback" USING "btree" ("FeedbackUUID" "varchar_pattern_ops");


--
-- TOC entry 3542 (class 1259 OID 20783)
-- Name: tblGender_Code_826963f5_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblGender_Code_826963f5_like" ON "public"."tblGender" USING "btree" ("Code" "varchar_pattern_ops");


--
-- TOC entry 3481 (class 1259 OID 20597)
-- Name: tblHFCatchment_HFID_81949f39; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblHFCatchment_HFID_81949f39" ON "public"."tblHFCatchment" USING "btree" ("HFID");


--
-- TOC entry 3482 (class 1259 OID 20643)
-- Name: tblHFCatchment_LocationId_9dc42e7d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblHFCatchment_LocationId_9dc42e7d" ON "public"."tblHFCatchment" USING "btree" ("LocationId");


--
-- TOC entry 3492 (class 1259 OID 20611)
-- Name: tblHFSublevel_HFSublevel_9b1bf0c1_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblHFSublevel_HFSublevel_9b1bf0c1_like" ON "public"."tblHFSublevel" USING "btree" ("HFSublevel" "varchar_pattern_ops");


--
-- TOC entry 3469 (class 1259 OID 20920)
-- Name: tblHF_HFSublevel_99fb0809; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblHF_HFSublevel_99fb0809" ON "public"."tblHF" USING "btree" ("HFSublevel");


--
-- TOC entry 3470 (class 1259 OID 20921)
-- Name: tblHF_HFSublevel_99fb0809_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblHF_HFSublevel_99fb0809_like" ON "public"."tblHF" USING "btree" ("HFSublevel" "varchar_pattern_ops");


--
-- TOC entry 3471 (class 1259 OID 20591)
-- Name: tblHF_HfUUID_31e0d742_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblHF_HfUUID_31e0d742_like" ON "public"."tblHF" USING "btree" ("HfUUID" "varchar_pattern_ops");


--
-- TOC entry 3474 (class 1259 OID 20901)
-- Name: tblHF_LegalForm_950c70ad; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblHF_LegalForm_950c70ad" ON "public"."tblHF" USING "btree" ("LegalForm");


--
-- TOC entry 3475 (class 1259 OID 20902)
-- Name: tblHF_LegalForm_950c70ad_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblHF_LegalForm_950c70ad_like" ON "public"."tblHF" USING "btree" ("LegalForm" "varchar_pattern_ops");


--
-- TOC entry 3476 (class 1259 OID 20908)
-- Name: tblHF_LocationId_1b9634eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblHF_LocationId_1b9634eb" ON "public"."tblHF" USING "btree" ("LocationId");


--
-- TOC entry 3477 (class 1259 OID 20895)
-- Name: tblHF_PLItemID_2276bb56; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblHF_PLItemID_2276bb56" ON "public"."tblHF" USING "btree" ("PLItemID");


--
-- TOC entry 3478 (class 1259 OID 20914)
-- Name: tblHF_PLServiceID_b08acd41; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblHF_PLServiceID_b08acd41" ON "public"."tblHF" USING "btree" ("PLServiceID");


--
-- TOC entry 3558 (class 1259 OID 20790)
-- Name: tblInsureePolicy_InsureeId_f98ddacc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblInsureePolicy_InsureeId_f98ddacc" ON "public"."tblInsureePolicy" USING "btree" ("InsureeID");


--
-- TOC entry 3559 (class 1259 OID 21284)
-- Name: tblInsureePolicy_PolicyId_2e30ab9f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblInsureePolicy_PolicyId_2e30ab9f" ON "public"."tblInsureePolicy" USING "btree" ("PolicyId");


--
-- TOC entry 3545 (class 1259 OID 21290)
-- Name: tblInsuree_Education_92d6d161; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblInsuree_Education_92d6d161" ON "public"."tblInsuree" USING "btree" ("Education");


--
-- TOC entry 3546 (class 1259 OID 21296)
-- Name: tblInsuree_FamilyID_fd2608e5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblInsuree_FamilyID_fd2608e5" ON "public"."tblInsuree" USING "btree" ("FamilyID");


--
-- TOC entry 3547 (class 1259 OID 21302)
-- Name: tblInsuree_Gender_684d27ce; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblInsuree_Gender_684d27ce" ON "public"."tblInsuree" USING "btree" ("Gender");


--
-- TOC entry 3548 (class 1259 OID 21303)
-- Name: tblInsuree_Gender_684d27ce_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblInsuree_Gender_684d27ce_like" ON "public"."tblInsuree" USING "btree" ("Gender" "varchar_pattern_ops");


--
-- TOC entry 3549 (class 1259 OID 21309)
-- Name: tblInsuree_HFID_6dd10883; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblInsuree_HFID_6dd10883" ON "public"."tblInsuree" USING "btree" ("HFID");


--
-- TOC entry 3550 (class 1259 OID 20784)
-- Name: tblInsuree_InsureeUUID_88c0edbf_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblInsuree_InsureeUUID_88c0edbf_like" ON "public"."tblInsuree" USING "btree" ("InsureeUUID" "varchar_pattern_ops");


--
-- TOC entry 3553 (class 1259 OID 21315)
-- Name: tblInsuree_PhotoID_a0c76ec1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblInsuree_PhotoID_a0c76ec1" ON "public"."tblInsuree" USING "btree" ("PhotoID");


--
-- TOC entry 3554 (class 1259 OID 21321)
-- Name: tblInsuree_Profession_baa97c52; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblInsuree_Profession_baa97c52" ON "public"."tblInsuree" USING "btree" ("Profession");


--
-- TOC entry 3555 (class 1259 OID 21327)
-- Name: tblInsuree_Relationship_abc21144; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblInsuree_Relationship_abc21144" ON "public"."tblInsuree" USING "btree" ("Relationship");


--
-- TOC entry 3459 (class 1259 OID 20533)
-- Name: tblItems_ItemUUID_7a25d200_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblItems_ItemUUID_7a25d200_like" ON "public"."tblItems" USING "btree" ("ItemUUID" "varchar_pattern_ops");


--
-- TOC entry 3419 (class 1259 OID 20415)
-- Name: tblLanguages_LanguageCode_7275408d_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblLanguages_LanguageCode_7275408d_like" ON "public"."tblLanguages" USING "btree" ("LanguageCode" "varchar_pattern_ops");


--
-- TOC entry 3485 (class 1259 OID 20598)
-- Name: tblLegalForms_LegalFormCode_36d2d2fd_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblLegalForms_LegalFormCode_36d2d2fd_like" ON "public"."tblLegalForms" USING "btree" ("LegalFormCode" "varchar_pattern_ops");


--
-- TOC entry 3495 (class 1259 OID 20617)
-- Name: tblLocations_LocationUUID_236a65f8_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblLocations_LocationUUID_236a65f8_like" ON "public"."tblLocations" USING "btree" ("LocationUUID" "varchar_pattern_ops");


--
-- TOC entry 3498 (class 1259 OID 20618)
-- Name: tblLocations_ParentLocationId_5ba57c61; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblLocations_ParentLocationId_5ba57c61" ON "public"."tblLocations" USING "btree" ("ParentLocationId");


--
-- TOC entry 3427 (class 1259 OID 22185)
-- Name: tblOfficer_OfficerIDSubst_29656666; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblOfficer_OfficerIDSubst_29656666" ON "public"."tblOfficer" USING "btree" ("OfficerIDSubst");


--
-- TOC entry 3428 (class 1259 OID 20422)
-- Name: tblOfficer_OfficerUUID_142745c8_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblOfficer_OfficerUUID_142745c8_like" ON "public"."tblOfficer" USING "btree" ("OfficerUUID" "varchar_pattern_ops");


--
-- TOC entry 3585 (class 1259 OID 20874)
-- Name: tblPLItemsDetail_ItemID_52cf508b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblPLItemsDetail_ItemID_52cf508b" ON "public"."tblPLItemsDetail" USING "btree" ("ItemID");


--
-- TOC entry 3586 (class 1259 OID 20875)
-- Name: tblPLItemsDetail_PLItemID_62dff0ac; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblPLItemsDetail_PLItemID_62dff0ac" ON "public"."tblPLItemsDetail" USING "btree" ("PLItemID");


--
-- TOC entry 3579 (class 1259 OID 20863)
-- Name: tblPLItems_LocationId_91a6b728; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblPLItems_LocationId_91a6b728" ON "public"."tblPLItems" USING "btree" ("LocationId");


--
-- TOC entry 3580 (class 1259 OID 20862)
-- Name: tblPLItems_PLItemUUID_6641f700_like; Type: INDEX; Schema: public; Owner: postgres
--

-- TODO
-- CREATE INDEX "tblPLItems_PLItemUUID_6641f700_like" ON "public"."tblPLItems" USING "btree" ("PLItemUUID" "varchar_pattern_ops");


--
-- TOC entry 3595 (class 1259 OID 20894)
-- Name: tblPLServicesDetail_PLServiceID_53e7d206; Type: INDEX; Schema: public; Owner: postgres
--
-- TODO
-- CREATE INDEX "tblPLServicesDetail_PLServiceID_53e7d206" ON "public"."tblPLServicesDetail" USING "btree" ("PLServiceID");


--
-- TOC entry 3596 (class 1259 OID 20893)
-- Name: tblPLServicesDetail_ServiceID_884bbf6b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblPLServicesDetail_ServiceID_884bbf6b" ON "public"."tblPLServicesDetail" USING "btree" ("ServiceID");


--
-- TOC entry 3589 (class 1259 OID 20882)
-- Name: tblPLServices_LocationId_b9340268; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblPLServices_LocationId_b9340268" ON "public"."tblPLServices" USING "btree" ("LocationId");


--
-- TOC entry 3590 (class 1259 OID 20881)
-- Name: tblPLServices_PLServiceUUID_30c97285_like; Type: INDEX; Schema: public; Owner: postgres
--

-- TODO
-- CREATE INDEX "tblPLServices_PLServiceUUID_30c97285_like" ON "public"."tblPLServices" USING "btree" ("PLServiceUUID" "varchar_pattern_ops");


--
-- TOC entry 3662 (class 1259 OID 21268)
-- Name: tblPayer_LocationId_240be842; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblPayer_LocationId_240be842" ON "public"."tblPayer" USING "btree" ("LocationId");


--
-- TOC entry 3663 (class 1259 OID 21254)
-- Name: tblPayer_PayerUUID_dfe9a7c7_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblPayer_PayerUUID_dfe9a7c7_like" ON "public"."tblPayer" USING "btree" ("PayerUUID" "varchar_pattern_ops");


--
-- TOC entry 3562 (class 1259 OID 20791)
-- Name: tblPhotos_PhotoUUID_8f5fba24_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblPhotos_PhotoUUID_8f5fba24_like" ON "public"."tblPhotos" USING "btree" ("PhotoUUID" "varchar_pattern_ops");


--
-- TOC entry 3571 (class 1259 OID 20818)
-- Name: tblPolicy_FamilyID_59ad2bf3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblPolicy_FamilyID_59ad2bf3" ON "public"."tblPolicy" USING "btree" ("FamilyID");


--
-- TOC entry 3572 (class 1259 OID 20819)
-- Name: tblPolicy_OfficerID_7a16e507; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblPolicy_OfficerID_7a16e507" ON "public"."tblPolicy" USING "btree" ("OfficerID");


--
-- TOC entry 3573 (class 1259 OID 20817)
-- Name: tblPolicy_PolicyUUID_c77172a1_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblPolicy_PolicyUUID_c77172a1_like" ON "public"."tblPolicy" USING "btree" ("PolicyUUID" "varchar_pattern_ops");


--
-- TOC entry 3576 (class 1259 OID 20820)
-- Name: tblPolicy_ProdID_70a26314; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblPolicy_ProdID_70a26314" ON "public"."tblPolicy" USING "btree" ("ProdID");


--
-- TOC entry 3668 (class 1259 OID 21261)
-- Name: tblPremium_PayerID_01ec1db8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblPremium_PayerID_01ec1db8" ON "public"."tblPremium" USING "btree" ("PayerID");


--
-- TOC entry 3669 (class 1259 OID 21262)
-- Name: tblPremium_PolicyID_5d8a7e70; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblPremium_PolicyID_5d8a7e70" ON "public"."tblPremium" USING "btree" ("PolicyID");


--
-- TOC entry 3670 (class 1259 OID 21260)
-- Name: tblPremium_PremiumUUID_51645b98_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblPremium_PremiumUUID_51645b98_like" ON "public"."tblPremium" USING "btree" ("PremiumUUID" "varchar_pattern_ops");


--
-- TOC entry 3516 (class 1259 OID 20692)
-- Name: tblProductItems_ItemID_6dfbe285; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblProductItems_ItemID_6dfbe285" ON "public"."tblProductItems" USING "btree" ("ItemID");


--
-- TOC entry 3517 (class 1259 OID 20693)
-- Name: tblProductItems_ProdID_40862a5c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblProductItems_ProdID_40862a5c" ON "public"."tblProductItems" USING "btree" ("ProdID");


--
-- TOC entry 3520 (class 1259 OID 20704)
-- Name: tblProductServices_ProdID_e48650a8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblProductServices_ProdID_e48650a8" ON "public"."tblProductServices" USING "btree" ("ProdID");


--
-- TOC entry 3521 (class 1259 OID 20705)
-- Name: tblProductServices_ServiceID_5e0a03a5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblProductServices_ServiceID_5e0a03a5" ON "public"."tblProductServices" USING "btree" ("ServiceID");


--
-- TOC entry 3509 (class 1259 OID 22249)
-- Name: tblProduct_ConversionProdID_83d83b2f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblProduct_ConversionProdID_83d83b2f" ON "public"."tblProduct" USING "btree" ("ConversionProdID");


--
-- TOC entry 3510 (class 1259 OID 20681)
-- Name: tblProduct_LocationId_7bb534bc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblProduct_LocationId_7bb534bc" ON "public"."tblProduct" USING "btree" ("LocationId");


--
-- TOC entry 3511 (class 1259 OID 20680)
-- Name: tblProduct_ProdUUID_b50a1104_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblProduct_ProdUUID_b50a1104_like" ON "public"."tblProduct" USING "btree" ("ProdUUID" "varchar_pattern_ops");


--
-- TOC entry 3602 (class 1259 OID 20963)
-- Name: tblRelDistr_ProdID_32d46a14; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblRelDistr_ProdID_32d46a14" ON "public"."tblRelDistr" USING "btree" ("ProdID");


--
-- TOC entry 3605 (class 1259 OID 20951)
-- Name: tblRelIndex_LocationId_89e56568; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblRelIndex_LocationId_89e56568" ON "public"."tblRelIndex" USING "btree" ("LocationId");


--
-- TOC entry 3606 (class 1259 OID 20957)
-- Name: tblRelIndex_ProdID_e919e689; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblRelIndex_ProdID_e919e689" ON "public"."tblRelIndex" USING "btree" ("ProdID");


--
-- TOC entry 3435 (class 1259 OID 20428)
-- Name: tblRoleRight_RoleID_d7e40425; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblRoleRight_RoleID_d7e40425" ON "public"."tblRoleRight" USING "btree" ("RoleID");


--
-- TOC entry 3464 (class 1259 OID 20534)
-- Name: tblServices_ServiceUUID_041cdfea_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblServices_ServiceUUID_041cdfea_like" ON "public"."tblServices" USING "btree" ("ServiceUUID" "varchar_pattern_ops");


--
-- TOC entry 3443 (class 1259 OID 20440)
-- Name: tblUserRole_RoleID_6dd249f4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblUserRole_RoleID_6dd249f4" ON "public"."tblUserRole" USING "btree" ("RoleID");


--
-- TOC entry 3444 (class 1259 OID 20441)
-- Name: tblUserRole_UserID_23690a00; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblUserRole_UserID_23690a00" ON "public"."tblUserRole" USING "btree" ("UserID");


--
-- TOC entry 3505 (class 1259 OID 20641)
-- Name: tblUsersDistricts_LocationId_99d2bfa9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblUsersDistricts_LocationId_99d2bfa9" ON "public"."tblUsersDistricts" USING "btree" ("LocationId");


--
-- TOC entry 3506 (class 1259 OID 20642)
-- Name: tblUsersDistricts_UserID_fe568ed4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblUsersDistricts_UserID_fe568ed4" ON "public"."tblUsersDistricts" USING "btree" ("UserID");


--
-- TOC entry 3412 (class 1259 OID 20442)
-- Name: tblUsers_LanguageID_41388727; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblUsers_LanguageID_41388727" ON "public"."tblUsers" USING "btree" ("LanguageID");


--
-- TOC entry 3413 (class 1259 OID 20443)
-- Name: tblUsers_LanguageID_41388727_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblUsers_LanguageID_41388727_like" ON "public"."tblUsers" USING "btree" ("LanguageID" "varchar_pattern_ops");


--
-- TOC entry 3414 (class 1259 OID 20414)
-- Name: tblUsers_UserUUID_3162bbf4_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "tblUsers_UserUUID_3162bbf4_like" ON "public"."tblUsers" USING "btree" ("UserUUID" "varchar_pattern_ops");


--
-- TOC entry 3824 (class 2606 OID 25502)
-- Name: tblHealthStatus FK_tblHealthStatus_tblInsuree; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblHealthStatus"
    ADD CONSTRAINT "FK_tblHealthStatus_tblInsuree" FOREIGN KEY ("InsureeID") REFERENCES "public"."tblInsuree"("InsureeID") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3817 (class 2606 OID 25404)
-- Name: tblLogins FK_tblLogins_tblUsers; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblLogins"
    ADD CONSTRAINT "FK_tblLogins_tblUsers" FOREIGN KEY ("UserId") REFERENCES "public"."tblUsers"("UserID") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3826 (class 2606 OID 25593)
-- Name: tblOfficerVillages FK_tblOfficerVillages_tblLocations; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblOfficerVillages"
    ADD CONSTRAINT "FK_tblOfficerVillages_tblLocations" FOREIGN KEY ("LocationId") REFERENCES "public"."tblLocations"("LocationId") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3825 (class 2606 OID 25598)
-- Name: tblOfficerVillages FK_tblOfficerVillages_tblOfficer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblOfficerVillages"
    ADD CONSTRAINT "FK_tblOfficerVillages_tblOfficer" FOREIGN KEY ("OfficerId") REFERENCES "public"."tblOfficer"("OfficerID") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3823 (class 2606 OID 25472)
-- Name: tblPolicyRenewalDetails FK_tblPolicyRenewalDetails_tblInsuree; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblPolicyRenewalDetails"
    ADD CONSTRAINT "FK_tblPolicyRenewalDetails_tblInsuree" FOREIGN KEY ("InsureeID") REFERENCES "public"."tblInsuree"("InsureeID") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3822 (class 2606 OID 25477)
-- Name: tblPolicyRenewalDetails FK_tblPolicyRenewalDetails_tblPolicyRenewals; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblPolicyRenewalDetails"
    ADD CONSTRAINT "FK_tblPolicyRenewalDetails_tblPolicyRenewals" FOREIGN KEY ("RenewalID") REFERENCES "public"."tblPolicyRenewals"("RenewalID") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3821 (class 2606 OID 25447)
-- Name: tblPolicyRenewals FK_tblPolicyRenewals_tblInsuree; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblPolicyRenewals"
    ADD CONSTRAINT "FK_tblPolicyRenewals_tblInsuree" FOREIGN KEY ("InsureeID") REFERENCES "public"."tblInsuree"("InsureeID") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3820 (class 2606 OID 25452)
-- Name: tblPolicyRenewals FK_tblPolicyRenewals_tblOfficer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblPolicyRenewals"
    ADD CONSTRAINT "FK_tblPolicyRenewals_tblOfficer" FOREIGN KEY ("NewOfficerID") REFERENCES "public"."tblOfficer"("OfficerID") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3819 (class 2606 OID 25457)
-- Name: tblPolicyRenewals FK_tblPolicyRenewals_tblPolicy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblPolicyRenewals"
    ADD CONSTRAINT "FK_tblPolicyRenewals_tblPolicy" FOREIGN KEY ("PolicyID") REFERENCES "public"."tblPolicy"("PolicyID") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3818 (class 2606 OID 25462)
-- Name: tblPolicyRenewals FK_tblPolicyRenewals_tblProduct; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblPolicyRenewals"
    ADD CONSTRAINT "FK_tblPolicyRenewals_tblProduct" FOREIGN KEY ("NewProdID") REFERENCES "public"."tblProduct"("ProdID") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3732 (class 2606 OID 21649)
-- Name: tblOfficer LocationId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblOfficer"
    ADD CONSTRAINT "LocationId" FOREIGN KEY ("LocationId") REFERENCES "public"."tblLocations"("LocationId") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3783 (class 2606 OID 20970)
-- Name: tblBatchRun tblBatchRun_LocationId_e8145c5a_fk_tblLocations_LocationId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblBatchRun"
    ADD CONSTRAINT "tblBatchRun_LocationId_e8145c5a_fk_tblLocations_LocationId" FOREIGN KEY ("LocationId") REFERENCES "public"."tblLocations"("LocationId") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3798 (class 2606 OID 21164)
-- Name: tblClaimAdmin tblClaimAdmin_HFId_b95da5ef_fk_tblHF_HfID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblClaimAdmin"
    ADD CONSTRAINT "tblClaimAdmin_HFId_b95da5ef_fk_tblHF_HfID" FOREIGN KEY ("HFId") REFERENCES "public"."tblHF"("HfID") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3800 (class 2606 OID 21140)
-- Name: tblClaimDedRem tblClaimDedRem_ClaimID_273b3ea8_fk_tblClaim_ClaimID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblClaimDedRem"
    ADD CONSTRAINT "tblClaimDedRem_ClaimID_273b3ea8_fk_tblClaim_ClaimID" FOREIGN KEY ("ClaimID") REFERENCES "public"."tblClaim"("ClaimID") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3801 (class 2606 OID 21146)
-- Name: tblClaimDedRem tblClaimDedRem_InsureeID_060ad9ea_fk_tblInsuree_InsureeID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblClaimDedRem"
    ADD CONSTRAINT "tblClaimDedRem_InsureeID_060ad9ea_fk_tblInsuree_InsureeID" FOREIGN KEY ("InsureeID") REFERENCES "public"."tblInsuree"("InsureeID") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3802 (class 2606 OID 21152)
-- Name: tblClaimDedRem tblClaimDedRem_PolicyID_d317b32a_fk_tblPolicy_PolicyID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblClaimDedRem"
    ADD CONSTRAINT "tblClaimDedRem_PolicyID_d317b32a_fk_tblPolicy_PolicyID" FOREIGN KEY ("PolicyID") REFERENCES "public"."tblPolicy"("PolicyID") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3803 (class 2606 OID 21116)
-- Name: tblClaimItems tblClaimItems_ClaimID_dae5ee72_fk_tblClaim_ClaimID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblClaimItems"
    ADD CONSTRAINT "tblClaimItems_ClaimID_dae5ee72_fk_tblClaim_ClaimID" FOREIGN KEY ("ClaimID") REFERENCES "public"."tblClaim"("ClaimID") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3804 (class 2606 OID 21122)
-- Name: tblClaimItems tblClaimItems_ItemID_87f5f3db_fk_tblItems_ItemID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblClaimItems"
    ADD CONSTRAINT "tblClaimItems_ItemID_87f5f3db_fk_tblItems_ItemID" FOREIGN KEY ("ItemID") REFERENCES "public"."tblItems"("ItemID") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3805 (class 2606 OID 21128)
-- Name: tblClaimItems tblClaimItems_PolicyID_46dca31d_fk_tblPolicy_PolicyID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblClaimItems"
    ADD CONSTRAINT "tblClaimItems_PolicyID_46dca31d_fk_tblPolicy_PolicyID" FOREIGN KEY ("PolicyID") REFERENCES "public"."tblPolicy"("PolicyID") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3806 (class 2606 OID 21134)
-- Name: tblClaimItems tblClaimItems_ProdID_2972c886_fk_tblProduct_ProdID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblClaimItems"
    ADD CONSTRAINT "tblClaimItems_ProdID_2972c886_fk_tblProduct_ProdID" FOREIGN KEY ("ProdID") REFERENCES "public"."tblProduct"("ProdID") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3809 (class 2606 OID 21078)
-- Name: tblClaimServices tblClaimServices_ClaimID_b01b2746_fk_tblClaim_ClaimID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblClaimServices"
    ADD CONSTRAINT "tblClaimServices_ClaimID_b01b2746_fk_tblClaim_ClaimID" FOREIGN KEY ("ClaimID") REFERENCES "public"."tblClaim"("ClaimID") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3810 (class 2606 OID 21086)
-- Name: tblClaimServices tblClaimServices_PolicyID_ae42a88a_fk_tblPolicy_PolicyID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblClaimServices"
    ADD CONSTRAINT "tblClaimServices_PolicyID_ae42a88a_fk_tblPolicy_PolicyID" FOREIGN KEY ("PolicyID") REFERENCES "public"."tblPolicy"("PolicyID") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3811 (class 2606 OID 21092)
-- Name: tblClaimServices tblClaimServices_ProdID_71382956_fk_tblProduct_ProdID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblClaimServices"
    ADD CONSTRAINT "tblClaimServices_ProdID_71382956_fk_tblProduct_ProdID" FOREIGN KEY ("ProdID") REFERENCES "public"."tblProduct"("ProdID") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3812 (class 2606 OID 21098)
-- Name: tblClaimServices tblClaimServices_ServiceID_3b91b421_fk_tblServices_ServiceID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblClaimServices"
    ADD CONSTRAINT "tblClaimServices_ServiceID_3b91b421_fk_tblServices_ServiceID" FOREIGN KEY ("ServiceID") REFERENCES "public"."tblServices"("ServiceID") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3787 (class 2606 OID 21170)
-- Name: tblClaim tblClaim_Adjuster_260f1304_fk_tblUsers_UserID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblClaim"
    ADD CONSTRAINT "tblClaim_Adjuster_260f1304_fk_tblUsers_UserID" FOREIGN KEY ("Adjuster") REFERENCES "public"."tblUsers"("UserID") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3788 (class 2606 OID 21176)
-- Name: tblClaim tblClaim_ClaimAdminId_0ef46dbe_fk_tblClaimAdmin_ClaimAdminId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblClaim"
    ADD CONSTRAINT "tblClaim_ClaimAdminId_0ef46dbe_fk_tblClaimAdmin_ClaimAdminId" FOREIGN KEY ("ClaimAdminId") REFERENCES "public"."tblClaimAdmin"("ClaimAdminId") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3790 (class 2606 OID 21187)
-- Name: tblClaim tblClaim_FeedbackID_60e540d8_fk_tblFeedback_FeedbackID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblClaim"
    ADD CONSTRAINT "tblClaim_FeedbackID_60e540d8_fk_tblFeedback_FeedbackID" FOREIGN KEY ("FeedbackID") REFERENCES "public"."tblFeedback"("FeedbackID") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3791 (class 2606 OID 21193)
-- Name: tblClaim tblClaim_HFID_e19ce816_fk_tblHF_HfID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblClaim"
    ADD CONSTRAINT "tblClaim_HFID_e19ce816_fk_tblHF_HfID" FOREIGN KEY ("HFID") REFERENCES "public"."tblHF"("HfID") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3793 (class 2606 OID 21205)
-- Name: tblClaim tblClaim_ICDID1_bda229e5_fk_tblICDCodes_ICDID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblClaim"
    ADD CONSTRAINT "tblClaim_ICDID1_bda229e5_fk_tblICDCodes_ICDID" FOREIGN KEY ("ICDID1") REFERENCES "public"."tblICDCodes"("ICDID") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3794 (class 2606 OID 21211)
-- Name: tblClaim tblClaim_ICDID2_01114040_fk_tblICDCodes_ICDID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblClaim"
    ADD CONSTRAINT "tblClaim_ICDID2_01114040_fk_tblICDCodes_ICDID" FOREIGN KEY ("ICDID2") REFERENCES "public"."tblICDCodes"("ICDID") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3795 (class 2606 OID 21217)
-- Name: tblClaim tblClaim_ICDID3_046d79c3_fk_tblICDCodes_ICDID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblClaim"
    ADD CONSTRAINT "tblClaim_ICDID3_046d79c3_fk_tblICDCodes_ICDID" FOREIGN KEY ("ICDID3") REFERENCES "public"."tblICDCodes"("ICDID") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3796 (class 2606 OID 21223)
-- Name: tblClaim tblClaim_ICDID4_2397d9bd_fk_tblICDCodes_ICDID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblClaim"
    ADD CONSTRAINT "tblClaim_ICDID4_2397d9bd_fk_tblICDCodes_ICDID" FOREIGN KEY ("ICDID4") REFERENCES "public"."tblICDCodes"("ICDID") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3792 (class 2606 OID 21199)
-- Name: tblClaim tblClaim_ICDID_e47cee10_fk_tblICDCodes_ICDID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblClaim"
    ADD CONSTRAINT "tblClaim_ICDID_e47cee10_fk_tblICDCodes_ICDID" FOREIGN KEY ("ICDID") REFERENCES "public"."tblICDCodes"("ICDID") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3797 (class 2606 OID 21229)
-- Name: tblClaim tblClaim_InsureeID_b81e59ed_fk_tblInsuree_InsureeID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblClaim"
    ADD CONSTRAINT "tblClaim_InsureeID_b81e59ed_fk_tblInsuree_InsureeID" FOREIGN KEY ("InsureeID") REFERENCES "public"."tblInsuree"("InsureeID") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3789 (class 2606 OID 21182)
-- Name: tblClaim tblClaim_RunID_a819cd42_fk_tblBatchRun_RunID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblClaim"
    ADD CONSTRAINT "tblClaim_RunID_a819cd42_fk_tblBatchRun_RunID" FOREIGN KEY ("RunID") REFERENCES "public"."tblBatchRun"("RunID") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3761 (class 2606 OID 21335)
-- Name: tblFamilies tblFamilies_ConfirmationType_bcb4c6c3_fk_tblConfir; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblFamilies"
    ADD CONSTRAINT "tblFamilies_ConfirmationType_bcb4c6c3_fk_tblConfir" FOREIGN KEY ("ConfirmationType") REFERENCES "public"."tblConfirmationTypes"("ConfirmationTypeCode") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3762 (class 2606 OID 21342)
-- Name: tblFamilies tblFamilies_FamilyType_bee7213f_fk_tblFamily; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblFamilies"
    ADD CONSTRAINT "tblFamilies_FamilyType_bee7213f_fk_tblFamily" FOREIGN KEY ("FamilyType") REFERENCES "public"."tblFamilyTypes"("FamilyTypeCode") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3763 (class 2606 OID 21347)
-- Name: tblFamilies tblFamilies_InsureeID_d793b5db_fk_tblInsuree_InsureeID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblFamilies"
    ADD CONSTRAINT "tblFamilies_InsureeID_d793b5db_fk_tblInsuree_InsureeID" FOREIGN KEY ("InsureeID") REFERENCES "public"."tblInsuree"("InsureeID") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3764 (class 2606 OID 21353)
-- Name: tblFamilies tblFamilies_LocationId_a1cec0d8_fk_tblLocations_LocationId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblFamilies"
    ADD CONSTRAINT "tblFamilies_LocationId_a1cec0d8_fk_tblLocations_LocationId" FOREIGN KEY ("LocationId") REFERENCES "public"."tblLocations"("LocationId") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3813 (class 2606 OID 21072)
-- Name: tblFeedback tblFeedback_ClaimID_6da5f5bb_fk_tblClaim_ClaimID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblFeedback"
    ADD CONSTRAINT "tblFeedback_ClaimID_6da5f5bb_fk_tblClaim_ClaimID" FOREIGN KEY ("ClaimID") REFERENCES "public"."tblClaim"("ClaimID") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3747 (class 2606 OID 20592)
-- Name: tblHFCatchment tblHFCatchment_HFID_81949f39_fk_tblHF_HfID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblHFCatchment"
    ADD CONSTRAINT "tblHFCatchment_HFID_81949f39_fk_tblHF_HfID" FOREIGN KEY ("HFID") REFERENCES "public"."tblHF"("HfID") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3746 (class 2606 OID 20644)
-- Name: tblHFCatchment tblHFCatchment_LocationId_9dc42e7d_fk_tblLocations_LocationId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblHFCatchment"
    ADD CONSTRAINT "tblHFCatchment_LocationId_9dc42e7d_fk_tblLocations_LocationId" FOREIGN KEY ("LocationId") REFERENCES "public"."tblLocations"("LocationId") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3745 (class 2606 OID 20922)
-- Name: tblHF tblHF_HFSublevel_99fb0809_fk_tblHFSublevel_HFSublevel; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblHF"
    ADD CONSTRAINT "tblHF_HFSublevel_99fb0809_fk_tblHFSublevel_HFSublevel" FOREIGN KEY ("HFSublevel") REFERENCES "public"."tblHFSublevel"("HFSublevel") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3742 (class 2606 OID 20903)
-- Name: tblHF tblHF_LegalForm_950c70ad_fk_tblLegalForms_LegalFormCode; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblHF"
    ADD CONSTRAINT "tblHF_LegalForm_950c70ad_fk_tblLegalForms_LegalFormCode" FOREIGN KEY ("LegalForm") REFERENCES "public"."tblLegalForms"("LegalFormCode") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3743 (class 2606 OID 20909)
-- Name: tblHF tblHF_LocationId_1b9634eb_fk_tblLocations_LocationId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblHF"
    ADD CONSTRAINT "tblHF_LocationId_1b9634eb_fk_tblLocations_LocationId" FOREIGN KEY ("LocationId") REFERENCES "public"."tblLocations"("LocationId") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3741 (class 2606 OID 20896)
-- Name: tblHF tblHF_PLItemID_2276bb56_fk_tblPLItems_PLItemID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblHF"
    ADD CONSTRAINT "tblHF_PLItemID_2276bb56_fk_tblPLItems_PLItemID" FOREIGN KEY ("PLItemID") REFERENCES "public"."tblPLItems"("PLItemID") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3744 (class 2606 OID 20915)
-- Name: tblHF tblHF_PLServiceID_b08acd41_fk_tblPLServices_PLServiceID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblHF"
    ADD CONSTRAINT "tblHF_PLServiceID_b08acd41_fk_tblPLServices_PLServiceID" FOREIGN KEY ("PLServiceID") REFERENCES "public"."tblPLServices"("PLServiceID") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3773 (class 2606 OID 20785)
-- Name: tblInsureePolicy tblInsureePolicy_InsureeId_f98ddacc_fk_tblInsuree_InsureeID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblInsureePolicy"
    ADD CONSTRAINT "tblInsureePolicy_InsureeId_f98ddacc_fk_tblInsuree_InsureeID" FOREIGN KEY ("InsureeID") REFERENCES "public"."tblInsuree"("InsureeID") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3772 (class 2606 OID 21285)
-- Name: tblInsureePolicy tblInsureePolicy_PolicyId_2e30ab9f_fk_tblPolicy_PolicyID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblInsureePolicy"
    ADD CONSTRAINT "tblInsureePolicy_PolicyId_2e30ab9f_fk_tblPolicy_PolicyID" FOREIGN KEY ("PolicyId") REFERENCES "public"."tblPolicy"("PolicyID") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3765 (class 2606 OID 21291)
-- Name: tblInsuree tblInsuree_Education_92d6d161_fk_tblEducations_EducationId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblInsuree"
    ADD CONSTRAINT "tblInsuree_Education_92d6d161_fk_tblEducations_EducationId" FOREIGN KEY ("Education") REFERENCES "public"."tblEducations"("EducationId") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3766 (class 2606 OID 21297)
-- Name: tblInsuree tblInsuree_FamilyID_fd2608e5_fk_tblFamilies_FamilyID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblInsuree"
    ADD CONSTRAINT "tblInsuree_FamilyID_fd2608e5_fk_tblFamilies_FamilyID" FOREIGN KEY ("FamilyID") REFERENCES "public"."tblFamilies"("FamilyID") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3767 (class 2606 OID 21304)
-- Name: tblInsuree tblInsuree_Gender_684d27ce_fk_tblGender_Code; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblInsuree"
    ADD CONSTRAINT "tblInsuree_Gender_684d27ce_fk_tblGender_Code" FOREIGN KEY ("Gender") REFERENCES "public"."tblGender"("Code") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3768 (class 2606 OID 21310)
-- Name: tblInsuree tblInsuree_HFID_6dd10883_fk_tblHF_HfID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblInsuree"
    ADD CONSTRAINT "tblInsuree_HFID_6dd10883_fk_tblHF_HfID" FOREIGN KEY ("HFID") REFERENCES "public"."tblHF"("HfID") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3769 (class 2606 OID 21316)
-- Name: tblInsuree tblInsuree_PhotoID_a0c76ec1_fk_tblPhotos_PhotoID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblInsuree"
    ADD CONSTRAINT "tblInsuree_PhotoID_a0c76ec1_fk_tblPhotos_PhotoID" FOREIGN KEY ("PhotoID") REFERENCES "public"."tblPhotos"("PhotoID") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3770 (class 2606 OID 21322)
-- Name: tblInsuree tblInsuree_Profession_baa97c52_fk_tblProfessions_ProfessionId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblInsuree"
    ADD CONSTRAINT "tblInsuree_Profession_baa97c52_fk_tblProfessions_ProfessionId" FOREIGN KEY ("Profession") REFERENCES "public"."tblProfessions"("ProfessionId") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3771 (class 2606 OID 21328)
-- Name: tblInsuree tblInsuree_Relationship_abc21144_fk_tblRelations_RelationId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblInsuree"
    ADD CONSTRAINT "tblInsuree_Relationship_abc21144_fk_tblRelations_RelationId" FOREIGN KEY ("Relationship") REFERENCES "public"."tblRelations"("RelationId") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3750 (class 2606 OID 20612)
-- Name: tblLocations tblLocations_ParentLocationId_5ba57c61_fk_tblLocati; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblLocations"
    ADD CONSTRAINT "tblLocations_ParentLocationId_5ba57c61_fk_tblLocati" FOREIGN KEY ("ParentLocationId") REFERENCES "public"."tblLocations"("LocationId") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3733 (class 2606 OID 22186)
-- Name: tblOfficer tblOfficer_OfficerIDSubst_29656666_fk_tblOfficer_OfficerID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblOfficer"
    ADD CONSTRAINT "tblOfficer_OfficerIDSubst_29656666_fk_tblOfficer_OfficerID" FOREIGN KEY ("OfficerIDSubst") REFERENCES "public"."tblOfficer"("OfficerID") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3779 (class 2606 OID 20864)
-- Name: tblPLItemsDetail tblPLItemsDetail_ItemID_52cf508b_fk_tblItems_ItemID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblPLItemsDetail"
    ADD CONSTRAINT "tblPLItemsDetail_ItemID_52cf508b_fk_tblItems_ItemID" FOREIGN KEY ("ItemID") REFERENCES "public"."tblItems"("ItemID") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3778 (class 2606 OID 20869)
-- Name: tblPLItemsDetail tblPLItemsDetail_PLItemID_62dff0ac_fk_tblPLItems_PLItemID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblPLItemsDetail"
    ADD CONSTRAINT "tblPLItemsDetail_PLItemID_62dff0ac_fk_tblPLItems_PLItemID" FOREIGN KEY ("PLItemID") REFERENCES "public"."tblPLItems"("PLItemID") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3777 (class 2606 OID 20857)
-- Name: tblPLItems tblPLItems_LocationId_91a6b728_fk_tblLocations_LocationId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblPLItems"
    ADD CONSTRAINT "tblPLItems_LocationId_91a6b728_fk_tblLocations_LocationId" FOREIGN KEY ("LocationId") REFERENCES "public"."tblLocations"("LocationId") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3781 (class 2606 OID 20888)
-- Name: tblPLServicesDetail tblPLServicesDetail_PLServiceID_53e7d206_fk_tblPLServ; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblPLServicesDetail"
    ADD CONSTRAINT "tblPLServicesDetail_PLServiceID_53e7d206_fk_tblPLServ" FOREIGN KEY ("PLServiceID") REFERENCES "public"."tblPLServices"("PLServiceID") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3782 (class 2606 OID 20883)
-- Name: tblPLServicesDetail tblPLServicesDetail_ServiceID_884bbf6b_fk_tblServices_ServiceID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblPLServicesDetail"
    ADD CONSTRAINT "tblPLServicesDetail_ServiceID_884bbf6b_fk_tblServices_ServiceID" FOREIGN KEY ("ServiceID") REFERENCES "public"."tblServices"("ServiceID") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3780 (class 2606 OID 20876)
-- Name: tblPLServices tblPLServices_LocationId_b9340268_fk_tblLocations_LocationId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblPLServices"
    ADD CONSTRAINT "tblPLServices_LocationId_b9340268_fk_tblLocations_LocationId" FOREIGN KEY ("LocationId") REFERENCES "public"."tblLocations"("LocationId") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3814 (class 2606 OID 21269)
-- Name: tblPayer tblPayer_LocationId_240be842_fk_tblLocations_LocationId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblPayer"
    ADD CONSTRAINT "tblPayer_LocationId_240be842_fk_tblLocations_LocationId" FOREIGN KEY ("LocationId") REFERENCES "public"."tblLocations"("LocationId") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3774 (class 2606 OID 20802)
-- Name: tblPolicy tblPolicy_FamilyID_59ad2bf3_fk_tblFamilies_FamilyID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblPolicy"
    ADD CONSTRAINT "tblPolicy_FamilyID_59ad2bf3_fk_tblFamilies_FamilyID" FOREIGN KEY ("FamilyID") REFERENCES "public"."tblFamilies"("FamilyID") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3775 (class 2606 OID 20807)
-- Name: tblPolicy tblPolicy_OfficerID_7a16e507_fk_tblOfficer_OfficerID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblPolicy"
    ADD CONSTRAINT "tblPolicy_OfficerID_7a16e507_fk_tblOfficer_OfficerID" FOREIGN KEY ("OfficerID") REFERENCES "public"."tblOfficer"("OfficerID") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3776 (class 2606 OID 20812)
-- Name: tblPolicy tblPolicy_ProdID_70a26314_fk_tblProduct_ProdID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblPolicy"
    ADD CONSTRAINT "tblPolicy_ProdID_70a26314_fk_tblProduct_ProdID" FOREIGN KEY ("ProdID") REFERENCES "public"."tblProduct"("ProdID") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3815 (class 2606 OID 21255)
-- Name: tblPremium tblPremium_PayerID_01ec1db8_fk_tblPayer_PayerID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblPremium"
    ADD CONSTRAINT "tblPremium_PayerID_01ec1db8_fk_tblPayer_PayerID" FOREIGN KEY ("PayerID") REFERENCES "public"."tblPayer"("PayerID") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3816 (class 2606 OID 21263)
-- Name: tblPremium tblPremium_PolicyID_5d8a7e70_fk_tblPolicy_PolicyID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblPremium"
    ADD CONSTRAINT "tblPremium_PolicyID_5d8a7e70_fk_tblPolicy_PolicyID" FOREIGN KEY ("PolicyID") REFERENCES "public"."tblPolicy"("PolicyID") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3758 (class 2606 OID 20682)
-- Name: tblProductItems tblProductItems_ItemID_6dfbe285_fk_tblItems_ItemID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblProductItems"
    ADD CONSTRAINT "tblProductItems_ItemID_6dfbe285_fk_tblItems_ItemID" FOREIGN KEY ("ItemID") REFERENCES "public"."tblItems"("ItemID") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3757 (class 2606 OID 20687)
-- Name: tblProductItems tblProductItems_ProdID_40862a5c_fk_tblProduct_ProdID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblProductItems"
    ADD CONSTRAINT "tblProductItems_ProdID_40862a5c_fk_tblProduct_ProdID" FOREIGN KEY ("ProdID") REFERENCES "public"."tblProduct"("ProdID") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3760 (class 2606 OID 20694)
-- Name: tblProductServices tblProductServices_ProdID_e48650a8_fk_tblProduct_ProdID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblProductServices"
    ADD CONSTRAINT "tblProductServices_ProdID_e48650a8_fk_tblProduct_ProdID" FOREIGN KEY ("ProdID") REFERENCES "public"."tblProduct"("ProdID") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3759 (class 2606 OID 20699)
-- Name: tblProductServices tblProductServices_ServiceID_5e0a03a5_fk_tblServices_ServiceID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblProductServices"
    ADD CONSTRAINT "tblProductServices_ServiceID_5e0a03a5_fk_tblServices_ServiceID" FOREIGN KEY ("ServiceID") REFERENCES "public"."tblServices"("ServiceID") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3755 (class 2606 OID 22250)
-- Name: tblProduct tblProduct_ConversionProdID_83d83b2f_fk_tblProduct_ProdID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblProduct"
    ADD CONSTRAINT "tblProduct_ConversionProdID_83d83b2f_fk_tblProduct_ProdID" FOREIGN KEY ("ConversionProdID") REFERENCES "public"."tblProduct"("ProdID") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3756 (class 2606 OID 20675)
-- Name: tblProduct tblProduct_LocationId_7bb534bc_fk_tblLocations_LocationId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblProduct"
    ADD CONSTRAINT "tblProduct_LocationId_7bb534bc_fk_tblLocations_LocationId" FOREIGN KEY ("LocationId") REFERENCES "public"."tblLocations"("LocationId") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3784 (class 2606 OID 20964)
-- Name: tblRelDistr tblRelDistr_ProdID_32d46a14_fk_tblProduct_ProdID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblRelDistr"
    ADD CONSTRAINT "tblRelDistr_ProdID_32d46a14_fk_tblProduct_ProdID" FOREIGN KEY ("ProdID") REFERENCES "public"."tblProduct"("ProdID") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3786 (class 2606 OID 20952)
-- Name: tblRelIndex tblRelIndex_LocationId_89e56568_fk_tblLocations_LocationId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblRelIndex"
    ADD CONSTRAINT "tblRelIndex_LocationId_89e56568_fk_tblLocations_LocationId" FOREIGN KEY ("LocationId") REFERENCES "public"."tblLocations"("LocationId") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3785 (class 2606 OID 20958)
-- Name: tblRelIndex tblRelIndex_ProdID_e919e689_fk_tblProduct_ProdID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblRelIndex"
    ADD CONSTRAINT "tblRelIndex_ProdID_e919e689_fk_tblProduct_ProdID" FOREIGN KEY ("ProdID") REFERENCES "public"."tblProduct"("ProdID") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3734 (class 2606 OID 20423)
-- Name: tblRoleRight tblRoleRight_RoleID_d7e40425_fk_tblRole_RoleID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblRoleRight"
    ADD CONSTRAINT "tblRoleRight_RoleID_d7e40425_fk_tblRole_RoleID" FOREIGN KEY ("RoleID") REFERENCES "public"."tblRole"("RoleID") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3736 (class 2606 OID 20430)
-- Name: tblUserRole tblUserRole_RoleID_6dd249f4_fk_tblRole_RoleID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblUserRole"
    ADD CONSTRAINT "tblUserRole_RoleID_6dd249f4_fk_tblRole_RoleID" FOREIGN KEY ("RoleID") REFERENCES "public"."tblRole"("RoleID") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3735 (class 2606 OID 20435)
-- Name: tblUserRole tblUserRole_UserID_23690a00_fk_tblUsers_UserID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblUserRole"
    ADD CONSTRAINT "tblUserRole_UserID_23690a00_fk_tblUsers_UserID" FOREIGN KEY ("UserID") REFERENCES "public"."tblUsers"("UserID") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3754 (class 2606 OID 20631)
-- Name: tblUsersDistricts tblUsersDistricts_LocationId_99d2bfa9_fk_tblLocati; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblUsersDistricts"
    ADD CONSTRAINT "tblUsersDistricts_LocationId_99d2bfa9_fk_tblLocati" FOREIGN KEY ("LocationId") REFERENCES "public"."tblLocations"("LocationId") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3753 (class 2606 OID 20636)
-- Name: tblUsersDistricts tblUsersDistricts_UserID_fe568ed4_fk_tblUsers_UserID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblUsersDistricts"
    ADD CONSTRAINT "tblUsersDistricts_UserID_fe568ed4_fk_tblUsers_UserID" FOREIGN KEY ("UserID") REFERENCES "public"."tblUsers"("UserID") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3730 (class 2606 OID 20444)
-- Name: tblUsers tblUsers_LanguageID_41388727_fk_tblLanguages_LanguageCode; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."tblUsers"
    ADD CONSTRAINT "tblUsers_LanguageID_41388727_fk_tblLanguages_LanguageCode" FOREIGN KEY ("LanguageID") REFERENCES "public"."tblLanguages"("LanguageCode") DEFERRABLE INITIALLY DEFERRED;

--
-- TOC entry 3989 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA "public"; Type: ACL; Schema: -; Owner: postgres
--


GRANT ALL ON SCHEMA "public" TO PUBLIC;


set search_path to public;
-- tblLanguages (en added in empty db)
INSERT INTO "tblLanguages" ("LanguageCode", "LanguageName", "SortOrder") VALUES (N'fr', N'Français', NULL);

-- tblGender
INSERT INTO "tblGender" ("Code", "Gender", "AltLanguage", "SortOrder") VALUES (N'F', N'Female', NULL, 2);
INSERT INTO "tblGender" ("Code", "Gender", "AltLanguage", "SortOrder") VALUES (N'M', N'Male', NULL, 1);

-- tblLegalForms
INSERT INTO "tblLegalForms" ("LegalFormCode", "LegalForms", "SortOrder", "AltLanguage") VALUES (N'C', N'Charity', NULL, N'Charité');
INSERT INTO "tblLegalForms" ("LegalFormCode", "LegalForms", "SortOrder", "AltLanguage") VALUES (N'D', N'District organization', NULL, N'Organisation du district');
INSERT INTO "tblLegalForms" ("LegalFormCode", "LegalForms", "SortOrder", "AltLanguage") VALUES (N'G', N'Government', NULL, N'Gouvernement');
INSERT INTO "tblLegalForms" ("LegalFormCode", "LegalForms", "SortOrder", "AltLanguage") VALUES (N'P', N'Private organization', NULL, N'Organisation privée');

-- tblFamilyTypes
INSERT INTO "tblFamilyTypes" ("FamilyTypeCode", "FamilyType", "SortOrder", "AltLanguage") VALUES (N'C', N'Council', NULL, N'Conseil');
INSERT INTO "tblFamilyTypes" ("FamilyTypeCode", "FamilyType", "SortOrder", "AltLanguage") VALUES (N'G', N'Organization', NULL, N'Organisation');
INSERT INTO "tblFamilyTypes" ("FamilyTypeCode", "FamilyType", "SortOrder", "AltLanguage") VALUES (N'H', N'Household', NULL, N'Ménage');
INSERT INTO "tblFamilyTypes" ("FamilyTypeCode", "FamilyType", "SortOrder", "AltLanguage") VALUES (N'O', N'Other', NULL, N'Autre');
INSERT INTO "tblFamilyTypes" ("FamilyTypeCode", "FamilyType", "SortOrder", "AltLanguage") VALUES (N'P', N'Priests', NULL, N'Prètres');
INSERT INTO "tblFamilyTypes" ("FamilyTypeCode", "FamilyType", "SortOrder", "AltLanguage") VALUES (N'S', N'Students', NULL, N'Etudiants');
INSERT INTO "tblFamilyTypes" ("FamilyTypeCode", "FamilyType", "SortOrder", "AltLanguage") VALUES (N'T', N'Teachers', NULL, N'Enseignant');

-- tblProfessions
INSERT INTO "tblProfessions" ("ProfessionId", "Profession", "SortOrder", "AltLanguage") VALUES (1, N'Housewife', NULL, N'Femme au foyer');
INSERT INTO "tblProfessions" ("ProfessionId", "Profession", "SortOrder", "AltLanguage") VALUES (2, N'Employee', NULL, N'Employé');
INSERT INTO "tblProfessions" ("ProfessionId", "Profession", "SortOrder", "AltLanguage") VALUES (3, N'Self Employee', NULL, N'Indépendant');
INSERT INTO "tblProfessions" ("ProfessionId", "Profession", "SortOrder", "AltLanguage") VALUES (4, N'Others', NULL, N'Autres');

-- tblRelations
INSERT INTO "tblRelations" ("RelationId", "Relation", "SortOrder", "AltLanguage") VALUES (1, N'Brother/Sister', NULL, N'Frère/soeur');
INSERT INTO "tblRelations" ("RelationId", "Relation", "SortOrder", "AltLanguage") VALUES (2, N'Father/Mother', NULL, N'Père/Mère');
INSERT INTO "tblRelations" ("RelationId", "Relation", "SortOrder", "AltLanguage") VALUES (3, N'Uncle/Aunt', NULL, N'Oncle/tante');
INSERT INTO "tblRelations" ("RelationId", "Relation", "SortOrder", "AltLanguage") VALUES (4, N'Son/Daughter', NULL, N'Fils/fille');
INSERT INTO "tblRelations" ("RelationId", "Relation", "SortOrder", "AltLanguage") VALUES (5, N'Grand parents', NULL, N'Grands/parents');
INSERT INTO "tblRelations" ("RelationId", "Relation", "SortOrder", "AltLanguage") VALUES (6, N'Employee', NULL, N'Employé');
INSERT INTO "tblRelations" ("RelationId", "Relation", "SortOrder", "AltLanguage") VALUES (7, N'Others', NULL, N'Autres');
INSERT INTO "tblRelations" ("RelationId", "Relation", "SortOrder", "AltLanguage") VALUES (8, N'Spouse', NULL, N'Époux');

-- tblConfirmationTypes
INSERT INTO "tblConfirmationTypes" ("ConfirmationTypeCode", "ConfirmationType", "SortOrder", "AltLanguage") VALUES (N'A', N'Local council', NULL, N'Conseil local');
INSERT INTO "tblConfirmationTypes" ("ConfirmationTypeCode", "ConfirmationType", "SortOrder", "AltLanguage") VALUES (N'B', N'Municipality', NULL, N'Municipalité');
INSERT INTO "tblConfirmationTypes" ("ConfirmationTypeCode", "ConfirmationType", "SortOrder", "AltLanguage") VALUES (N'C', N'State', NULL, N'Etat');
INSERT INTO "tblConfirmationTypes" ("ConfirmationTypeCode", "ConfirmationType", "SortOrder", "AltLanguage") VALUES (N'D', N'Other', NULL, N'Autre');

-- tblControls
INSERT INTO "tblControls" ("FieldName", "Adjustibility", "Usage") VALUES (N'BeneficiaryCard', N'O', N'Family, Insuree');
INSERT INTO "tblControls" ("FieldName", "Adjustibility", "Usage") VALUES (N'ClaimAdministrator', N'M', N'FindClaim, Claim, ClaimReview, ClaimFeedback');
INSERT INTO "tblControls" ("FieldName", "Adjustibility", "Usage") VALUES (N'Confirmation', N'O', N'Family, Insuree, OverviewFamily, ChangeFamily');
INSERT INTO "tblControls" ("FieldName", "Adjustibility", "Usage") VALUES (N'ConfirmationNo', N'O', N'Family, Insuree, FindFamily, OverviewFamily, ChangeFamily');
INSERT INTO "tblControls" ("FieldName", "Adjustibility", "Usage") VALUES (N'ContributionCategory', N'O', N'Premium, FindPremium');
INSERT INTO "tblControls" ("FieldName", "Adjustibility", "Usage") VALUES (N'CurrentAddress', N'O', N'Family, Insuree');
INSERT INTO "tblControls" ("FieldName", "Adjustibility", "Usage") VALUES (N'CurrentDistrict', N'O', N'Family, Insuree');
INSERT INTO "tblControls" ("FieldName", "Adjustibility", "Usage") VALUES (N'CurrentMunicipality', N'O', N'Family, Insuree');
INSERT INTO "tblControls" ("FieldName", "Adjustibility", "Usage") VALUES (N'CurrentVillage', N'O', N'Family, Insuree');
INSERT INTO "tblControls" ("FieldName", "Adjustibility", "Usage") VALUES (N'Education', N'O', N'Family, Insuree');
INSERT INTO "tblControls" ("FieldName", "Adjustibility", "Usage") VALUES (N'FamilyType', N'O', N'Family, ChangeFamily');
INSERT INTO "tblControls" ("FieldName", "Adjustibility", "Usage") VALUES (N'FSP', N'O', N'Family, Insuree');
INSERT INTO "tblControls" ("FieldName", "Adjustibility", "Usage") VALUES (N'FSPCategory', N'O', N'Family, Insuree');
INSERT INTO "tblControls" ("FieldName", "Adjustibility", "Usage") VALUES (N'FSPDistrict', N'O', N'Family, Insuree');
INSERT INTO "tblControls" ("FieldName", "Adjustibility", "Usage") VALUES (N'GuaranteeNo', N'O', N'Claim, ClaimReview');
INSERT INTO "tblControls" ("FieldName", "Adjustibility", "Usage") VALUES (N'IdentificationNumber', N'O', N'Family, Insuree');
INSERT INTO "tblControls" ("FieldName", "Adjustibility", "Usage") VALUES (N'IdentificationType', N'O', N'Family, Insuree');
INSERT INTO "tblControls" ("FieldName", "Adjustibility", "Usage") VALUES (N'InsureeEmail', N'O', N'Family, Insuree, FindFamily');
INSERT INTO "tblControls" ("FieldName", "Adjustibility", "Usage") VALUES (N'MaritalStatus', N'O', N'Family, Insuree');
INSERT INTO "tblControls" ("FieldName", "Adjustibility", "Usage") VALUES (N'PermanentAddress', N'O', N'Family, Insuree, ChangeFamily');
INSERT INTO "tblControls" ("FieldName", "Adjustibility", "Usage") VALUES (N'Poverty', N'O', N'Family, Insuree, Policy, Premium, FindFamily, ChangeFamily');
INSERT INTO "tblControls" ("FieldName", "Adjustibility", "Usage") VALUES (N'Profession', N'O', N'Family, Insuree');
INSERT INTO "tblControls" ("FieldName", "Adjustibility", "Usage") VALUES (N'Relationship', N'O', N'Insuree');

-- tblEducations
INSERT INTO "tblEducations" ("EducationId", "Education", "SortOrder", "AltLanguage") VALUES (1, N'Nursery', NULL, N'Garderie');
INSERT INTO "tblEducations" ("EducationId", "Education", "SortOrder", "AltLanguage") VALUES (2, N'Primary school', NULL, N'École primaire');
INSERT INTO "tblEducations" ("EducationId", "Education", "SortOrder", "AltLanguage") VALUES (3, N'Secondary school', NULL, N'École secondaire');
INSERT INTO "tblEducations" ("EducationId", "Education", "SortOrder", "AltLanguage") VALUES (4, N'University', NULL, N'Université');
INSERT INTO "tblEducations" ("EducationId", "Education", "SortOrder", "AltLanguage") VALUES (5, N'Postgraduate studies', NULL, N'Études supérieures');
INSERT INTO "tblEducations" ("EducationId", "Education", "SortOrder", "AltLanguage") VALUES (6, N'PHD', NULL, N'Doctorat');
INSERT INTO "tblEducations" ("EducationId", "Education", "SortOrder", "AltLanguage") VALUES (7, N'Other', NULL, N'Autre');


-- tblIMISDefaults
INSERT INTO "tblIMISDefaults" ("DefaultID", "PolicyRenewalInterval", "FTPHost", "FTPUser", "FTPPassword", "FTPPort", "FTPEnrollmentFolder", "AssociatedPhotoFolder", "FTPClaimFolder", "FTPFeedbackFolder", "FTPPolicyRenewalFolder", "FTPPhoneExtractFolder", "FTPOffLineExtractFolder", "AppVersionBackEnd", "AppVersionEnquire", "AppVersionEnroll", "AppVersionRenewal", "AppVersionFeedback", "AppVersionClaim", "OffLineHF", "WinRarFolder", "DatabaseBackupFolder", "OfflineCHF", "SMSLink", "SMSIP", "SMSUserName", "SMSPassword", "SMSSource", "SMSDlr", "SMSType", "AppVersionFeedbackRenewal", "AppVersionImis") VALUES (1, 14, N'', N'', N'', 50100, N'/Images/Submitted', N'/Images/Updated', N'', N'', N'', N'', N'', CAST(1.2 AS Decimal(3, 1)), CAST(0.0 AS Decimal(3, 1)), CAST(0.0 AS Decimal(3, 1)), CAST(0.0 AS Decimal(3, 1)), CAST(0.0 AS Decimal(3, 1)), CAST(0.0 AS Decimal(3, 1)), 0, N'C:\Program Files (x86)\WinRAR\', N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\Backup', 0, N'', N'', N'', N'', N'', 1, 1, CAST(2.5 AS Decimal(3, 1)), CAST(0.0 AS Decimal(3, 1)));
INSERT INTO "tblIMISDefaultsPhone" ("RuleName", "RuleValue") VALUES (N'AllowInsureeWithoutPhoto', false);
INSERT INTO "tblIMISDefaultsPhone" ("RuleName", "RuleValue") VALUES (N'AllowFamilyWithoutPolicy', false);
INSERT INTO "tblIMISDefaultsPhone" ("RuleName", "RuleValue") VALUES (N'AllowPolicyWithoutPremium', false);

-- tblIdentificationTypes
INSERT INTO "tblIdentificationTypes" ("IdentificationCode", "IdentificationTypes", "AltLanguage", "SortOrder") VALUES (N'D', N'Driver''s License', N'Permis de conduire', NULL);
INSERT INTO "tblIdentificationTypes" ("IdentificationCode", "IdentificationTypes", "AltLanguage", "SortOrder") VALUES (N'N', N'National ID', N'Carte d''identité', NULL);
INSERT INTO "tblIdentificationTypes" ("IdentificationCode", "IdentificationTypes", "AltLanguage", "SortOrder") VALUES (N'P', N'Passport', N'Passeport', NULL);
INSERT INTO "tblIdentificationTypes" ("IdentificationCode", "IdentificationTypes", "AltLanguage", "SortOrder") VALUES (N'V', N'Voter Card', N'Carte d''électeur', NULL);


-- tblLocations
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('e5b22772-9b34-4f6a-a8e3-960e6cfdc284', 1, 'AA', 'Addis Ababa', NULL, 
 'C', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'c7840894-3a89-49e8-a6eb-3494ae8079bf');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('544fad1a-13e1-4db6-a6fd-e77911385451', 2, 'AA_AK', 'Addis Ketema', 1, 
 'S', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '9d915cbb-3bab-4d77-ad7f-e1e4d786daf7');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('f0415c4d-b392-4bb7-80ca-be9b312a4e46', 3, 'AA_AK_01', 'Woreda 1', 2, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '250a715e-ebf6-4d44-96bc-84749ceeab8f');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")VALUES ('e38109bb-13a6-4230-ac9f-3c55cc15a7b9', 4, 'AA_AK_01', 'Ketena 01', 3, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, NULL, NULL, NULL, NULL, '6a00d817-b515-408b-8c07-3f5975aa5fb4');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('86268311-a013-4277-843b-14d34694d686', 5, 'AA_AK_01', 'Ketena 02', 3, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'a90892ca-32c2-4b53-92a7-17f2472e7592');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('46513aa4-ed02-4fb3-8a97-676fcc92e243', 6, 'AA_AK_01', 'Ketena 03', 3, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'dad13465-c30f-4eba-a877-258bd81ccf51');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('aebca4a4-103c-417b-9ae5-7c07281ccf32', 7, 'AA_AK_01', 'Ketena 04', 3, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '6d48c9a7-c36b-4e22-beef-aa0aaa3e99d6');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('644aa463-531a-4130-a8b5-e0888ebf7cbf', 8, 'AA_AK_01', 'Ketena 05', 3, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'f0415279-369d-460b-92cb-64c8eb65473f');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('eaa4fa8e-5491-4a97-a220-060129a4ef24', 9, 'AA_AK_02', 'Woreda 2', 2, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '1184a134-1cb5-41f3-b034-6c1e937fe89a');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ff127791-8ca9-4d6a-86c4-cfef5b4d94dd', 11, 'AA_AK_02', 'Ketena 01', 9, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '7ac4aefa-227b-4814-b5fb-80025ad52fbf');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ec873738-0257-41d8-80b1-9d27a71bdd76', 11, 'AA_AK_03', 'Woreda 3', 88, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'ae92113c-9386-467a-bbee-c5e3380a9012');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('06203680-c52e-423e-9ce3-e1d36e976ffe', 12, 'AA_AK_02', 'Ketena 02', 9, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '9907a23e-ec1b-4598-8c25-ea6b3a4082e2');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('e0e58fbc-c7de-4e22-9162-c718fb1c5f85', 13, 'AA_AK_02', 'Ketena 03', 9, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'd9438964-19df-4ad2-a17b-a88e4254db37');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('fb13c4ca-ccd5-44a7-8e91-e5e597aab375', 14, 'AA_AK_02', 'Ketena 04', 9, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '1608d069-3e23-4a66-b10d-62a4d0c8137c');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d274626d-3153-4782-b9e2-dfce6aadaed9', 15, 'AA_AK_02', 'Ketena 05', 9, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'e4fc49a5-bc2e-44e4-a32b-0884aebd370d');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('1bbc6b33-2cae-4b27-8b97-94fad53aa210', 16, 'AA_AK_03', 'Woreda 3', 2, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '3cde9d55-f14c-4e3f-af5e-f36191f7656f');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('6fc310b7-1f6f-445c-83a9-adc5b1d6ddbd', 17, 'AA_AK_03', 'Ketena 01', 16, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'c5ac8251-cbc4-4060-b105-9dfbc4263516');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('bf5c80e8-365a-453b-9a4f-db1285a503ce', 18, 'AA_AK_03', 'Ketena 02', 16, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'c6cb4547-48d1-4d0f-8517-b0d0e398860e');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('623b3056-4b76-4ccd-a358-b6956b1d206e', 19, 'AA_AK_03', 'Ketena 03', 16, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '766a6230-e690-4b3f-a577-df1f92096d56');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('8ef803c3-7e9e-46e2-a306-1063b86e5fd6', 20, 'AA_AK_03', 'Ketena 04', 16, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '5336597d-c4af-4b89-b8e9-24a9f160e378');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('f9adce00-466b-4073-a459-4a9b153d66a8', 21, 'AA_AK_03', 'Ketena 05', 16, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '89dcb8f9-079c-44a0-9fb5-580e8c847653');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('7f36c912-6657-4c2c-a3c1-cf1925015f21', 22, 'AA_AK_04', 'Woreda 4', 2, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '1f6caf95-6fd0-4d97-bb01-9b02ef76c5fa');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('9e316ac3-92cb-402b-b4b0-dcbb76103eaf', 23, 'AA_AK_04', 'Ketena 01', 22, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '1e0f7f62-bd5a-495d-8abe-487dba882bed');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('385ae1fe-8aa9-434d-bc65-15f2cf9e1493', 24, 'AA_AK_04', 'Ketena 02', 22, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '8a4117a6-061c-47b8-990b-90d2d8a1733e');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('58399441-7670-447b-bb8f-cb2748ccf4b2', 25, 'AA_AK_04', 'Ketena 03', 22, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '9c48ffbc-6ae5-4980-a910-17686fe230b1');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('717d57f2-3da5-4c90-abd5-b3e25c489ff2', 26, 'AA_AK_04', 'Ketena 04', 22, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '5552d1bf-778a-4ecd-98ed-305a819347a0');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('da23f0e9-64a0-4caf-86f8-26709dc76e63', 27, 'AA_AK_04', 'Ketena 05', 22, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '309d5327-b06f-46ee-b86c-6425b5b14723');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('67728f82-93d5-4ddf-9549-abe8d7ef88ac', 28, 'AA_AK_05', 'Woreda 5', 2, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '1fbcbbe7-9786-4a4d-8afa-db54c2b48250');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('acd78468-b0aa-4e72-8811-855f2386aa18', 29, 'AA_AK_05', 'Ketena 01', 28, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'efd4e7a3-246a-4a41-a51a-596cef69136b');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('009967b3-dd0e-4b6c-bdd7-ca84376fed34', 30, 'AA_AK_05', 'Ketena 02', 28, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'f8acd969-abe7-402f-a347-70c3059e3ba8');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d6b83dcf-89d6-4f5a-8ca0-3cb9b2729fbc', 31, 'AA_AK_05', 'Ketena 03', 28, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '68fbbb72-3df2-48dc-a65d-f7c772e6fef2');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('c282a533-97d0-4aae-a5fb-1537fe1bc964', 32, 'AA_AK_05', 'Ketena 04', 28, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '647993c6-f08a-4a07-ba77-c742c33e83ce');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('63e18b53-16f0-41fe-be5c-0e533c56d7dc', 33, 'AA_AK_05', 'Ketena 05', 28, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '8129cbce-094a-4954-b433-c8d63bbe662d');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('a6886a05-0fed-41c5-9400-7031557b06f1', 34, 'AA_AK_06', 'Woreda 6', 2, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '6da64f0a-a969-470e-9014-3c5a02782ac0');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('06b2b53f-b4da-4fca-a1e1-ef46a4aceffc', 35, 'AA_AK_06', 'Ketena 01', 34, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '0f12b990-886f-426b-8cc5-d64501756b1c');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('9f9617f4-b5dc-4e44-9fc0-357246636443', 36, 'AA_AK_06', 'Ketena 02', 34, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '2c4d9388-d1f7-4cdb-85f9-9b0d840d0bf5');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('25091f7f-90e1-4814-84a9-6a59d99d9582', 37, 'AA_AK_06', 'Ketena 03', 34, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'e8a0a553-13e9-496c-94f0-0eda692e2b78');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('396cfe88-f6e5-4f19-b7b1-f0f1f63c6982', 38, 'AA_AK_06', 'Ketena 04', 34, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'd389a756-459f-4159-ab74-70db99b12482');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('252968e9-7f08-4aec-acb1-219ad68e99f4', 39, 'AA_AK_06', 'Ketena 05', 34, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'ed032cdf-cec5-47e1-8f13-33ef48cb65d6');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('b307e2a2-ce20-4133-b81a-fe107f7083da', 40, 'AA_AK_07', 'Woreda 7', 2, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '9f4a7227-812c-4838-95dc-798415ce1b14');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('2114785c-2a57-4b0a-ada9-61b593ab3cd4', 41, 'AA_AK_07', 'Ketena 01', 40, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'fdf98e60-453b-4419-9e5d-62b3299cf82f');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('6517e220-4f8a-4acc-b291-e77fdd7af880', 42, 'AA_AK_07', 'Ketena 02', 40, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '64a2bbab-4c2c-4b8a-b216-5c207160fce5');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('f9c7b3de-9ee5-44b3-a0d5-b2afcd3bcefb', 43, 'AA_AK_07', 'Ketena 03', 40, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'ee00cd73-e031-44ed-9804-8066b3861e8a');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('0feab8e6-9889-4764-9642-fc30ed4128fc', 44, 'AA_AK_07', 'Ketena 04', 40, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'bf6c8aa4-28de-4ac3-b926-a4e39c19715d');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('5462db9a-9461-44c0-a45d-9ee0eec62ebe', 45, 'AA_AK_07', 'Ketena 05', 40, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'dfe3cea0-bdaa-4cb2-8955-6eb28fc9ed6a');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('a0b57fde-da53-46ec-ad82-9f523a634940', 46, 'AA_AK_08', 'Woreda 8', 2, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '0a88bfbc-cbb6-41e2-8b13-3251044e13c0');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('eea9b926-a530-4f80-9b0f-05780d7fe28d', 47, 'AA_AK_08', 'Ketena 01', 46, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '56dcaf30-36df-41a9-93f7-edc290b85b9e');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('38643cc1-6082-4891-a09e-3ff2b42c9f48', 48, 'AA_AK_08', 'Ketena 02', 46, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'f50cf559-f75e-4b0c-93a1-721ac997ca8d');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('9fe1c198-0437-4207-936f-3aa17d988130', 49, 'AA_AK_08', 'Ketena 03', 46, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '06af6881-21c2-4588-b18d-77ec494b8723');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('2b27946f-e496-4592-a361-41fb596d19d9', 50, 'AA_AK_08', 'Ketena 04', 46, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'e9fd1a2f-3879-4846-af32-07faffb1d978');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('2ecaf177-7b49-4493-a22e-e3ff353f2fd1', 51, 'AA_AK_08', 'Ketena 05', 46, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'bcad71c0-deb5-492f-a964-6dd4b71b6dc4');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('9b9dda95-392c-47ae-90b9-84b3b9d48985', 52, 'AA_AK_09', 'Woreda 9', 2, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '2e99908a-4ab7-4aec-b796-bba22622c6cb');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d7ecdff1-ec35-4e7f-9786-eeb90c100063', 53, 'AA_AK_09', 'Ketena 01', 52, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '3ac3963d-4f3e-41b7-9f84-fd71521a3fe7');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('db80c290-a1ea-4719-aa41-7d07499222d6', 54, 'AA_AK_09', 'Ketena 02', 52, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '807a5a55-1e2d-43b7-b9a8-82628d7b6918');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('12d70af3-f0b3-4555-ae81-facc916b30f7', 55, 'AA_AK_09', 'Ketena 03', 52, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '2af5f301-e843-4831-a11b-95693c53e22f');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('8352db33-8198-41d2-ab7a-f2684c6b0e46', 56, 'AA_AK_09', 'Ketena 04', 52, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'abeff8b7-2dae-4adb-9a6f-2eab939ce687');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('27b9d796-9e53-4fb6-8b3d-203487fe3daa', 57, 'AA_AK_09', 'Ketena 05', 52, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '8e4ae0ce-ce61-4b20-b017-09ab331060e9');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('31b0a198-ebef-4677-92db-2b4b9756572c', 58, 'AA_AK_10', 'Woreda 10', 2, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '8a6b51db-b7ea-4d83-b134-0304ab34e5f4');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('247e2a60-f582-42c5-8318-e58a664255fb', 59, 'AA_AK_10', 'Ketena 01', 58, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '12b1a1e9-b893-40a8-a531-cfabdb31e419');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('9f095461-4b56-4aab-a5ff-b2c10e633c0e', 60, 'AA_AK_10', 'Ketena 02', 58, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '67a54353-e6ee-4d64-99b4-581c2835caa7');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('86c474ce-57b7-4288-be37-55fb1c799b68', 61, 'AA_AK_10', 'Ketena 03', 58, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '551f354e-5749-4be7-95fb-2d664956d481');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('7833d1e3-0d0c-4b3e-b785-69945ac217d5', 62, 'AA_AK_10', 'Ketena 04', 58, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'fa78ba5f-c0ca-45b3-b248-4a827c1e8424');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('a75d08fb-a1db-4a2a-884e-5ce6b48ad88f', 63, 'AA_AK_10', 'Ketena 05', 58, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'ef837db9-094b-45d0-a0ea-ace4859e5ca0');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('224c805a-f60b-48bf-bfbe-8e55bae3015f', 64, 'AA_AK_11', 'Woreda 11', 2, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'f9a9bc43-82f1-42fc-a40e-32dde18fb796');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('fe5c1d31-4ab9-452d-9f9d-5b5858888066', 65, 'AA_AK_11', 'Ketena 01', 64, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'cab640af-435d-42bb-82c1-f74ab7d1bb21');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('1da788f1-c8cf-4b33-9d11-5ada1206651a', 66, 'AA_AK_11', 'Ketena 02', 64, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'ca37658e-409c-4222-b667-1ec07064232b');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('f99df0f1-4b12-4e61-9e15-08aab82374c9', 67, 'AA_AK_11', 'Ketena 03', 64, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '16029b35-d225-4c22-bdf8-28388db193d0');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('29c70f76-4304-482f-b7e5-66a3570a4c60', 68, 'AA_AK_11', 'Ketena 04', 64, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'd49a4764-5fdf-4b22-947b-5197d758a3fc');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('f689f500-9b8d-4f5d-9263-dc26cffc5e6b', 69, 'AA_AK_11', 'Ketena 05', 64, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'ce3eda4a-6a7e-4114-9060-fc4d0d0000c6');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('8123ef33-14ad-4f81-941d-2afc9bbdc51d', 70, 'AA_AK_12', 'Woreda 12', 2, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '85cbbc06-6062-488c-9ad3-fe3b06101277');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('e7b5233d-13dc-4f6e-babe-f442c8a868d0', 71, 'AA_AK_12', 'Ketena 01', 70, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'dd527cfd-96b3-498f-b4cc-b12e40b9ec73');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('6ac82049-5672-4144-b39b-32f9e49bef63', 72, 'AA_AK_12', 'Ketena 02', 70, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'b1f1800c-5643-48ba-9fb0-bf212b8d5907');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ce6313db-7b8c-4ae5-8727-5cceb62dbf48', 73, 'AA_AK_12', 'Ketena 03', 70, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '08dbcad5-9449-48e7-a9ee-11c60d8bbd66');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('0ac75681-ae58-495b-9965-2be173a10354', 74, 'AA_AK_12', 'Ketena 04', 70, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '1d0010de-0a5f-44bd-9030-9bee27dae8ce');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('9b50d5bc-eb4d-455d-85e8-c6971997c507', 75, 'AA_AK_12', 'Ketena 05', 70, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '5ab9afe8-8be4-46bc-ba18-806570f2400e');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('bd971405-ddf5-4e2a-93f7-666ac6c85698', 76, 'AA_AK_13', 'Woreda 13', 2, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '91734a6c-e395-4a77-ab98-82c2f24626e8');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('561f6723-454b-43ad-a924-e643fd248f40', 77, 'AA_AK_13', 'Ketena 01', 76, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '80498885-fb9d-4376-a401-012d3c22a0a8');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ad4adc72-ccb6-4cc2-9b2b-01b24e271b97', 78, 'AA_AK_13', 'Ketena 02', 76, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '16494944-881e-4ddd-82c1-a9f92b615fa5');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('776fa0be-72b0-4664-b5a4-44a12a3830f9', 79, 'AA_AK_13', 'Ketena 03', 76, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '2763b32a-7022-4b36-a6bb-487c2bc8aefe');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('60424a9f-e775-472e-bab7-7c7521f8a850', 80, 'AA_AK_13', 'Ketena 04', 76, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '8bfaaf0c-a8cf-49c1-a264-ec76263bc770');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('6f07c4ee-43fb-4e82-9315-b3354ed4ad6e', 81, 'AA_AK_13', 'Ketena 05', 76, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '7db1fe31-b8db-4da2-96b9-3c2fe6a9047f');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('aceb96e4-00bd-4e0c-a14d-2dc603bd49e7', 82, 'AA_AK_14', 'Woreda 14', 2, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '08c4d599-a51c-4567-8873-56b81b269e3a');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('323ebd39-c5d5-44e5-a32d-5e26fa0db139', 83, 'AA_AK_14', 'Ketena 01', 82, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '4a6ff8a0-8997-4332-b130-5c434a76276c');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('6bfa95a8-6a30-4803-b9c5-58fb1cba7d3c', 84, 'AA_AK_14', 'Ketena 02', 82, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '920035a2-6839-4fd3-a395-d45218376d4b');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('84b26f99-f6fd-4e23-b0dc-ca5ba785a8ab', 85, 'AA_AK_14', 'Ketena 03', 82, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'ebf09d1f-f506-401f-b271-6e0697e46617');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('b8a965f2-72bb-4df8-8813-77db5fd8c561', 86, 'AA_AK_14', 'Ketena 04', 82, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '4a609968-269a-4793-aa13-9b5d3eb770a7');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('fe334f32-e532-41dd-a6cb-48c929043ff3', 87, 'AA_AK_14', 'Ketena 05', 82, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'ff6a4f8f-0070-4a2d-89bb-2d87bdb5ff66');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('031ef326-bb3b-4503-ba47-7d2d938ffd5a', 88, 'AA_AK', 'Akaki Kality', 1, 
 'S', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '54f78e24-50ad-47d1-af0a-fad4833b5589');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('a9e4998e-bacb-4c93-9773-a3314efc9a3b', 89, 'AA_AK_01', 'Woreda 1', 88, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '7babda2f-f9a2-46a1-9a1d-e7b55177cebf');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('66b8cf67-9935-4312-baab-146da9d40aa5', 90, 'AA_AK_01', 'Ketena 01', 89, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'b9db4cea-85a7-4864-b9d3-338b3fda8454');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('bc2fc517-33c7-44b2-a2d5-50acc1b78a4e', 91, 'AA_AK_01', 'Ketena 02', 89, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'dcf8ab45-3c59-4167-a96b-8aef5b97ab8f');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('7db5180f-906d-46e2-a2c4-16efe6f44fb4', 92, 'AA_AK_01', 'Ketena 03', 89, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '5abbd852-3c14-47fc-bce4-dfd70affb25d');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('4be3bcc6-a2ca-4926-ba3f-ef3203076c9c', 93, 'AA_AK_01', 'Ketena 04', 89, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '76ce7d94-4caa-4ee4-84fb-fa7ea5fb9091');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('2dde51ba-6412-4bc5-974e-d2e368e240a5', 94, 'AA_AK_01', 'Ketena 05', 89, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '5a8c6fcd-2636-4044-a9ba-e814d31511e8');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('77fc97dc-7637-4c23-a2d2-23bd0bf51435', 95, 'AA_AK_02', 'Woreda 2', 88, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '3be4b391-6372-4413-a9fa-bc986382a669');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('46d67b26-39c2-4c26-8dfa-fec662a39f4c', 96, 'AA_AK_02', 'Ketena 01', 95, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'd2ec5473-22c3-4432-9311-d5eef8ee599a');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('6843d893-bc3b-414d-b26f-b9fbe65802db', 97, 'AA_AK_02', 'Ketena 02', 95, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '5698e36b-5056-4b1a-89bd-bc83194261e8');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('e0450105-9986-4906-a232-a116e2434650', 98, 'AA_AK_02', 'Ketena 03', 95, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '46010efa-cbdf-4649-bb92-573bc055ee46');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('f98463d1-56d8-4dbd-b8cc-6bae0537f9a1', 99, 'AA_AK_02', 'Ketena 04', 95, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '40571ee3-fb09-4da2-997b-11f4ff8f4690');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('97a6ef13-38b5-441b-bc47-5199b1cea1a4', 100, 'AA_AK_02', 'Ketena 05', 95, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'ce1141b6-e64d-4275-8dd0-772c77be5ce9');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('9c62c1c7-89af-4212-8ccb-e0ea16d6b2c1', 101, 'AA_AK_03', 'Ketena 01', 11, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '4cf8e917-31e7-4109-9a66-872c3c0a7950');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('71fb21ec-af30-47e6-b159-9e0e44201477', 102, 'AA_AK_03', 'Ketena 02', 11, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '45162c23-cfae-4f0f-8db1-70df8f61002f');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('dab5ad5b-0636-46c0-b7c7-02c0a879dc78', 103, 'AA_AK_03', 'Ketena 03', 11, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '00fb387e-5e6d-46b8-a50d-9c205a50e3e8');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d656691c-a280-4af0-8832-efae006ed3b9', 104, 'AA_AK_03', 'Ketena 04', 11, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '7ada211e-8a36-4f4c-b432-18ec89dbc7d0');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('59eabdd4-c2eb-4aa8-afac-d91a19ddad5d', 105, 'AA_AK_03', 'Ketena 05', 11, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'e04d2cf4-8170-4f73-967b-7a277e89e254');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ee8a5e3f-94cf-48d5-b6f1-946f24bafd80', 106, 'AA_AK_04', 'Woreda 4', 88, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'b5508916-570e-4dbe-845c-664c04400da9');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('2c1b4b7d-046c-40e0-89cc-6688230ca2a4', 107, 'AA_AK_04', 'Ketena 01', 106, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '0dcb2e53-825c-46c0-885f-f247c1f6746a');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('83f37a8d-c506-4102-b4e0-8b161a5c7857', 108, 'AA_AK_04', 'Ketena 02', 106, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '7a6ba432-032a-41e3-a682-1b2a13fc061a');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('a50f1a26-1ef3-48c3-9738-680baf815d1e', 109, 'AA_AK_04', 'Ketena 03', 106, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '7a2caa66-a750-43c8-879d-7f66d3aca3ec');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('b4f51f53-a615-40f7-8a1a-22ef0488792f', 110, 'AA_AK_04', 'Ketena 04', 106, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '982510f6-82b4-4852-85ef-5061d1faec90');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('78a18a0f-32b7-427f-870e-3291f9db5833', 111, 'AA_AK_04', 'Ketena 05', 106, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '25b37f3b-1d2c-4ebf-91f0-d5675c7f9b87');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('0ebcaddf-e411-49ea-91cb-28a8c2b2e352', 112, 'AA_AK_05', 'Woreda 5', 88, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '88a48346-815f-4f16-935a-325dc497a6fd');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('03f6d2c0-0e13-4d8b-a22d-99b5d00d5d05', 113, 'AA_AK_05', 'Ketena 01', 112, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'af158243-fc63-469c-b64e-b0d1ede294e1');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('924970f2-deb2-4a15-9aa7-2ccaf91dddc9', 114, 'AA_AK_05', 'Ketena 02', 112, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '6fe8aeef-246d-4e69-9c44-428e01938c5a');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('71bd1e31-6ef9-41e6-b6d9-ff8e5e4a9ca4', 115, 'AA_AK_05', 'Ketena 03', 112, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '3070b026-4c91-4e3b-9932-1877f17ad1fe');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('e0db790d-d9d1-4a95-bba7-68472375027c', 116, 'AA_AK_05', 'Ketena 04', 112, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'dcdb691e-1846-4493-b0f7-89f4435443b5');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('057e9ded-0b24-4c6e-9eb9-139978154c5d', 117, 'AA_AK_05', 'Ketena 05', 112, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '0ada5552-9031-45e7-9c6c-4980b6834b6c');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('179b3bb2-d9b7-42d5-bfdb-22f300d81488', 118, 'AA_AK_06', 'Woreda 6', 88, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '7f927a5e-8b38-4694-a61e-0dd03b668365');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d9f42efa-b945-42b1-92ca-c1bbc19c3637', 119, 'AA_AK_06', 'Ketena 01', 118, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'df985e11-a9c5-468f-928c-74ced15417e0');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('dbf35750-c53b-4d62-b9ed-f1940108171d', 120, 'AA_AK_06', 'Ketena 02', 118, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '41782f36-d6ff-458c-82e7-6300464fe554');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('9d8bf98c-d2e1-4492-8d9b-3f8dbfef3905', 121, 'AA_AK_06', 'Ketena 03', 118, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '2344c89e-c8a6-4181-afdd-c93985887cd8');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('3b425ede-426c-49ea-95a1-5b92f01a66e1', 122, 'AA_AK_06', 'Ketena 04', 118, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '0a9ab926-cd4e-4171-bdf1-ffef3f35cac8');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('4120abcc-b978-4723-a06b-516feef54d97', 123, 'AA_AK_06', 'Ketena 05', 118, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'f8b0d4e2-a85e-4408-9c3d-6558c670e2bc');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d564a735-2f6d-409b-acc6-32450921072c', 124, 'AA_AK_07', 'Woreda 7', 88, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'bb6d6043-6d27-40f1-acad-1a7df100970f');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('68bb1d47-f3f3-4e42-aa9b-88146aca33af', 125, 'AA_AK_07', 'Ketena 01', 124, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '956c2b65-5b07-47bc-ab31-d29eab58dc7a');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('62305be0-eb39-46fb-a3e4-7d112ea77f9b', 126, 'AA_AK_07', 'Ketena 02', 124, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '98617615-311d-40f4-a959-aa98128a2e1d');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('57786403-0bba-4caf-aafa-4fef3f521b01', 127, 'AA_AK_07', 'Ketena 03', 124, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '69bd59ed-0e80-43db-9355-1ef7a2ace3e7');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('c5ec8239-f7f8-4ec9-8a1a-ae809108aad1', 128, 'AA_AK_07', 'Ketena 04', 124, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'f01f5716-3063-4ae1-93ff-31906b3a13cf');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('8bd0e568-ea82-4b6c-9d3c-a287b512fcdf', 129, 'AA_AK_07', 'Ketena 05', 124, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'dc5d4e2c-2bf4-426c-8c31-197dcb58117d');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('bf385c27-8ac9-43fe-a26b-e4c8cc9c6ad9', 130, 'AA_AK_08', 'Woreda 8', 88, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '5b0e6cb1-5b93-41a0-9dbc-e27163d0e953');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('7c318854-e78f-44d2-aa76-6552b399a1df', 131, 'AA_AK_08', 'Ketena 01', 130, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '2301a200-107b-4f2b-8e95-2a844bfc4364');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('f4909109-6c2f-4d03-84cd-ca1195e7477e', 132, 'AA_AK_08', 'Ketena 02', 130, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '7636d8bf-08ea-43e8-a091-5074c0cf55ad');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('cb0b5811-f947-41f0-8571-2182718ac8cd', 133, 'AA_AK_08', 'Ketena 03', 130, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'ebfae9e1-78c3-44e6-82eb-cc73deb64254');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('47c78857-2345-4d5b-b8c0-acf5b4d387ca', 134, 'AA_AK_08', 'Ketena 04', 130, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'ad9075d2-f342-4963-8e78-d7e0f4afeeee');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('a8a2f1cc-5e59-48f3-9aae-c2d5d911a076', 135, 'AA_AK_08', 'Ketena 05', 130, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '2d549b61-aea8-41c8-a966-2eeee300707e');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('0ad66440-18da-4123-8be9-63b591dd6cc9', 136, 'AA_AK_09', 'Woreda 9', 88, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'edcf877f-44ac-4343-9292-b97eead6a347');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('b8113e08-cda1-442f-97b9-72b31bdc9389', 137, 'AA_AK_09', 'Ketena 01', 136, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '42ba4b64-b918-41a7-96ef-ee77c9647037');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('6707eeeb-6187-4176-9e90-fd35d4ec72c3', 138, 'AA_AK_09', 'Ketena 02', 136, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '74a9fbda-009e-445a-a87a-f64978b702be');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('f9d2be92-fb4a-4db2-9f0b-3a64d635991a', 139, 'AA_AK_09', 'Ketena 03', 136, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'e29a38b2-f3f4-4d81-a9d2-a252fda32be8');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('adc12410-a694-4b7a-8136-857809eb87fd', 140, 'AA_AK_09', 'Ketena 04', 136, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '944275d7-d62e-48b3-996e-43b0628612c8');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('30765fc0-7ef1-4112-9371-76c8179fdb0f', 141, 'AA_AK_09', 'Ketena 05', 136, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '0218bd5f-e8d4-4737-90ca-8fba9e589afe');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('9d4cf8b3-fb62-4dfe-be8e-92ff8bb1dedb', 142, 'AA_AK_10', 'Woreda 10', 88, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '3bfdc3e4-8d79-4363-8f2c-9d81887fac4c');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('49b7303f-0ef8-45dc-94b2-4af9b9f32e37', 143, 'AA_AK_10', 'Ketena 01', 142, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '99490972-f601-47f1-9d77-ee138e43b6d9');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('90f4519a-feca-4885-a35a-2fe7983c99a7', 144, 'AA_AK_10', 'Ketena 02', 142, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '285a87cd-b0b4-4198-914e-2e511c5d9f0e');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('6380421a-fb41-415d-b46d-6448e8fb37dc', 145, 'AA_AK_10', 'Ketena 03', 142, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '44a72a09-607d-4d05-a16e-e603a5498b7e');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('fe4757ef-f815-4a9e-9e8e-2808191b539e', 146, 'AA_AK_10', 'Ketena 04', 142, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'f35cf560-14b3-41a9-a855-cf98c351e3ca');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('5084bf68-5b7c-4e04-9b8b-30cc36a64ab8', 147, 'AA_AK_10', 'Ketena 05', 142, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '9496287c-a080-4370-8947-e5c470a5ca64');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('eb82ccd5-8c11-4326-be38-6f9165c45a72', 148, 'AA_AK_11', 'Woreda 11', 88, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '88c4a275-a844-4f81-b6a5-73d8313c6aa6');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('bab3bb6a-e047-4383-8ff4-40f42988cced', 149, 'AA_AK_11', 'Ketena 01', 148, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'f9ac90d3-84bd-41e1-a336-e371a62907b6');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('9cc4799b-0a8f-4e2a-b97e-97b4f704a3f7', 150, 'AA_AK_11', 'Ketena 02', 148, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '2e7ab4b3-d3cf-4d91-954e-a2d742b20471');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('81dcc2ee-ab67-4ac3-a9a6-fe4edfa9d90d', 151, 'AA_AK_11', 'Ketena 03', 148, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '3690e9a5-e212-468c-b000-1f68af854a58');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('88cd84da-5428-4f3c-9590-17dd86ea8efc', 152, 'AA_AK_11', 'Ketena 04', 148, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '3b555bd8-0cbd-48e4-b6d7-9bc5ff38104a');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('b71cc2c8-ae4e-416f-834e-f5b61783778f', 153, 'AA_AK_11', 'Ketena 05', 148, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '5b929ecd-f6ee-4d48-ac97-9a7d364ffc10');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('b6f629d3-9f19-4e5b-a61b-a3d61caa79f3', 154, 'AA_AK_12', 'Woreda 12', 88, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '300c9554-7cc4-4a29-aba6-4def2fa8b518');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('5dde3fa5-a867-4b56-bf0e-6188e3738709', 155, 'AA_AK_12', 'Ketena 01', 154, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '8bc20147-7282-4e5d-b173-0fe644ed62ec');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ad36883c-bd24-40b0-be03-b5c2b23f4bc9', 156, 'AA_AK_12', 'Ketena 02', 154, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'd3455a30-b666-4607-818e-647bcbec3a5b');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('bcab5dae-cbd2-499d-b4dd-58fe06704938', 157, 'AA_AK_12', 'Ketena 03', 154, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '55780157-0f3d-4c8e-aa34-fbd1dc63fef8');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('4a8401ae-ca13-45aa-81e1-12843ff41099', 158, 'AA_AK_12', 'Ketena 04', 154, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'cdb5ec14-628c-4af4-af9e-33e07608e5ce');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ca1721f5-11a5-4cb5-8f4c-4e2711193466', 159, 'AA_AK_12', 'Ketena 05', 154, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '1c5ca4f1-2fec-4bb5-a57a-c1fc625a3f5a');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('3082c13b-ce7b-43d3-9434-984c528c0db6', 160, 'AA_AK_13', 'Woreda 13', 88, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '5ca987cc-cb46-4215-b49d-0776ba17dcdb');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('96e92489-4392-4325-b36a-e3659f9e5da3', 161, 'AA_AK_13', 'Ketena 01', 160, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '5e57ca71-9a45-4c9e-93c1-a4b7f8066e33');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('a8b8a6d8-83a3-4337-a5f1-925cb784a120', 162, 'AA_AK_13', 'Ketena 02', 160, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'c9380aca-b441-4203-a0b9-3b00052675d2');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('c0e0f46a-6545-4bd6-b8ac-2014afd940b1', 163, 'AA_AK_13', 'Ketena 03', 160, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'f4ad43a8-c16b-4edd-839c-10584f9cbd1e');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('a0f2a441-01a1-4f9b-8a11-093083550019', 164, 'AA_AK_13', 'Ketena 04', 160, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'b78d0627-72ef-4f67-a69d-8675b57baa5a');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('272a399d-30c1-4f39-af62-ff896e6d9805', 165, 'AA_AK_13', 'Ketena 05', 160, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '88499b6f-fb24-4c42-9f87-6acac1f107bf');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('f42539cd-2b89-4d0f-acb7-d21262a76e1f', 166, 'AA_A', 'Arada', 1, 
 'S', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '2340b822-9f8b-4a38-9afa-574ba9a93563');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('cd200927-3606-4dff-ab6c-8f528d6dcf7c', 167, 'AA_A_01', 'Woreda 1', 166, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '537595c8-9fd8-4b86-8060-4fa1e4469323');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('18fea33a-4d4c-4d6c-a0b8-98808017aee3', 168, 'AA_A_01_', 'Ketena 01', 167, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'c19886af-5c60-41d1-8d84-94e23d25a4d6');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('6333a467-3778-4a53-85a2-3d7f2cbfa817', 169, 'AA_A_01_', 'Ketena 02', 167, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '371655e6-99e8-45e4-8a56-ef89813d84c6');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ad0b8df4-d4a5-48fa-8455-0f4984ddc803', 170, 'AA_A_01_', 'Ketena 03', 167, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'be798b3f-62f3-4ea0-86fc-6bf9d11208b7');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('1e678ef0-74b6-44c8-96e3-379dd1000b0b', 171, 'AA_A_01_', 'Ketena 04', 167, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '18d1f33a-a28c-4ceb-86e4-a895f3fa8b9e');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('b6b31cc3-0c0b-45dd-95cf-37f008144bdf', 172, 'AA_A_01_', 'Ketena 05', 167, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'c3f85223-8699-4f6f-af1c-ac0f46b3c119');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('4f7f0f94-aacf-4f12-ac53-2a4787d8a62e', 173, 'AA_A_02', 'Woreda 2', 166, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '6ff0b0ff-e47d-4bd9-8817-ea3b729a3c99');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('236c614c-b62b-4b02-ac49-2f1393a88d09', 174, 'AA_A_02_', 'Ketena 01', 173, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'eb5446cb-180f-4a9e-b94d-741aa0da526a');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('fbaef6cb-faa7-40e8-b0a9-88534f488e21', 175, 'AA_A_02_', 'Ketena 02', 173, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '537a73c6-9782-4d45-94e2-a99f3c55ebe8');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('cd886aa0-71f9-4a8f-9c34-0957948ced35', 176, 'AA_A_02_', 'Ketena 03', 173, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'bd30b92c-515f-441f-8c18-21b5b56f12f9');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('295f9703-a2db-4fbf-b5b1-0daf0e08b856', 177, 'AA_A_02_', 'Ketena 04', 173, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '31396bb1-3fc1-4c76-8be4-63b2b384a355');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('2643703e-6457-44df-a257-a55eb49808f3', 178, 'AA_A_02_', 'Ketena 05', 173, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'e0efc649-209b-452a-9a80-6483e80f9803');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('2a125f4f-efc0-4ecb-897d-9e4c0be2ba0d', 179, 'AA_A_03', 'Woreda 3', 166, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'b2199fe4-3529-497f-a9b5-3d6bb3ac8c90');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('7646bae4-e010-45bf-bf9d-6d60547e769c', 180, 'AA_A_03_', 'Ketena 01', 179, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '1fa28862-06af-4fc6-92e9-82f79ec965e8');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d240d3ab-48ee-472d-b2df-c2001236de5f', 181, 'AA_A_03_', 'Ketena 02', 179, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '62292470-3e52-44ad-ac99-f25e7a0cbc37');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('294712ca-98ac-4911-ad19-f8f06cabd052', 182, 'AA_A_03_', 'Ketena 03', 179, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '16ca4d10-95ee-414b-ba9f-e11104d86486');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('6ec44a91-4ee7-45d7-8e95-31ab645f686f', 183, 'AA_A_03_', 'Ketena 04', 179, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '436f8123-a8a7-4010-bd05-86e1ee9773cc');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('5ecd7701-066d-480a-884e-61d563cd3aca', 184, 'AA_A_03_', 'Ketena 05', 179, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '9936160b-c1ed-4dba-a11c-2bdbbce026ed');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('9ff9165e-0920-475c-b679-44089a4e96bc', 185, 'AA_A_04', 'Woreda 4', 166, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '6a2adf0a-77cd-4941-acad-a268576d6366');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('c3cae8f5-24b0-40c1-b8bc-77681b593ca0', 186, 'AA_A_04_', 'Ketena 01', 185, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '9e0c9cc1-8f55-401d-9e30-6e780b6c91f3');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('cb1595f7-f5a3-43c1-811a-08016492e60f', 187, 'AA_A_04_', 'Ketena 02', 185, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '51077c9e-a6b6-4f89-87c3-0cf310940afc');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('01f9bae5-d42d-49ed-9ba5-427ca3b5cc68', 188, 'AA_A_04_', 'Ketena 03', 185, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '9624f09a-d43f-41ef-8053-f0a6a9fa144f');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('5e18b1b4-2808-44ca-beec-b3698c53ce5b', 189, 'AA_A_04_', 'Ketena 04', 185, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '7e86467a-391c-4475-a353-d6d34a6648ac');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('7ffe7b0c-d5f5-4431-b7f3-8f97e3be7d6b', 190, 'AA_A_04_', 'Ketena 05', 185, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'dfa1e3b3-2dac-4290-9828-3044f656cffa');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('3c7faf93-c6a4-497b-b49d-acb6259171bd', 191, 'AA_A_05', 'Woreda 5', 166, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '46f7143d-5fce-45f0-9e36-a6f113bd925d');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('2aaee5c8-f8cd-4295-b55d-9315ae8a5d07', 192, 'AA_A_05_', 'Ketena 01', 191, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '95a35ce7-0056-4f0d-b00f-585590ffb8a1');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('7054c458-f348-4902-bfdc-c75f5ddfa5cd', 193, 'AA_A_05_', 'Ketena 02', 191, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'dfd34e8e-bdd3-43f4-ad15-88ee5adb99d0');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('420fb308-159e-476a-8bb7-2cea9a9ff0fd', 194, 'AA_A_05_', 'Ketena 03', 191, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '083d84c2-7f51-41a1-b438-2fbc0f218adf');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('308b969f-49ac-4de0-b696-56c6e0d46cf0', 195, 'AA_A_05_', 'Ketena 04', 191, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '835ce40a-8327-4b14-b678-ec5f9becbbf5');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('1c7ee75e-31fd-4533-b509-340ac7e658d5', 196, 'AA_A_05_', 'Ketena 05', 191, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'ce3385fa-51ff-475a-bc71-ecf6d66504f5');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('697c8414-7b80-4d4d-b71f-9f73dcf51cb2', 197, 'AA_A_06', 'Woreda 6', 166, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'a60a42fb-5a1e-4aca-8137-8a6ba0da70da');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ef3a3e96-b186-4bdc-a61d-1fe78e508528', 198, 'AA_A_06_', 'Ketena 01', 197, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '9003e977-1911-41a1-87e5-f3a04e5d7590');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d58ba5b9-bc41-4b41-ab9d-7598acdd25d6', 199, 'AA_A_06_', 'Ketena 02', 197, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'ba30e96e-cfde-4ff8-a63e-ad8c851aaeca');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('c4be6a0b-2571-4150-b4c5-2b0a2e3a845b', 200, 'AA_A_06_', 'Ketena 03', 197, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '3fdb1736-1bcc-4523-b406-0dfd821bc1e4');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('9e80d90e-9a9a-4438-84c3-7ab950d10f36', 201, 'AA_A_06_', 'Ketena 04', 197, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '430fc5f2-8600-4101-a7cc-0ce53a961d5a');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('5fc66afa-8b1c-4657-abff-2bb60316ab0d', 202, 'AA_A_06_', 'Ketena 05', 197, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '7996d7e3-f7a1-4ffb-8312-32c52638ce71');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('05114d41-ad60-4246-9808-56f8a11f2355', 203, 'AA_A_07', 'Woreda 7', 166, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '5c7cd5e5-5b75-4fee-bc9f-770cad1a9d44');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('9cc91758-75af-4ab9-a8f3-ea3b0b57e306', 204, 'AA_A_07_', 'Ketena 01', 203, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'bc6eb724-acd7-45cb-9c46-d97c0a20c80b');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('a19edf25-cfeb-43dc-8f19-b3911492c84e', 205, 'AA_A_07_', 'Ketena 02', 203, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '6290b195-bbba-4fab-a917-1be159fa91c9');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ef7d52fd-a5ee-4624-9680-e65a8a214aa5', 206, 'AA_A_07_', 'Ketena 03', 203, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '57819434-acc4-4b84-897d-10acf6705827');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('e1eadb04-7dc1-4294-b432-003177f469e3', 207, 'AA_A_07_', 'Ketena 04', 203, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'f078d26c-ce08-4f28-842f-33164797deac');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('b383d12a-7c86-4b8e-9020-f6c7ba73ee7a', 208, 'AA_A_07_', 'Ketena 05', 203, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'a1489866-ee95-4c67-b5fb-15ffa17ff6e3');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('95dd6af3-388a-4959-8c17-2919699c735e', 209, 'AA_A_08', 'Woreda 8', 166, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '05afc054-bbd2-47f6-974d-ef99dce652e6');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ee366dec-1f1f-430e-83e3-f5db483b7584', 210, 'AA_A_08_', 'Ketena 01', 209, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '9131cc9d-b4fa-45b0-bfce-58d8ac9ef384');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('4f30c5b2-51b5-4aee-86bd-7fcbfcbbff99', 211, 'AA_A_08_', 'Ketena 02', 209, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '7892e671-8810-4964-a6e5-beff37546198');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('c57fc1e5-f9f2-4799-a36f-30cc550e40e4', 212, 'AA_A_08_', 'Ketena 03', 209, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '722e6485-0174-4408-abb8-350f8c3623c9');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('6065eb50-1cad-4aa9-9590-fc4db078b5ff', 213, 'AA_A_08_', 'Ketena 04', 209, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'de4d60cc-53f8-4c71-85c4-63882f81ac60');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('54f2eac6-2b6d-477a-a22c-16607f5a7184', 214, 'AA_A_08_', 'Ketena 05', 209, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '792f22a3-01c3-46f8-a3cc-c415a3a0de84');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('b4341e3e-fb55-4c2c-8c57-f0134172b02f', 215, 'AA_A_09', 'Woreda 9', 166, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '1e5fcd60-11a7-4518-82bd-317a88cc3e36');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ab356d32-7081-44cc-ac8c-99ca26f03891', 216, 'AA_A_09_', 'Ketena 01', 215, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '55841f9a-b375-4030-be1f-5fac177d31f5');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('a670e8f0-5f07-4a8d-9bc6-24f409ef50dc', 217, 'AA_A_09_', 'Ketena 02', 215, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '9ac59a1c-b807-4ca2-ae4d-85db879e0500');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('3564e541-7ef4-47c0-9a1e-0a13ff154aa9', 218, 'AA_A_09_', 'Ketena 03', 215, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'd996bf9f-8fab-457c-83dc-fab10a9f4bd6');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('3d9eb34f-fa74-4a6b-93bc-ef168032b088', 219, 'AA_A_09_', 'Ketena 04', 215, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'b73c0e6b-170a-4838-a87a-8e1685349bd0');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('2b22e67d-157b-4bc8-9876-4b76c138b8a2', 220, 'AA_A_09_', 'Ketena 05', 215, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '6bc42146-024c-48aa-9aae-f42377d8d669');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('4ec29ed9-b2fa-46b0-8d31-4d11a3930da8', 221, 'AA_A_10', 'Woreda 10', 166, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'c49632b4-abae-4f55-b9ee-cdfb5a982d4e');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d7dda5e4-3b8c-4901-a965-cdbfdd22717c', 222, 'AA_A_10_', 'Ketena 01', 221, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'f5774ae4-af12-4700-b013-25cae4cb0a45');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('4f09b739-a0d3-494a-a6df-13df41368949', 223, 'AA_A_10_', 'Ketena 02', 221, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '71ed740a-3c9e-4797-910d-82ee82caeca5');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('b55cf205-2a64-4ed8-bc65-1c6b75c9a600', 224, 'AA_A_10_', 'Ketena 03', 221, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '38909746-c6bb-4ccd-b238-9b33d5d262d3');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('6421cb81-f2f8-4949-9ddf-422fad053a47', 225, 'AA_A_10_', 'Ketena 04', 221, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '92522c75-436f-4ee7-ac5f-16780f21fb69');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('a4579d7c-e013-4964-98ba-7e8d6b03ec00', 226, 'AA_A_10_', 'Ketena 05', 221, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '74455c6f-c675-4c1c-9e91-8df0e20e3eac');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('00ff71ea-7a96-47bf-a881-9f05874542ed', 227, 'AA_B', 'Bole', 1, 
 'S', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '87f2ce05-c51d-4992-9f42-9afeca026916');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('6d6094af-eebe-4603-ace1-84fa255c36f9', 228, 'AA_B_01', 'Woreda 1', 227, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'ec4f3481-3f55-4297-984e-38e2af2f6d17');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('388f23e7-e550-451b-b5b0-85f0220f05e2', 229, 'AA_B_01_', 'Ketena 01', 228, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '9d5c6a21-09a3-415e-949f-69736bfcf6e0');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('83b5e348-4708-407e-b56c-77f4efcc376b', 230, 'AA_B_01_', 'Ketena 02', 228, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '02badc2e-139f-41b3-89f5-045fb21b85fa');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('9d18f86b-6741-4c67-b854-7114f02439ec', 231, 'AA_B_01_', 'Ketena 03', 228, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '5b3fa8c2-517b-44ce-af23-f9e385178e84');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('260b4b26-873a-4791-a434-970f0897fff8', 232, 'AA_B_01_', 'Ketena 04', 228, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '2893680c-5e9d-4439-8c71-568b81eedd82');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('b7c45f02-35d8-4d5e-b4b6-253021c0de4e', 233, 'AA_B_01_', 'Ketena 05', 228, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '8efad998-d3c9-4890-b8b9-e3b9c77d851d');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('fa90be28-cf99-4d0b-8f37-dd826f5e899c', 234, 'AA_B_02', 'Woreda 2', 227, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'c1538045-f180-4044-ae71-6e112292076e');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('a4728654-4698-4b96-ac1c-1c081b5038f8', 235, 'AA_B_02_', 'Ketena 01', 234, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'c1ff93f7-f5d9-417a-a78b-9e48bd156d35');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('c2257a86-d6f6-4c52-9060-a993a5a93c32', 236, 'AA_B_02_', 'Ketena 02', 234, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '55814a39-8d76-4729-93a8-303413f40c33');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('6edbf8d2-eacd-423c-8251-010eb3d9d9b2', 237, 'AA_B_02_', 'Ketena 03', 234, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '311bddba-5d7e-4fae-9d49-87f195cccb12');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('dacc00ca-7682-4703-b149-cfdaa49d4165', 238, 'AA_B_02_', 'Ketena 04', 234, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'ecf17a27-bbd8-42ce-aab7-891dc4de396d');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('e69624fd-bc96-4b3a-ba72-cddfd7bd314d', 239, 'AA_B_02_', 'Ketena 05', 234, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '65a5eebb-f16d-41f6-b2de-181a3f6c670a');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('013d14a6-a42c-4cf5-b610-344215c8e1a4', 240, 'AA_B_03', 'Woreda 3', 227, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '4b8c5e03-f3b0-40fd-9164-d81bd9998533');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('8563cfe9-6a6e-460d-8cd3-8f0dfbe58973', 241, 'AA_B_03_', 'Ketena 01', 240, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '48bfc0c2-4f7f-4283-81e1-813ddf33cab1');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ada6b5d7-c7ef-4e3d-b241-511eac7a991a', 242, 'AA_B_03_', 'Ketena 02', 240, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'd076467d-d750-4e46-aaf6-683d3d2987e9');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('1aa6ad66-b2d5-4834-b1e8-381f67a430c6', 243, 'AA_B_03_', 'Ketena 03', 240, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '36459ea5-d712-4e4c-bf35-c07cc3297fe0');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('10edd78e-3b1d-48e1-8b67-25f5d99c394d', 244, 'AA_B_03_', 'Ketena 04', 240, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '19e3d5b0-d2bc-495b-b9c7-912d26c1682a');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d63b5364-715f-4103-92d8-f49a9192f6d7', 245, 'AA_B_03_', 'Ketena 05', 240, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'a19600b7-1f8c-4c06-be1f-794bb174195a');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('9c0e8150-ebc2-4fa1-83bb-73b710c08efd', 246, 'AA_B_04', 'Woreda 4', 227, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '3d03e5fb-c14f-4f2d-8472-95085951ed81');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d5d47497-38cd-4d5a-aa7e-b19e2a4a11c1', 247, 'AA_B_04_', 'Ketena 01', 246, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '3e21efb0-f0f8-49eb-94cc-26c6c48b5ddb');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('1bcf814a-331f-4b8e-b2a9-d7a66a0be6f8', 248, 'AA_B_04_', 'Ketena 02', 246, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '30718425-8ee1-46eb-b718-02d2ee381d6c');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('63a68227-1272-4615-b881-daa02351b7af', 249, 'AA_B_04_', 'Ketena 03', 246, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '9cf0fc99-548d-45a4-b43d-198235f786aa');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('89932db3-fff7-440e-bfc9-aa707e05cde6', 250, 'AA_B_04_', 'Ketena 04', 246, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '0159d9a1-a82e-4816-b97d-82a31a33b030');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('86bfc34e-8d4c-4f44-979f-d3a149d3c4bd', 251, 'AA_B_04_', 'Ketena 05', 246, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '78088716-4667-4f20-8ac9-cd1e1add1241');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('c2a42825-0840-40e5-92ab-ab5c5004ef89', 252, 'AA_B_05', 'Woreda 5', 227, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'cc9f66a7-5693-4787-a2f7-63b2fa628522');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d9bec39d-829b-485d-91b3-4ec6125da73c', 253, 'AA_B_05_', 'Ketena 01', 252, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '761497bf-9f11-4332-8162-9d874cdaee30');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('14c8cabc-641a-41dc-be93-6bf777ec014e', 254, 'AA_B_05_', 'Ketena 02', 252, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'a0d1b377-6452-4550-aa22-5de4d473c65d');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('df3d88cc-d522-46aa-8365-c7930f32b639', 255, 'AA_B_05_', 'Ketena 03', 252, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'a050290e-f0e5-4bf5-9a2c-c3f992926415');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('99b3a800-77c0-4bf9-971d-f9c472ca4926', 256, 'AA_B_05_', 'Ketena 04', 252, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '72165b9e-f88d-4d9c-a774-dfdcb7ca77bd');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('708e403d-8b27-4feb-b1d7-152dbad83f04', 257, 'AA_B_05_', 'Ketena 05', 252, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '36b12f36-b244-42b1-9dcd-98a6b5c07b8f');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('a30ca945-2841-40b7-880c-fcea244084d7', 258, 'AA_B_06', 'Woreda 6', 227, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '40deb659-eca7-4ca0-96c2-73634858a751');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('7dbcccb4-f2f6-4f8c-81d6-ea16b2c2b2e3', 259, 'AA_B_06_', 'Ketena 01', 258, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'e89057b7-ad39-4bf1-86cf-c89e4e94f575');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('c8c12185-0ea4-4a85-b8f3-0e1783177630', 260, 'AA_B_06_', 'Ketena 02', 258, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'e7803330-8ce5-4011-9de7-763a910645c1');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ab35aaba-57ee-49e5-a27f-dfaab9b4af06', 261, 'AA_B_06_', 'Ketena 03', 258, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'e468c28b-20de-474d-a9c1-55370a84e822');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('30650acf-6df5-4b85-88da-e7f1bacb768b', 262, 'AA_B_06_', 'Ketena 04', 258, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'bd929b9e-414b-431c-9bfd-9a20fc59a8ba');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('f0664c3f-7d50-4f65-ae24-53f27a996a00', 263, 'AA_B_06_', 'Ketena 05', 258, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '90a8c02c-565a-47a1-9f3e-2236cc13dac7');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('e9da8d36-fecc-4a24-97cc-e9062de1c8c9', 264, 'AA_B_07', 'Woreda 7', 227, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '7d6ccf20-0c2d-4b6c-9094-a6081f459425');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('0e92ac07-2ab6-4b71-b08b-3f6cc64a97e9', 265, 'AA_B_07_', 'Ketena 01', 264, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '39fda87b-12e6-4509-bad5-a831d11c8c5a');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('eb5a7485-ecd0-48f8-86fc-f3e7a48fc794', 266, 'AA_B_07_', 'Ketena 02', 264, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '06dca360-c2f7-46ec-af4b-595f80d477ea');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('f7500a28-5c45-433d-84ca-97b1a9fd8787', 267, 'AA_B_07_', 'Ketena 03', 264, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'afc264fa-9b9c-4e2c-b4da-8f9c1553fcb9');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ef68ea29-06a6-4944-ac0d-7cff36b53f6a', 268, 'AA_B_07_', 'Ketena 04', 264, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '507b80d6-7764-4b03-9397-73763c6ec340');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('c688a6a3-7f52-40c9-8331-82c8ad4f704f', 269, 'AA_B_07_', 'Ketena 05', 264, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '53830887-03e0-4af1-bfee-f46da66f2c00');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('9ebd72ab-701d-4ba1-81c6-651e86e5d573', 270, 'AA_B_08', 'Woreda 8', 227, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'e31a2f04-19ad-4f93-8976-4992b0810d3d');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('b0ec4244-5002-4119-a3fd-f87fb131214b', 271, 'AA_B_08_', 'Ketena 01', 270, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'a17119a8-fbed-40a0-a66b-e7a78b92ef4e');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d8142e1f-08ab-47f4-8587-028c8d6b56a1', 272, 'AA_B_08_', 'Ketena 02', 270, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '288c9f54-3fb2-484e-b9d4-2bb4285afe6e');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('cf0c3630-d11f-48f2-a7ad-90c72eb9616f', 273, 'AA_B_08_', 'Ketena 03', 270, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '0e2f5400-49ae-4afa-8e94-2f26f4c6be40');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('15e097b9-8f89-4ca9-bea8-99621bba1a6b', 274, 'AA_B_08_', 'Ketena 04', 270, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '1350ef95-5e29-4b88-a48c-01a68a4fa14b');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('32098832-eefe-42a6-b441-9f46ba9cc270', 275, 'AA_B_08_', 'Ketena 05', 270, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '8c84ee97-0f76-4704-995c-5786a523ea48');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('8f52d2e3-5d43-410b-b6a4-af4fd410b2f1', 276, 'AA_B_09', 'Woreda 9', 227, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'f7e86f9d-a1f0-44e3-ac93-a888f9cdd467');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('cba0068d-d35d-4d7e-b197-897e2488e400', 277, 'AA_B_09_', 'Ketena 01', 276, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '7777d54d-7706-4b15-be99-475c72c2dcc9');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d88dd105-29aa-4c93-87ef-ce5ffdfd567b', 278, 'AA_B_09_', 'Ketena 02', 276, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '4c1873e8-3496-40a0-a728-f31a8acf03b5');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('2c61240a-5dd6-49e4-b892-c440846ca802', 279, 'AA_B_09_', 'Ketena 03', 276, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '15d9182a-f143-4964-888a-572ce910b7c9');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('da1e02f7-439c-41b4-b159-3646e55eaa98', 280, 'AA_B_09_', 'Ketena 04', 276, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'f7c9d5f7-a759-43eb-a535-653a0cdc6150');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ad75bce6-99a2-4af6-826d-593002159f62', 281, 'AA_B_09_', 'Ketena 05', 276, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'ae243a57-4907-4f44-aba6-4f2d812384be');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('3d3018a0-38da-474d-87dd-18b2eb0918e4', 282, 'AA_B_10', 'Woreda 10', 227, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '7dd568fb-389b-419e-8292-e2865278d766');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('c9759477-7683-4550-8878-001e325033a3', 283, 'AA_B_10_', 'Ketena 01', 282, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'cf353f44-53ac-4e1b-9a28-4fe4436c616d');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('04e10117-c491-4266-802c-1e5f14095613', 284, 'AA_B_10_', 'Ketena 02', 282, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'b072386e-7356-49f2-90e8-9b6b3ed1aa2e');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('e3568ffd-ec4f-456d-8e2f-3998f82246c3', 285, 'AA_B_10_', 'Ketena 03', 282, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '781fb6a3-1bba-44f3-8f7c-ae3cce8454be');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('e068059e-7489-4db9-bb6c-1e73a89d7b58', 286, 'AA_B_10_', 'Ketena 04', 282, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '6cd57c4d-0240-4c02-b936-109dbace769b');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('85f8b80f-4e4b-4227-b484-54e668218cd0', 287, 'AA_B_10_', 'Ketena 05', 282, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'c921ecdb-5519-45d0-b6f0-3e4fee771e34');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('a3b4888b-440f-4592-8184-aadd2e62b82e', 288, 'AA_B_11', 'Woreda 11', 227, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '6ee525bf-c3c7-4d35-97f4-4128689f16a1');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('a47650af-ab18-47a2-9d32-7fe29307608d', 289, 'AA_B_11_', 'Ketena 01', 288, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '83f44340-0c55-4b6f-9e39-dc247774f207');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('e516883c-b1e3-4d40-a4c8-73efa58fbdfb', 290, 'AA_B_11_', 'Ketena 02', 288, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '934706f8-baf4-449d-8391-bafe8e7d523d');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ad45c272-7a98-4c8e-bab3-6d4f181c34a6', 291, 'AA_B_11_', 'Ketena 03', 288, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'fbf52720-870d-4723-b0ac-3a36922d7037');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('52996740-dee1-495a-9884-afd9fde05df7', 292, 'AA_B_11_', 'Ketena 04', 288, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '086ae5b0-6772-4939-aca3-fe4deca2009f');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('effc8c92-a9ae-490f-a0cd-4340051d678e', 293, 'AA_B_11_', 'Ketena 05', 288, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '8498ba0c-cf1b-4088-80e3-35a8c1338ba5');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('209a6db7-18e0-45cb-b850-926aa4c0545b', 294, 'AA_B_12', 'Woreda 12', 227, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'b3b10923-2fcc-47fc-b291-65f10207f977');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('4180b640-02a9-4dd1-91ac-2312326d16b7', 295, 'AA_B_12_', 'Ketena 01', 294, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '06abb85a-b600-4d24-9e85-53fa86eb4a8d');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('bf80c6cd-1271-4f70-9141-f5cbacc83be1', 296, 'AA_B_12_', 'Ketena 02', 294, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '7d7e2f12-d51c-46b9-8517-2b6d0df374fc');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d6992f6c-faa3-41bd-8015-b34a5d744d3b', 297, 'AA_B_12_', 'Ketena 03', 294, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '098c96d4-69ae-4eb4-a040-7a0550c825c1');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('4e491365-4919-4429-9fd0-c25a91bf37f3', 298, 'AA_B_12_', 'Ketena 04', 294, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '80d6501d-751d-4eff-a314-8e19045a99b4');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('2f77b3ba-c1c9-479b-8af4-7f380f58d07e', 299, 'AA_B_12_', 'Ketena 05', 294, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'e011159f-7ea5-455d-8561-bdba3ee4c54e');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('f977275c-0d13-48b2-b768-42e5f5417dc6', 300, 'AA_B_13', 'Woreda 13', 227, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '935f737c-a125-428d-a461-2cd106e4d608');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('b09ed771-442a-4fd8-81d9-c944c008d71b', 301, 'AA_B_13_', 'Ketena 01', 300, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'a167e033-f6c2-4883-b1d7-8e141e0a9ff3');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('acbb0edf-097e-4196-8b7b-4addf6565b45', 302, 'AA_B_13_', 'Ketena 02', 300, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'ef24e1db-1ad3-4fc2-8d69-4e8d0871eb10');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('8ea0962a-1a14-4999-9d12-d7454f0f6fc9', 303, 'AA_B_13_', 'Ketena 03', 300, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '61ce41a7-5a54-4d17-84ed-cea8564fb14d');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('5d82b904-1006-41e6-99fe-dd4566b55308', 304, 'AA_B_13_', 'Ketena 04', 300, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '2805f4f0-d151-458d-a28b-bcc3ab9eb2b7');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('3f9b66a5-8cf8-4e4b-9570-1e5c6b6705e2', 305, 'AA_B_13_', 'Ketena 05', 300, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '5a74b471-0886-46f3-a739-f330c626d41b');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('3c07d897-4eeb-46cc-9c4e-e564bbf16090', 306, 'AA_B_14', 'Woreda 14', 227, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '3d7d602b-fb13-4502-8906-070240aeca0b');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('6660675b-abdb-4967-b3fe-af8d7f53f571', 307, 'AA_B_14_', 'Ketena 01', 306, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '84ab8a05-5004-4adb-a027-679382f234f1');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ef0c3724-4977-492e-96ad-625d88685b82', 308, 'AA_B_14_', 'Ketena 02', 306, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '6f804f6a-acaf-4e99-b2ca-bdd7aec90f7c');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('fc3dc7c1-5ac8-4ef3-b438-9467284a11f1', 309, 'AA_B_14_', 'Ketena 03', 306, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '350a56eb-7217-4008-beea-deec34a8fd8e');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ab3c1971-68db-44f8-babb-fefb9454ea79', 310, 'AA_B_14_', 'Ketena 04', 306, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '58b1dfe5-f997-4880-b730-13f40c27e5e0');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('3377cded-e57d-4e58-87d0-cf7e6ee46ccb', 311, 'AA_B_14_', 'Ketena 05', 306, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '0feba992-0e88-4d09-90c4-9c125d53fd6d');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('6323b1eb-5687-46bb-bebc-361fc8e2356f', 312, 'AA_G', 'Gulele', 1, 
 'S', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'b8f5a63b-fd10-4cfc-9bbd-8433c850a7f9');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('8301415b-acd4-4b06-adbf-bb6e504ef7b5', 313, 'AA_G_01', 'Woreda 1', 312, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '55716bdc-add1-4ac0-97c3-c47d988bb4e7');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('c614f3c0-c5a8-4b42-99d4-ac00a36789d0', 314, 'AA_G_01_', 'Ketena 01', 313, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '1eb861b4-330b-4be8-a3a0-4065ecbdc737');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('5cc391b9-83de-40be-ace2-643aa05d2d43', 315, 'AA_G_01_', 'Ketena 02', 313, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '1f175f2d-e4b8-48ba-a17d-a3176e81c6e7');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('571b2674-6ca6-4665-9cc8-62f533db3c15', 316, 'AA_G_01_', 'Ketena 03', 313, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'cb9ac91b-e993-4251-ad9a-4b4fd2780bd8');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('f8e0c8ee-aa07-40c9-9898-1fb4b12c1644', 317, 'AA_G_01_', 'Ketena 04', 313, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '7f083220-f577-465a-a26e-613ab31b4b60');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('aeb7112f-f0a0-4c80-bf37-bff074f607f2', 318, 'AA_G_01_', 'Ketena 05', 313, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '6f8f6ad6-a05d-4036-a0cf-da51ea2ed2a8');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('44edad3a-099c-4427-bd0d-cfd2ad4ada8f', 319, 'AA_G_02', 'Woreda 2', 312, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'cb3660eb-d021-4bf7-9e93-d9f828eacf37');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('9ef8dbff-6f23-4991-9464-590c132f5d38', 320, 'AA_G_02_', 'Ketena 01', 319, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '7848b8bf-8af3-4916-a538-2d80cb7d5e8c');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('59e8d71e-6060-4bf0-bc58-a9faece3d44b', 321, 'AA_G_02_', 'Ketena 02', 319, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '74e001cc-3477-46d0-a0ec-7d6c44266935');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('147a0cf0-8f14-403a-b545-86f51a83b420', 322, 'AA_G_02_', 'Ketena 03', 319, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '15d94117-4f2d-499f-a8c1-c30f0d08eda6');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('6b411ec2-1963-4660-a240-19a7cedce175', 323, 'AA_G_02_', 'Ketena 04', 319, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'fe41b64d-b5c2-4f81-9da4-f3acf816a3cd');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('fcad2efb-486a-46c8-bfc2-30e548f1bb9f', 324, 'AA_G_02_', 'Ketena 05', 319, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'f519adb6-ee37-4de9-b9e9-ec710c599d51');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('0830a05d-c9d5-4633-8a04-840f3d59ac4c', 325, 'AA_G_03', 'Woreda 3', 312, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '8568e239-5779-474e-9a8c-98cef9950a59');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('0879d839-1ef6-4811-94cc-dd0a096a49e0', 326, 'AA_G_03_', 'Ketena 01', 325, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '02abb332-b41f-43df-87c4-228d516a41e3');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('fb2c0c8c-fa34-45bf-914f-f881f44eada0', 327, 'AA_G_03_', 'Ketena 02', 325, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '0bfa5193-7a4c-42c4-a8b2-e418650e2b57');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('542de473-71fd-4d8f-91ad-878857658cdb', 328, 'AA_G_03_', 'Ketena 03', 325, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '2128f966-e2de-4333-b80f-043f48227614');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('992da02f-623e-4e6e-8af0-38aca62f4f95', 329, 'AA_G_03_', 'Ketena 04', 325, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '2b719e87-7b6c-4a1e-bbee-3307395d071b');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('2cd0e120-fe24-4b4b-8107-ea9d2f3feaa9', 330, 'AA_G_03_', 'Ketena 05', 325, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'a5f2f4c0-a620-4389-929b-93039ee26139');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('8a1e59b0-e71e-44cf-9540-80322cff3c42', 331, 'AA_G_04', 'Woreda 4', 312, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '7914478d-2f44-44a2-8222-cf6fd2fdfc7a');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('4fd2bcff-ecef-4e5a-a86a-d5bc1178ad10', 332, 'AA_G_04_', 'Ketena 01', 331, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'ca1cf917-3c60-4f93-9b75-bffc4e7a4979');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('1804e130-4e4a-4272-a323-1609882aae84', 333, 'AA_G_04_', 'Ketena 02', 331, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '0f35de62-2df8-4a3f-a72e-b7feeca996df');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('56d92836-c5e8-44a7-a0fb-c3ade9292b69', 334, 'AA_G_04_', 'Ketena 03', 331, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'd6d1f914-8f61-4a36-8607-b3aa4faaa977');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('22b1c949-e31e-49fa-b2d2-5cf2e83c714f', 335, 'AA_G_04_', 'Ketena 04', 331, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '54eb0761-2442-4198-bc27-a066c91fb7b4');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('8c4b563c-04e1-41ec-bbc7-7f4fdf6e3488', 336, 'AA_G_04_', 'Ketena 05', 331, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'a4d09511-896d-4e5b-9c32-00b3aa2bb335');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('7174761c-f2ac-40f5-aafa-a375511e7aea', 337, 'AA_G_05', 'Woreda 5', 312, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '13f74e1d-2d1f-4c2c-b3de-a6b579443862');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('4ceb6a5b-028f-42b1-a0e5-571af9ce1ef5', 338, 'AA_G_05_', 'Ketena 01', 337, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '9aaff01c-b21e-4bef-bd2f-c529ba20279c');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('b73bfaab-9124-4226-bbfa-a07aa17a5ddd', 339, 'AA_G_05_', 'Ketena 02', 337, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'c42019a3-ea81-49fa-bcb8-4c0c22b6740b');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('b0bad582-1295-4523-a4b7-c6cdd2ed3cac', 340, 'AA_G_05_', 'Ketena 03', 337, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '9297d360-3a3a-4cfd-af1e-f45dd11a961a');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('b348747a-c020-43bd-aeff-78705f353079', 341, 'AA_G_05_', 'Ketena 04', 337, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '71cd49ea-b82b-4106-8765-36e32429ea9c');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('1b0d386f-e330-4a19-b258-8a1caca49a40', 342, 'AA_G_05_', 'Ketena 05', 337, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '8eabf5d4-c287-48bd-b779-ffd3a1a77d8c');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('68a508e6-9694-43cd-b6e4-779883b29a14', 343, 'AA_G_06', 'Woreda 6', 312, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '0f817d09-1cc4-486d-b473-44d3f72759c0');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('f4cb6e96-95df-403e-a062-ca76e65b48a3', 344, 'AA_G_06_', 'Ketena 01', 343, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'b9e18d7d-5f39-4742-8215-2c213c91c9b6');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('b591a349-2458-4670-b947-40eaa1b64965', 345, 'AA_G_06_', 'Ketena 02', 343, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '1769e76a-e045-4c41-ac3a-a886494f1071');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('8b127844-47c9-4055-87ad-8ea0bf500ef8', 346, 'AA_G_06_', 'Ketena 03', 343, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'b0ea0d18-6eae-4f0d-b445-09b7234701cc');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('195d8a7a-b133-479f-959b-1384984e96b9', 347, 'AA_G_06_', 'Ketena 04', 343, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'e2456d83-b6bb-4fc3-aa9d-7821c5820855');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('edfbb095-8d11-4380-9d47-4743a9b6e8ac', 348, 'AA_G_06_', 'Ketena 05', 343, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '4ed937eb-db09-4244-9467-017dc6d35fa1');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('7d2c500c-a848-4a2a-8897-8b7401f68c28', 349, 'AA_G_07', 'Woreda 7', 312, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'a80a51a3-9ebc-4d7a-94fa-fc6bdfb045ca');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('3beeb703-1cda-43e8-814c-ad2cbdfd768b', 350, 'AA_G_07_', 'Ketena 01', 349, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '45f6f0f9-086b-4568-9f87-3333eef1d541');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('8d52a993-b86c-4970-9604-982a2b0d2b03', 351, 'AA_G_07_', 'Ketena 02', 349, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'ade694a7-e65c-482c-ad50-06c3c185facd');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('43652c49-fa7a-4316-ada2-ed3eadc61de3', 352, 'AA_G_07_', 'Ketena 03', 349, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '1e23b281-6717-4f29-8ff4-ae2d8b1fb4c3');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('596be16c-2287-4110-b3ae-5bcdd67026c9', 353, 'AA_G_07_', 'Ketena 04', 349, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '20704859-e564-4dfe-bd85-d8a8e7d66447');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('50aa2380-d8a1-4626-a8fb-7f6ca1a29f68', 354, 'AA_G_07_', 'Ketena 05', 349, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '1e58070e-2a64-481a-903c-a43b57f57ca0');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('247332ad-c427-45ec-a26c-3e23fc81d755', 355, 'AA_G_08', 'Woreda 8', 312, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '78ac597e-9410-4240-b4b7-cb57a50dab53');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('4b1d52fb-9319-481e-a633-002a686c5660', 356, 'AA_G_08_', 'Ketena 01', 355, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '29944d7a-3776-4611-a00e-5b373e86090b');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('a3f54097-6257-492d-a696-d0186ad95a6d', 357, 'AA_G_08_', 'Ketena 02', 355, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '70c96940-6dd2-4b67-ae8e-e963cfd320ef');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('409fec29-bfbf-4103-9636-a176dda3a1bb', 358, 'AA_G_08_', 'Ketena 03', 355, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '3a1b252d-b18d-4c05-9c8f-e3c9c98db153');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('29102fb5-9d8f-4b09-b59f-f8c7d6a93379', 359, 'AA_G_08_', 'Ketena 04', 355, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'fa7e675f-3554-4855-826f-ffa6e0b94c01');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('1c71935d-cbc3-4ae1-874c-b6ff4b12ecdb', 360, 'AA_G_08_', 'Ketena 05', 355, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'ed3fc222-4e67-4bc2-bff1-2cb66805b0b8');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('f16ed223-1a33-4900-9685-b40b8b32fad8', 361, 'AA_G_09', 'Woreda 9', 312, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'df43ac8d-bab6-4704-a0e0-2c3466f1d4c9');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ba4e0608-5bfb-40fa-bcb2-827010129f05', 362, 'AA_G_09_', 'Ketena 01', 361, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '6c98ea40-6a0a-45c0-b441-cbcbbf8ba1f7');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('3105833a-0d0d-4071-87d0-0785b0e4351f', 363, 'AA_G_09_', 'Ketena 02', 361, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '07d0b103-0121-4ee2-8cee-8901a7077a3c');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('1f5e41d1-13ea-40ce-896d-a7f738009cc0', 364, 'AA_G_09_', 'Ketena 03', 361, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '4212e84f-7db8-46bf-9252-668b5183ca2b');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('a6cd815b-82f3-4c0c-bb21-32bc31e142b4', 365, 'AA_G_09_', 'Ketena 04', 361, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '9622812a-ebc7-4d34-afed-eb0709bbad78');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('f0b54691-2780-4cfd-b652-1b5030927431', 366, 'AA_G_09_', 'Ketena 05', 361, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '7e5c1361-c033-4f1b-ba6e-3294994a3c42');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('e99b155c-cbfe-44c8-9c95-3b4e1d77a86e', 367, 'AA_G_10', 'Woreda 10', 312, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '31a1bb33-af24-42c3-9aab-228db7433475');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('a9672fac-a80c-40e6-b94c-5d20b11cf4bf', 368, 'AA_G_10_', 'Ketena 01', 367, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '4af22e2d-7e48-4a75-a8b3-e182740dfd6a');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('83925dee-c976-44fe-88b4-096d2db4327c', 369, 'AA_G_10_', 'Ketena 02', 367, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '41fdfac0-6440-4232-8e5d-bc2776dd1f51');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ee17fa7f-d24f-4e12-a30c-5157f873fd08', 370, 'AA_G_10_', 'Ketena 03', 367, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '2b5c3faa-a35b-4a5c-8924-d68a745f2a44');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('e19d7e3b-f0a6-4986-8b4d-80cc95769a1e', 371, 'AA_G_10_', 'Ketena 04', 367, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '89f6d5bb-58fa-4f2a-bba4-0d4e40f1bb91');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('f253e38b-0587-4e44-97d9-14f55229a064', 372, 'AA_G_10_', 'Ketena 05', 367, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'd0b26317-bd8e-4fe3-8923-c0bf266290cd');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('8f7eb854-65bc-480c-b75a-b4e13d6c2fcc', 373, 'AA_K', 'Kirkos', 1, 
 'S', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'e8dab9f8-a40d-4aca-8f75-1a85dd804fbe');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('587e73f3-5909-43a8-8c5e-6bcaf2a97e72', 374, 'AA_K_01', 'Woreda 1', 373, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '10b3fe25-5c5c-4c4c-9f14-3f61de4b4b41');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('586884f3-cab7-4d37-9d97-765d7dd9f9d9', 375, 'AA_K_01_', 'Ketena 01', 374, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '9fae9306-6904-4830-b62d-3ac8f257990c');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('e83044b9-ee97-4a45-a2cb-b1b20607fb1c', 376, 'AA_K_01_', 'Ketena 02', 374, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'e70e45b0-fe6d-40b2-bde6-dddce6832422');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('4a0cea51-ba59-45d4-839c-c4557d3c276c', 377, 'AA_K_01_', 'Ketena 03', 374, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'cfbd817e-f8db-4401-8535-ab49a27abb0f');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('697e009c-5e54-4ec3-ba06-665d9b3a4a60', 378, 'AA_K_01_', 'Ketena 04', 374, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '9f95d8e6-c2c6-4687-a0b8-03f80fb10f9b');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('afc6f46d-a7de-47d2-8ade-14b60baeafe5', 379, 'AA_K_01_', 'Ketena 05', 374, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'c9f58b06-47f7-4043-9a8f-870af265f8cc');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('dbaefbf3-c1bb-4787-81dd-40fb99b0d7d2', 380, 'AA_K_02', 'Woreda 2', 373, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'a7c9686b-2888-4b15-8a3b-b2e04b6036c2');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('be228d1e-f3e7-41cd-b5b8-62654125caef', 381, 'AA_K_02_', 'Ketena 01', 380, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'aaa24846-ec86-42e9-ac71-0079e63e6644');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('9c96813c-496f-4fed-86b5-0801feeb8873', 382, 'AA_K_02_', 'Ketena 02', 380, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '3761998f-e093-42fd-a1dd-e601c6ba722b');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('628f0186-cf26-4192-8d08-931fb24f06ad', 383, 'AA_K_02_', 'Ketena 03', 380, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '82a96936-3597-4a94-988a-41093db9ded3');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('4ae580fd-762d-447a-92f4-b3b1e1f6903b', 384, 'AA_K_02_', 'Ketena 04', 380, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'a90dac90-f9a6-45e6-b719-acc2abca5bb0');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('92e49431-4135-4e49-b6c9-10522eaad37e', 385, 'AA_K_02_', 'Ketena 05', 380, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'a1f03bd0-0583-4cc5-b1df-1d16c2c846a8');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('8d517f7e-9eec-43d3-ba07-f67d71f0be60', 386, 'AA_K_03', 'Woreda 3', 373, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '18ad1cf8-6bc4-4800-84d3-67ebc8c21b3b');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d6fdacbf-b11c-4a54-a402-ce507ccbadd4', 387, 'AA_K_03_', 'Ketena 01', 386, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'e87bab83-58b9-4265-9325-11d019e9f6f0');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('c95eba95-467d-45be-8d79-eba445a752ff', 388, 'AA_K_03_', 'Ketena 02', 386, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '4b8c5f9f-7878-40e5-89ac-33ebb84b11e9');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('1a25d84f-227b-463a-94c0-0f1ac1eb7378', 389, 'AA_K_03_', 'Ketena 03', 386, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '27338654-1941-4525-9f44-a3a9f57fe921');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('39139cf7-2357-48b7-8445-04e6bf2b8b96', 390, 'AA_K_03_', 'Ketena 04', 386, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '762d6e7b-7317-44d9-97b9-5bc2fb63e48e');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('32cd5be6-e35f-4d2b-b840-bcc0672dde71', 391, 'AA_K_03_', 'Ketena 05', 386, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '26bd7f38-18a3-4fbd-8704-e69513db3bd8');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('4d4fe031-386e-4a02-87ba-e5219658f396', 392, 'AA_K_04', 'Woreda 4', 373, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '4b1ec6ec-e327-4baf-85b6-8e02d178d111');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('163a1ed2-b176-4608-978f-f8d4dc95283b', 393, 'AA_K_04_', 'Ketena 01', 392, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'eea32135-31e6-4811-a807-fd4731bfa5b9');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('fed7d608-bd83-4e94-b910-cb876ecdd3a9', 394, 'AA_K_04_', 'Ketena 02', 392, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'bc8df416-c4b3-4ec6-bb15-ca5beae6c95b');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('f75c97f0-88c3-4ffd-a124-f7abb4bc0d1b', 395, 'AA_K_04_', 'Ketena 03', 392, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '720e9da3-a20a-4233-9166-20b505845d35');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('a22f6383-4b5c-476d-8884-9db121dd94d3', 396, 'AA_K_04_', 'Ketena 04', 392, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'a84a819e-e414-46a5-91a0-db39e2255ed2');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('85f1b26c-c7dd-408b-903e-af635769d3ea', 397, 'AA_K_04_', 'Ketena 05', 392, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '439fff40-f601-4020-b9ec-4a444bfa9a34');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('cb236bf2-b0f8-4063-9703-f5352158dbb2', 398, 'AA_K_05', 'Woreda 5', 373, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '1e113364-ce8d-4284-8476-fabc96b210c6');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('32db5467-e2dc-46bc-ba35-3d272c5740d4', 399, 'AA_K_05_', 'Ketena 01', 398, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'dbab8d5b-7c2c-4705-a7ca-9c57eb909d3c');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('7980f331-5ddf-4c32-bafd-abd76090d0b0', 400, 'AA_K_05_', 'Ketena 02', 398, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'f49b925a-7802-4934-84b4-19fa1c219def');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('c82c3e30-338e-4966-b9f4-d7c8949ce521', 401, 'AA_K_05_', 'Ketena 03', 398, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '8ab965d0-52cb-4b25-9916-97117d782071');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('e0f18508-b06e-4970-bc20-4de41b545476', 402, 'AA_K_05_', 'Ketena 04', 398, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'a67d1cf9-4a4a-4f8e-a8d6-85e45522c28f');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('86f0c54f-07f5-4520-9fe2-cccf9611bff1', 403, 'AA_K_05_', 'Ketena 05', 398, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'b0f857ac-56ab-436b-8c46-430bf9d44f96');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('9c187966-919b-4c8a-b109-87cc1703bc2b', 404, 'AA_K_06', 'Woreda 6', 373, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '3348b39c-787d-431a-b7e9-1ee9b8d0a7fc');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('f16eb41f-052a-4b29-ab17-d741adb73d01', 405, 'AA_K_06_', 'Ketena 01', 404, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '4b8fad2f-0efa-41e0-96c3-b0041b929707');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('2c758398-668d-4335-bc46-90d7960944d0', 406, 'AA_K_06_', 'Ketena 02', 404, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '725049be-df02-44d2-b03d-8ef2f12b67bd');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('a2347657-9c7f-4478-a55f-8ee4acdd89d6', 407, 'AA_K_06_', 'Ketena 03', 404, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '3f4800fc-5a3c-4319-be4a-d91bc84075db');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('00dce0fe-ec87-4d0a-922c-bed2e39c7a44', 408, 'AA_K_06_', 'Ketena 04', 404, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '95688bbe-4878-415b-b28c-1f3375d5e714');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('2566ab07-150b-424c-97d5-1b9e6a27f8eb', 409, 'AA_K_06_', 'Ketena 05', 404, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '030e62a3-da9f-4916-afbf-62cad21c1a05');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('fb3696ae-4995-44e0-8343-95a8638182d1', 410, 'AA_K_07', 'Woreda 7', 373, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'cd4ea4f0-e2ab-46df-9113-342fa0ef6850');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('0d2700b9-e332-4e04-a7b3-142774a07ef4', 411, 'AA_K_07_', 'Ketena 01', 410, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '8b832948-543b-4205-97aa-cebe093eadeb');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d331a965-1631-440a-b032-b1da04f2a504', 412, 'AA_K_07_', 'Ketena 02', 410, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '0d7ddf65-2a31-41c6-80ea-a322abe348cc');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('3db5ff0b-ac46-4bcf-88de-f27e0572eca4', 413, 'AA_K_07_', 'Ketena 03', 410, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'df3e7498-14ef-453d-87a8-703c088297a1');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('010cc493-a982-4b62-a86d-6f3393b15a15', 414, 'AA_K_07_', 'Ketena 04', 410, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '0cae7196-001d-4398-a00b-e6b0f337cb0a');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('2f7f5da3-fead-4fa8-9d6d-9a1ffd3caa66', 415, 'AA_K_07_', 'Ketena 05', 410, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '24a9d44b-fae1-4a57-8555-53c3067594ac');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('94cd41e9-09ab-43cc-a93a-ab8cf9d284b7', 416, 'AA_K_08', 'Woreda 8', 373, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'd03f62e9-f0f2-4c2b-b06d-ff1a4bc5793e');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('3b27f07c-c257-4d47-9853-8c2c6d16640f', 417, 'AA_K_08_', 'Ketena 01', 416, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '47cecc95-597b-4203-b66b-ccbf73cbb036');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('2b2b242c-4172-445e-89d7-b41bcd4b1f31', 418, 'AA_K_08_', 'Ketena 02', 416, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '922ef022-423f-40c2-8450-f8fab0e0169c');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('6700cb82-f9f7-4074-a7c2-f9138a670f70', 419, 'AA_K_08_', 'Ketena 03', 416, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'e9e3b6bc-5f0f-4891-8a07-141491d3959b');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d9b69594-b6ff-408f-b115-499959063666', 420, 'AA_K_08_', 'Ketena 04', 416, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'a44d621c-41f9-4ef7-9491-dba607771dd5');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('1fc9b7a4-fbfa-436e-b4ed-e888dfaf8270', 421, 'AA_K_08_', 'Ketena 05', 416, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'b0fe3db6-1dc1-46ad-93c6-e69cfe814043');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ee31d292-78d4-4b1b-bbcb-d437d5093798', 422, 'AA_K_09', 'Woreda 9', 373, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'c78ede5c-d409-42a7-8293-091fd0c228b3');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('4201ac73-fd9a-4285-936e-571988704d85', 423, 'AA_K_09_', 'Ketena 01', 422, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '082188a5-995b-4ed8-8e2f-f5539e161183');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('c43a54a8-a667-436b-ab4b-eaf13b3ef0f9', 424, 'AA_K_09_', 'Ketena 02', 422, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '037278ae-864c-46e0-85b8-36131c00b2b8');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('cf57915c-308e-46f4-9774-b9b22abb078a', 425, 'AA_K_09_', 'Ketena 03', 422, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'c5143962-d6cb-4e79-9e18-f5512862c233');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ee86bb75-579a-498a-a4cc-cc29e2f71ffb', 426, 'AA_K_09_', 'Ketena 04', 422, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '2a8e7f1c-0700-4019-ae5a-c0229e3c03fe');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('107ea491-c9e7-4734-9969-8e39adb8d2fe', 427, 'AA_K_09_', 'Ketena 05', 422, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '2a2237ad-1f1b-4c14-821c-19eeea9476ac');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('9ead155e-859c-472c-9288-e1de9b375bd4', 428, 'AA_K_10', 'Woreda 10', 373, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '3d0f954b-7f5b-40c4-ae55-5dc3af8857d8');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('5c0c9995-2724-4085-81bb-e2f2ba4c168c', 429, 'AA_K_10_', 'Ketena 01', 428, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '9e447d66-ef6c-48ce-b0ff-0d3ec0e45918');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('0fb2b63c-9ee7-46fe-bb4f-455f8d93f45d', 430, 'AA_K_10_', 'Ketena 02', 428, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '0d41c2d5-fdb2-42e0-b1c5-d9c1d26aab1d');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('0b6f7a25-f02f-4b0d-b427-f8269224c8b9', 431, 'AA_K_10_', 'Ketena 03', 428, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '5f936d6f-ec93-4203-b06b-3648c92a0f3f');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('510ac101-3096-4bd0-ac5c-abd4cf35f416', 432, 'AA_K_10_', 'Ketena 04', 428, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '8637cecc-7376-42f6-8744-f21b656ca5de');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('597093b1-49ff-4a98-91aa-6140052f9778', 433, 'AA_K_10_', 'Ketena 05', 428, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'c694a71c-1b00-466a-9e4b-1f297aeeb23b');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('50f4b194-f1aa-4845-8dfa-29224c467688', 434, 'AA_KK', 'Kolfe Keraniyo', 1, 
 'S', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'c8efc0ae-cb63-4de5-9d08-23d992bd8228');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('6648a53f-f128-4ef5-8665-47d181dd6baf', 435, 'AA_KK_01', 'Woreda 1', 434, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '9c63d3c3-0412-4309-9090-6209fe56161b');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('e085ec94-1442-4661-99fd-51e0e91fea0d', 436, 'AA_KK_01', 'Ketena 01', 435, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '589cb4da-f951-4ebb-be63-59a723baf37f');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('b1b5440b-1aa7-4479-ad80-8cda3e8c4a20', 437, 'AA_KK_01', 'Ketena 02', 435, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '9e0ec397-cf43-42da-993a-afc4664d9fba');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('dad18f11-463b-4a5d-aafa-25645eee17dc', 438, 'AA_KK_01', 'Ketena 03', 435, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '877253f1-68ee-4308-b052-2a715dda7a27');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('cdb8e739-c6a5-45f4-ad25-651d15db3438', 439, 'AA_KK_01', 'Ketena 04', 435, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '7bcc133b-a84e-42f4-bd64-52e22afb10f9');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('a2e677da-e8ca-4ccd-ab6d-2b8d6cf43ae4', 440, 'AA_KK_01', 'Ketena 05', 435, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'd80a4668-c79a-4e2d-bf7b-f2457d2e81e1');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('72438f04-f9bf-4027-a2a3-a905841433b6', 441, 'AA_KK_02', 'Woreda 2', 434, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'd2ea7dd4-7d76-4fd7-97cd-fd78ea242cab');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('1750cf98-221a-4478-9a55-f813f2bee9e1', 442, 'AA_KK_02', 'Ketena 01', 441, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '5290a8df-85b7-4871-819f-7ec14e293980');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('a6b9039d-3ec2-4615-83b8-c4b2e20aefa4', 443, 'AA_KK_02', 'Ketena 02', 441, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'cfdca33b-125d-4938-b551-0c6adcdd3281');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('000f75f7-3d5b-472d-8f68-1d1f42111c79', 444, 'AA_KK_02', 'Ketena 03', 441, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'b0ce5272-e6f4-4862-954c-72c6265f387b');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('7796340b-fce6-4829-8479-3954f36ffa76', 445, 'AA_KK_02', 'Ketena 04', 441, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '61586bb9-ab70-4140-8357-2ecfdc2e1cc1');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('2cb148c7-32aa-4c85-b276-e4477cfd0f96', 446, 'AA_KK_02', 'Ketena 05', 441, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'b38bec07-8663-42d1-a847-bacb97d4b660');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('a810d95d-2b16-4624-9508-8598a72a4a54', 447, 'AA_KK_03', 'Woreda 3', 434, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'd373279f-a684-4fbf-b318-a8a137b562f6');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('5c03b897-eb1c-4588-9941-456b73de0ccb', 448, 'AA_KK_03', 'Ketena 01', 447, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '6aa6c6cd-7783-4a9a-930c-6fb523279163');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d1fd3aeb-feaf-40d5-8f6d-fbaaa49892fa', 449, 'AA_KK_03', 'Ketena 02', 447, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'f8a8353d-3de0-4675-8395-f0483dd67155');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('3ed819e2-66c6-414e-82f8-1d3fd961546e', 450, 'AA_KK_03', 'Ketena 03', 447, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '95fccaa2-6f7a-49f0-bde9-e7f3165f29e3');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('f4f6d9a7-161e-43e7-b9ac-143f6b87dfdd', 451, 'AA_KK_03', 'Ketena 04', 447, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'a987f5c5-26f9-4b79-9bda-b2189b009536');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('fbe3b3f7-7d19-4516-942f-57cbf8f8581c', 452, 'AA_KK_03', 'Ketena 05', 447, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'ec0e67db-a4ec-4957-a000-7a2ccc970e3f');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('994129db-d926-4479-bd3e-d172f24908d0', 453, 'AA_KK_04', 'Woreda 4', 434, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '6725446d-4913-41e0-b63e-cb846bb88ffa');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('821476ba-9f47-40b2-b7ac-4e6565057e58', 454, 'AA_KK_04', 'Ketena 01', 453, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'ecc090c9-c847-40ad-a9ae-0533dd87e44c');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('62360421-977b-4f7e-a101-e3d16444b0a5', 455, 'AA_KK_04', 'Ketena 02', 453, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '492b0ad2-d2b6-48b3-80e8-f9d8c257b805');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('26e560d1-08e6-4e81-aafa-581cabb431ca', 456, 'AA_KK_04', 'Ketena 03', 453, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'e583e791-59cd-4ff0-b1a5-c57d8170d1b6');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('aa4e306d-e164-46cd-bb14-53d342e8bffc', 457, 'AA_KK_04', 'Ketena 04', 453, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'dd76176c-393b-4462-b25d-be8cd5853796');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('fa937a63-0662-42fe-8858-fdc31ce39177', 458, 'AA_KK_04', 'Ketena 05', 453, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '1615a7b9-48ef-431b-9ff3-30b0498e2090');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ee963061-e11d-4030-8924-9c6d4db6c4dd', 459, 'AA_KK_05', 'Woreda 5', 434, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '3320efa3-e8be-4e78-b94a-571cb3bc8308');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('980a8210-1d52-47d4-9873-fe0c740bce8f', 460, 'AA_KK_05', 'Ketena 01', 459, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '997b7f57-89e9-4390-bc82-b44d0fccd7aa');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('80c39d7d-35a5-49d9-a2a7-29ae138746d2', 461, 'AA_KK_05', 'Ketena 02', 459, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '3aa44538-ba95-4486-8a65-199de57a0126');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('17f07289-d56d-4b16-a8aa-f5411af4f4ff', 462, 'AA_KK_05', 'Ketena 03', 459, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '3306a662-8ddc-4b94-b1cd-d1260e0170cf');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('e0e57ec1-ab2a-486b-a832-34e520d5d22f', 463, 'AA_KK_05', 'Ketena 04', 459, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'b22a568c-bc08-442a-b02e-6e2f5cac2a90');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('1f64fa2f-147a-4d81-ab1b-b863efad0db7', 464, 'AA_KK_05', 'Ketena 05', 459, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'dee3d2aa-c9b5-4413-b8bc-f9366e5ebcd2');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('1eea28aa-f14b-4b98-ba80-72b100267008', 465, 'AA_KK_06', 'Woreda 6', 434, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '5ceea1f4-191c-4766-a159-cf12f509910b');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('647f86e0-e3db-4b97-8da0-a7f3e051cec3', 466, 'AA_KK_06', 'Ketena 01', 465, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '839530ee-42b3-4e26-872a-02b3ad187e49');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('6f5a6b3d-d4ab-492c-ac69-559ac398514f', 467, 'AA_KK_06', 'Ketena 02', 465, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'b1899e33-d1a5-4b9e-a5f4-30ebeb939cf8');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('9cea55e7-a4d8-4589-8f5c-73206661006f', 468, 'AA_KK_06', 'Ketena 03', 465, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'c782732b-56be-4f7d-9a8e-b6f3ffc35f78');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('3b88a846-e15e-4e6b-a3a3-3e6821d86929', 469, 'AA_KK_06', 'Ketena 04', 465, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'd70e9bb5-ad99-4de6-8f3b-713dbaaf1e99');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('8426112b-11e0-4c3e-b914-f5735d370142', 470, 'AA_KK_06', 'Ketena 05', 465, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '373484d0-214d-4fd3-a42a-18766e1d41bb');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('9660f58d-ee26-404b-86ef-bc661f2b79d2', 471, 'AA_KK_07', 'Woreda 7', 434, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '70e2599d-da16-4bf9-8574-fe02f82bd311');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('80ef1d9e-d471-49fd-8954-068a7cfd9740', 472, 'AA_KK_07', 'Ketena 01', 471, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '396afd80-74bf-4fd5-869e-42f3e3a2f2cb');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('55ed5c8e-6db0-4074-ae63-589505ccbc3e', 473, 'AA_KK_07', 'Ketena 02', 471, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '89ea0762-e59a-422a-ba5f-f6a8f7bb279d');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('307c1b85-31e9-4ecf-8f90-e22cdf9a3b63', 474, 'AA_KK_07', 'Ketena 03', 471, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '6a8a3db4-56fd-4741-bbfd-b9455e3cf17c');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('0a4e2321-5eaf-4830-8b78-fd67bd71a415', 475, 'AA_KK_07', 'Ketena 04', 471, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'a0713e7e-01bf-4971-9b75-0fc8488e71a8');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('022f40b5-73b5-414d-a240-627cd2a8a48c', 476, 'AA_KK_07', 'Ketena 05', 471, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'ccb19766-b364-4f10-b3f0-1f688881966c');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('5ece216d-defa-4271-9b58-a68833e9c812', 477, 'AA_KK_08', 'Woreda 8', 434, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'd18ac792-3f33-4cf4-84e8-773bf5880a81');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('37d9aefd-50c5-4309-ae0e-14d06f46d941', 478, 'AA_KK_08', 'Ketena 01', 477, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '08eaf13a-5c0f-4dbe-8015-3b80c78efa77');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('8b5c9970-4067-45f3-9d8e-6c97e49d1963', 479, 'AA_KK_08', 'Ketena 02', 477, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '56808b27-d58b-49f5-84f3-c6cf64226144');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('c350d721-82bb-4b00-9fca-b4a4aecc2c27', 480, 'AA_KK_08', 'Ketena 03', 477, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '20858d54-3818-470d-8f0f-a492dcbb244e');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('049edc84-0bce-4b99-9a01-35f17baeb5c3', 481, 'AA_KK_08', 'Ketena 04', 477, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'e3bf9f05-f7f4-4423-bfce-ad790a2e21e5');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('b2a5ec55-7633-4455-81a6-c8b6f11499c0', 482, 'AA_KK_08', 'Ketena 05', 477, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '6f2a1d54-5d45-4d41-8f94-12c351766e82');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('2cd203e8-c487-4a08-9968-7e8ac35423b0', 483, 'AA_KK_09', 'Woreda 9', 434, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'd4af9f03-7367-4121-8fd8-80b8809dbb12');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('367591b6-e801-4348-8f0c-1591f4846869', 484, 'AA_KK_09', 'Ketena 01', 483, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'e42d06b8-0b58-4693-9218-cc647312c5fa');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('8ddaf81b-11cd-4031-ba51-b30c2a220aa8', 485, 'AA_KK_09', 'Ketena 02', 483, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'b612693b-dfa2-4e66-854d-639999c98280');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('fe02b3c0-e9b8-4517-ac27-92e2221fe758', 486, 'AA_KK_09', 'Ketena 03', 483, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '07fe2676-0380-4184-bae0-6da39b23259b');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d9763d2c-f44a-494d-87f7-814314d61543', 487, 'AA_KK_09', 'Ketena 04', 483, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '8424292d-6837-4f3f-b888-4ddc079cb610');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('3378aa2b-5652-44c1-baad-182a78ad2e9f', 488, 'AA_KK_09', 'Ketena 05', 483, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '25e0d29f-a542-4234-941f-c5bc7da72351');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('a8366ee6-430f-424d-bb0f-3ed175674fc2', 489, 'AA_KK_10', 'Woreda 10', 434, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '19b47b60-8e0f-493e-9173-f9b3f60e3706');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('fdec7f97-2eb8-41cc-a4cb-70437d9206b5', 490, 'AA_KK_10', 'Ketena 01', 489, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '5296a414-5854-4da2-b66c-c4ad32fb4fea');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('834ba3e0-cde7-417a-a26e-31fc575f0fe7', 491, 'AA_KK_10', 'Ketena 02', 489, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '00a9d5e8-d6a2-4b02-a0ab-e87acd3b0b6d');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('f9f17252-6900-4a62-be44-4b9a1e7ab2eb', 492, 'AA_KK_10', 'Ketena 03', 489, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'e59ecd61-d4f3-440d-9079-e37bb6b06a5f');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('f176b5c0-66f4-4d32-87b5-5d3897017761', 493, 'AA_KK_10', 'Ketena 04', 489, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'e6824e12-5d78-4d64-ba60-e4e9d990767c');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d21f915d-c1c8-4747-81df-6f52d41df04c', 494, 'AA_KK_10', 'Ketena 05', 489, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '6b79deb2-8107-4710-ba27-e7547af38f05');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('72638210-ff17-44a9-bf8c-508c9820b49d', 495, 'AA_KK_11', 'Woreda 11', 434, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'cc06230a-b9a2-4bad-8302-89428ff598fc');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('edb7795f-049c-44dc-8194-249d4ca76aaa', 496, 'AA_KK_11', 'Ketena 01', 495, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '06ade6ce-60c8-4ed9-8c1f-c1c2fa032e50');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ba6a446e-f130-42af-a06b-c374b9635380', 497, 'AA_KK_11', 'Ketena 02', 495, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '9013aa33-8859-421b-950e-73f94b0e940f');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('505176ca-55ea-406e-95c4-fa780737d091', 498, 'AA_KK_11', 'Ketena 03', 495, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'ab4ffeaf-bc01-46f5-b480-fe678c90bf1c');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('4cb933dc-850d-4a0f-b1d1-29201e66d480', 499, 'AA_KK_11', 'Ketena 04', 495, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '931fa08b-6f0a-4ec8-927e-afb32339479a');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('cda845dd-8b79-4627-a0e6-f5ad049da544', 500, 'AA_KK_11', 'Ketena 05', 495, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '56d777fe-a964-4de0-90e0-f2ac8c3060d6');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('92513bee-5d18-47c9-849a-1e47bff4ecba', 501, 'AA_LK', 'Lemi Kura', 1, 
 'S', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '6e5ad220-f3e5-48ff-9f4f-4a33c07bed4f');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('53a23eec-af8e-4817-8c17-928f870a8bba', 502, 'AA_LK_01', 'Woreda 1', 501, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '1332cadb-a48e-45da-9abf-54775d09de2d');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ed08187f-4e74-4731-82fa-5ccf7f389246', 503, 'AA_LK_01', 'Ketena 01', 502, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '950092f4-8b71-49ae-b4fb-cc282125f087');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('edd7599b-a326-4e3b-8fbb-04b99ddd88d5', 504, 'AA_LK_01', 'Ketena 02', 502, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'dd6e697a-5688-417f-9170-1ec943a7ff31');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d2ea4d77-b51a-47ec-869f-a14f12a92abe', 505, 'AA_LK_01', 'Ketena 03', 502, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'a0152583-f369-4d27-a94a-57718f208c11');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('3c50b3ba-8d01-4e10-8e2e-815daa4ee3ad', 506, 'AA_LK_01', 'Ketena 04', 502, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'b3f40de5-9750-4b41-93a6-d8220492ce66');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('6d75a347-2b84-4f5c-8d39-67fc5428b881', 507, 'AA_LK_01', 'Ketena 05', 502, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '79d27980-c0ae-4888-990a-280ab63190a5');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('399b74ad-cae5-4c08-b6d8-cee4eba20e15', 508, 'AA_LK_02', 'Woreda 2', 501, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '50a707b0-8c6d-44ed-ace3-d94743e463cf');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('4fc2c819-0f35-4c84-b150-39637b0a4a8d', 509, 'AA_LK_02', 'Ketena 01', 508, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '470100bb-d652-43b0-8ef0-e63492ad7fbf');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('b9c588a9-2c08-4f19-be65-e878192fa232', 510, 'AA_LK_02', 'Ketena 02', 508, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'abd4c1f4-9205-4b27-917b-e10526f4b819');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('7d5d1bc0-2f8c-48a1-95d9-a893c96bc18f', 511, 'AA_LK_02', 'Ketena 03', 508, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '190744a3-16c0-438f-b496-1a1f2d4dc348');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('28dc1ec5-cee6-492f-8452-62fa432693e6', 512, 'AA_LK_02', 'Ketena 04', 508, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '5795d18e-de8e-49cc-80ef-50f7743c3ae9');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('f310fc21-c4e2-433f-bd5e-247f07aa7853', 513, 'AA_LK_02', 'Ketena 05', 508, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '07f77e8e-f6f6-4938-9139-d4b7947c4175');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('3e2aab98-89bd-4721-bca9-556d183cf51b', 514, 'AA_LK_03', 'Woreda 3', 501, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'b762d908-21d0-4987-abee-4de3806db75d');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('5acbf96b-4146-4389-98a9-915a1a9d58c7', 515, 'AA_LK_03', 'Ketena 01', 514, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '471ea0ba-fd47-41b3-b737-628a9f765c0b');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('4e3542e7-23d3-4f03-93ab-d65b4b6e365d', 516, 'AA_LK_03', 'Ketena 02', 514, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '3ca2b647-5ada-4e03-b31e-989bf14526c7');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('dfd1273b-ea37-4e3c-8d25-71b45ecb994d', 517, 'AA_LK_03', 'Ketena 03', 514, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '4c7ffd3c-19bb-438a-93a1-e09839da0caa');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('948b9e76-e590-4544-8196-542a25dc1494', 518, 'AA_LK_03', 'Ketena 04', 514, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '275d2b36-9f1e-4b5d-8cf9-f75d5a5e5a68');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('8c6ec66d-ae06-4bf5-ac40-785d73bf239c', 519, 'AA_LK_03', 'Ketena 05', 514, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '79ed0300-d07b-4cf4-9621-b9fdb1c7cfef');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('991ec8e9-556a-4e50-890f-82f823c3fc6b', 520, 'AA_LK_04', 'Woreda 4', 501, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '0716422c-af03-49aa-bcf1-9c6bbcceccc7');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('3b55abea-632c-49c3-996f-9c7218c6ed70', 521, 'AA_LK_04', 'Ketena 01', 520, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '46c00937-1e09-422a-8609-e588f8fbb30e');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('bb23823a-3b99-4177-9f3d-f7ce123ffab8', 522, 'AA_LK_04', 'Ketena 02', 520, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'a4aaab2e-1bd6-40e5-bde6-6731eb760cd2');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ba40b57d-161f-40ab-b5d5-ad57c52edcd3', 523, 'AA_LK_04', 'Ketena 03', 520, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '4dfc4a95-9af0-43c5-adc9-d935e2485306');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('0b71fcc4-a9ee-4bbd-9a87-bb03c87c600d', 524, 'AA_LK_04', 'Ketena 04', 520, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '347aa6d5-3931-4880-a79d-f73f77312d63');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('23ba97bd-6189-44e6-a5c1-37cfec3dc603', 525, 'AA_LK_04', 'Ketena 05', 520, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '215cd916-84f2-42b9-ab4c-2acdbc33498b');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('43fd8ca7-ff0d-4362-adf1-95ab24982760', 526, 'AA_LK_05', 'Woreda 5', 501, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '6d0de6e2-c709-43ce-9fda-478e79c99eb6');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('1d9a24dd-ccdf-4cea-936e-dbab64bf042e', 527, 'AA_LK_05', 'Ketena 01', 526, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'a5e1c130-edea-4abd-aa09-6e2aed598a19');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('bfce3883-136f-475f-9dbb-18c66b22e1b1', 528, 'AA_LK_05', 'Ketena 02', 526, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '4a50acb1-e941-4206-bdef-b5081ec99645');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('9f52bcab-af79-4bae-803d-1a48eb6e230b', 529, 'AA_LK_05', 'Ketena 03', 526, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'b6d77476-6e67-4f3f-9b16-22e6db379629');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('2b80eee3-a954-4ea8-838c-f0c2c837c477', 530, 'AA_LK_05', 'Ketena 04', 526, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '5369e97f-f0b9-42e7-a66b-c86ba2e91177');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('b0dacb55-8ad9-4c36-af5f-d0e24a4316c5', 531, 'AA_LK_05', 'Ketena 05', 526, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '421fe419-dd83-4d83-a768-d8c48e5ff9b7');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('f25d7d5d-4fdf-4d8c-ad2b-be56f37e9b29', 532, 'AA_LK_06', 'Woreda 6', 501, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '7dafeee5-cf0c-43c3-8401-cb7a43391a23');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('5d4de0e7-41fe-49e4-928b-e9dcc1cca3cb', 533, 'AA_LK_06', 'Ketena 01', 532, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '81678080-26ae-4963-b5fe-a0e3486c4e6a');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('2cbf8372-8c28-4e47-bf15-c79e7b3507b5', 534, 'AA_LK_06', 'Ketena 02', 532, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '19404d25-47fe-4075-8fe4-77496b7cd372');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('862adf34-bca6-4de7-8406-44ca3147ccf6', 535, 'AA_LK_06', 'Ketena 03', 532, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '3df34486-b634-4f84-92ae-1eedbaa4173d');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('72999d16-7813-4516-8a65-b76648c60fec', 536, 'AA_LK_06', 'Ketena 04', 532, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '9b7c7a36-d8a8-438d-8135-04c4f49a0fa0');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('7b684603-94cc-4ce1-ad55-a6f25e6930dc', 537, 'AA_LK_06', 'Ketena 05', 532, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'ebbc964c-e76b-4b23-9dcd-9a9c500998e1');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('9b82299c-ca8e-43cf-8f7a-b9c6dc54a400', 538, 'AA_LK_07', 'Woreda 7', 501, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '2a4e9a30-5ae3-4b9a-820f-9c61ca81b0b8');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('3aa7e92e-5034-4d1d-bd72-43f9bc079339', 539, 'AA_LK_07', 'Ketena 01', 538, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '12df1dc9-8b62-46c3-9431-517f8a5e943f');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('37fd2dcd-729b-408c-8606-2c55222b170a', 540, 'AA_LK_07', 'Ketena 02', 538, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'c0ecb092-0831-4076-a138-5705ec0ff897');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('80d52cb3-6434-4b65-9242-63faf8650a54', 541, 'AA_LK_07', 'Ketena 03', 538, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '4d0bdc66-b48a-4626-9d26-ed06499339a9');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('c1132c0d-e932-4fa7-99c1-605ae19c4f23', 542, 'AA_LK_07', 'Ketena 04', 538, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'db506e0b-c27a-408a-acbc-9eaa0eafb979');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('025486d6-afea-4125-9789-c3712e73eed6', 543, 'AA_LK_07', 'Ketena 05', 538, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '00b7d3da-0779-4ae0-97c2-6705d9a0942f');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('3249f7f3-0267-4b87-98aa-6f770505beab', 544, 'AA_LK_08', 'Woreda 8', 501, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'db9c7d5e-fa5b-40cb-bb10-e08a6731af1c');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('7e7cb370-a0a4-4b5f-920a-846c3d9d14db', 545, 'AA_LK_08', 'Ketena 01', 544, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'de586d5c-59d5-4f5e-9c75-ede811f2d136');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('847ba1a4-6775-46d3-bd2b-f81340b384f5', 546, 'AA_LK_08', 'Ketena 02', 544, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'd902ae24-e822-467c-aa54-fb274d0eef16');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('534ac87c-f960-4a00-959a-4e94739743f5', 547, 'AA_LK_08', 'Ketena 03', 544, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'ac3c0d7d-5c60-4f4a-9523-afb19bf01dc6');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d21b3552-3dd5-4eb3-95a1-809b16da6af0', 548, 'AA_LK_08', 'Ketena 04', 544, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '64e080a8-acd2-4fac-baef-d94f3c654597');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('fef66d1e-0809-4b25-b587-f746d94db9ef', 549, 'AA_LK_08', 'Ketena 05', 544, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '1e166a84-ca1c-4650-8f2e-fe1bd524235b');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('2c6e431d-de05-4d08-8d61-6a00a02a90b5', 550, 'AA_LK_09', 'Woreda 9', 501, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '2147a4db-5a86-4e5c-a45e-c0a6f3cb7990');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('0a3eddcf-0595-4b96-9290-d57dd4937c4f', 551, 'AA_LK_09', 'Ketena 01', 550, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'b5f3282a-5457-47f8-9301-a281dee0aca9');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('612ac7e3-dfb7-4b26-83ae-c2f1b1760405', 552, 'AA_LK_09', 'Ketena 02', 550, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '14dfae83-d58b-4ccd-8886-1eb6ffe253da');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('4a6764f3-393c-4fc0-81f9-34296a58effc', 553, 'AA_LK_09', 'Ketena 03', 550, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'cf4e17e8-65f8-4f2d-a3aa-a697923836dd');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('27af5ea0-2682-4388-b334-e653384ad07f', 554, 'AA_LK_09', 'Ketena 04', 550, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'c63eaec7-2a6a-44d8-809a-95cf8dc5091e');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('7586eaa8-f5c1-4237-ae35-37973b42a378', 555, 'AA_LK_09', 'Ketena 05', 550, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '9a08ad6e-1377-4098-97c8-fbd42f8d608d');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('4973f03c-5c03-464d-b0c3-fc62aba0f88d', 556, 'AA_LK_10', 'Woreda 10', 501, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'e4462879-5673-464c-956d-6db1af00e315');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('320e1cdf-7c97-45cb-8f27-d09ab95e1a00', 557, 'AA_LK_10', 'Ketena 01', 556, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '4bd797de-f6b1-45d1-bc2a-509612125e61');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('af03b98e-8e85-4e1d-8316-f5e6cf047308', 558, 'AA_LK_10', 'Ketena 02', 556, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'f4b5191d-73e3-4e27-a2a6-c08e83493d14');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('fa92541b-4e90-47d8-979d-a21fc5f1f2c7', 559, 'AA_LK_10', 'Ketena 03', 556, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '7dfa655c-c53c-4540-bf6a-38bc1eaff000');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('37ecefc4-c964-4bca-b721-842cb8ed2390', 560, 'AA_LK_10', 'Ketena 04', 556, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '7b596152-d637-4d92-a7e4-7bac24c64ec4');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('5ddf1351-4b2b-468c-a037-f1cacffdaf1c', 561, 'AA_LK_10', 'Ketena 05', 556, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '46ed1753-90cb-4ed7-8b78-c3d9ff8a0c18');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('0168302a-6c02-4dc8-b85a-54a5cd48871f', 562, 'AA_LK_11', 'Woreda 11', 501, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '409ca910-3e2b-46e5-a12e-4a6f8922f2a3');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('33d90c04-ec4f-4301-89fc-55bd5246e497', 563, 'AA_LK_11', 'Ketena 01', 562, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '648cc69d-2c24-4aed-a233-5f19ad846970');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('0ad6a420-45f7-4ee7-a738-eec51e8b7d19', 564, 'AA_LK_11', 'Ketena 02', 562, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'c78afe2f-9ed7-407e-aebd-ac658e07e1da');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('debe2880-a878-4309-b578-beeb228f129d', 565, 'AA_LK_11', 'Ketena 03', 562, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'ae7e04c4-6b5a-40cb-9765-3481eede128e');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('3bc93a8d-9df5-4622-b9c4-9495b19e3a4c', 566, 'AA_LK_11', 'Ketena 04', 562, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '70cf1882-2380-4f04-8832-48eeeb9586c1');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('5c75239a-0d1b-46ce-a9f6-2ee382685ab3', 567, 'AA_LK_11', 'Ketena 05', 562, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '6b0ce667-418f-44ff-a5eb-fd1160391219');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('c9e45c76-c845-4cee-976b-0c62d652684c', 568, 'AA_LK_12', 'Woreda 12', 501, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '240c518b-dd81-4b5a-a4e8-a68aa6a3fe0e');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('a8eb7960-cfe0-48f7-9055-edb5b4ecc608', 569, 'AA_LK_12', 'Ketena 01', 568, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'd6c5f92f-461c-44f4-804b-8870f2879bf9');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('488991dc-d642-4b67-96e5-71b817e60291', 570, 'AA_LK_12', 'Ketena 02', 568, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '4a311677-45f6-4743-8ae5-ebe8079cee42');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('f04cbd00-dd22-4cc6-a838-5da1c1dff1bf', 571, 'AA_LK_12', 'Ketena 03', 568, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '08242765-38e5-47e5-b50e-c22c0464c590');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d323e98c-c589-4a6c-8272-f30f715e53ee', 572, 'AA_LK_12', 'Ketena 04', 568, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '02f7d156-96a0-46ed-bbdc-058d5823a485');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d62f76c1-fe16-4e82-9c70-0417d4b3f079', 573, 'AA_LK_12', 'Ketena 05', 568, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '8ae0d5d5-df2f-42b9-822b-bb2b8102046f');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('63f81fa0-5415-420e-838b-50284d0fd051', 574, 'AA_LK_13', 'Woreda 13', 501, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'c8772ca0-2a8d-407c-83b3-1222f8fc29f0');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('1f97057a-7f6d-4eb8-9571-c1d56154d87b', 575, 'AA_LK_13', 'Ketena 01', 574, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'b7a6fe34-6f9a-48fe-a08e-97837c0dd99b');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('221e9b1b-4494-47ed-ac63-f4a1cd74580a', 576, 'AA_LK_13', 'Ketena 02', 574, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '78c05b26-e77f-4b2d-be8b-3fdb8a5a71d8');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('bb045885-7305-40e0-b8e1-4e3d3e8e0c95', 577, 'AA_LK_13', 'Ketena 03', 574, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'b86b5726-7662-4f8b-b838-4547889922ae');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('9552b583-75c3-4037-b433-8399ddc43d41', 578, 'AA_LK_13', 'Ketena 04', 574, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '30dfa667-58a0-47c5-b0de-d067bdcc7252');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('e16f5544-bf29-414c-a6d2-00443b225d05', 579, 'AA_LK_13', 'Ketena 05', 574, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '66937bb1-0eb4-4ba1-ae2d-1886d28cc0c0');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('b98333f5-65ec-4047-9e2d-ba3a3577cbdc', 580, 'AA_LK_14', 'Woreda 14', 501, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'ee73134a-ca64-47a3-bc4c-facba1845fad');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('edf87c4c-faea-41c8-8103-803b337390ea', 581, 'AA_LK_14', 'Ketena 01', 580, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '82b1748e-dd58-4bc2-939a-517095d41efe');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('596549a2-051b-4287-8346-ab2183b69f28', 582, 'AA_LK_14', 'Ketena 02', 580, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '76e639bc-bfee-4899-9243-aefe55bc47c3');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('4fb0a5c7-1c63-4b06-89b1-b11dc436ec59', 583, 'AA_LK_14', 'Ketena 03', 580, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'cabfe698-e45e-41cd-9d82-a997f02bbe20');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ec19e630-3c95-4417-af90-dd81e6981c58', 584, 'AA_LK_14', 'Ketena 04', 580, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '9a208812-46c7-464b-9d47-090e5cd80aed');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('5736cd4d-89b9-4d2c-a211-8124256cc49f', 585, 'AA_LK_14', 'Ketena 05', 580, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'e85bf285-6573-4b6d-b3b8-f803de0ef680');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('65b046a8-cc0f-46bb-b95d-ab4f499b6d4a', 586, 'AA_L', 'Lideta', 1, 
 'S', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'eae51555-193c-4585-97ed-0f64089fbafe');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('f370f162-d7c4-46b0-b9e1-3bcbaac57ee8', 587, 'AA_L_01', 'Woreda 1', 586, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '9fc9ae2e-143d-4e49-91ee-97924f6e0e2d');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('81cdce6e-2e94-4bad-b741-491d8c612369', 588, 'AA_L_01_', 'Ketena 01', 587, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'cf2d235a-3189-4b63-9a30-634e8ec1180d');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('65f12f90-bbc8-4383-8505-34e0ff2ba9c0', 589, 'AA_L_01_', 'Ketena 02', 587, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'f716b62a-18ff-447f-9dfe-42d11d6c4978');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('3f03df88-a72e-469c-8955-84ff84fe502a', 590, 'AA_L_01_', 'Ketena 03', 587, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '56dbfc37-d94d-49f5-8a59-3c578ab7f6ac');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('481c70e2-11a3-40c9-8c05-434f67c58d34', 591, 'AA_L_01_', 'Ketena 04', 587, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '0bc69bf1-3506-4a56-841e-2294ac966548');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('931b4938-f632-45ab-8178-e52550235154', 592, 'AA_L_01_', 'Ketena 05', 587, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '580a1615-1d70-4b96-9aeb-c4691000a787');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('51657e63-16aa-4d8b-8528-ea2c0ac9e774', 593, 'AA_L_02', 'Woreda 2', 586, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '51f39513-7001-4fe7-ac56-cde2028708b6');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('126ccd67-1c52-43fd-a286-56f6c6007661', 594, 'AA_L_02_', 'Ketena 01', 593, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '181820d2-2fe4-414d-99d3-35b43e2426c6');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('9e2c4773-b44c-49f9-9638-f8fe54667ba1', 595, 'AA_L_02_', 'Ketena 02', 593, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '1b70ade4-0110-4fab-97c8-b185d486b43c');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ce2100f7-d5fb-4925-a7f8-b270e0993071', 596, 'AA_L_02_', 'Ketena 03', 593, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'c6b73857-3a8e-4644-a2e2-8793f4f428c2');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('2e191257-20b8-4151-b6f7-f350a53474ac', 597, 'AA_L_02_', 'Ketena 04', 593, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '8992574b-3c79-46e8-97c9-fb33604ecf98');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('7f8d343d-29bc-458f-b3b3-e34cfdb7fa02', 598, 'AA_L_02_', 'Ketena 05', 593, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '34e46c99-8563-4b77-b34f-be178d761a90');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ad725d0b-e1da-42b1-8864-45d9c5159468', 599, 'AA_L_03', 'Woreda 3', 586, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'ff5baeb0-4c97-49a5-a43f-4aa22c806525');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('074ed12d-5ae5-471f-a84b-622689b3fe2e', 600, 'AA_L_03_', 'Ketena 01', 599, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'c2581f18-2a39-4561-9968-e143a6e13025');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('7565e40e-2b47-4030-b31a-eac85a835a5a', 601, 'AA_L_03_', 'Ketena 02', 599, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '2df3c558-593a-4df3-be17-433883b75451');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('9a9107e6-d025-48c8-9607-7c45fee185f9', 602, 'AA_L_03_', 'Ketena 03', 599, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '0a605514-1727-45b6-9b33-3794797548db');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('9b83f4e9-b10a-43bc-9f91-5cc4ecc471e5', 603, 'AA_L_03_', 'Ketena 04', 599, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '38b68f7c-5d64-4e89-a576-c4b2884117c4');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('017c3e22-4b9c-47af-bdb5-d9ba626b48c7', 604, 'AA_L_03_', 'Ketena 05', 599, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'f2a6d6bd-68e1-40d6-9cce-e97a8966700b');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('1a79ad9a-d42b-482b-9bb8-e1b471f7310f', 605, 'AA_L_04', 'Woreda 4', 586, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'eac7ac4c-f664-4a38-8526-78fca21d216b');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('117ec1ca-5623-43da-807a-af9a811c72af', 606, 'AA_L_04_', 'Ketena 01', 605, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '47d1efd0-46d6-4a40-a08a-fbfb9b78d1ff');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('5ce4727f-576a-4ef1-932b-791b2241efc0', 607, 'AA_L_04_', 'Ketena 02', 605, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '1c9ec773-ba10-4b31-b447-4b14275afbeb');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('1e5e1667-5beb-4caa-a508-140bef24b44d', 608, 'AA_L_04_', 'Ketena 03', 605, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '19370cea-f73f-46bd-9c35-610ae68d0214');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('c66b754a-b3ff-4a94-99d4-182174b8d907', 609, 'AA_L_04_', 'Ketena 04', 605, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'f97ec2f9-709b-4795-8202-baebd7e68ae4');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('b25ca0fe-feb0-4703-a8c0-bbe165e384bd', 610, 'AA_L_04_', 'Ketena 05', 605, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '90181fa3-4891-409d-b4bc-ea0e9b9e9d8f');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('2288aa4f-b016-44c0-b4bc-7546d964f81e', 611, 'AA_L_05', 'Woreda 5', 586, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '30fc0ed0-40ee-42b2-bfae-96c417b54015');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('fffceeb9-6b62-49a3-964c-02453b1f7bf7', 612, 'AA_L_05_', 'Ketena 01', 611, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '1c742d70-22dd-4a13-aec8-cb1ed846df2b');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('9b6c1073-57c7-417a-8d20-ea5e7b2bbaea', 613, 'AA_L_05_', 'Ketena 02', 611, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '799a06f4-23b1-49c1-9e9e-933710e3d4b1');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ec349690-7f7a-4928-ac51-b30a1cd02cdc', 614, 'AA_L_05_', 'Ketena 03', 611, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '37227764-31ac-4ed1-bf0a-364e84cbe640');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('7299221f-9241-4cbc-9741-5ce9cb2a8319', 615, 'AA_L_05_', 'Ketena 04', 611, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '6197bb3a-dc74-46dd-8a74-504ec564dfcd');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d1969b7f-89d3-483d-befe-0dfa307521b8', 616, 'AA_L_05_', 'Ketena 05', 611, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'cdee2f1b-064a-4d06-adb8-ac2477586e3b');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ffbf1d7d-0af0-464f-93c6-c1cd12d303d2', 617, 'AA_L_06', 'Woreda 6', 586, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '06acd381-5e19-4edf-8ac9-36a52c91dd17');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('5d55bf9f-15cf-48fb-b5bb-a10d23c2ce4c', 618, 'AA_L_06_', 'Ketena 01', 617, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'e3997a9e-f889-4ca5-a2fd-189ea0cc1981');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('66a6ef76-c200-4c7a-a659-f721ff138688', 619, 'AA_L_06_', 'Ketena 02', 617, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '99df1f3a-e65f-47e1-9433-a46475186abd');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('0e9fadd0-3d92-44eb-8110-40d7551c0f13', 620, 'AA_L_06_', 'Ketena 03', 617, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '47ed3cc5-f32a-4b38-b324-11635feaa2a5');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('711a5ead-a312-4960-8224-ad52ba0df30f', 621, 'AA_L_06_', 'Ketena 04', 617, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '81bbf457-3aea-42a5-9e1a-81d31be894c7');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('c61d953e-48e3-468c-b93b-9af6c03a0853', 622, 'AA_L_06_', 'Ketena 05', 617, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '3c9e76a8-4b7c-43dd-a63e-82c74a5425fc');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('69a18e9d-7ddf-4ad0-bfb6-c5a6b5e05023', 623, 'AA_L_07', 'Woreda 7', 586, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '32c872d6-2ef0-417b-85b9-a6d4e8a8e326');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('e35d7ba5-b8a1-45c8-9bf5-bd2868d31df3', 624, 'AA_L_07_', 'Ketena 01', 623, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '57fce52e-017e-4303-a95f-2780877441b1');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('943bff88-b338-4827-934c-3244b61e0d41', 625, 'AA_L_07_', 'Ketena 02', 623, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'f5af1b74-f736-4fb7-925a-66fec52c649a');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('a845fc7c-eba0-4140-a2a0-45bba555856f', 626, 'AA_L_07_', 'Ketena 03', 623, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '19cc77c5-54cd-4c83-a48a-500fad033a6e');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('da57f70a-935b-4657-8a8d-210263a28e9e', 627, 'AA_L_07_', 'Ketena 04', 623, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'c39c957c-d853-4007-8627-7a0fcb2694d1');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('f0950fe6-19cd-4b9d-a21a-14a414ac8a23', 628, 'AA_L_07_', 'Ketena 05', 623, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '4827d8c7-612f-4b87-8916-cdd37184d7ae');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('887ddfd4-0db3-49ad-a1e2-ab84f085d2ba', 629, 'AA_L_08', 'Woreda 8', 586, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '5407113b-8657-4e0b-ace3-8a476347f192');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('e1f967b5-608e-403b-bfc1-57631a90c32b', 630, 'AA_L_08_', 'Ketena 01', 629, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '7670da8e-0159-478a-a901-927488789b57');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('6afe0469-77c2-4f67-9976-bfbd7fa87a8c', 631, 'AA_L_08_', 'Ketena 02', 629, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '15e340b9-3519-43f3-8d2b-1296af317165');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('de56f762-6f1a-4f0c-a3fc-bf37c37742fa', 632, 'AA_L_08_', 'Ketena 03', 629, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '14307d68-100c-4a97-9c61-6897590ea596');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('cb6d89ea-3cdb-4243-98b6-d170cdb8a424', 633, 'AA_L_08_', 'Ketena 04', 629, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'aee4701a-15e6-4308-a6f0-9ed30547ebda');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('8808a02d-92e4-4eea-84bd-5a9fd48b6290', 634, 'AA_L_08_', 'Ketena 05', 629, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '96727446-931d-4806-afd5-ea55ee809255');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('6100d996-dbc5-42e5-8df1-01380abd40cc', 635, 'AA_L_09', 'Woreda 9', 586, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '986b5a7a-b408-4ea9-9769-64669adf8c2a');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('f245d15a-daa1-48c2-8864-98d053a14ac1', 636, 'AA_L_09_', 'Ketena 01', 635, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '7f7730dd-6a32-4d53-96ab-e120d5b89e33');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('0bfda377-c18f-41be-a93a-e0bcad81de9e', 637, 'AA_L_09_', 'Ketena 02', 635, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '0eeff67e-6b03-4204-82af-a9f90c70688e');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('65c07b03-c5d2-4612-aba2-b48af4dcaff1', 638, 'AA_L_09_', 'Ketena 03', 635, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '9c8ef1b6-ef9c-4044-9a9a-cb9018f8f092');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ffbed987-0d65-4c88-98e2-4a51056edcc6', 639, 'AA_L_09_', 'Ketena 04', 635, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'a323d043-038f-4b39-9371-fdb7a483dc53');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('b5f58838-7460-48f6-94d2-f52a79415671', 640, 'AA_L_09_', 'Ketena 05', 635, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '8eeb6a59-e5c5-4995-b038-5186df62b09a');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('20c50aec-b454-4018-8d6a-6f390c9f0192', 641, 'AA_L_10', 'Woreda 10', 586, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '5c8df91c-af5b-475d-b649-95596e7cbe1e');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ddb0c6ca-085f-49c5-8b05-84d50439f590', 642, 'AA_L_10_', 'Ketena 01', 641, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '02fe954a-77ad-4726-8ecb-0d246fe0bdf3');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('1526caef-ab0b-49d6-adc5-f507b4fd3752', 643, 'AA_L_10_', 'Ketena 02', 641, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '71d38f5f-3129-463c-9da4-d3d1582624fb');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('dc7f9ea8-7eab-47f6-b869-e123f194e6f8', 644, 'AA_L_10_', 'Ketena 03', 641, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'fc64c1ca-0d0b-4376-a39d-3609e70a7141');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d7b4fc4d-9332-4cfc-9f01-6da699d8da7b', 645, 'AA_L_10_', 'Ketena 04', 641, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'f94cf0ad-dcad-4f0b-92b5-ba868ef1c7b5');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('506a7a33-a4aa-4ea9-8cac-ef677456aca4', 646, 'AA_L_10_', 'Ketena 05', 641, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'c4f47e3e-5eae-46f5-9367-fcbbe52515a7');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ed78d0d7-b8e1-4988-aac2-42d85adc2916', 647, 'AA_NSL', 'Nifas Silk Lafto', 1, 
 'S', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '0a95ea00-b67b-4a33-a601-ee34d7288b77');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('70c727be-8ad9-403a-b09e-04cde31b13d9', 648, 'AA_NSL_0', 'Woreda 1', 647, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '6aafa445-c10a-4497-bfb8-bece745d898a');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('7ce82b58-3a01-48f6-abd8-44241b997950', 649, 'AA_NSL_0', 'Ketena 01', 648, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'cf4ffbf3-ddce-4ce3-8a25-d849fc1d3af5');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('32c99825-b0df-46f9-899d-07a5154b4252', 650, 'AA_NSL_0', 'Ketena 02', 648, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'dddd0a56-066d-4b2d-87ee-8a459a6e749f');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('13ccb5d8-9d1e-4d5c-ae09-ab680889e731', 651, 'AA_NSL_0', 'Ketena 03', 648, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'ed09c9f0-0f08-47cc-9b44-eba99a47b54f');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('780115ba-0d67-4d0d-9a7a-c10447bcb1ea', 652, 'AA_NSL_0', 'Ketena 04', 648, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'a49ed5f9-098c-4469-9c26-0c9d186b2225');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('b6f98286-ad9d-471b-94fa-ab2eb2cb2645', 653, 'AA_NSL_0', 'Ketena 05', 648, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'a6eb7f73-e90f-4825-980a-c0209a48f818');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('eeb3a268-e6aa-4ee6-a9ff-d942ef2c7198', 654, 'AA_NSL_0', 'Woreda 2', 647, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '254d2ffa-04ec-49d8-a39d-c6f000fc5535');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('e9f4d1f7-33a9-445a-bec5-f5dab1db77c6', 655, 'AA_NSL_0', 'Ketena 01', 654, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '31fec200-2c0f-46eb-863d-fc967bfee6d1');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('698a1772-102b-4167-b0e3-8199bc7943f2', 656, 'AA_NSL_0', 'Ketena 02', 654, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '485537d2-935f-4d8b-bd28-bef5fea3a72d');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('85649af9-6178-43e3-a624-720dafad62d8', 657, 'AA_NSL_0', 'Ketena 03', 654, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'a691116f-6765-4ea1-b404-8af323f9a943');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('8f0bab69-957c-4274-9b8d-11d39ed109fb', 658, 'AA_NSL_0', 'Ketena 04', 654, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'd866d222-12b6-4462-890a-027cf6d44972');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('f34cc138-5880-434f-973a-ac6ccb24c5fd', 659, 'AA_NSL_0', 'Ketena 05', 654, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '7d5f8ab8-a843-4701-87bd-6322f765ffa4');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ef88a585-0c08-4eba-83a1-8a45bc057f5f', 660, 'AA_NSL_0', 'Woreda 3', 647, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '31d51556-abeb-4847-8b1e-ffee108e5397');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('5ceb51df-ad5a-4b7f-a68e-4719fad820f8', 661, 'AA_NSL_0', 'Ketena 01', 660, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '1cb7b3fe-db4c-4987-84ed-3bcc6b944984');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('7a0715b6-fceb-461f-954c-38ae92a82750', 662, 'AA_NSL_0', 'Ketena 02', 660, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '7c442606-7ae0-4923-b98d-2bb6b30ffd05');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ea807bef-13c4-468b-99eb-2bddd1a2a5d8', 663, 'AA_NSL_0', 'Ketena 03', 660, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '78ef3b39-1d3f-4094-ba89-72bc4b98fdb3');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('454d7212-b6c5-4435-825a-3f261dfab06d', 664, 'AA_NSL_0', 'Ketena 04', 660, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '97dde441-17f4-48d7-97ba-0e9a1806904e');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('2215bab4-e324-419d-842c-829c41e9503b', 665, 'AA_NSL_0', 'Ketena 05', 660, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '79d747f8-0d0b-48b2-863a-205a88b12e0b');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('6c24bb54-96b7-444d-a95f-0efbdfa5009d', 666, 'AA_NSL_0', 'Woreda 4', 647, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '8c0eba43-6a12-4c5a-a66d-d86358efda3d');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('19d90db3-c15b-4d3b-816f-3658145b1da1', 667, 'AA_NSL_0', 'Ketena 01', 666, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '1c9d5141-c4d7-4262-97ac-c91b371e8e3b');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('0c4e490e-0595-4ffd-a3dc-eccaf5f26479', 668, 'AA_NSL_0', 'Ketena 02', 666, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '0e4d5711-fbd3-4c0e-b9f3-e61491bcd906');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('16cd2b28-1115-442c-ac56-643752392be5', 669, 'AA_NSL_0', 'Ketena 03', 666, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'd6041ee1-dd9a-42ae-b600-a1a394f9191b');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('4f4f3cee-45ec-4cbc-b0f9-c5a1049f8cf3', 670, 'AA_NSL_0', 'Ketena 04', 666, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '33ad10d7-ef42-45d6-8ede-5a40650f2008');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('54f26b43-8c2a-473c-82b2-7cf3df803e8a', 671, 'AA_NSL_0', 'Ketena 05', 666, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'b806bddd-29c6-40c5-9f82-4c43e7f6a37d');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('342df9ba-870b-4bf5-a7c7-f8a4ae4064eb', 672, 'AA_NSL_0', 'Woreda 5', 647, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '8717dbaf-6ef2-493a-a70b-132006d00cfe');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('4c748957-4a79-4c2c-8b0f-68f6549df30b', 673, 'AA_NSL_0', 'Ketena 01', 672, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'de54b264-dd9e-47b7-bc5e-fa23f715ed12');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('7005666f-1690-4821-b734-d5a2c559376e', 674, 'AA_NSL_0', 'Ketena 02', 672, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'e5057c18-58c0-457f-894b-4464dce2bb95');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('5cf30a0a-52e9-454c-a329-31ef6fa326a1', 675, 'AA_NSL_0', 'Ketena 03', 672, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'da1bbf96-6e6b-444a-b06d-e9c75dea33bf');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('da50a0dc-3f1b-4bde-b43e-c158ee368bd7', 676, 'AA_NSL_0', 'Ketena 04', 672, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'ac395e1a-5770-4e36-ac38-ebc84fdbc1b0');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('45b8231f-5177-40b5-a806-15563a857a1a', 677, 'AA_NSL_0', 'Ketena 05', 672, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'e952a8bd-7ad8-42cc-aaf3-7b6fac698c86');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('250e28a8-059c-4fe9-bca0-a9f3a51866b3', 678, 'AA_NSL_0', 'Woreda 6', 647, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '5115bdd8-2354-49bb-b83a-17abc61a556e');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('7a028dcf-fc4f-4ca1-9ea3-3da7f5584578', 679, 'AA_NSL_0', 'Ketena 01', 678, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '7376c84f-92c3-4adf-bdb0-c3c5fbfaf7a7');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('36a6d8b9-6a1d-4e11-8dbb-a64a4cd19695', 680, 'AA_NSL_0', 'Ketena 02', 678, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'e2c65449-13b6-46b1-8feb-0604fd55b4e5');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('c81c8b39-f886-4baf-a828-1f267fc87eaa', 681, 'AA_NSL_0', 'Ketena 03', 678, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'df593a31-ff37-4f8d-bf97-da34f769b799');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('7125d4d7-e921-4d49-8ae2-e31f2e1f4b4d', 682, 'AA_NSL_0', 'Ketena 04', 678, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'aae62ed4-ef1e-4bd9-879a-57b2389c60e2');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('c18a9843-ceff-44e5-8d51-65e98124f2e9', 683, 'AA_NSL_0', 'Ketena 05', 678, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'a4687efd-17cd-4d85-9d96-197eeafba408');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('5a9982d0-887c-4bcd-adfa-5f638ac6f9ea', 684, 'AA_NSL_0', 'Woreda 7', 647, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '5e9299cd-4fc9-45e1-8184-8f5f0d0f5876');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('9b2649ed-40d5-4856-9226-71766d5e2655', 685, 'AA_NSL_0', 'Ketena 01', 684, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '8e8fe764-b9ad-4bdd-9aad-db845212c77f');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('b6455df1-f11e-4622-b67f-d95239afc18e', 686, 'AA_NSL_0', 'Ketena 02', 684, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '1d6f55f5-4f19-4f05-b830-1d14eee258d2');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('a6cc2390-f8cb-486b-b91d-cca558c88852', 687, 'AA_NSL_0', 'Ketena 03', 684, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '752a7b3d-efea-4a07-a354-3f8d30f0c96b');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('0efc258b-077d-4299-bd84-d1a780d798c6', 688, 'AA_NSL_0', 'Ketena 04', 684, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'c94a24fd-4c59-4e09-92f3-7105385d50b7');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('f2823bf9-679f-4d38-967d-c07d3ed895ed', 689, 'AA_NSL_0', 'Ketena 05', 684, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '58f5736a-d1ab-4869-80c9-8f7f5f9064cd');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('c5f8e70a-c971-46a8-9a5d-69a933321f56', 690, 'AA_NSL_0', 'Woreda 8', 647, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '9daa510c-9bd7-4239-ae3c-f82a0e536937');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('395b18a7-c769-4278-838a-c2f0d6e4db9e', 691, 'AA_NSL_0', 'Ketena 01', 690, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'fc88b9dd-87db-4785-808e-5531f7338d8c');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('34dc674a-c7fe-4ab6-aeaf-a5b1013529f8', 692, 'AA_NSL_0', 'Ketena 02', 690, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'cb347d37-5603-4ee8-bd83-d55e04d3cd98');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('9da1b4c3-43cd-4a03-a01a-0757f34a806b', 693, 'AA_NSL_0', 'Ketena 03', 690, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'd29cc66c-32bf-4db6-a181-f5433e3cf235');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('fa0982e2-0a4c-4f0f-bf30-e961853a2559', 694, 'AA_NSL_0', 'Ketena 04', 690, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '4466a0b5-6259-4876-96cf-62628e081f47');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('2c0f36b6-a710-455a-958a-cb47fa946c13', 695, 'AA_NSL_0', 'Ketena 05', 690, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '6c5c6d79-18d0-4d65-beb3-085d8ddd713e');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('173ea598-1968-4110-b6cd-0983b2872363', 696, 'AA_NSL_0', 'Woreda 9', 647, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'c143c20e-a3ce-4d22-9292-d7195ea6a0d9');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('76fcbdf1-9747-420b-93df-611366fb9f20', 697, 'AA_NSL_0', 'Ketena 01', 696, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '3d91cafd-29bf-4e60-a8ee-3fc37b8afb62');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('3a61e9a5-58a4-4034-9fa6-1df54dcb2cda', 698, 'AA_NSL_0', 'Ketena 02', 696, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '28fb947b-af56-45f0-8e12-ab0b8c5065b4');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('c5438bd1-bb17-4890-b94a-644426096a90', 699, 'AA_NSL_0', 'Ketena 03', 696, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '614def45-3960-46e2-9cdb-cbbd3fcb695d');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d302ff96-0a04-401d-a1de-3948f39da612', 700, 'AA_NSL_0', 'Ketena 04', 696, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '60a82ffb-9c69-4ecb-b122-8ddb71ca5661');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('caa6d2dc-2215-49c8-a8c6-60663f9eb9ca', 701, 'AA_NSL_0', 'Ketena 05', 696, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '24dd9bc7-5a8b-4529-a55f-04873ab66b6c');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('a87aa4f6-f877-4899-aec2-1f5d5f884663', 702, 'AA_NSL_1', 'Woreda 10', 647, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '75d09efd-50cb-4842-b81e-61c1b8033636');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('b8f7e6e6-d1f3-4f7c-a296-1c2e9b738919', 703, 'AA_NSL_1', 'Ketena 01', 702, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'cd03abeb-b0e5-4c09-bd1d-c57936b91d4d');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('40db814e-3ef7-474e-9beb-72321fc09013', 704, 'AA_NSL_1', 'Ketena 02', 702, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '8c10a92c-baa5-482d-9d93-78d019a7d8a4');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('a2c5409f-3743-4798-af6c-b99b15eeef91', 705, 'AA_NSL_1', 'Ketena 03', 702, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '53dfcfc6-18cb-44ac-9221-bf0f6c22eda7');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('1034a277-55d9-4bde-b117-fc3d3f64c2aa', 706, 'AA_NSL_1', 'Ketena 04', 702, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '42ce1417-f128-4463-aeb8-563a0eb5e121');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('7970306f-41f1-47e1-acd1-9f1e1a7108c8', 707, 'AA_NSL_1', 'Ketena 05', 702, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '15a5bcf5-8f2c-4f4b-b231-78857754ce63');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('b88aa332-4927-478e-b221-0fd3f7f06231', 708, 'AA_NSL_1', 'Woreda 11', 647, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'ab5a3824-f75d-442e-a05d-aaceeee9a0a5');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('71719014-0bc3-4420-a9cd-32f963978ebf', 709, 'AA_NSL_1', 'Ketena 01', 708, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '0e91f1be-5489-4ed5-ba59-32515a522923');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('4d7bdeb5-9cf5-44d6-bb64-cb1dda7365b5', 710, 'AA_NSL_1', 'Ketena 02', 708, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'af77411c-47f1-44e5-9c1f-fcabb165944e');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('a4366542-0104-4608-a897-6a231d50bafb', 711, 'AA_NSL_1', 'Ketena 03', 708, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '4d0dbbc7-79be-4d37-b0dd-981a50fcbfa8');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('0773fc65-1148-48e4-88a5-5ff6782126ae', 712, 'AA_NSL_1', 'Ketena 04', 708, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'b67ddc73-5072-4bed-8614-10b5685b3cf0');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('50d84eab-d650-419c-afff-019edfb756e4', 713, 'AA_NSL_1', 'Ketena 05', 708, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '8ab1fe0a-1727-4825-8f0e-f3e23163c9d7');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ee293a67-0b74-434a-8388-e51625d7b049', 714, 'AA_NSL_1', 'Woreda 12', 647, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '82541a02-9ef1-4146-84e8-8037015c53d4');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d2c9dbeb-ae12-478f-b961-7700445bdf03', 715, 'AA_NSL_1', 'Ketena 01', 714, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '17b247e3-d454-4510-aa56-a438ae9b66c4');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('9bd40959-a7d1-4cfe-8efb-d9fc604dcd41', 716, 'AA_NSL_1', 'Ketena 02', 714, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '98d375ba-4b5f-4c12-81ca-55715064fc59');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('493ffd0d-0719-4d66-af35-2c0961d0533c', 717, 'AA_NSL_1', 'Ketena 03', 714, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'fe3963bc-e1bf-40e1-ae00-61b422cc79fe');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('0eae6511-c383-45be-8d5e-98de3d02c09c', 718, 'AA_NSL_1', 'Ketena 04', 714, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'c93d3b0d-c8fd-44b8-9ff3-ef7651fb86c6');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('7b0f3dbf-fad7-4387-802e-4c68b38628af', 719, 'AA_NSL_1', 'Ketena 05', 714, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'daee1fcb-5d9f-4870-94d8-765376f2bea3');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('5933ca8e-6216-4056-a0b9-4c89628e8e7b', 720, 'AA_NSL_1', 'Woreda 13', 647, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'b212daaf-df54-4dd9-acf6-2426a0916088');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ab7d36d3-151d-4ab0-9abc-a632f53dfc45', 721, 'AA_NSL_1', 'Ketena 01', 720, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '4b38a1fc-8fd9-4685-8061-17707d20fc6b');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('fe9ed812-3139-4c09-881a-e894565f0d3b', 722, 'AA_NSL_1', 'Ketena 02', 720, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '2e9a00a8-7512-41e1-ba68-b37796ac002e');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('accce16e-bf75-48f9-89ed-6c7dfe5df0cc', 723, 'AA_NSL_1', 'Ketena 03', 720, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'b36b97b0-9c39-4d3d-bc23-1a5bb00dd693');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d997de17-c38c-4c1f-b6c8-66fcb1b461d4', 724, 'AA_NSL_1', 'Ketena 04', 720, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'c19f4410-3200-4bee-bcb6-9360527643b6');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('8546b997-ca07-4693-b8a6-09ff8df249d9', 725, 'AA_NSL_1', 'Ketena 05', 720, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'f79a1900-0ac0-4fde-98c3-dc9907ada6c4');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('873a8fb9-a798-4239-b53b-7b31909f5200', 726, 'AA_NSL_1', 'Woreda 14', 647, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'c5907ff1-6a1c-452f-a624-dc2d39e91633');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('9ca5cb5e-02ad-44ab-b215-761f685601b4', 727, 'AA_NSL_1', 'Ketena 01', 726, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '8e521dcd-98d3-406f-bcfc-9b059b3b15ab');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('238bdae2-3867-44c9-baaf-7b91b60f3dba', 728, 'AA_NSL_1', 'Ketena 02', 726, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '5198b77d-b625-47af-80df-e36794c60cc3');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('fb0626db-edd3-46d0-9004-74bbb3d52581', 729, 'AA_NSL_1', 'Ketena 03', 726, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '99045fe4-42f4-4167-b511-b727fe02bdf1');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('35d53472-7aa0-454a-a140-bfc6f91b8e40', 730, 'AA_NSL_1', 'Ketena 04', 726, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '3275b7be-8b09-42a1-a658-8bd29e7c830c');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('04ed08bc-e71e-4bbf-85e7-c5066b968b1f', 731, 'AA_NSL_1', 'Ketena 05', 726, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'bafe5083-eb5a-44c7-9e24-7e8bd4517b97');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('bbdece8b-0d9a-4aac-a89f-6fee13a87d55', 732, 'AA_NSL_1', 'Woreda 15', 647, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '20afd2a3-4178-4774-9bc5-44822867817e');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('9325201e-f2c6-44a6-b273-9d5e4b323a38', 733, 'AA_NSL_1', 'Ketena 01', 732, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'fedabfc6-3d5b-4df6-89d5-0b7039761199');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('8f80a92b-552e-4736-a3f9-43afff23e0ee', 734, 'AA_NSL_1', 'Ketena 02', 732, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'c988d507-f6f6-439e-92e0-479fa12968bf');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('aa2b13ca-9b7b-46e4-9de8-32ca55f5dde8', 735, 'AA_NSL_1', 'Ketena 03', 732, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'fdd5ca37-3f76-4bc4-832d-72f3beb740d1');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('61ff9c1b-6c8d-4992-8e19-479789fe6784', 736, 'AA_NSL_1', 'Ketena 04', 732, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'd8ec397b-1046-4529-a83e-93b771f8cd89');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('015c0a06-0f65-458c-ade2-0be5bf4c7029', 737, 'AA_NSL_1', 'Ketena 05', 732, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '5a4a3548-1fd8-48e6-ae79-f729b70850ad');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('62be82eb-e0ed-4d15-a29a-8674bfbe383b', 738, 'AA_Y', 'Yeka', 1, 
 'S', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'd1e088c3-7948-488f-bc81-86b010c2d60a');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('47043767-5bd4-498b-b5c8-0c5ba4fb6d63', 739, 'AA_Y_01', 'Woreda 1', 738, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '49400d03-d8ef-48f7-9ce4-6575fd782830');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('14bd8ca0-915b-4557-9435-970f8e1c5665', 740, 'AA_Y_01_', 'Ketena 01', 739, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '538eafd5-4755-4c56-bd13-18351d292853');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('a821cb9e-294f-4b59-96b2-8b8c6c7a5bea', 741, 'AA_Y_01_', 'Ketena 02', 739, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '8f2f5d53-6c50-426b-84d8-a4c358c44896');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('5aed67c7-f682-42b6-8d03-8a270ea1cbb7', 742, 'AA_Y_01_', 'Ketena 03', 739, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'ce740cf5-831a-4c3a-889e-b1d535f26884');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('b437d639-fe6a-4447-9eb2-e437062b10ce', 743, 'AA_Y_01_', 'Ketena 04', 739, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'a04dbe17-449e-4d20-b541-bb103cd16b69');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ead40428-cbb1-480b-a559-4df40d860484', 744, 'AA_Y_01_', 'Ketena 05', 739, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'fd0a5dcc-0d98-49a6-a099-6ce152e14ac7');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('1caa74b9-14af-47eb-a024-707ede7f981b', 745, 'AA_Y_02', 'Woreda 2', 738, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '145483b9-d3f3-4100-8523-76c49cbf1524');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('230e657d-c900-411e-bf33-80c2dfc8cc9e', 746, 'AA_Y_02_', 'Ketena 01', 745, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '5a53a65e-0929-4242-8fc9-f805ba7a8a23');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('3c840f40-a3ad-4f16-8ebc-25983e7123b7', 747, 'AA_Y_02_', 'Ketena 02', 745, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '306b5818-4d78-491c-9c8d-e0525cd74669');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('f32ea1be-2fd7-482b-8c8e-0157478070b1', 748, 'AA_Y_02_', 'Ketena 03', 745, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '6b5f8be4-4e78-4231-8164-a146bde5d5ed');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('4baea10c-ee72-4ba7-a161-1f6dbc8225e4', 749, 'AA_Y_02_', 'Ketena 04', 745, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '699d901d-72cd-4c16-a3e6-7cc586c01d23');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('e2e2c1a1-beb9-44a9-8a5f-40f7cd63484f', 750, 'AA_Y_02_', 'Ketena 05', 745, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'cb439905-c622-40a2-9687-4420b79bb9a1');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('c21f6053-fa25-4058-ae79-397206d5f868', 751, 'AA_Y_03', 'Woreda 3', 738, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'b327db94-c73c-44a5-9038-10fcd7387f41');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('bc8e2cc3-d90e-47fe-83a1-1690c53aa98d', 752, 'AA_Y_03_', 'Ketena 01', 751, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'd4959bf3-ab67-4ca7-9a08-33e7a1d7827c');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('0c0fd3cd-b32a-4af1-8645-4e7913c0f01e', 753, 'AA_Y_03_', 'Ketena 02', 751, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '2bc61391-a230-40cd-b8e5-5892595b5ff1');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('b339828b-727b-44f3-aa5f-4b6a3fd24000', 754, 'AA_Y_03_', 'Ketena 03', 751, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '46686d19-6c53-483b-8d90-84ce0ce96c59');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('94865e33-334d-46ea-b454-259b694c9a7d', 755, 'AA_Y_03_', 'Ketena 04', 751, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '9904faf9-a158-4c63-8838-e9e193021e42');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('84bcff3c-7368-4460-bb64-8ac021f6193c', 756, 'AA_Y_03_', 'Ketena 05', 751, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '6a8ce9d1-56e4-4951-baa1-2d7f00491910');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('28e2415e-d172-46dc-8eed-6dbfb53ed646', 757, 'AA_Y_04', 'Woreda 4', 738, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'bfe8b248-70b1-41c1-9509-8b2a681db8fb');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('9d9bf46a-cfb8-46ca-9360-bf6d1119e1c5', 758, 'AA_Y_04_', 'Ketena 01', 757, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '3df3fd59-84a0-41ba-86d1-c9dfc807fe78');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ea03aa90-a6f1-45b6-b23f-81df6ea40dc8', 759, 'AA_Y_04_', 'Ketena 02', 757, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'a2110e13-2e90-493e-94dc-c04920560164');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('4f73e529-2f82-465a-bdf6-0f0b21f9a4eb', 760, 'AA_Y_04_', 'Ketena 03', 757, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '1595e9ef-b8b3-4a66-a2a4-11b362894fb5');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('fd4f970c-9959-434e-bdcb-4775b14481ac', 761, 'AA_Y_04_', 'Ketena 04', 757, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '227bcf55-1856-4b50-afa3-113b65dceeed');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('22bc256e-2421-4d74-8733-97f4cf6576fa', 762, 'AA_Y_04_', 'Ketena 05', 757, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'a3e6aae7-3c75-405e-ab55-062654aa4b85');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('08d0b36f-6e44-4a42-b7db-19f784cee7b1', 763, 'AA_Y_05', 'Woreda 5', 738, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '08d79961-9859-4a2e-b28b-5884815e8e21');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('98dc0dc3-5b14-4ba1-9e79-f2541890f779', 764, 'AA_Y_05_', 'Ketena 01', 763, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '7bc83f41-0e18-474d-a430-b92b4c79cc3b');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('8c787d81-6c28-4ba2-acca-fefd081f6a61', 765, 'AA_Y_05_', 'Ketena 02', 763, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '3020240b-361c-4133-bca9-99f3de404209');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('5bf9a67d-c299-41ac-a04b-c23605534720', 766, 'AA_Y_05_', 'Ketena 03', 763, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'e5e0faf6-7a82-48f5-b437-50c96417a12c');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('3f407778-1e8a-45a7-8192-ea735d4b4079', 767, 'AA_Y_05_', 'Ketena 04', 763, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '2ca484a4-7856-43d1-a68b-633749ba5907');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('b85b03b6-a912-4efa-94dc-50d94b5fd095', 768, 'AA_Y_05_', 'Ketena 05', 763, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '194fa5fa-dc3a-4345-a5ed-fab9ba1e8c84');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('336e17ad-c51c-4b96-90a0-2957f6e0d611', 769, 'AA_Y_06', 'Woreda 6', 738, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'ae0e660a-f03f-4d4e-ab6d-27322bc013c2');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('8b7ee96a-25af-497b-b39e-e81917357abf', 770, 'AA_Y_06_', 'Ketena 01', 769, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '9b0e8579-fceb-4678-b2e9-4a7c2d4efd97');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('8ecc3670-0509-4010-9bec-e9d716c2681a', 771, 'AA_Y_06_', 'Ketena 02', 769, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '7d269afd-c6b3-49b0-9e5d-cb96d3297688');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d62cb558-2239-4a17-b0a7-acd389706b4b', 772, 'AA_Y_06_', 'Ketena 03', 769, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'a9d6196b-c945-4525-a23c-5b4318ad714a');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d83062c6-3e8d-4f44-b7e2-7b26704354fd', 773, 'AA_Y_06_', 'Ketena 04', 769, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '4457fb4c-88f3-412b-9aaf-1f989ff832e7');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('3d1cd119-ab75-4847-9865-2b44b2d7d836', 774, 'AA_Y_06_', 'Ketena 05', 769, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '50bedd84-1e33-4adb-83ce-5baa42d14598');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('71067176-3523-458e-b44d-eb52984a8b61', 775, 'AA_Y_07', 'Woreda 7', 738, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'c18ccdc9-0941-4aca-9109-4010b925f391');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('4926c56c-fd5f-4fae-ac3b-e5fc92c07995', 776, 'AA_Y_07_', 'Ketena 01', 775, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'bdee66ad-bf16-4d9c-b109-c09c717d37d6');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('55275c45-3e03-459a-ad6a-5a504296154e', 777, 'AA_Y_07_', 'Ketena 02', 775, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'fe30717e-8ac7-43b9-b947-94a6af748378');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('84ac559b-c271-4809-8a59-4205cfc85395', 778, 'AA_Y_07_', 'Ketena 03', 775, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '72d4ff07-5d45-4595-863c-665f39ccbcfa');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('b344417f-52e0-42a3-9058-740de832a915', 779, 'AA_Y_07_', 'Ketena 04', 775, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '4bee07c8-92c4-4b96-adc0-4fa95a4ecbff');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('57b00e04-1362-4f52-98ff-52ed061db988', 780, 'AA_Y_07_', 'Ketena 05', 775, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '7cd22954-d68d-476a-897b-22f29a6a11cf');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('64b6e98f-802a-4b18-9558-bdd11f182103', 781, 'AA_Y_08', 'Woreda 8', 738, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'a0a574c0-1f45-4893-a5d2-fa9e78b30653');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d9be97d0-4e8a-4587-97e1-25f590d16200', 782, 'AA_Y_08_', 'Ketena 01', 781, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'cdb4389b-5c8b-4306-85cc-5df6a8a40e14');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('45648b26-ab06-4243-9a19-054623046547', 783, 'AA_Y_08_', 'Ketena 02', 781, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'b72a1a7f-9f68-4fed-b9d7-b73a4232d51e');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('94ec2657-d5b3-48f5-a709-9d9fa1669998', 784, 'AA_Y_08_', 'Ketena 03', 781, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'e337ef29-398a-4594-89b6-60890534ec38');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('73f8f274-77dd-4581-bb37-c3e02430e004', 785, 'AA_Y_08_', 'Ketena 04', 781, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '1f369849-5164-44a6-b13e-90fd82bebc22');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('6f3f4768-d4e5-451a-9a46-5182861587e5', 786, 'AA_Y_08_', 'Ketena 05', 781, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '37f24c05-234d-4cf5-94f6-f1bce0099ff9');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('3552217f-68ed-4aaa-9c48-cc707461b387', 787, 'AA_Y_09', 'Woreda 9', 738, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'ae812c0c-5fe7-4db8-926b-174c198bd191');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('01652aab-10d8-4cf1-bf46-9f2b9666a251', 788, 'AA_Y_09_', 'Ketena 01', 787, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '26d803eb-20db-4aa6-9608-7b8c2d69f93f');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('63e78519-8797-4e40-bce1-b4beb0a8ba9d', 789, 'AA_Y_09_', 'Ketena 02', 787, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '5f8d5349-8b8d-4459-8014-2a96f22cdb22');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('c7817c8b-3add-44bc-8940-07cc7ad7be96', 790, 'AA_Y_09_', 'Ketena 03', 787, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'c58f1bc9-4102-4256-979a-ae4e3fbad920');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('639baf45-797b-4b3b-8d18-aed78ee981aa', 791, 'AA_Y_09_', 'Ketena 04', 787, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '574ac376-60a6-4e89-8606-a4825bef0ef4');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('fc0aba42-6f63-47a4-b3ca-4a1a1a4df7cd', 792, 'AA_Y_09_', 'Ketena 05', 787, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '37ca47b8-6d55-45c8-848d-b14dd4f1f184');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('50c17687-2560-4fbf-8622-e8f79b8b75e3', 793, 'AA_Y_10', 'Woreda 10', 738, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '91d6cb42-1b73-466f-8ef3-20360eb99c52');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('de02a5e8-3f70-46c7-a3df-2cd4f67ddad4', 794, 'AA_Y_10_', 'Ketena 01', 793, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '536dc47b-3f6f-4b01-a90f-fef64f357b2f');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('f17e2c6c-7cd9-4d9d-a78d-a84731bc33ca', 795, 'AA_Y_10_', 'Ketena 02', 793, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'd0e81408-0d85-4101-b623-4b6ece6150c1');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('1a93417c-0c96-4845-8cee-5b3b2f433de8', 796, 'AA_Y_10_', 'Ketena 03', 793, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '61a7ec47-096c-44bd-98dd-14ca28d778ce');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('b9782bb3-ee35-40c6-b769-5a96d45a8c60', 797, 'AA_Y_10_', 'Ketena 04', 793, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '5e723e97-c8dc-4c84-94ea-592a9b81a327');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('8102f703-067e-413f-a0a4-030b1f3eef2a', 798, 'AA_Y_10_', 'Ketena 05', 793, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '9f8c4837-01e2-4291-8bbd-e5f654c4c4f5');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('26cd9c83-e4ac-4dce-938f-ce818e9a8e9f', 799, 'AA_Y_11', 'Woreda 11', 738, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'cfc8819f-bf9d-4bc2-b85f-c489c598d808');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('4c9a036b-5155-4c11-9df3-42e57af2dabd', 800, 'AA_Y_11_', 'Ketena 01', 799, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '51667b58-7a73-455f-9a25-7b0b354dd756');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ef1a6621-efaa-4f5e-b509-d8c7ecb3c66e', 801, 'AA_Y_11_', 'Ketena 02', 799, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'd9fbfc74-1e96-4730-947f-6a96fd89f99e');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('e7358e59-5bb0-4808-a572-e19994562770', 802, 'AA_Y_11_', 'Ketena 03', 799, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '8a2cafdb-55a7-44a4-9ce1-4e148d1d301c');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('7a548b86-a705-4501-b948-300d6445bcea', 803, 'AA_Y_11_', 'Ketena 04', 799, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'db8038a4-4bca-4984-bf44-bea0587edd94');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('5cb74cef-71d9-4bb4-a416-7d561849e983', 804, 'AA_Y_11_', 'Ketena 05', 799, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '95e65e9c-5722-4fc5-9881-42aa8197dec3');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('1a62c1cb-0420-4835-9697-074d66a9af9b', 805, 'AA_Y_12', 'Woreda 12', 738, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '2631703e-8ea3-4385-b5bd-ae8c1b9f1176');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d1aa5806-222d-4824-99a6-15bfcdc9cfa4', 806, 'AA_Y_12_', 'Ketena 01', 805, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '794dd61b-f0bb-410c-a402-96902e498167');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('4a5bf39c-ec5b-4a55-9ed6-eaf0d2f1f75c', 807, 'AA_Y_12_', 'Ketena 02', 805, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'b1714794-4c71-4832-8d07-c312a433f996');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('bca7ac4f-2dc6-4093-ab54-d453070de6c4', 808, 'AA_Y_12_', 'Ketena 03', 805, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'f3d7756f-9f93-4669-a242-037bdc456488');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('0d1ebf34-22f1-4384-9c32-dc91ca29bd53', 809, 'AA_Y_12_', 'Ketena 04', 805, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'f3aa8df2-df13-4a15-8f71-c5f610de0007');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('148a8b37-666b-4b9e-9cef-e1196e5d709b', 810, 'AA_Y_12_', 'Ketena 05', 805, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'cfa4acf3-7ac0-4725-8b88-c8d6f36495f0');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d7b59892-03d3-4ff0-b528-11b36d2c0ccf', 811, 'AA_Y_13', 'Woreda 13', 738, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '5937d51d-22eb-4aa9-a2d3-d253dd6f57cf');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('93667fd0-2754-43c4-8ee5-b616b66c1910', 812, 'AA_Y_13_', 'Ketena 01', 811, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '350ce5ec-4a7d-41d0-aafd-85ef7aa6c3ff');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('69e2a93e-34d9-48a3-bd9d-5dec44facbe5', 813, 'AA_Y_13_', 'Ketena 02', 811, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '5693ae99-efa5-4295-a4f7-defb25d95eec');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('57c6c4fe-f0c5-41eb-b200-92911dd83898', 814, 'AA_Y_13_', 'Ketena 03', 811, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '8749386d-00e0-48e1-ba81-6d3fabac2b0c');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('7aba00ab-5542-4dea-8d17-4f4b3835fc54', 815, 'AA_Y_13_', 'Ketena 04', 811, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'd7c07b15-2d84-45d6-9849-f15ca524df87');

INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('7625ba63-cd5e-4b93-b16a-fb72b1375a8a', 816, 'AA_Y_13_', 'Ketena 05', 811, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '8ad524c5-4846-4c57-9800-b0df5060871e');


 -- tblHF

INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,1,'043c7cfa-2b51-4057-8092-77947ee8f494',N'AAAKHC01',N'Abissiniya health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',2,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,2,'e8d6e3a3-ad7e-4156-a9c8-e65f9dba2bc8',N'AAAKHC02',N'Abebe bikila health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',2,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,3,'e55e6ad2-88bc-4223-a3bc-3bd8bc90583e',N'AAAKHC03',N'Addis ketema health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',2,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,4,'b0ad9b31-324d-4e4b-bd1e-46ad7e0f7adf',N'AAAKHC04',N'Addis reay health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',2,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,5,'707f4b8d-d77b-4085-9394-636b6e230556',N'AAAKHC05',N'Ginibot20 health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',2,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,6,'50e955e8-426d-418a-afa2-9901b76343d7',N'AAAKHC06',N'Felegemelese health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',2,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,7,'95d42e66-e26c-497d-ac90-6c11bd007a5d',N'AAAKHC07',N'Kolfe health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',2,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,8,'042436e8-8787-4d4c-acfc-cf9bfac13dcb',N'AAAKHC08',N'Kuas meda health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',2,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,9,'8a7fe1cb-dc9a-484b-b4d6-812add1c987c',N'AAAKHC09',N'Lommimeda health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',2,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,10,'0412b1cd-f109-41be-a01d-43667634b5b5',N'AAAKHC10',N'Millinium health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',2,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,11,'12cc815c-20e8-4980-8e47-ab86974ae3f3',N'AAAKHC11',N'Mikililnd health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',2,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,12,'1da8e388-d582-4386-93c0-ef85c8c60aac',N'AAAKHC12',N'Philipos health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',2,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,13,'8c095fc4-6c9f-481e-a61e-4e7da02d5bac',N'AAAKHC13',N'Woreda3 health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',2,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,14,'a29c0977-9a49-4054-bc70-40c3d77066c7',N'AAAKHC14',N'Woreda 10 health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',2,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,15,'1f6ac581-35a1-4304-85b9-62b72ee8cef8',N'AAAKKHC01',N'Akaki health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',87,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,16,'52a4001a-06ba-4f2d-98e4-a4f07ff21fa7',N'AAAKKHC02',N'Gelan gura',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',87,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,17,'42862f0c-5ea8-4682-a6d3-db10513aa4a3',N'AAAKKHC03',N'Gelan health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',87,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,18,'62e3b49e-f310-413f-a830-3cd07f30dc15',N'AAAKKHC04',N'Kality health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',87,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,19,'05713bf0-0dbe-49f7-97ea-565233fee433',N'AAAKKHC05',N'Saris health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',87,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,20,'7ff00f12-642f-440d-82b8-ff9c3fbbd4aa',N'AAAKKHC06',N'Selam fire health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',87,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,21,'d949a295-e5ca-4eac-945c-476a03edeb3f',N'AAAKKHC07',N'Serit health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',87,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,22,'d2e79591-13a1-4b88-b150-75f327b0e267',N'AAAKKHC08',N'Gelan Gura health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',87,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,23,'b151b55d-11e9-431a-a522-f5c0c05b03a1',N'AAARHC01',N'Abware health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',166,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,24,'dd308318-5b15-43ee-8c13-e0568b996646',N'AAARHC02',N'Afinchober health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',166,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,25,'a53c2cc2-8eaf-432c-8749-77fa364a858f',N'AAARHC03',N'Arada health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',166,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,26,'7b54195d-94d8-4632-a410-61c30017369b',N'AAARHC04',N'Basha wolde health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',166,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,27,'0d1ff62b-8aae-4490-a449-e20f20029ca6',N'AAARHC05',N'Beata health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',166,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,28,'6058ff41-668c-46cc-aebc-a4fbfe7110e7',N'AAARHC06',N'Churchil health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',166,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,29,'b60a9e41-79af-490c-8fc5-3dd5eddcba65',N'AAARHC07',N'Janmeda health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',166,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,30,'0c0da0dd-e2cc-42ed-a94b-73578c280aa7',N'AAARHC08',N'Kebena health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',166,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,31,'7548cb08-4f1d-421a-9f3c-7bd3e22f1c29',N'AAARHC09',N'Ras emiru health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',166,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,32,'0d54a2fa-237b-46fc-bce8-4a3a731528de',N'AAARHC10',N'Semegn kebede health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',166,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,33,'9c4c8680-6e3c-4d5f-a715-18ad6412b44e',N'AABLHC01',N'Semen health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',227,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,34,'7d9f9074-5c1d-4728-bb28-2c8d8d6d0556',N'AABLHC02',N'Bole 17_20 health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',227,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,35,'661d97b5-9c50-456a-8ac7-fb0826ed21db',N'AABLHC03',N'Bole 17 health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',227,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,36,'84bed0b1-fdcd-420f-8a22-1486fb905945',N'AABLHC04',N'Bulbula health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',227,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,37,'1f7ae0fb-b3d7-4301-8b39-346b62c61e85',N'AABLHC05',N'Dilfire health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',227,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,38,'555d1be9-efec-4cea-bb33-89ed8daf2eb6',N'AABLHC06',N'Gergi health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',227,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,39,'b14da1ba-35be-429f-aa73-9e8d5b7818f6',N'AAGLHC01',N'Addis hiwot health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',312,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,40,'2c60bbdc-45fa-431e-87af-0523bf77e96b',N'AAGLHC02',N'Addisu gbya health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',312,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,41,'54146ff0-d5b5-4b22-8c22-bb067f26b1d6',N'AAGLHC03',N'Entoto fana health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',312,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,42,'f49dc837-ade2-49ba-89a5-dfbec8282304',N'AAGLHC04',N'Guto meda health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',312,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,43,'a412656b-260f-48fa-a4ae-aa33fb458491',N'AAGLHC05',N'Hidase health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',312,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,44,'abadc30c-e79c-4232-ab02-d8ed0526cda6',N'AAGLHC06',N'Maychew health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',312,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,45,'4bb6f8be-1174-4923-9539-3d2fe0c63d10',N'AAGLHC07',N'Selam health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',312,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,46,'2628aa4f-9b20-4aaa-8da2-e22304072348',N'AAGLHC08',N'Shegole health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',312,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,47,'3d372bf1-b540-44ce-bc34-b78bcccf9587',N'AAGLHC09',N'Shromeda health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',312,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,48,'fa722354-ddce-4ea4-ac13-31600784f4ed',N'AAGLHC10',N'Tibeb bekchne health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',312,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,49,'fd1e3d90-0f34-49a2-a94d-0b6bc57d3f8a',N'AAKRHC01',N'Efoyita health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',373,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,50,'bbc6538d-0fcd-410f-8d6e-e0b1e2bedc03',N'AAKRHC02',N'Felege hiwot health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',373,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,51,'793c6ace-9007-4ed7-99bc-78e3b7470365',N'AAKRHC03',N'Feres meda health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',373,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,52,'00b9ff50-b9c9-4d0a-b23a-37c7dc8c54be',N'AAKRHC04',N'Gotera masalecha health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',373,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,53,'ab32d09b-6b79-47c2-840b-77962ef29069',N'AAKRHC05',N'Hiwot amba health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',373,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,54,'572a1cb9-a3d8-44a0-809a-5031c813c6e8',N'AAKRHC06',N'Kazanchis health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',373,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,55,'df868a2e-af11-4581-814d-ea757cb776df',N'AAKRHC07',N'Kirkos health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',373,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,56,'e551e54c-e094-4e96-b520-a93f0d37aadd',N'AAKRHC08',N'Meshualekia health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',373,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,57,'eb2158f5-8490-4902-93a6-15ccd1f3bbde',N'AAKLHC01',N'Alembank health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',434,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,58,'4695f749-1097-4fdf-96a9-cf60b3fcb5ce',N'AAKLHC02',N'Keraniyo health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',434,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,59,'7b2f2a1a-4fea-4d04-a766-76f20e6c032d',N'AAKLHC03',N'Woreda 1 health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',434,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,60,'51863ba0-4903-40d0-86de-8c07b5e9f5cc',N'AAKLHC04',N'Woreda 3 health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',434,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,61,'ec48f388-e1b7-4404-b177-b1484c64c599',N'AAKLHC05',N'Woreda 5 health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',434,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,62,'7e00936b-45a9-4ec0-b747-259e623ae5d2',N'AAKLHC06',N'Woreda 6 health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',434,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,63,'377c6eb3-4a04-4587-bd5a-6768390a6de5',N'AAKLHC07',N'Woreda 9 health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',434,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,64,'da6f997c-b9b2-475c-b500-0f671840b139',N'AALKHC01',N'Amoraw health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',501,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,65,'293f69f8-186c-4ba5-b799-3a526bf8e007',N'AALKHC02',N'Bole Arabsa health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',501,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,66,'f6c09a61-aac8-46c4-94ed-49c6381faf26',N'AALKHC03',N'Goro health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',501,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,67,'dee9b331-b779-4c11-9b70-bb1324930cb3',N'AALKHC04',N'Woreda14 Hidase health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',501,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,68,'e21d8ff0-8aba-4f2e-9651-e8a2af3be249',N'AALKHC05',N'Meri health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',501,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,69,'6ccdf92d-f303-4633-90fb-6bc4e8a04827',N'AALKHC06',N'Summit health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',501,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,70,'a5e2ce73-fddd-4dd6-a192-7243d0c8f2bf',N'AALKHC07',N'Reay health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',501,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,71,'a4134514-8192-440f-b675-c50c3465acf5',N'AALKHC08',N'Woreda 2 health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',501,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,72,'eab12bed-9576-4b47-a40e-269400482555',N'AALKHC09',N'Yeka Abado health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',501,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,73,'de243f80-9430-4092-8399-e613e37666f9',N'AALDHC01',N'Abinet health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',586,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,74,'a709b5bd-2c79-4472-a779-2866487d20cd',N'AALDHC02',N'Beletishachew health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',586,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,75,'3ecd83b7-a5be-4875-b77b-c938a4327bea',N'AALDHC03',N'Dagim hidase health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',586,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,76,'53c0998d-3643-4703-9097-53bffc82baca',N'AALDHC04',N'General jagama kalo health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',586,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,77,'ce8d666a-713b-4f1a-952e-33ec32d800de',N'AALDHC05',N'Hidase fire health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',586,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,78,'8069e739-4a92-497a-a572-e9bacce04d47',N'AALDHC06',N'Lideta health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',586,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,79,'423dd185-4cac-45a9-85de-a27b494a60f3',N'AALDHC07',N'Woreda 4 health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',586,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,80,'601a0d5b-82be-43ad-861c-38069fc534e2',N'AALDHC08',N'Tekelhaymanot health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',586,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,81,'1b8aaa0f-27d8-420c-a36f-648843622489',N'AANSHC01',N'NSL no1 health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',647,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,82,'e4129730-c61d-4e05-8944-f2ee21239b6f',N'AANSHC02',N'Woreda 1 health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',647,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,83,'8b4e68b3-ec22-471e-b96d-77b785cb42a0',N'AANSHC03',N'Woreda 2 health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',647,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,84,'f4460e19-2f08-4de9-aac9-e95230652f8c',N'AANSHC04',N'Woreda 5 health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',647,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,85,'ca0c9839-ba37-4123-98b2-e31f0a70c6ce',N'AANSHC05',N'Woreda 6 health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',647,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,86,'dabc70fe-59b9-40b5-9508-15e40590956d',N'AANSHC06',N'Woreda 10 health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',647,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,87,'3c1b082f-6992-443d-9386-b0647c985f3e',N'AANSHC07',N'Woreda 11 health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',647,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,88,'98684a8e-c34b-4dba-af2f-6f46421509c7',N'AANSHC08',N'Woreda 12 health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',647,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,89,'cbb27270-22ee-407b-b4d7-895a5abfe5b0',N'AAYKHC01',N'Entoto no 1 health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',738,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,90,'d4d8bfc7-5f64-47b4-a62f-47742ecce3eb',N'AAYKHC02',N'Entoto no 2 health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',738,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,91,'b082eee4-f47e-4f54-89b3-35454a705f02',N'AAYKHC03',N'Koria zemachochi health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',738,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,92,'38ddb48b-ea1a-4cc0-b8ee-5992209230b9',N'AAYKHC04',N'Kotebe health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',738,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,93,'667cd543-071d-47ab-8a6a-2f1b8ae7a8c4',N'AAYKHC05',N'Woreda 1 health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',738,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,94,'1f1e1592-ed8e-490d-a544-49d3485b42c1',N'AAYKHC06',N'Woreda 7 health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',738,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,95,'2dbb62e3-1090-43b9-9a4f-785c07912c89',N'AAYKHC07',N'Woreda 8 health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',738,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,96,'e3f5d932-7a65-4740-81a7-8eff8766b3ab',N'AAYKHC08',N'Woreda 10 health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',738,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,97,'d9f7de64-c18b-42d2-9fe9-97a1529fff07',N'AAYKHC09',N'Woreda 12 health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',738,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,98,'5e95da34-5ae1-46c9-92b1-778f983b33c5',N'AAYKHC10',N'Yeka health center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',738,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,99,'b732917a-456d-4896-ac77-77023a4e4257',N'AAYKHC11',N'Ferensay Health Center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',738,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,100,'f9cdf399-e035-4218-a4bd-c8f2e6728aa6',N'AAYKHC12',N'Korea Meterian Memorial Health Center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',738,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,101,'14591259-e250-4ae2-811b-3fe16c53e7f8',N'AAYKHC13',N'Abuare Health Center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',738,6,NULL);
INSERT INTO "tblHF"
("ValidityFrom","ValidityTo","LegacyID","HFID","HFUUID","HFCode","HFName","AccCode","HFLevel","HFAddress","Phone","Fax","eMail","HFCareType","OffLine","AuditUserID","PLItemID","LegalForm","LocationId","PLServiceID","HFSublevel")
VALUES (CAST(N'2025-01-01T00:00:00.000' AS timestamptz),NULL,NULL,102,'75580065-ba9a-4e23-8050-a8519dd59754',N'AAYKHC14',N'Chefe Health Center',N'',N'C',N'',N'',N'',N'',N'O',0::boolean,1,5,N'G',738,6,NULL);

-- tblHFSublevel
INSERT INTO "tblHFSublevel" ("HFSublevel", "HFSublevelDesc", "SortOrder", "AltLanguage") VALUES (N'I', N'Integrated', NULL, NULL);
INSERT INTO "tblHFSublevel" ("HFSublevel", "HFSublevelDesc", "SortOrder", "AltLanguage") VALUES (N'N', N'No Sublevel', NULL, NULL);
INSERT INTO "tblHFSublevel" ("HFSublevel", "HFSublevelDesc", "SortOrder", "AltLanguage") VALUES (N'R', N'Reference', NULL, NULL);

-- tblUsersDistricts
INSERT INTO "tblUsersDistricts" ("UserDistrictID", "UserID", "LocationId", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserID") VALUES (1, 1, 1, CAST(N'2017-12-16T14:26:37.713' AS timestamptz), NULL, NULL, 1);


-- tblPayerType
INSERT INTO "tblPayerType" ("Code", "PayerType", "AltLanguage", "SortOrder") VALUES (N'C', N'Co-operative', NULL, NULL);
INSERT INTO "tblPayerType" ("Code", "PayerType", "AltLanguage", "SortOrder") VALUES (N'D', N'Donor', NULL, NULL);
INSERT INTO "tblPayerType" ("Code", "PayerType", "AltLanguage", "SortOrder") VALUES (N'G', N'Government', NULL, NULL);
INSERT INTO "tblPayerType" ("Code", "PayerType", "AltLanguage", "SortOrder") VALUES (N'L', N'Local Authority', NULL, NULL);
INSERT INTO "tblPayerType" ("Code", "PayerType", "AltLanguage", "SortOrder") VALUES (N'O', N'Other', NULL, NULL);
INSERT INTO "tblPayerType" ("Code", "PayerType", "AltLanguage", "SortOrder") VALUES (N'P', N'Private Organization', NULL, NULL);

-- tblRole
INSERT INTO "tblRole" ("RoleID", "RoleName", "AltLanguage", "IsSystem", "IsBlocked", "ValidityFrom", "ValidityTo", "AuditUserID", "LegacyID", "RoleUUID") VALUES (1, N'Enrolment Officer', NULL, 1, 0::boolean, CAST(N'2019-05-10T05:08:23.167' AS timestamptz), NULL, NULL, NULL, N'fe17fee9-a501-48c2-966e-091b765f3718');
INSERT INTO "tblRole" ("RoleID", "RoleName", "AltLanguage", "IsSystem", "IsBlocked", "ValidityFrom", "ValidityTo", "AuditUserID", "LegacyID", "RoleUUID") VALUES (2, N'Manager', NULL, 2, 0::boolean, CAST(N'2019-05-10T05:08:23.173' AS timestamptz), NULL, NULL, NULL, N'10824c66-f7dc-4eb7-a4c9-481f514e35ac');
INSERT INTO "tblRole" ("RoleID", "RoleName", "AltLanguage", "IsSystem", "IsBlocked", "ValidityFrom", "ValidityTo", "AuditUserID", "LegacyID", "RoleUUID") VALUES (3, N'Accountant', NULL, 4, 0::boolean, CAST(N'2019-05-10T05:08:23.180' AS timestamptz), NULL, NULL, NULL, N'496d7cdc-16d2-4d36-ae35-313a5795158b');
INSERT INTO "tblRole" ("RoleID", "RoleName", "AltLanguage", "IsSystem", "IsBlocked", "ValidityFrom", "ValidityTo", "AuditUserID", "LegacyID", "RoleUUID") VALUES (4, N'Clerk', NULL, 8, 0::boolean, CAST(N'2019-05-10T05:08:23.180' AS timestamptz), NULL, NULL, NULL, N'caa6fe3c-b59d-4b2f-b9e6-9df6ef35f7de');
INSERT INTO "tblRole" ("RoleID", "RoleName", "AltLanguage", "IsSystem", "IsBlocked", "ValidityFrom", "ValidityTo", "AuditUserID", "LegacyID", "RoleUUID") VALUES (5, N'Medical Officer', NULL, 16, 0::boolean, CAST(N'2019-05-10T05:08:23.183' AS timestamptz), NULL, NULL, NULL, N'47b0f22f-29f6-41f7-b17e-469aae76e7d3');
INSERT INTO "tblRole" ("RoleID", "RoleName", "AltLanguage", "IsSystem", "IsBlocked", "ValidityFrom", "ValidityTo", "AuditUserID", "LegacyID", "RoleUUID") VALUES (6, N'Scheme Administrator', NULL, 32, 0::boolean, CAST(N'2019-05-10T05:08:23.187' AS timestamptz), NULL, NULL, NULL, N'335a2380-211b-44dc-bb69-7ad6c4de7dce');
INSERT INTO "tblRole" ("RoleID", "RoleName", "AltLanguage", "IsSystem", "IsBlocked", "ValidityFrom", "ValidityTo", "AuditUserID", "LegacyID", "RoleUUID") VALUES (7, N'IMIS Administrator', NULL, 64, 0::boolean, CAST(N'2019-05-10T05:08:23.190' AS timestamptz), NULL, NULL, NULL, N'e794c4ab-3554-4f14-98c4-a5c72d6c3e9a');
INSERT INTO "tblRole" ("RoleID", "RoleName", "AltLanguage", "IsSystem", "IsBlocked", "ValidityFrom", "ValidityTo", "AuditUserID", "LegacyID", "RoleUUID") VALUES (8, N'Receptionist', NULL, 128, 0::boolean, CAST(N'2019-05-10T05:08:23.193' AS timestamptz), NULL, NULL, NULL, N'f9725efc-a649-4af9-962b-003d24d4e863');
INSERT INTO "tblRole" ("RoleID", "RoleName", "AltLanguage", "IsSystem", "IsBlocked", "ValidityFrom", "ValidityTo", "AuditUserID", "LegacyID", "RoleUUID") VALUES (9, N'Claim Administrator', NULL, 256, 0::boolean, CAST(N'2019-05-10T05:08:23.200' AS timestamptz), NULL, NULL, NULL, N'20f7fc37-c0c3-427c-8241-04af84fcf876');
INSERT INTO "tblRole" ("RoleID", "RoleName", "AltLanguage", "IsSystem", "IsBlocked", "ValidityFrom", "ValidityTo", "AuditUserID", "LegacyID", "RoleUUID") VALUES (10, N'Claim Contributor', NULL, 512, 0::boolean, CAST(N'2019-05-10T05:08:23.200' AS timestamptz), NULL, NULL, NULL, N'577f654d-4ace-49fe-9abd-0e6d1ca2c95f');
INSERT INTO "tblRole" ("RoleID", "RoleName", "AltLanguage", "IsSystem", "IsBlocked", "ValidityFrom", "ValidityTo", "AuditUserID", "LegacyID", "RoleUUID") VALUES (11, N'HF Administrator', NULL, 524288, 0::boolean, CAST(N'2019-05-10T05:08:23.207' AS timestamptz), NULL, NULL, NULL, N'b5a31366-35a1-466d-b814-213ca76adf30');
INSERT INTO "tblRole" ("RoleID", "RoleName", "AltLanguage", "IsSystem", "IsBlocked", "ValidityFrom", "ValidityTo", "AuditUserID", "LegacyID", "RoleUUID") VALUES (12, N'Offline Administrator', NULL, 1048576, 0::boolean, CAST(N'2019-05-10T05:08:23.210' AS timestamptz), NULL, NULL, NULL, N'009436c3-6066-4c34-a96f-cee3b4aa7329');

-- tblRoleRight
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (1, 1, 101001, CAST(N'2019-05-10T05:08:23.460' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (2, 1, 101002, CAST(N'2019-05-10T05:08:23.460' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (3, 1, 101003, CAST(N'2019-05-10T05:08:23.460' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (4, 1, 101004, CAST(N'2019-05-10T05:08:23.460' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (5, 1, 101101, CAST(N'2019-05-10T05:08:23.460' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (6, 1, 101102, CAST(N'2019-05-10T05:08:23.460' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (7, 1, 101103, CAST(N'2019-05-10T05:08:23.460' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (8, 1, 101104, CAST(N'2019-05-10T05:08:23.460' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (9, 1, 101105, CAST(N'2019-05-10T05:08:23.460' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (10, 1, 101201, CAST(N'2019-05-10T05:08:23.460' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (11, 1, 101202, CAST(N'2019-05-10T05:08:23.460' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (12, 1, 101203, CAST(N'2019-05-10T05:08:23.460' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (13, 1, 101204, CAST(N'2019-05-10T05:08:23.460' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (14, 1, 101205, CAST(N'2019-05-10T05:08:23.460' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (15, 1, 101301, CAST(N'2019-05-10T05:08:23.460' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (16, 1, 101302, CAST(N'2019-05-10T05:08:23.460' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (17, 1, 101303, CAST(N'2019-05-10T05:08:23.460' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (18, 1, 101304, CAST(N'2019-05-10T05:08:23.460' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (19, 1, 111001, CAST(N'2019-05-10T05:08:23.460' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (20, 1, 111009, CAST(N'2019-05-10T05:08:23.460' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (21, 6, 101105, CAST(N'2019-05-10T05:08:23.550' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (22, 6, 121001, CAST(N'2019-05-10T05:08:23.550' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (23, 6, 121002, CAST(N'2019-05-10T05:08:23.550' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (24, 6, 121003, CAST(N'2019-05-10T05:08:23.550' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (25, 6, 121004, CAST(N'2019-05-10T05:08:23.550' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (26, 6, 121005, CAST(N'2019-05-10T05:08:23.550' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (27, 6, 121101, CAST(N'2019-05-10T05:08:23.550' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (28, 6, 121102, CAST(N'2019-05-10T05:08:23.550' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (29, 6, 121103, CAST(N'2019-05-10T05:08:23.550' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (30, 6, 121104, CAST(N'2019-05-10T05:08:23.550' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (31, 6, 121201, CAST(N'2019-05-10T05:08:23.550' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (32, 6, 121202, CAST(N'2019-05-10T05:08:23.550' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (33, 6, 121203, CAST(N'2019-05-10T05:08:23.550' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (34, 6, 121204, CAST(N'2019-05-10T05:08:23.550' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (35, 6, 121205, CAST(N'2019-05-10T05:08:23.550' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (36, 6, 121301, CAST(N'2019-05-10T05:08:23.550' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (37, 6, 121302, CAST(N'2019-05-10T05:08:23.550' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (38, 6, 121303, CAST(N'2019-05-10T05:08:23.550' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (39, 6, 121304, CAST(N'2019-05-10T05:08:23.550' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (40, 6, 121305, CAST(N'2019-05-10T05:08:23.550' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (41, 6, 121401, CAST(N'2019-05-10T05:08:23.550' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (42, 6, 121402, CAST(N'2019-05-10T05:08:23.550' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (43, 6, 121403, CAST(N'2019-05-10T05:08:23.550' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (44, 6, 121404, CAST(N'2019-05-10T05:08:23.550' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (45, 6, 122101, CAST(N'2019-05-10T05:08:23.550' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (46, 6, 122102, CAST(N'2019-05-10T05:08:23.550' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (47, 6, 122103, CAST(N'2019-05-10T05:08:23.550' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (48, 6, 122104, CAST(N'2019-05-10T05:08:23.550' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (49, 6, 121501, CAST(N'2019-05-10T05:08:23.550' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (50, 6, 121502, CAST(N'2019-05-10T05:08:23.550' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (51, 6, 121503, CAST(N'2019-05-10T05:08:23.550' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (52, 6, 121504, CAST(N'2019-05-10T05:08:23.550' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (53, 6, 121601, CAST(N'2019-05-10T05:08:23.550' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (54, 6, 121602, CAST(N'2019-05-10T05:08:23.550' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (55, 6, 121603, CAST(N'2019-05-10T05:08:23.550' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (56, 6, 121604, CAST(N'2019-05-10T05:08:23.550' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (57, 6, 121801, CAST(N'2019-05-10T05:08:23.550' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (58, 6, 121802, CAST(N'2019-05-10T05:08:23.550' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (59, 6, 121803, CAST(N'2019-05-10T05:08:23.550' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (60, 6, 121804, CAST(N'2019-05-10T05:08:23.550' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (61, 6, 131001, CAST(N'2019-05-10T05:08:23.550' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (62, 6, 131002, CAST(N'2019-05-10T05:08:23.550' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (63, 6, 131003, CAST(N'2019-05-10T05:08:23.550' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (64, 6, 131004, CAST(N'2019-05-10T05:08:23.550' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (65, 6, 131101, CAST(N'2019-05-10T05:08:23.550' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (66, 6, 131102, CAST(N'2019-05-10T05:08:23.550' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (67, 6, 131103, CAST(N'2019-05-10T05:08:23.550' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (68, 6, 131104, CAST(N'2019-05-10T05:08:23.550' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (69, 6, 131105, CAST(N'2019-05-10T05:08:23.550' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (70, 6, 131106, CAST(N'2019-05-10T05:08:23.550' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (71, 6, 131209, CAST(N'2019-05-10T05:08:23.550' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (72, 7, 101105, CAST(N'2019-05-10T05:08:23.683' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (73, 7, 121701, CAST(N'2019-05-10T05:08:23.683' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (74, 7, 121702, CAST(N'2019-05-10T05:08:23.683' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (75, 7, 121703, CAST(N'2019-05-10T05:08:23.683' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (76, 7, 121704, CAST(N'2019-05-10T05:08:23.683' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (77, 7, 121901, CAST(N'2019-05-10T05:08:23.683' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (78, 7, 121902, CAST(N'2019-05-10T05:08:23.683' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (79, 7, 121903, CAST(N'2019-05-10T05:08:23.683' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (80, 7, 121904, CAST(N'2019-05-10T05:08:23.683' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (81, 7, 121905, CAST(N'2019-05-10T05:08:23.683' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (82, 7, 131005, CAST(N'2019-05-10T05:08:23.683' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (83, 7, 131006, CAST(N'2019-05-10T05:08:23.683' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (84, 7, 131207, CAST(N'2019-05-10T05:08:23.683' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (85, 7, 131301, CAST(N'2019-05-10T05:08:23.683' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (86, 7, 131302, CAST(N'2019-05-10T05:08:23.683' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (87, 7, 131303, CAST(N'2019-05-10T05:08:23.683' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (88, 7, 131304, CAST(N'2019-05-10T05:08:23.683' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (89, 7, 122000, CAST(N'2019-05-10T05:08:23.683' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (90, 7, 122001, CAST(N'2019-05-10T05:08:23.683' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (91, 7, 122002, CAST(N'2019-05-10T05:08:23.683' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (92, 7, 122003, CAST(N'2019-05-10T05:08:23.683' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (93, 7, 122004, CAST(N'2019-05-10T05:08:23.683' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (94, 7, 122005, CAST(N'2019-05-10T05:08:23.683' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (95, 3, 101001, CAST(N'2019-05-10T05:08:23.767' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (96, 3, 101101, CAST(N'2019-05-10T05:08:23.767' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (97, 3, 101105, CAST(N'2019-05-10T05:08:23.767' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (98, 3, 101201, CAST(N'2019-05-10T05:08:23.767' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (99, 3, 101301, CAST(N'2019-05-10T05:08:23.767' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (100, 3, 101401, CAST(N'2019-05-10T05:08:23.767' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (101, 3, 101402, CAST(N'2019-05-10T05:08:23.767' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (102, 3, 101403, CAST(N'2019-05-10T05:08:23.767' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (103, 3, 101404, CAST(N'2019-05-10T05:08:23.767' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (104, 3, 111101, CAST(N'2019-05-10T05:08:23.767' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (105, 3, 111102, CAST(N'2019-05-10T05:08:23.767' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (106, 3, 111103, CAST(N'2019-05-10T05:08:23.767' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (107, 3, 131204, CAST(N'2019-05-10T05:08:23.767' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (108, 3, 131205, CAST(N'2019-05-10T05:08:23.767' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (109, 3, 131206, CAST(N'2019-05-10T05:08:23.767' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (110, 3, 131210, CAST(N'2019-05-10T05:08:23.767' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (111, 3, 131211, CAST(N'2019-05-10T05:08:23.767' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (112, 3, 131212, CAST(N'2019-05-10T05:08:23.767' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (113, 3, 131213, CAST(N'2019-05-10T05:08:23.767' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (114, 3, 131214, CAST(N'2019-05-10T05:08:23.767' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (115, 3, 131215, CAST(N'2019-05-10T05:08:23.767' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (116, 3, 131216, CAST(N'2019-05-10T05:08:23.767' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (117, 3, 131217, CAST(N'2019-05-10T05:08:23.767' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (118, 3, 131218, CAST(N'2019-05-10T05:08:23.767' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (119, 3, 131219, CAST(N'2019-05-10T05:08:23.767' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (120, 3, 131220, CAST(N'2019-05-10T05:08:23.767' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (121, 3, 131221, CAST(N'2019-05-10T05:08:23.767' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (122, 3, 131222, CAST(N'2019-05-10T05:08:23.767' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (123, 3, 131401, CAST(N'2019-05-10T05:08:23.767' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (124, 9, 111001, CAST(N'2019-05-10T05:08:23.853' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (125, 9, 111002, CAST(N'2019-05-10T05:08:23.853' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (126, 9, 111004, CAST(N'2019-05-10T05:08:23.853' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (127, 9, 111005, CAST(N'2019-05-10T05:08:23.853' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (128, 9, 111006, CAST(N'2019-05-10T05:08:23.853' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (129, 9, 111007, CAST(N'2019-05-10T05:08:23.853' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (130, 4, 101001, CAST(N'2019-05-10T05:08:23.903' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (131, 4, 101002, CAST(N'2019-05-10T05:08:23.903' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (132, 4, 101003, CAST(N'2019-05-10T05:08:23.903' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (133, 4, 101004, CAST(N'2019-05-10T05:08:23.903' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (134, 4, 101101, CAST(N'2019-05-10T05:08:23.903' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (135, 4, 101102, CAST(N'2019-05-10T05:08:23.903' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (136, 4, 101103, CAST(N'2019-05-10T05:08:23.903' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (137, 4, 101104, CAST(N'2019-05-10T05:08:23.903' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (138, 4, 101105, CAST(N'2019-05-10T05:08:23.903' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (139, 4, 101201, CAST(N'2019-05-10T05:08:23.903' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (140, 4, 101202, CAST(N'2019-05-10T05:08:23.903' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (141, 4, 101203, CAST(N'2019-05-10T05:08:23.903' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (142, 4, 101204, CAST(N'2019-05-10T05:08:23.903' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (143, 4, 101205, CAST(N'2019-05-10T05:08:23.903' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (144, 4, 101301, CAST(N'2019-05-10T05:08:23.903' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (145, 4, 101302, CAST(N'2019-05-10T05:08:23.903' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (146, 4, 101303, CAST(N'2019-05-10T05:08:23.903' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (147, 4, 101304, CAST(N'2019-05-10T05:08:23.903' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (148, 2, 131201, CAST(N'2019-05-10T05:08:23.950' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (149, 2, 131202, CAST(N'2019-05-10T05:08:23.950' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (150, 2, 131203, CAST(N'2019-05-10T05:08:23.950' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (151, 2, 131208, CAST(N'2019-05-10T05:08:23.950' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (152, 2, 101105, CAST(N'2019-05-10T05:08:23.950' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (153, 5, 111001, CAST(N'2019-05-10T05:08:23.980' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (154, 5, 111008, CAST(N'2019-05-10T05:08:23.980' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (155, 5, 111009, CAST(N'2019-05-10T05:08:23.980' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (156, 5, 111010, CAST(N'2019-05-10T05:08:23.980' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (157, 5, 111011, CAST(N'2019-05-10T05:08:23.980' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (158, 5, 131223, CAST(N'2019-05-10T05:08:23.980' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (159, 8, 101001, CAST(N'2019-05-10T05:08:24.010' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (160, 8, 101101, CAST(N'2019-05-10T05:08:24.010' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (161, 8, 101105, CAST(N'2019-05-10T05:08:24.010' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (162, 8, 101201, CAST(N'2019-05-10T05:08:24.010' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (163, 10, 111001, CAST(N'2019-05-10T05:08:24.037' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (164, 10, 111002, CAST(N'2019-05-10T05:08:24.037' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (165, 10, 111005, CAST(N'2019-05-10T05:08:24.037' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (166, 12, 121701, CAST(N'2019-05-10T05:08:24.083' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (167, 12, 121702, CAST(N'2019-05-10T05:08:24.083' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (168, 12, 121703, CAST(N'2019-05-10T05:08:24.083' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (169, 12, 121704, CAST(N'2019-05-10T05:08:24.087' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (170, 12, 131101, CAST(N'2019-05-10T05:08:24.087' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (171, 12, 131103, CAST(N'2019-05-10T05:08:24.087' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (172, 12, 131301, CAST(N'2019-05-10T05:08:24.087' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (173, 12, 131302, CAST(N'2019-05-10T05:08:24.087' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (174, 12, 131303, CAST(N'2019-05-10T05:08:24.090' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (175, 12, 131304, CAST(N'2019-05-10T05:08:24.090' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (176, 11, 121701, CAST(N'2019-05-10T05:08:24.167' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (177, 11, 121702, CAST(N'2019-05-10T05:08:24.167' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (178, 11, 121703, CAST(N'2019-05-10T05:08:24.170' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (179, 11, 121704, CAST(N'2019-05-10T05:08:24.170' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (180, 11, 131101, CAST(N'2019-05-10T05:08:24.170' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (181, 11, 131103, CAST(N'2019-05-10T05:08:24.170' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (182, 11, 131301, CAST(N'2019-05-10T05:08:24.170' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (183, 11, 131302, CAST(N'2019-05-10T05:08:24.173' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (184, 11, 131303, CAST(N'2019-05-10T05:08:24.173' AS timestamptz), NULL, NULL, NULL);
INSERT INTO "tblRoleRight" ("RoleRightID", "RoleID", "RightID", "ValidityFrom", "ValidityTo", "AuditUserId", "LegacyID") VALUES (185, 11, 131304, CAST(N'2019-05-10T05:08:24.177' AS timestamptz), NULL, NULL, NULL);

-- tblUserRole
INSERT INTO "tblUserRole" ("UserRoleID", "UserID", "RoleID", "ValidityFrom", "ValidityTo", "AudituserID", "LegacyID") VALUES (1, 1, 1, CAST(N'2019-05-10T05:08:23.313' AS timestamptz), NULL, 3, NULL);
INSERT INTO "tblUserRole" ("UserRoleID", "UserID", "RoleID", "ValidityFrom", "ValidityTo", "AudituserID", "LegacyID") VALUES (2, 1, 2, CAST(N'2019-05-10T05:08:23.320' AS timestamptz), NULL, 3, NULL);
INSERT INTO "tblUserRole" ("UserRoleID", "UserID", "RoleID", "ValidityFrom", "ValidityTo", "AudituserID", "LegacyID") VALUES (3, 1, 3, CAST(N'2019-05-10T05:08:23.327' AS timestamptz), NULL, 3, NULL);
INSERT INTO "tblUserRole" ("UserRoleID", "UserID", "RoleID", "ValidityFrom", "ValidityTo", "AudituserID", "LegacyID") VALUES (4, 1, 4, CAST(N'2019-05-10T05:08:23.330' AS timestamptz), NULL, 3, NULL);
INSERT INTO "tblUserRole" ("UserRoleID", "UserID", "RoleID", "ValidityFrom", "ValidityTo", "AudituserID", "LegacyID") VALUES (5, 1, 5, CAST(N'2019-05-10T05:08:23.333' AS timestamptz), NULL, 3, NULL);
INSERT INTO "tblUserRole" ("UserRoleID", "UserID", "RoleID", "ValidityFrom", "ValidityTo", "AudituserID", "LegacyID") VALUES (6, 1, 6, CAST(N'2019-05-10T05:08:23.337' AS timestamptz), NULL, 3, NULL);
INSERT INTO "tblUserRole" ("UserRoleID", "UserID", "RoleID", "ValidityFrom", "ValidityTo", "AudituserID", "LegacyID") VALUES (7, 1, 7, CAST(N'2019-05-10T05:08:23.340' AS timestamptz), NULL, 3, NULL);
INSERT INTO "tblUserRole" ("UserRoleID", "UserID", "RoleID", "ValidityFrom", "ValidityTo", "AudituserID", "LegacyID") VALUES (8, 1, 8, CAST(N'2019-05-10T05:08:23.343' AS timestamptz), NULL, 3, NULL);
INSERT INTO "tblUserRole" ("UserRoleID", "UserID", "RoleID", "ValidityFrom", "ValidityTo", "AudituserID", "LegacyID") VALUES (9, 1, 9, CAST(N'2019-05-10T05:08:23.347' AS timestamptz), NULL, 3, NULL);
INSERT INTO "tblUserRole" ("UserRoleID", "UserID", "RoleID", "ValidityFrom", "ValidityTo", "AudituserID", "LegacyID") VALUES (10, 1, 10, CAST(N'2019-05-10T05:08:23.350' AS timestamptz), NULL, 3, NULL);


COMMIT;

SELECT setval('"public"."tblBatchRun_RunID_seq"', (select coalesce(max("RunID"), 1) from "public"."tblBatchRun"), true);
-- SELECT setval('"public"."tblCapitationPayment_CapitationPaymentID_seq"', (select coalesce(max("CapitationPaymentID"), 1) from "public"."tblCapitationPayment"), true);
SELECT setval('"public"."tblClaim_ClaimID_seq"', (select coalesce(max("ClaimID"), 1) from "public"."tblClaim"), true);
SELECT setval('"public"."tblClaimAdmin_ClaimAdminId_seq"', (select coalesce(max("ClaimAdminId"), 1) from "public"."tblClaimAdmin"), true);
SELECT setval('"public"."tblClaimDedRem_ExpenditureID_seq"', (select coalesce(max("ExpenditureID"), 1) from "public"."tblClaimDedRem"), true);
SELECT setval('"public"."tblClaimItems_ClaimItemID_seq"', (select coalesce(max("ClaimItemID"), 1) from "public"."tblClaimItems"), true);
SELECT setval('"public"."tblClaimServices_ClaimServiceID_seq"', (select coalesce(max("ClaimServiceID"), 1) from "public"."tblClaimServices"), true);
SELECT setval('"public"."tblFamilies_FamilyID_seq"', (select coalesce(max("FamilyID"), 1) from "public"."tblFamilies"), true);
SELECT setval('"public"."tblFeedback_FeedbackID_seq"', (select coalesce(max("FeedbackID"), 1) from "public"."tblFeedback"), true);
SELECT setval('"public"."tblHF_HfID_seq"', (select coalesce(max("HfID"), 1) from "public"."tblHF"), true);
SELECT setval('"public"."tblHFCatchment_HFCatchmentId_seq"', (select coalesce(max("HFCatchmentId"), 1) from "public"."tblHFCatchment"), true);
SELECT setval('"public"."tblICDCodes_ICDID_seq"', (select coalesce(max("ICDID"), 1) from "public"."tblICDCodes"), true);
SELECT setval('"public"."tblInsuree_InsureeID_seq"', (select coalesce(max("InsureeID"), 1) from "public"."tblInsuree"), true);
SELECT setval('"public"."tblInsureePolicy_InsureePolicyID_seq"', (select coalesce(max("InsureePolicyID"), 1) from "public"."tblInsureePolicy"), true);
SELECT setval('"public"."tblItems_ItemID_seq"', (select coalesce(max("ItemID"), 1) from "public"."tblItems"), true);
SELECT setval('"public"."tblLocations_LocationId_seq"', (select coalesce(max("LocationId"), 1) from "public"."tblLocations"), true);
SELECT setval('"public"."tblOfficer_OfficerID_seq"', (select coalesce(max("OfficerID"), 1) from "public"."tblOfficer"), true);
SELECT setval('"public"."tblOfficerVillages_OfficerVillageId_seq"', (select coalesce(max("OfficerVillageId"), 1) from "public"."tblOfficerVillages"), true);
SELECT setval('"public"."tblPayer_PayerID_seq"', (select coalesce(max("PayerID"), 1) from "public"."tblPayer"), true);
SELECT setval('"public"."tblPhotos_PhotoID_seq"', (select coalesce(max("PhotoID"), 1) from "public"."tblPhotos"), true);
SELECT setval('"public"."tblPLItems_PLItemID_seq"', (select coalesce(max("PLItemID"), 1) from "public"."tblPLItems"), true);
SELECT setval('"public"."tblPLItemsDetail_PLItemDetailID_seq"', (select coalesce(max("PLItemDetailID"), 1) from "public"."tblPLItemsDetail"), true);
SELECT setval('"public"."tblPLServices_PLServiceID_seq"', (select coalesce(max("PLServiceID"), 1) from "public"."tblPLServices"), true);
SELECT setval('"public"."tblPLServicesDetail_PLServiceDetailID_seq"', (select coalesce(max("PLServiceDetailID"), 1) from "public"."tblPLServicesDetail"), true);
SELECT setval('"public"."tblPolicy_PolicyID_seq"', (select coalesce(max("PolicyID"), 1) from "public"."tblPolicy"), true);
SELECT setval('"public"."tblPremium_PremiumId_seq"', (select coalesce(max("PremiumId"), 1) from "public"."tblPremium"), true);
SELECT setval('"public"."tblProduct_ProdID_seq"', (select coalesce(max("ProdID"), 1) from "public"."tblProduct"), true);
SELECT setval('"public"."tblProductItems_ProdItemID_seq"', (select coalesce(max("ProdItemID"), 1) from "public"."tblProductItems"), true);
SELECT setval('"public"."tblProductServices_ProdServiceID_seq"', (select coalesce(max("ProdServiceID"), 1) from "public"."tblProductServices"), true);
SELECT setval('"public"."tblRelDistr_DistrID_seq"', (select coalesce(max("DistrID"), 1) from "public"."tblRelDistr"), true);
SELECT setval('"public"."tblRelIndex_RelIndexID_seq"', (select coalesce(max("RelIndexID"), 1) from "public"."tblRelIndex"), true);
SELECT setval('"public"."tblRole_RoleID_seq"', (select coalesce(max("RoleID"), 1) from "public"."tblRole"), true);
SELECT setval('"public"."tblRoleRight_RoleRightID_seq"', (select coalesce(max("RoleRightID"), 1) from "public"."tblRoleRight"), true);
SELECT setval('"public"."tblServices_ServiceID_seq"', (select coalesce(max("ServiceID"), 1) from "public"."tblServices"), true);
SELECT setval('"public"."tblUserRole_UserRoleID_seq"', (select coalesce(max("UserRoleID"), 1) from "public"."tblUserRole"), true);
SELECT setval('"public"."tblUsers_UserID_seq"', (select coalesce(max("UserID"), 1) from "public"."tblUsers"), true);
SELECT setval('"public"."tblUsersDistricts_UserDistrictID_seq"', (select coalesce(max("UserDistrictID"), 1) from "public"."tblUsersDistricts"), true);


-- Completed on 2020-07-05 14:18:38

--
-- PostgreSQL database dump complete
--

