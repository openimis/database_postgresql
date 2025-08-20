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
VALUES ('eea8bbe8-cf1a-4935-88de-f81640e7078d', 10001, 'AA', 'Addis Ababa', NULL, 
 'C', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '1f269672-6675-4083-8044-61ba8bcf9807');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('f482525e-fbac-4dde-ab24-0b554ebf6e14', 10002, 'AA_AK', 'Addis Ketema', 10001, 
 'S', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '566d63b7-b578-480a-884c-2b2ec27b472b');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('64e91f98-c066-475b-83f2-077b49118c19', 10003, 'AA_AK_01', 'Woreda 1', 10002, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '9b67bdc0-fe7a-4e63-94d4-cfd6256e6821');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('81530067-e90e-4035-ae2d-78fc1e381708', 10004, 'AA_AK_01', 'Ketena 01', 10003, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '19ddec43-6704-4955-8325-82bfb35ea0de');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('1c87b9f2-e3f9-4578-8c0a-e0c39e4e7b25', 10005, 'AA_AK_01', 'Ketena 02', 10003, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '46ba4c98-1cba-420c-855c-b83947723e77');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('e0a2f015-6017-481a-9c26-73b4617503a7', 10006, 'AA_AK_01', 'Ketena 03', 10003, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'c36be3fa-baf6-45a7-89b7-3929abd0ed41');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('86cc8922-5ad8-47a7-aed4-a7f9d534e9d3', 10007, 'AA_AK_01', 'Ketena 04', 10003, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '92d9c66b-14d8-48ea-897b-a3e2cbbc2ea6');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('990e3311-1cef-4330-9313-7b3fd65a9132', 10008, 'AA_AK_01', 'Ketena 05', 10003, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'c4d4ebf6-646c-404a-a7b5-81207af67e42');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('87c6da3b-7de6-4731-be59-1a0322d4c5cd', 10009, 'AA_AK_02', 'Woreda 2', 10002, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '87c0ceb2-6581-4237-9024-3e72e5415bec');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('9efb4ab0-2b5d-4f35-956a-9c2c7f783096', 10010, 'AA_AK_02', 'Ketena 01', 10009, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'a654e52c-adc5-431e-adea-eba8677ba327');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('80055abd-362a-453f-9326-20d6815882a4', 10011, 'AA_AK_02', 'Ketena 02', 10009, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '86da920a-0c19-4782-afc3-c03d9608b763');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('df2be11e-2ede-4e15-808a-2e0353b49023', 10012, 'AA_AK_02', 'Ketena 03', 10009, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '6a722ed3-cb64-45cd-aa81-d8f02eaf5ad7');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('2a8f8cec-7fb5-4b60-94bf-4f33c2922551', 10013, 'AA_AK_02', 'Ketena 04', 10009, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'a4368e7e-4799-487b-a461-c38f054b98f4');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ccb4846e-59f5-45ed-9efb-c0423e391e68', 10014, 'AA_AK_02', 'Ketena 05', 10009, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'b05c7d64-0834-4142-92fe-ec556525bd34');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('afe015c8-bd45-441f-aefd-fe6bf589c113', 10015, 'AA_AK_03', 'Woreda 3', 10002, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'f89278c7-d382-4fbc-86aa-e999f37076b3');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('efc460f9-a0cf-4fef-9ccb-61f4e87d927d', 10016, 'AA_AK_03', 'Ketena 01', 10015, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '9880729d-a60c-4488-b409-de491ba8d6f0');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ff8fb9b2-f9ee-4c17-9046-53f113f8069d', 10017, 'AA_AK_03', 'Ketena 02', 10015, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'ffedabac-7ef0-44c0-a341-13f2921cb8d7');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('18eb11b8-f308-4f91-ac2a-15e8f48148c4', 10018, 'AA_AK_03', 'Ketena 03', 10015, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'd528eeef-837f-4f3e-8157-3a1776958641');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('8acf7577-5510-40e3-968a-daca9ac60c73', 10019, 'AA_AK_03', 'Ketena 04', 10015, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '67dbc404-1e73-4cbd-9630-f67e6ffbbc7c');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('5e8b7cf9-08fb-4139-b16f-10c6ef40295a', 10020, 'AA_AK_03', 'Ketena 05', 10015, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '90e28177-19e8-4609-8501-f75ec422f4da');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('6ed77e9d-523b-4f46-bdf5-43dfe0cfeacd', 10021, 'AA_AK_04', 'Woreda 4', 10002, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'b1adb354-5791-4dbe-8f2d-8aa1f021aa1d');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('8c02fc18-80ad-41c2-bfe7-6b2a839a0bb3', 10022, 'AA_AK_04', 'Ketena 01', 10021, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '5a31e59e-f56d-4a66-8a25-86a9f1f5407a');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('91d872a1-2fa5-470a-b38b-d408cd920043', 10023, 'AA_AK_04', 'Ketena 02', 10021, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '51862c2c-8ee4-490e-9c7b-4cadbe00d374');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('c4bd4405-73e8-4a79-9144-63388b54a164', 10024, 'AA_AK_04', 'Ketena 03', 10021, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '3fec6955-fd0d-4116-8bbb-b94b42879a16');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('f6ab8b5d-5a6c-4914-8c83-a68f2a35d93f', 10025, 'AA_AK_04', 'Ketena 04', 10021, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '3d15ea48-2d80-4ff2-b1b9-18a3d82159ec');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('042f34df-ccc3-4bba-ade3-ecb7a1eb857f', 10026, 'AA_AK_04', 'Ketena 05', 10021, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '4f7e3860-61bd-4be4-9e2c-bc5142728905');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d4ef8e3e-b45a-405e-b3e5-2ce7d02876e2', 10027, 'AA_AK_05', 'Woreda 5', 10002, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'ba1acd1c-7064-4b18-97a1-4297a2a21bf1');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('829a7e59-ba32-4750-be80-c4cd7f445d9f', 10028, 'AA_AK_05', 'Ketena 01', 10027, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'e77f49ef-69fc-468e-85cd-203c91987d7b');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d694b272-7b34-45e5-98a5-d8666f8f95b2', 10029, 'AA_AK_05', 'Ketena 02', 10027, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '476b3324-f68d-4fcc-b8bc-a60a2084be31');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('68f0b07f-ab49-405b-a02c-42f7188c5818', 10030, 'AA_AK_05', 'Ketena 03', 10027, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '7c97e7f7-5c71-4ea3-8f9b-9192da93518e');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('3d87da2c-5422-4df3-beeb-28de980bd9b7', 10031, 'AA_AK_05', 'Ketena 04', 10027, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '77f14567-e2c0-4d16-8780-b196fc6530ab');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ed266af0-cf76-4a30-a66b-b2dff6053295', 10032, 'AA_AK_05', 'Ketena 05', 10027, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'e2d47a2f-a38d-4486-b9ad-045ceec3c6ea');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('11488978-3067-4470-897f-e4d58b4751c6', 10033, 'AA_AK_06', 'Woreda 6', 10002, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '7be97fd5-5075-4aa1-9871-9a987ab93aa3');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('953974ca-0e4e-4651-8c73-5c44f021c0fb', 10034, 'AA_AK_06', 'Ketena 01', 10033, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '3fba25cd-81ef-4c1a-8a51-f8591b4185eb');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('058dc221-baae-4667-8939-ac7300f4faa2', 10035, 'AA_AK_06', 'Ketena 02', 10033, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'eb0d8711-41da-4fa3-a74d-d8a931d2cc0d');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('17b5cc0b-f0e3-4b87-84da-831c7e44b0e9', 10036, 'AA_AK_06', 'Ketena 03', 10033, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '9de9a7d5-5790-4d6e-b98e-f2378f670de2');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('6283912b-38a7-4a58-bc84-47cc87960be3', 10037, 'AA_AK_06', 'Ketena 04', 10033, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '9e211001-733a-4d6f-b976-860a8f6ff7f3');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('9b614e5c-775a-46fc-800a-3d41777d0d86', 10038, 'AA_AK_06', 'Ketena 05', 10033, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '9cfefe21-c997-403c-87b1-044a2f5ff4ff');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('f09d1039-efd5-4258-9b63-38c898a014d7', 10039, 'AA_AK_07', 'Woreda 7', 10002, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'b1b3380c-6f3a-4cdd-8362-d8c43ecfd54e');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('70149230-e947-4aac-8d4b-756ac2464295', 10040, 'AA_AK_07', 'Ketena 01', 10039, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'f8cb9a92-dfc5-4a7e-8a96-555f5fb4ec4e');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('5b14905b-f765-49ef-a6a0-f980106b93a2', 10041, 'AA_AK_07', 'Ketena 02', 10039, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '25ac99ca-75b6-4d20-912a-41d54a4455b3');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('e9efe971-83e5-4937-ae03-1b56776541a2', 10042, 'AA_AK_07', 'Ketena 03', 10039, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'ae4497bb-c399-4f96-8e76-690379d021ac');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('0d1cbb77-475b-4b06-ac87-7476d9c027bc', 10043, 'AA_AK_07', 'Ketena 04', 10039, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '88caef8b-ff26-4f79-bdc4-c36981ebd45e');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('32f2566a-2a8e-4565-8f2e-a6361981121b', 10044, 'AA_AK_07', 'Ketena 05', 10039, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '5b7c0c35-f864-4fd9-9850-3fb4c9b66446');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('745b95a0-31c1-44c6-a083-3e62bd6cddd5', 10045, 'AA_AK_08', 'Woreda 8', 10002, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '41f0b24e-b0f7-4565-a459-0b8cae8a5939');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('51babf15-d510-4050-901e-ffc541a1dd79', 10046, 'AA_AK_08', 'Ketena 01', 10045, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '2e827149-e7da-431f-8a15-20c1a4842192');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ea73324a-3716-4f90-b3a2-2ee7e6411c44', 10047, 'AA_AK_08', 'Ketena 02', 10045, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'd5c2a7fd-f973-492c-8bb4-62a926a854c4');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('00378c4b-05a9-45ac-9edf-cbcecb3b10d2', 10048, 'AA_AK_08', 'Ketena 03', 10045, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'dbae6c88-8b33-4fc1-9827-d5c86b064a31');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('78a8766a-473a-433c-9a26-42db5b83c7a4', 10049, 'AA_AK_08', 'Ketena 04', 10045, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '3d66adb1-366a-4775-8bdc-6e60852c0d09');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d4f7157b-a044-4387-a4c1-d507e3c66df7', 10050, 'AA_AK_08', 'Ketena 05', 10045, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'fed56bd8-3bd0-4ac3-9bb6-c5445e8e1bdb');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('46fdd4d1-e365-403b-a07e-2997521fb9bb', 10051, 'AA_AK_09', 'Woreda 9', 10002, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '1cb86234-0d6b-41aa-a810-fa47912a7dfd');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('257da966-a31b-4f56-b203-f4486ff2a69a', 10052, 'AA_AK_09', 'Ketena 01', 10051, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'cd950879-6e6b-4dbf-9268-eabf7132c65b');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('3bad9ed0-cb09-40e0-ae1a-6a878a1757a2', 10053, 'AA_AK_09', 'Ketena 02', 10051, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '53393eba-7423-46f2-bcec-4a4ed54de4bd');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('e8f672cf-1798-4172-9b3a-cac3f5c8ba7a', 10054, 'AA_AK_09', 'Ketena 03', 10051, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'b0d50546-23d1-459d-9619-f32e3f21815e');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('311311c8-558e-4e53-8fee-2cef8d386d5b', 10055, 'AA_AK_09', 'Ketena 04', 10051, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '40cd78ad-edb0-46d5-b495-9b0553c0f10d');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('92e3b790-9c76-44ca-96cc-2c4a69c5d20d', 10056, 'AA_AK_09', 'Ketena 05', 10051, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'ab2863b2-abc2-48fc-a6da-ada1feb64941');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('3ded7e9d-66fb-4c4d-93ee-d5f77fd7424d', 10057, 'AA_AK_10', 'Woreda 10', 10002, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '321449ab-7fb5-49c6-bc5e-0950373a8015');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('7ee011b9-fcae-41a6-8ee2-ec9558364fe1', 10058, 'AA_AK_10', 'Ketena 01', 10057, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '35ef0003-f29c-4333-a7fe-2549bd0c83fb');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('66548ed0-e4c3-4e9c-9e09-ae219a26f416', 10059, 'AA_AK_10', 'Ketena 02', 10057, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '33ad6025-1f24-4331-882b-b3a0bdc92125');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ec03cf49-977d-47c2-a7c1-75daec4f5c77', 10060, 'AA_AK_10', 'Ketena 03', 10057, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '2c9c4d82-6302-46fa-8cb2-4d25b61ac5cc');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ae8f1e86-861b-45dd-a5c3-5779df99b743', 10061, 'AA_AK_10', 'Ketena 04', 10057, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '11ce491b-4324-4d15-9508-ee7b627e2901');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('a9f98b7e-7dbe-4d33-b43d-01cc51ac6a94', 10062, 'AA_AK_10', 'Ketena 05', 10057, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'db860cde-77c1-455b-857b-bb183845743f');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('3f6582ec-6454-485b-b83a-db25a7e01756', 10063, 'AA_AK_11', 'Woreda 11', 10002, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '366cf431-adf2-43fa-9bf1-51e5f23fecff');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('85b7b0f2-edf4-41e6-8890-d863e0313df6', 10064, 'AA_AK_11', 'Ketena 01', 10063, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '1ec26471-a13f-491a-9b90-e76da2816c34');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('bb593abe-1c7a-40c0-ad58-02e25cae1ffe', 10065, 'AA_AK_11', 'Ketena 02', 10063, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '47d8a1fb-db01-410b-a411-334159b1f75f');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('38a82bb4-331b-4115-9acc-23c25065d446', 10066, 'AA_AK_11', 'Ketena 03', 10063, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'bbd6382d-591e-44db-9fbd-af4396007cd7');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('277400f6-bc69-4b4c-ba1e-8d9ecb3211fd', 10067, 'AA_AK_11', 'Ketena 04', 10063, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '46cd1f61-39a4-4cf9-aca4-2cc72b3b8cab');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('bee44227-4f10-4f4a-bed1-16c79aaef1ef', 10068, 'AA_AK_11', 'Ketena 05', 10063, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '1d382561-5dd8-43d1-9452-c440cb9a34ea');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('6e1d4f46-5136-4b60-8d1f-278ef3bc35b0', 10069, 'AA_AK_12', 'Woreda 12', 10002, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'ce588210-2eb9-49e1-bbf6-91a38b321740');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('c7fe0216-ab4a-4437-9504-5666c32c71fd', 10070, 'AA_AK_12', 'Ketena 01', 10069, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'fef0304d-e19e-4c22-8d8c-a46acf59cd6f');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('e667615f-f198-4222-82d5-884f734b695b', 10071, 'AA_AK_12', 'Ketena 02', 10069, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '44f41dee-0150-4cdf-b817-ca01d89a9421');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('980e1100-e294-4aa2-8124-3faa4ff5a024', 10072, 'AA_AK_12', 'Ketena 03', 10069, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '4c025420-7237-4e87-b52b-2a3fc031f674');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('118a13df-7be1-4c1c-97c5-481797cd2aa6', 10073, 'AA_AK_12', 'Ketena 04', 10069, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '8997edb7-c22a-4137-8e55-50769b9f0f0b');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('851fa366-91d2-42bf-b710-12806352cab0', 10074, 'AA_AK_12', 'Ketena 05', 10069, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '10ead2f1-47b6-4276-8252-57f3c6917de3');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('328fda67-5f1b-4ec7-9c2b-5639d87f7447', 10075, 'AA_AK_13', 'Woreda 13', 10002, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'ce23c27e-66ef-461f-a3ee-43c4ee948379');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('0204f881-fa49-46b2-95be-9edad6b215d4', 10076, 'AA_AK_13', 'Ketena 01', 10075, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'da370965-5bdd-40f5-85f0-0ca6aeda47ff');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('8a8d3a20-2aa2-4461-8606-4df92e336a6f', 10077, 'AA_AK_13', 'Ketena 02', 10075, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'e07bbbb2-f466-4b36-83ef-553387df79c0');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('5c9cf993-b0f0-4569-bec3-63e74c94659b', 10078, 'AA_AK_13', 'Ketena 03', 10075, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'e39fe2bc-9c49-438a-b606-34fb5393fa01');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('8e08d673-3f7b-4ec8-8b48-c2683e1e216f', 10079, 'AA_AK_13', 'Ketena 04', 10075, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '7cf4e36d-cd97-4431-a15d-d163c5324a09');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('de3e4bbf-5c97-44b1-952c-b3a230017e9c', 10080, 'AA_AK_13', 'Ketena 05', 10075, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '459b069c-5c08-4558-af5b-51387818dc37');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('23ba7ce2-cbbf-4e7a-a65b-4e4ca3e6b296', 10081, 'AA_AK_14', 'Woreda 14', 10002, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '4edeb84e-4040-4309-8676-24088b66a586');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('64bf08d4-0f05-4889-843d-60b81a7ef74d', 10082, 'AA_AK_14', 'Ketena 01', 10081, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '41777a7f-e1fd-4f1e-8f6b-e78fd6cc63c9');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ca4d5753-f07d-4f14-9eb0-723111ade93e', 10083, 'AA_AK_14', 'Ketena 02', 10081, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '2fe67ec6-5cf9-437a-99fc-289c7b9d2840');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('91d7e1a2-90fe-41ff-be2a-4743aca63c3e', 10084, 'AA_AK_14', 'Ketena 03', 10081, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'f9d4a727-b1ff-4077-9290-2ba5b3341b1b');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('7d53f204-ae41-4e9e-9d4b-afd72e5b542b', 10085, 'AA_AK_14', 'Ketena 04', 10081, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'da46635a-c522-462b-b860-bb6a73d6d121');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('4bde18f8-922a-49f6-a12e-d21f56c2258e', 10086, 'AA_AK_14', 'Ketena 05', 10081, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'e9fa5aec-b06b-4d21-9204-30efb85b243a');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('7d40a125-8d2f-47d7-a7ec-8a9cfee824a4', 10087, 'AA_AK', 'Akaki Kality', 10001, 
 'S', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'e9e3610a-675d-4166-891d-9bf776307394');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('7f23d595-f730-4ca4-b5da-d8d678d2a314', 10088, 'AA_AK_01', 'Woreda 1', 10087, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'ca9977bf-ea82-45dc-8f26-3d92eb2c5b86');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('6cd52d06-62a7-406a-8e5a-7ebc66dbaf38', 10089, 'AA_AK_01', 'Ketena 01', 10088, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'f466e1ad-85bb-48ea-9fae-e3b6b6da1365');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('0ad6ea05-cf43-47fd-81f1-a9986e1edb3c', 10090, 'AA_AK_01', 'Ketena 02', 10088, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'ff81805e-76bd-4684-b911-3afbd68b3bc2');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d2e6465d-6e0d-451e-9ca8-f5a19fecfd35', 10091, 'AA_AK_01', 'Ketena 03', 10088, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '8048cad9-41d0-4f3a-ac7c-dbde200ccdd3');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('2ac037a5-903e-47e4-992c-3000f88f0110', 10092, 'AA_AK_01', 'Ketena 04', 10088, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '1c9ea83a-ddeb-4c87-b217-3c3fbb586d0b');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('e43b7b2a-cbfb-463b-b6e6-3267d853e6dc', 10093, 'AA_AK_01', 'Ketena 05', 10088, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '9312d914-64e1-4acd-9a1c-8be7738785d8');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('10d6f0ab-cc48-4eb6-9209-cd240a184f0e', 10094, 'AA_AK_02', 'Woreda 2', 10087, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '76900106-6ed0-46cb-8fc1-4954c8dec0a2');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('4435e4f5-b9df-4bfd-ad04-8be9159234e6', 10095, 'AA_AK_02', 'Ketena 01', 10094, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '445f7a58-4dc6-45f5-83e9-5b7f1367d018');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('bc319768-447b-4e5c-aea1-55d39cde9ada', 10096, 'AA_AK_02', 'Ketena 02', 10094, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '60e39eca-d780-47ae-adbc-f621caa7ec0e');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('65110876-085d-41ac-a189-42c0c583767f', 10097, 'AA_AK_02', 'Ketena 03', 10094, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '92add029-7b4a-4d15-bda7-06eee5ab4cf5');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('e9950cd1-b2cb-4cd1-abd1-30dc0c90641e', 10098, 'AA_AK_02', 'Ketena 04', 10094, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '57ee0711-36e4-4d76-a9dd-d28eeb3250af');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ce0ab554-a7f4-4a47-8184-ec81ca2e7c00', 10099, 'AA_AK_02', 'Ketena 05', 10094, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '662fa599-244b-47f1-a570-a9ad624dc82f');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('6c9b180a-71b3-406e-9c2c-e6a706f9a104', 10100, 'AA_AK_03', 'Woreda 3', 10087, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '8899b5ec-c06f-4812-8e39-117a941b514d');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('facbdc8d-1ae5-4a94-b7d8-a11045b56a4f', 10101, 'AA_AK_03', 'Ketena 01', 10100, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '466b875f-2875-47d9-a636-16c4ab81354d');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('2621c970-1876-458c-b0ec-2c063ddad2cf', 10102, 'AA_AK_03', 'Ketena 02', 10100, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'f9d434aa-0f9a-4093-854d-d097de0e1993');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('aa64273b-42a4-4a12-ab56-fd35105a01de', 10103, 'AA_AK_03', 'Ketena 03', 10100, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '08edd230-f85e-4aac-90d7-9aa1929f35f9');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('36b56984-371a-4c1f-8eb8-439ca7fd871c', 10104, 'AA_AK_03', 'Ketena 04', 10100, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '57d94768-e76b-40d4-9d77-b37d0f00ac87');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d723a7f4-7a74-40e0-945e-88de7e422568', 10105, 'AA_AK_03', 'Ketena 05', 10100, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'dbf67188-df6c-4246-8bd5-95ec05295307');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('0d0b7c6b-b343-478f-8aad-43ede102fda0', 10106, 'AA_AK_04', 'Woreda 4', 10087, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '888b327a-86cc-46a4-bd92-2319a259c0a7');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('1ff43eec-eb25-41d6-8674-6826c730a641', 10107, 'AA_AK_04', 'Ketena 01', 10106, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '74ce6324-4506-4714-ba37-ea9fb262b68f');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('886d3f3e-12eb-460b-abb9-4379879857fc', 10108, 'AA_AK_04', 'Ketena 02', 10106, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'cdeb9a3a-7249-4b09-8f35-331eaaf83566');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('e36522e7-0f2e-4e51-8214-991f5b9bf332', 10109, 'AA_AK_04', 'Ketena 03', 10106, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'b3b29cfb-387e-4c80-ba9d-91827b54d044');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('4662ae75-f393-4624-98df-63efdaddc507', 10110, 'AA_AK_04', 'Ketena 04', 10106, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '3c97d323-ae00-4cd8-a82c-cee5a53f1827');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('fc8346a4-838a-491d-bc6b-3b8ec20e07c2', 10111, 'AA_AK_04', 'Ketena 05', 10106, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '4749ccba-471f-4e02-909c-981d54fd13b4');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('57acd171-15ff-4524-9382-1656f8ae805b', 10112, 'AA_AK_05', 'Woreda 5', 10087, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '57a4d6ed-c136-4cf0-bccb-342c3dcc98e9');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('684715f3-febd-4b53-ba48-8073b17e98fb', 10113, 'AA_AK_05', 'Ketena 01', 10112, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '16c49038-502b-4d95-8613-e8e97359e776');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('e5445c3f-f0eb-4f97-8acc-ef850f70f246', 10114, 'AA_AK_05', 'Ketena 02', 10112, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'f7bae140-a868-4629-ae75-204ed3db9f73');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('39e5bee1-08a3-4f89-8a1d-a0b17f0ca03a', 10115, 'AA_AK_05', 'Ketena 03', 10112, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '99e068fc-89db-458f-b0f5-a604ad7b1206');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('8d65efb1-b4a8-4523-82a8-7fe17bb3f666', 10116, 'AA_AK_05', 'Ketena 04', 10112, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '370b51b3-fbe2-4f2f-95b3-cce8f709cbe6');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('44b90aec-71d5-4ff4-be44-ff447b504c14', 10117, 'AA_AK_05', 'Ketena 05', 10112, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '7c6ced6e-567f-4c7c-9137-e99ec9b0b64f');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('23a402f4-2672-4bd0-a4d3-b58d671f12c6', 10118, 'AA_AK_06', 'Woreda 6', 10087, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '5291404e-a634-41a1-9ec9-e3ad79f123f2');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('72c68160-a8b4-4110-97d1-90f4ba3348af', 10119, 'AA_AK_06', 'Ketena 01', 10118, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'f2e361d4-9d93-4c55-895e-9a69d2fc6eef');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('727b82de-0787-4289-a296-8c504eb8abe8', 10120, 'AA_AK_06', 'Ketena 02', 10118, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '8822080a-25b8-4116-94a2-ddaf071c7af9');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('55a53410-f656-418f-ab5f-29bde4e7ee0d', 10121, 'AA_AK_06', 'Ketena 03', 10118, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '6e662f84-f8ca-40d5-b3a2-a539a88d5b59');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d9fe9ea8-5883-41c9-9189-f6feefa19672', 10122, 'AA_AK_06', 'Ketena 04', 10118, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '4ccaed55-b5bd-4114-a8f1-424f16a6e181');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('c631fe3f-4540-44fb-b0fe-5b7ef622f3d2', 10123, 'AA_AK_06', 'Ketena 05', 10118, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'd5fec203-1ef4-4042-bb34-fac0bb7d8e0f');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('f840cec5-aa8d-42ce-9155-653ee96afe4b', 10124, 'AA_AK_07', 'Woreda 7', 10087, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '984bcac5-1dce-4c0f-a418-886b5246541b');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('e12a5178-e1b4-4819-aa7d-e899c5b44003', 10125, 'AA_AK_07', 'Ketena 01', 10124, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '92e48bab-3364-4ce8-9ef8-c1895678f455');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('1d7435f9-d206-4714-a9df-d4285c6e3d71', 10126, 'AA_AK_07', 'Ketena 02', 10124, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'a31b1c6d-f7f8-4f4d-8c15-3d498584c659');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('5c0d27a4-4941-4390-9c3a-51bf4ca0a7c4', 10127, 'AA_AK_07', 'Ketena 03', 10124, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '97f99bdf-5e30-497b-9cf8-d92eb43e4f36');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('77ec7ece-a47b-4edb-9046-f7311efcc243', 10128, 'AA_AK_07', 'Ketena 04', 10124, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'ef2a7658-a885-437f-b9d9-ebb263e69bb1');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('a271e4eb-0105-49e3-8bb8-64d131f0baf6', 10129, 'AA_AK_07', 'Ketena 05', 10124, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '415643d7-f47c-4784-b277-0af3b888e5e2');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('761fed21-7f95-420b-b3eb-cabe0a5fd545', 10130, 'AA_AK_08', 'Woreda 8', 10087, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '78ef3271-b52c-45e4-aa6a-7e715f126f3e');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('2511e19a-6e77-416c-b9b3-d07c3ff92c6a', 10131, 'AA_AK_08', 'Ketena 01', 10130, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '43c41591-c679-4af3-8977-609049799652');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('e630652c-bda8-471b-9dcb-c7dbef3b9dc7', 10132, 'AA_AK_08', 'Ketena 02', 10130, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '1c1d234d-4c1f-46a2-bc98-24822c17be09');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('97879132-8c3b-4557-956a-b5f22c38f632', 10133, 'AA_AK_08', 'Ketena 03', 10130, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '6503f06f-eddf-451e-a61e-564be8a2cad9');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('6dccd2bb-e2d0-4f89-9cc3-8f7ae6134b0f', 10134, 'AA_AK_08', 'Ketena 04', 10130, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '3655b804-a91a-4b51-a09f-d1dfe19abe5a');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('aa029fc0-95d0-4701-bac2-2835b3b9ac68', 10135, 'AA_AK_08', 'Ketena 05', 10130, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'b5632f67-71ff-4946-b22c-77f100985842');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('c31c5a38-d482-4d59-b377-0c179bdbb5a6', 10136, 'AA_AK_09', 'Woreda 9', 10087, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '853ef815-5db8-4324-9935-e0fa4326e059');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('1fafbeaa-c4ae-43be-b86b-12776cda4ffa', 10137, 'AA_AK_09', 'Ketena 01', 10136, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '2f2ff4e4-9f4a-4712-a2c2-c12c0762ceab');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('1dbc84a1-b0f3-4c8a-b41b-cdd76a3405f2', 10138, 'AA_AK_09', 'Ketena 02', 10136, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '24e78403-8146-4ded-9a00-c0e6493a6ab7');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('626f8452-20ec-413a-85c4-bebba0ef9c7a', 10139, 'AA_AK_09', 'Ketena 03', 10136, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'bcd53db7-c338-4c18-8b99-fbab6d403b52');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('5955c0cd-b0b1-4dda-b73e-e431911e4f74', 10140, 'AA_AK_09', 'Ketena 04', 10136, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '48879af6-f20e-4a78-9140-18b67ec3ee64');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('829d6467-a922-44eb-b474-bc7cecc71bfb', 10141, 'AA_AK_09', 'Ketena 05', 10136, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'd3bfd504-3002-460b-b5c1-b73629a396a7');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('20ce6c4f-41e0-4031-af47-d5cf86406412', 10142, 'AA_AK_10', 'Woreda 10', 10087, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '2a568137-650e-4d5c-bdf7-10410b240783');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('eb77037b-eac6-46ff-b2ec-90ce6ee41812', 10143, 'AA_AK_10', 'Ketena 01', 10142, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'edefc8c3-4e08-4768-9834-53ce1267c32a');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d71e4029-ba59-49a8-880c-5c7ac9562b68', 10144, 'AA_AK_10', 'Ketena 02', 10142, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'bbbca44e-6467-48d5-a265-25ada87eb006');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d0361584-ff57-4da1-bfbc-c445ade38bf2', 10145, 'AA_AK_10', 'Ketena 03', 10142, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '65df462d-2da6-4ce1-bd27-75e088d8b587');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('e1d2ca4f-31ae-4e3c-810b-b052c5790187', 10146, 'AA_AK_10', 'Ketena 04', 10142, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '46c209f3-5c1c-4c5b-b8e1-2ab3025dd24f');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('80732f16-d01e-491f-8d7c-4186a6a269bc', 10147, 'AA_AK_10', 'Ketena 05', 10142, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '5b3a68df-f70c-4ac2-92dd-3eeb6a0d7497');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('568e684e-f140-4195-9eaf-77f02527742c', 10148, 'AA_AK_11', 'Woreda 11', 10087, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '50c77317-68ac-4c81-be36-8f3718a3af4e');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('10b455a1-7f62-4d79-8b9d-9e4b00be46d2', 10149, 'AA_AK_11', 'Ketena 01', 10148, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '6e01adc4-6682-48b4-980c-14833b73bd0b');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('6e2bcc7d-c8e2-4e78-a3fe-ecb3cc5acf8b', 10150, 'AA_AK_11', 'Ketena 02', 10148, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '6d0af837-367b-4c71-9e98-ea3c83f953d7');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('108a8a8c-af48-40a9-837b-1a9b8a2b409a', 10151, 'AA_AK_11', 'Ketena 03', 10148, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'a86583b4-47b5-4fa6-905f-516eaf44318e');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('c14eadb1-7351-4dc4-ad8d-af282d298e26', 10152, 'AA_AK_11', 'Ketena 04', 10148, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '51c16617-fb3d-4287-acb5-a7d33dc2a67b');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('e2d2defd-d3f5-49e4-a39a-c9aafe4c3df8', 10153, 'AA_AK_11', 'Ketena 05', 10148, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '44a920a7-85dd-40f7-9f88-35136f507470');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('4eaa3e0b-457a-4674-b16a-0a661b5ba931', 10154, 'AA_AK_12', 'Woreda 12', 10087, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '669f8018-492f-4c34-b011-07de37ee520c');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('2a610266-02c3-48d1-a3e6-41511624d51b', 10155, 'AA_AK_12', 'Ketena 01', 10154, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '179317c0-b5ad-4ef3-895e-d717d3cf9199');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d77b7039-2587-4bd0-adba-3c0031f7b45a', 10156, 'AA_AK_12', 'Ketena 02', 10154, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '4a3743be-ab20-42ac-88b7-282e6c848d6c');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('4bdb1983-5c6b-4c38-b152-31e790c31e61', 10157, 'AA_AK_12', 'Ketena 03', 10154, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '4a8f789c-033e-4814-bdb6-0155a8032e53');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('1b7f496f-76a8-4960-bf4c-2f7f8ab0d639', 10158, 'AA_AK_12', 'Ketena 04', 10154, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '6dfa8d34-359e-46f1-a1ad-bafa3e60cad8');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('83c6cf0a-db90-4bd4-9e63-ef7692406995', 10159, 'AA_AK_12', 'Ketena 05', 10154, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'f914af9c-c856-4ffa-832d-9309c5015df9');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('1ffbbfc5-e87c-4b98-8dfb-17d97ced8f15', 10160, 'AA_AK_13', 'Woreda 13', 10087, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '6be73cc2-8891-47c1-9dc5-1d254b5bd989');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('2c6f4b0b-3a70-4835-97b5-1a41c0850428', 10161, 'AA_AK_13', 'Ketena 01', 10160, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'dbfa85d3-6328-439d-91e6-26cb712a5e0a');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('f8197d5f-6f5a-40b8-a0b8-660716f61f02', 10162, 'AA_AK_13', 'Ketena 02', 10160, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '8eb2e350-37da-469d-b020-0d26c7c15363');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('37e78e0b-0d4a-408f-9ec9-87d611be8b7d', 10163, 'AA_AK_13', 'Ketena 03', 10160, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '5821506e-67d0-437e-aeb0-09e88a54bf64');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('f9cf3693-fe52-43f5-af4e-297c0a4c55cc', 10164, 'AA_AK_13', 'Ketena 04', 10160, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'db8c147c-e7f1-4f1d-91f3-7ffb4b761fa4');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('5068bf04-21b6-488b-a966-df2746fa95f7', 10165, 'AA_AK_13', 'Ketena 05', 10160, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '2b628257-33ee-4ac9-b717-5ec7c9ef0b8f');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('40ba6240-ad28-45d3-acc0-027ed74aaef5', 10166, 'AA_A', 'Arada', 10001, 
 'S', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'cfe2a3e2-1f5c-4d9b-8c34-483a8410658f');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('6d472b73-8201-46f9-a4be-897290b46741', 10167, 'AA_A_01', 'Woreda 1', 10166, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '9a2dc3a8-8010-4940-bcc0-e3e1a091094a');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('fe0dbf0b-ac4e-402f-9129-32a2fde41f00', 10168, 'AA_A_01_', 'Ketena 01', 10167, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '79ec5b3d-fcc6-40a6-b3cb-c15a3b2082b3');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('95e5249f-1944-48ad-b86f-4152b8b853e0', 10169, 'AA_A_01_', 'Ketena 02', 10167, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '4fc4f8e4-1efc-45b0-80a1-57ed4b545a0d');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('61b4b9a2-d272-42b7-8225-0a3e190d0710', 10170, 'AA_A_01_', 'Ketena 03', 10167, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '49594a48-4572-4816-8a24-5a42bf5af96e');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ca9921ba-67ab-4485-b82d-1aae9966a880', 10171, 'AA_A_01_', 'Ketena 04', 10167, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '584c014c-be9e-41d4-879a-32541bfc16cc');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('443b18b7-f307-4392-a6f0-e09c37d62ea4', 10172, 'AA_A_01_', 'Ketena 05', 10167, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '4a181716-f41b-4ad0-abd1-ae2edc221193');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('14064d12-0e8c-4b81-87ac-ef2dff9a707d', 10173, 'AA_A_02', 'Woreda 2', 10166, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'a8bf5045-1a1a-4ddc-8b61-3a939f4f2efc');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('9c9360d9-d0e9-415e-9e8c-00113282da98', 10174, 'AA_A_02_', 'Ketena 01', 10173, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'a292636d-87ab-43fe-a5c3-f2a2cfe88db3');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d2422424-124f-491a-8712-3cc0e889b3ef', 10175, 'AA_A_02_', 'Ketena 02', 10173, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '4313fb45-058d-4ab4-81d9-a923a1367ab8');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('37b9635b-ec0a-42ec-9371-5cc969a92540', 10176, 'AA_A_02_', 'Ketena 03', 10173, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '66f17001-4d18-4bb5-8f31-f255ced5de74');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('97897a66-ce8c-4de8-9c2a-47652dcdad2c', 10177, 'AA_A_02_', 'Ketena 04', 10173, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '9c410bfb-38f1-4846-be06-1cd1bad2fe1e');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('8655daea-e05f-4e19-a8b7-0353249bf6b2', 10178, 'AA_A_02_', 'Ketena 05', 10173, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '2924f630-ce82-47e3-b0e0-7f70a1bfba03');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('f7568a82-2a76-45bb-b12c-c03b5eef2a58', 10179, 'AA_A_03', 'Woreda 3', 10166, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '699f0063-f45f-4aca-902d-67e503b4e386');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('48ecdcbd-e0f3-489a-a7f8-6e1821c0c430', 10180, 'AA_A_03_', 'Ketena 01', 10179, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'b8913a50-d3fc-4c65-a87a-4d969d16acf5');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('b654f0b8-acfc-4ffe-9ec5-d8cab7e56edc', 10181, 'AA_A_03_', 'Ketena 02', 10179, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'fc33e392-331c-4c25-b3cb-f30cbe31c066');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('23ba4c44-1dc5-4e82-9b2d-e21e04c14264', 10182, 'AA_A_03_', 'Ketena 03', 10179, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '787870dd-0cca-4b4d-bd7d-111f13b2aad8');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('b4990ff6-cf30-4dc0-8c58-961e19a84305', 10183, 'AA_A_03_', 'Ketena 04', 10179, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '66f4fea5-cd8f-48a0-9504-963f8f90cf38');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('5be6ea7a-c77d-4bcd-984a-9a766967257d', 10184, 'AA_A_03_', 'Ketena 05', 10179, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '369bb113-9191-4b97-9310-36685ac183b5');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('47755d11-4eb1-46c4-be6b-1152b5c2f0b9', 10185, 'AA_A_04', 'Woreda 4', 10166, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '1a74697f-aad1-490b-8abe-256ade6f0c0b');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('486249da-025e-491a-b94e-ae4f2af90f79', 10186, 'AA_A_04_', 'Ketena 01', 10185, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '653e51a0-20dd-4231-8bc2-f3caf1eace75');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('047b9fc3-f19a-4c32-bbe7-cbf822708321', 10187, 'AA_A_04_', 'Ketena 02', 10185, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '72033ea2-43a1-4f8c-b4f5-c46c3ef51328');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('592fb765-2fad-4b1a-b2e9-4dbc33419fdb', 10188, 'AA_A_04_', 'Ketena 03', 10185, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'a07005f8-c0d9-49f9-a893-30fdc08b24c3');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('f77ff556-bfb6-46c3-b4f5-a2970c4375aa', 10189, 'AA_A_04_', 'Ketena 04', 10185, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '909285e5-bcd5-4464-b913-643fd23b1830');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ccc0afaf-1529-4880-b764-30f588efcaf0', 10190, 'AA_A_04_', 'Ketena 05', 10185, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '8010fada-448a-4170-a14a-450ff708fe06');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('c3c375fa-e8c3-4bf0-a721-8ed5fe5de8c2', 10191, 'AA_A_05', 'Woreda 5', 10166, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '975ca055-02a3-439a-b3aa-2b91ecf757af');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('086e4ac0-1e50-4600-a52f-faba5be7671f', 10192, 'AA_A_05_', 'Ketena 01', 10191, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'a00422ad-a767-498c-9521-c0a9adae53a2');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('99c386a6-d2e2-428d-97c1-05542c68cbfa', 10193, 'AA_A_05_', 'Ketena 02', 10191, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '5f440726-861b-4e39-8f55-404698f399b3');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('b0bc6471-bbec-45da-921c-86a1d6ecd450', 10194, 'AA_A_05_', 'Ketena 03', 10191, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '71e9fcb1-292c-441e-975c-dd9f7a4c2402');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('fb5a906d-96e3-409c-bdde-bd5ed526e361', 10195, 'AA_A_05_', 'Ketena 04', 10191, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'e23b3f0d-ef70-4a2e-9651-7753d804a67b');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('32993c18-3250-4480-aefb-a6a04a618c58', 10196, 'AA_A_05_', 'Ketena 05', 10191, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '155987d2-31a2-456a-bd4f-3c9276041297');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('7c401e72-3d3d-484c-8432-b4841a7e6a36', 10197, 'AA_A_06', 'Woreda 6', 10166, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '1dcab94e-0f6a-4e4b-8f73-6497bb61f5a7');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('9cf835d6-88ed-4890-84d0-c0ff7e3b7ee4', 10198, 'AA_A_06_', 'Ketena 01', 10197, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '0d5b2c49-a013-4847-ac46-e548138f801d');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('a7b4ead4-d52b-42ef-bd7e-e71638f7e158', 10199, 'AA_A_06_', 'Ketena 02', 10197, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'ea87b876-5982-4c0c-956d-9e5749b6af8c');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('fde5ebc4-99eb-4efa-83f6-7e9ee1884c13', 10200, 'AA_A_06_', 'Ketena 03', 10197, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '76037733-71c6-4deb-bf6c-c65725cd4398');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('9d625f99-7feb-41bc-a351-e1031458e4e8', 10201, 'AA_A_06_', 'Ketena 04', 10197, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '07bb292b-4579-4e63-8c19-5a21164c1132');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('fcf961fb-52a5-40ee-8e39-a2f395386351', 10202, 'AA_A_06_', 'Ketena 05', 10197, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '6172ac99-f371-466a-937c-03aaca0dfaf3');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d769af4d-1daf-4639-a1cf-36e7b41383bd', 10203, 'AA_A_07', 'Woreda 7', 10166, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '762ef959-e384-46a7-8c1c-b7e74b4bad47');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('79ee74d1-381a-4be5-8527-1f77d2ff4fe3', 10204, 'AA_A_07_', 'Ketena 01', 10203, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'ab243d16-6f65-4bc5-98c4-6d50499dcce1');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('3bfa0064-8692-43e8-84ab-3a30bae84c1c', 10205, 'AA_A_07_', 'Ketena 02', 10203, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'c4dd0e8f-bc50-42e1-a002-0c03bc1c62d6');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('5e776f6f-1aa0-48f4-8ad6-a96861fe8ba2', 10206, 'AA_A_07_', 'Ketena 03', 10203, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '14e13a50-b39e-4844-9ca0-d66c3cc0b83f');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('84f5b7d7-efe8-4793-8aa3-ea5a66b3e0ee', 10207, 'AA_A_07_', 'Ketena 04', 10203, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'f0f4eb55-1f9b-46bb-aa17-b211c456d29d');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('119b7264-f2a5-4029-a4d6-c61a4ccea733', 10208, 'AA_A_07_', 'Ketena 05', 10203, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '795be44b-128f-4dcf-97ab-97968c011a8d');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('7ab14781-45dc-4362-bffd-f0e158be7bfb', 10209, 'AA_A_08', 'Woreda 8', 10166, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '176e6344-fceb-4b5b-989e-e3a53d5725df');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('20f410cd-41d6-4dd2-b472-1d6076eab67d', 10210, 'AA_A_08_', 'Ketena 01', 10209, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '340a5850-431f-43e5-810c-a7732b4be840');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('b6beaefc-debf-4f35-a0d6-57aef9176497', 10211, 'AA_A_08_', 'Ketena 02', 10209, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '972ab05b-1545-4be2-a413-b7034ea5241c');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('2ce0cf4f-1a06-41f1-8ca5-df22e595122d', 10212, 'AA_A_08_', 'Ketena 03', 10209, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '0612a3cf-1788-4b78-af1e-61324dda7500');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('3db98adc-7617-4024-a9c0-497bf7ac1c34', 10213, 'AA_A_08_', 'Ketena 04', 10209, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'cd5e5cb7-c6d0-4766-9812-ccb56f7504cb');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ea7bcf4f-bdc9-4703-a061-3ddae94fddf7', 10214, 'AA_A_08_', 'Ketena 05', 10209, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'c05be883-8b32-4528-a4cc-ff425fc72397');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('7d717ac3-221e-422f-a441-d13e89326525', 10215, 'AA_A_09', 'Woreda 9', 10166, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '592d568a-ec3f-4be2-89c3-03d6242e3e40');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('f876c71d-83e6-467c-beb0-c21a2aa3aa21', 10216, 'AA_A_09_', 'Ketena 01', 10215, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'bdbab3fc-01f5-4cac-b13a-cb759fdb3485');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('79c2b89a-f0ac-4f66-b071-00d68697fbc5', 10217, 'AA_A_09_', 'Ketena 02', 10215, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '6e3dcf1b-f135-4b93-a95c-fb412bf0dc9d');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ce55fce5-685b-4583-8f64-9de4cbe038ab', 10218, 'AA_A_09_', 'Ketena 03', 10215, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'd86f57a9-c264-4532-8872-1ca988a7e5c9');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('1bb91a43-6730-4972-a664-98999a5f7f3f', 10219, 'AA_A_09_', 'Ketena 04', 10215, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'c73cdbe8-6873-467c-a3ca-d62ef2d34aac');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('3510bd5b-9e92-45f7-8790-4a2adf3b5670', 10220, 'AA_A_09_', 'Ketena 05', 10215, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'b5d44171-8b76-4da5-bca2-88bdf071a8e9');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('82ce0d62-ceb4-443f-aa6b-42025ef7f785', 10221, 'AA_A_10', 'Woreda 10', 10166, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '7ea50eca-bacd-4751-be7e-b781ab3b5e62');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('c8ce2341-9c6f-46b7-a4ce-ab2ee2cec612', 10222, 'AA_A_10_', 'Ketena 01', 10221, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'e8823c28-402d-40ae-a8be-47f5a9225b11');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('060d9b84-e6d4-4be7-87ba-0f1050ffa330', 10223, 'AA_A_10_', 'Ketena 02', 10221, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '43723846-d47b-46ba-bcf9-977bcccef266');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('cac44c93-0a92-4230-9273-ffbbce3da3ea', 10224, 'AA_A_10_', 'Ketena 03', 10221, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'e6c03d58-a7fc-43b5-8bda-757a3066c0f3');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('338b259e-1ee5-417c-9346-64d69784a713', 10225, 'AA_A_10_', 'Ketena 04', 10221, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '1a7f3411-ac66-4749-8007-f7f765e18c63');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('72e629d4-aab4-432a-b382-aba6b9d32e40', 10226, 'AA_A_10_', 'Ketena 05', 10221, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '5484156a-95d8-4cf6-a9b8-9e81658073c9');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('8351b125-5296-47bf-a11a-42fe71667510', 10227, 'AA_B', 'Bole', 10001, 
 'S', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'b2bd7a2c-c232-41e2-a08e-803f7dfacd8d');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('fe4e8bc1-e993-4fcb-afe9-4b3726c842b6', 10228, 'AA_B_01', 'Woreda 1', 10227, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '07805292-7482-44bb-87dd-dd40ce6ae78a');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('5b64f18f-32d3-4388-9068-3adc301f942d', 10229, 'AA_B_01_', 'Ketena 01', 10228, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'cac790cf-7519-40c3-9e5f-a5647d6f17a1');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('c965f26b-dc01-4475-a7b9-0c127247a0cc', 10230, 'AA_B_01_', 'Ketena 02', 10228, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '23af1cc4-ce24-4878-a124-d264a6d165c7');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('268d9be3-480c-4024-965f-04a3c282a5a3', 10231, 'AA_B_01_', 'Ketena 03', 10228, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '585ff9ee-39e8-4a26-b54e-6e4f412f32cf');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('6bca2884-ab1e-4190-940b-49addfc9c399', 10232, 'AA_B_01_', 'Ketena 04', 10228, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '3583a8e5-f1e6-4d83-a70f-8138e22e88a6');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('1070789f-1432-4dd9-ba02-7455f8042a00', 10233, 'AA_B_01_', 'Ketena 05', 10228, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'dcfe8a14-5db2-4f2e-b36f-583c215ba28c');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d918088d-29c6-4aaa-8d57-e7798d1704ad', 10234, 'AA_B_02', 'Woreda 2', 10227, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '954a175e-5538-4273-b86e-08ab3115be6e');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('2ad01a77-dd1a-4cb2-998b-bace743a13b2', 10235, 'AA_B_02_', 'Ketena 01', 10234, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'c01d8ca9-1e4b-4e21-af93-b708df9c430e');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d2270072-ec6e-4f26-b514-411800abdc87', 10236, 'AA_B_02_', 'Ketena 02', 10234, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'a4357d41-9064-44a4-86cc-c9b2a680adea');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('21bdd6b7-243d-4bae-86ac-90a52ca3d32b', 10237, 'AA_B_02_', 'Ketena 03', 10234, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'c216e717-c07d-4d8b-84d3-6c80b84ff609');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d5f8fed4-10b2-4abe-a812-9572c483c932', 10238, 'AA_B_02_', 'Ketena 04', 10234, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '1ac10289-ce50-46cf-808c-352ebd9f47d4');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('a32daa22-d042-44ac-8fc1-e069320a8de7', 10239, 'AA_B_02_', 'Ketena 05', 10234, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '353a7bd5-48fb-46d3-a853-1b8e22f5d29a');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('c114ef8e-b08d-4e72-ab7e-e45a9f01e531', 10240, 'AA_B_03', 'Woreda 3', 10227, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '0e5cb7b7-b521-4830-824c-19ceab961b4b');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('1e92e5a9-93f5-4f28-8b78-719877d7c569', 10241, 'AA_B_03_', 'Ketena 01', 10240, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '3b7fecfd-23a8-496e-b812-2c39019c898e');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('a59ec644-4ba4-45b7-81c8-bb6965ba83c3', 10242, 'AA_B_03_', 'Ketena 02', 10240, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'f0612e6b-df55-412c-8b84-661ff279099d');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('dfb8135b-9c1e-4621-a9db-de8c0039633c', 10243, 'AA_B_03_', 'Ketena 03', 10240, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '3f1df083-fadb-4461-867a-3bdcd3ea362f');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('6110cd1b-bc34-4924-aa1d-00188816fe56', 10244, 'AA_B_03_', 'Ketena 04', 10240, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'f606ad08-7bb9-4595-a845-497c9e025c85');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('05015ebe-ebac-4dd2-94cd-b1e510f4feed', 10245, 'AA_B_03_', 'Ketena 05', 10240, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '799a3180-7827-4485-a67f-7c3bb9322339');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('e50e3915-60bd-47eb-94c2-f3440d2d522e', 10246, 'AA_B_04', 'Woreda 4', 10227, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '75fc6133-6628-4440-bfc5-fe46c735c3f8');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('be48dea1-ba87-4063-b233-eca1533198af', 10247, 'AA_B_04_', 'Ketena 01', 10246, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '3ffdd748-58ac-428c-a60d-145234c8bfbd');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('b1b7b1e0-4beb-4d42-b366-291037584f29', 10248, 'AA_B_04_', 'Ketena 02', 10246, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '8e2b5119-3e02-4895-8a47-ec473cdc677e');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('8d3d5d28-54d2-4200-bbb2-5b253bc074f9', 10249, 'AA_B_04_', 'Ketena 03', 10246, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'eade16a9-37e7-45fb-92d4-e3b3a1166b56');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('74ca264a-77e3-4e06-b2ed-114b62eef7e9', 10250, 'AA_B_04_', 'Ketena 04', 10246, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'bc5df424-8450-47c1-87c9-f8f5ac6694b8');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ade0bf84-8cf3-4b0f-87b8-14c3d99bd3c6', 10251, 'AA_B_04_', 'Ketena 05', 10246, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'ddb1f21d-d689-418d-ba49-f0646dee87fc');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('b6f1dffa-8b78-44ec-aa82-71a7ad3bc5ef', 10252, 'AA_B_05', 'Woreda 5', 10227, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '06461954-8ac4-49ce-ae93-17b0a8e44159');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('fd8855ef-dbc4-4bde-ad02-185cd4d48418', 10253, 'AA_B_05_', 'Ketena 01', 10252, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '06962b8f-2dc4-4ff3-8b40-0b1740a937c2');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('a9db1cf3-0f97-4da0-b9f6-cf39e8f3ba58', 10254, 'AA_B_05_', 'Ketena 02', 10252, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '6ade7692-bc14-4319-b020-a5537cd8db38');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('5293f7da-db73-4228-a29b-bfe486782c35', 10255, 'AA_B_05_', 'Ketena 03', 10252, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '412562b4-7c0d-4823-8a36-8bd969df7598');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('9487f4b9-6973-430d-bd99-55826b9ee0cc', 10256, 'AA_B_05_', 'Ketena 04', 10252, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '26c8a78a-b9a8-4f36-84d7-a70172a263f6');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('f2a6debf-84e5-42a8-92a1-eb6d6d2da0b6', 10257, 'AA_B_05_', 'Ketena 05', 10252, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '98b3649e-3b79-4590-97cd-09910dcd1e77');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('67ed2e58-4bb0-433c-b13d-d84fd5ae93c3', 10258, 'AA_B_06', 'Woreda 6', 10227, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '0dd66652-a353-45a7-a6b4-0eed1bb18c63');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('e21f4564-dd45-4d55-8141-adf669019cea', 10259, 'AA_B_06_', 'Ketena 01', 10258, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'a0ddcae2-cf86-4f63-bfd4-4564d3111bd8');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('9892ce72-930c-4460-9092-079439b3b53a', 10260, 'AA_B_06_', 'Ketena 02', 10258, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '39775156-d50c-47dd-965a-aaadf1ed9c7a');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d9d81a53-6599-4468-8a74-77c9bff4381a', 10261, 'AA_B_06_', 'Ketena 03', 10258, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'e8c70cab-9594-4bd5-bb2e-83bdc466b5b9');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('0432302e-7c52-4a4a-b07e-0d303eff6555', 10262, 'AA_B_06_', 'Ketena 04', 10258, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '88422d4d-468b-4ea5-b226-7c1ef9438ae0');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('caebea4a-899f-491e-9345-17d9b2aad972', 10263, 'AA_B_06_', 'Ketena 05', 10258, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '7052a895-0c5b-46a8-8d31-e5c53921b157');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('752ce3fc-c912-43f7-adaa-7b5302687e8c', 10264, 'AA_B_07', 'Woreda 7', 10227, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '5e079fe2-4736-41b7-9918-e29b44ee53a9');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('a37ef803-c899-468b-983a-5095948ab17e', 10265, 'AA_B_07_', 'Ketena 01', 10264, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'f80e0fe6-5e74-431a-aa3f-a774d1f0134b');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('cc1b220f-5624-4d45-b35d-cedef9e1ecf7', 10266, 'AA_B_07_', 'Ketena 02', 10264, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'bcd9885e-6896-4db6-bc20-d751ca49a330');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('40e82b76-c633-44c6-bc06-78df30298bfa', 10267, 'AA_B_07_', 'Ketena 03', 10264, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '63a8819b-a5d3-4402-acfb-7ef0dc53c2af');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('20795bbb-15ee-44e1-9846-4a37052ffc92', 10268, 'AA_B_07_', 'Ketena 04', 10264, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '80d5bec6-f09c-40aa-83a4-8c12581a94ae');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('a31d4368-d3ac-487d-b326-d2041e3d572b', 10269, 'AA_B_07_', 'Ketena 05', 10264, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '98879889-ebe4-4d8e-8daa-40f16aac6b26');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('6406c2b5-3534-48af-99a4-a432da0c838f', 10270, 'AA_B_08', 'Woreda 8', 10227, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '55ff0d51-a9eb-4a0f-935a-b9dca0f8ad2f');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('0d41a670-7db0-49a3-822f-aaa1edda560e', 10271, 'AA_B_08_', 'Ketena 01', 10270, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '97f03961-2670-43a9-9829-d21f75de5ec1');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('16543117-6b48-490a-ad23-232812a0dae7', 10272, 'AA_B_08_', 'Ketena 02', 10270, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '0d25a57d-d1cf-4a57-97fe-3ce928b90590');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('da7c22dc-4fc8-49bd-b8cf-b4eb39aaac0e', 10273, 'AA_B_08_', 'Ketena 03', 10270, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '5e94ed0c-c81a-47ee-9b83-6bf663377372');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ef24b99b-70d9-4086-a35e-0f7a2d933981', 10274, 'AA_B_08_', 'Ketena 04', 10270, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '1cb4d686-7895-4dc0-8601-f1453de66fcb');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('7fb62c44-bb45-4b48-a3e1-448725836766', 10275, 'AA_B_08_', 'Ketena 05', 10270, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '04e8c36f-cec8-4d80-b5b1-d1978c5f5365');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('56ebe694-9b11-493c-b82e-4a1e45932034', 10276, 'AA_B_09', 'Woreda 9', 10227, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '6aced5de-a76e-4350-94aa-8791bd2d51bc');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('af96ef5c-26ee-4f93-93e2-a42fecf0e1f8', 10277, 'AA_B_09_', 'Ketena 01', 10276, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '3d253d99-e465-46f3-bdce-e3d500fd487f');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('6af987d3-3100-4530-bdef-8e7d3e5e9a8d', 10278, 'AA_B_09_', 'Ketena 02', 10276, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '28a2faec-388d-490e-8b4e-dd76b586c624');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('807a78a1-89b2-4011-ba75-c8aae72ce017', 10279, 'AA_B_09_', 'Ketena 03', 10276, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '3ebca514-f220-449e-a26f-6920577d133e');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('2cd33a53-6b25-46de-89c7-710ba06c77d5', 10280, 'AA_B_09_', 'Ketena 04', 10276, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '38ae92cd-e09f-4079-b147-e8a0443e5fa3');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('8edac5c5-d606-4821-8e8c-d6c35cabba5a', 10281, 'AA_B_09_', 'Ketena 05', 10276, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '042e4e7f-6f70-4f78-9235-cc5a3dbe5f10');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d9b549d3-7a7c-4ab6-9249-0cbf5ae66737', 10282, 'AA_B_10', 'Woreda 10', 10227, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '231b6e93-dbde-459b-a8f3-412eaeb1680f');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('289dc274-078b-4e99-beeb-096af4d9fb3d', 10283, 'AA_B_10_', 'Ketena 01', 10282, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '7b48f290-0fd6-46e2-a665-398f19891911');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('281f699c-8fb7-4d97-b9da-8e20fa14d461', 10284, 'AA_B_10_', 'Ketena 02', 10282, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '00235a76-678d-48eb-ad01-7a3b8de6cfb5');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('2948bac5-2b06-44c0-a7e5-b38903d17f29', 10285, 'AA_B_10_', 'Ketena 03', 10282, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'd992666c-f707-4c2b-8a2d-8939f90ba425');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('b42b5835-a42c-47fa-8705-8384d2c0a9ff', 10286, 'AA_B_10_', 'Ketena 04', 10282, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '9ed35a5f-9159-46b5-bee6-a2538f5478e1');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('f85ed760-f85e-4c41-aed9-a7b89359aa52', 10287, 'AA_B_10_', 'Ketena 05', 10282, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'a723045f-b67e-4633-b2b9-8ea8d4888e0d');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('beadb2c9-3286-4277-a46b-0c0da3a30092', 10288, 'AA_B_11', 'Woreda 11', 10227, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '193a3a2f-d5c0-44be-8c9a-bd88b351fd5c');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('c2b743cd-e7aa-4dd5-8f5f-363dac904db5', 10289, 'AA_B_11_', 'Ketena 01', 10288, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '40339dd7-acfa-4108-bc62-eb3ec90d1859');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('c1a4a0ef-f938-4529-a405-01041d684b2a', 10290, 'AA_B_11_', 'Ketena 02', 10288, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '73ab88b9-6cfe-4adb-a30c-543e785f1362');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d1039f73-8813-4da3-9182-5516c1369cd8', 10291, 'AA_B_11_', 'Ketena 03', 10288, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '29a493b5-2c75-4972-b0e3-7073ff51a1e0');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('b7801168-0844-4738-8a98-c2e5d1f08874', 10292, 'AA_B_11_', 'Ketena 04', 10288, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '0808c4e8-07d3-4872-be29-9c9c5a8f78b4');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('00c2ed72-8187-4671-8fad-2df4ff2257a5', 10293, 'AA_B_11_', 'Ketena 05', 10288, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'cf25d138-1c52-4a9d-b816-ca7be64c28a5');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('fd28978c-8375-4b37-90bb-a22b17fe428d', 10294, 'AA_B_12', 'Woreda 12', 10227, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '7241c53a-39a5-4f8d-a36c-6ffe7d31b34d');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('164efa09-d526-4e4c-82a3-b6dd388c30d6', 10295, 'AA_B_12_', 'Ketena 01', 10294, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'a0b312d0-bce2-4566-928c-db8a7a327f35');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('dd998a70-c209-4e4d-8d34-df02cefe56d9', 10296, 'AA_B_12_', 'Ketena 02', 10294, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'c6c5daa0-62e3-40c3-ae61-3c6123571bee');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('da6571b1-1585-4830-9285-2b27af8075b8', 10297, 'AA_B_12_', 'Ketena 03', 10294, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '40ed3082-b0b3-4eae-bfee-37b903e4b3b9');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('bea31c32-6c75-4094-8141-dded81713d60', 10298, 'AA_B_12_', 'Ketena 04', 10294, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'e2f47176-91bf-4edb-b11f-5ef0be27b4f5');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('b81b071b-95d5-4277-b83d-7e3cd3e836eb', 10299, 'AA_B_12_', 'Ketena 05', 10294, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '785f0bc2-831e-4a73-a11d-f3a0218ce7ac');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('66ea5026-a1e1-41d7-9521-677272b904dc', 10300, 'AA_B_13', 'Woreda 13', 10227, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '28a9b669-dc11-44bd-a3e6-0f7a6c49af73');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('8512956f-fd2d-4620-82fc-2a6b5e76cbfa', 10301, 'AA_B_13_', 'Ketena 01', 10300, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '326f6820-45fd-4daa-b33f-b7ba86737f82');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('beaf6732-94b0-45cf-a5b5-929e3fee5b0d', 10302, 'AA_B_13_', 'Ketena 02', 10300, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '75b7211e-4589-4b39-81be-2c1a4a647309');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d6344e8a-ec79-41f6-8337-7940d7f02d92', 10303, 'AA_B_13_', 'Ketena 03', 10300, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '8971fea2-ac3d-4488-acdd-d1bf3b452c9b');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('6757177b-1dbe-420d-82eb-3467285dbe5c', 10304, 'AA_B_13_', 'Ketena 04', 10300, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '55d590d0-60f3-4e77-880a-3d43ad712797');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('2d1678ba-b037-45a1-9e97-4bedacd8b540', 10305, 'AA_B_13_', 'Ketena 05', 10300, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '0842302f-31b9-44dc-b4c7-cc28aaea3748');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d9b756bc-7353-45cf-a52f-67dee9671a82', 10306, 'AA_B_14', 'Woreda 14', 10227, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'd0d41e03-3a21-4a20-a943-55daa4e52112');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('9dbc724e-226a-4cf1-85df-f6f828c94c2f', 10307, 'AA_B_14_', 'Ketena 01', 10306, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '00a04446-3e37-4c49-927a-44953b2e9a1c');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ab55e84c-1021-44c1-a9f1-138489be2a11', 10308, 'AA_B_14_', 'Ketena 02', 10306, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '0907b021-ea98-4ef4-9693-07bf6b5ddddc');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('0e171c66-71f0-4d95-911c-1f07a21b08a4', 10309, 'AA_B_14_', 'Ketena 03', 10306, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'e7aeee61-5891-4dc8-83b6-bcbb6038374f');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('6c3eb3e3-2dab-400f-9a23-0184f5a31173', 10310, 'AA_B_14_', 'Ketena 04', 10306, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'cdc89e1b-2f79-42ef-9963-a54ce6ba8abb');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('afd26dc0-5e99-429f-b78f-ac351474291c', 10311, 'AA_B_14_', 'Ketena 05', 10306, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '268049ba-79ba-4d58-8e11-2e2117f6c87c');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('8fda13ac-22a0-4b36-b782-e26bf7feca80', 10312, 'AA_G', 'Gulele', 10001, 
 'S', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '1e0b081f-6dcd-4f38-b965-46d817ff35b9');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('24d2431e-3395-4bbb-af14-f1d48e52d322', 10313, 'AA_G_01', 'Woreda 1', 10312, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '20f172cb-9679-4fb6-b49d-c8f9118e832b');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('daefef04-877a-472f-9ce0-a714c064ce06', 10314, 'AA_G_01_', 'Ketena 01', 10313, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'fe5d8644-cb33-4821-bb1d-3b9a02b23d0d');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('6a1b88c7-88d6-4f83-9c6b-e9b4564ce4eb', 10315, 'AA_G_01_', 'Ketena 02', 10313, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '65b35edc-e151-4a03-b532-4cf00ef830d3');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('22be46f2-fcce-498c-a0c6-f0db7cc8e5ad', 10316, 'AA_G_01_', 'Ketena 03', 10313, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '12dfcbba-6d20-41b1-ae01-89089208ca57');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('311d7f62-4234-46a6-82bf-e4d84f7b0b68', 10317, 'AA_G_01_', 'Ketena 04', 10313, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '12d79dc1-e60c-4b4b-93c3-a24a7bb676c4');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('c98bd0de-57d9-4955-9d34-2ef4c0c8c94e', 10318, 'AA_G_01_', 'Ketena 05', 10313, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'fef0e987-b3ca-4be8-ab9d-50837c6314de');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('68e87bc3-9170-4dbc-8c87-4e50b5c1206f', 10319, 'AA_G_02', 'Woreda 2', 10312, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '5d035525-9087-4bea-9366-911c72a1df07');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('775166ce-63d5-452d-a572-d2c6c91d1f3c', 10320, 'AA_G_02_', 'Ketena 01', 10319, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '74dc3068-b4ab-4e7e-bbdd-279a37810b6c');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('b8df2bd4-9fe1-4ed4-845f-d35a8bdfd1c6', 10321, 'AA_G_02_', 'Ketena 02', 10319, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '3e719616-40a3-4b9c-b2a6-287b321d02e0');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('16e640fe-9542-4929-90d0-e194978c22ab', 10322, 'AA_G_02_', 'Ketena 03', 10319, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '87eeaafc-78e5-4cc2-bfa9-52fc9a918830');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('3eae2f82-4326-4b2a-8223-c1c8b2b847a1', 10323, 'AA_G_02_', 'Ketena 04', 10319, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '17c86ea3-58c7-4881-a6ab-142b600b4029');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('b7fb2845-580b-4a3d-818f-828d8307d004', 10324, 'AA_G_02_', 'Ketena 05', 10319, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '74738cf6-b679-45f5-9851-21f33dfbc04a');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('300af9df-f3e4-429b-8d6a-73528f252818', 10325, 'AA_G_03', 'Woreda 3', 10312, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '62d8930f-7cfc-489f-8b76-eed4a3af1cc5');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('a814e3dd-c2d5-404c-88d5-235e6c7b259a', 10326, 'AA_G_03_', 'Ketena 01', 10325, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'e8968346-6567-44d2-8958-5bb1a9d62abe');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d689d90e-fcd6-4484-a46b-92a7f73135b7', 10327, 'AA_G_03_', 'Ketena 02', 10325, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'b985d2b2-38cf-4a2a-a9b1-85cd783c6910');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('858f7c4f-0f2e-4c78-b0ef-37b9280af1aa', 10328, 'AA_G_03_', 'Ketena 03', 10325, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'a04b8daf-4e3f-48f9-81ee-c3d98f4af8b1');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('871b66b1-cb86-4b84-b899-c787b273beb2', 10329, 'AA_G_03_', 'Ketena 04', 10325, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'a633340d-7dfa-45ad-8ea5-698ff565649a');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('909033d4-2d34-43b7-bb3b-52efb38f8f7f', 10330, 'AA_G_03_', 'Ketena 05', 10325, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '3eae3e64-23cb-463e-beec-ba5f34fde5ec');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('79bf9664-ff98-4030-b1b8-8d727ae0098f', 10331, 'AA_G_04', 'Woreda 4', 10312, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '7a31ddaf-b0bf-410a-8f7a-718b684e31b9');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('64a554b2-bd6a-4aaf-816d-64bebff88f33', 10332, 'AA_G_04_', 'Ketena 01', 10331, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'b1e5628e-29c1-477b-ac2f-432311de85ac');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('1293f2e9-749f-4063-911f-1f5334f99d69', 10333, 'AA_G_04_', 'Ketena 02', 10331, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'f80c0484-57ec-4d59-a7f7-66cedf59e67a');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('fad2e130-4e50-4dba-ae84-3d4ecd1900d8', 10334, 'AA_G_04_', 'Ketena 03', 10331, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'a5ef72f6-e7cf-436a-9495-b5dfb8b6754f');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('04d79b84-b1ba-4e80-b5f9-c0498d781ebc', 10335, 'AA_G_04_', 'Ketena 04', 10331, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '063f41f6-2004-4657-bcc4-4173d13894e6');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('66ba2e43-64f9-4e67-90a5-f91add9c60fb', 10336, 'AA_G_04_', 'Ketena 05', 10331, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'e1f9ef71-5a6c-49c0-8bc4-99196b0a523f');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('c4afc229-6fc3-4068-a982-d3ef8551a9da', 10337, 'AA_G_05', 'Woreda 5', 10312, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '48bf9b21-d0d5-4636-a9dc-1be6003589ac');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('dc5018b8-6658-42d0-812f-9f65992767a9', 10338, 'AA_G_05_', 'Ketena 01', 10337, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '81242e21-f03d-44c4-ac5a-3833c64f802c');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('9e875abe-b6ff-48a3-b3b7-aff4c1f8484f', 10339, 'AA_G_05_', 'Ketena 02', 10337, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '6745356e-2b9d-4aa3-b202-a14c29c95c4a');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ef52af35-7f62-4b7f-9a74-658d0ba56784', 10340, 'AA_G_05_', 'Ketena 03', 10337, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '99f9e5a7-43dd-4c8d-84b5-988ced647226');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('a8520cce-19c3-4deb-bd3a-ca3ffa8271d5', 10341, 'AA_G_05_', 'Ketena 04', 10337, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '62371d1b-d42b-4096-bd68-cd6e15e23506');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('b816d30f-712b-4e6f-bcc1-3579e2a02e66', 10342, 'AA_G_05_', 'Ketena 05', 10337, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'f533e876-daa0-4f53-ad7b-33871a974d3d');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('de55d969-e012-4260-b6cb-1eea14b687be', 10343, 'AA_G_06', 'Woreda 6', 10312, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '24ba2ea4-5c53-43bf-ae4a-c7efc4d2355c');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ae2cae4d-d7da-46d0-80b5-6bf805885508', 10344, 'AA_G_06_', 'Ketena 01', 10343, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'd1e3902e-be48-49e7-a638-c23f07d2df7b');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('a399ee07-3cbd-436a-80b8-0463f48e3292', 10345, 'AA_G_06_', 'Ketena 02', 10343, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '57f1a45f-75fe-4c96-ba43-852982a05288');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('b6c93697-5033-4e46-9793-535a7c5d35fa', 10346, 'AA_G_06_', 'Ketena 03', 10343, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '467d6cc8-d0d0-4457-a6c4-fa57549e1a1a');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('13665fb3-6210-4069-8c62-26bff02b5f73', 10347, 'AA_G_06_', 'Ketena 04', 10343, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '46e811c2-2b6c-4779-b22f-a69c0e115c40');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('66d6ca8e-a21a-48ae-ad35-58dcfe024173', 10348, 'AA_G_06_', 'Ketena 05', 10343, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '5a71f830-c3b9-4ab3-9189-884870477cac');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('473d9004-588f-4b13-8402-6e1cb29892be', 10349, 'AA_G_07', 'Woreda 7', 10312, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'e0d74ff3-b5a5-4efc-a21e-aa1ee6b1681b');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('990e8c67-e238-49f3-8c51-bd9e76b20ad8', 10350, 'AA_G_07_', 'Ketena 01', 10349, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'ba9c6990-760e-4295-bfbf-adaed4e548d0');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('fb532f46-2760-4a63-9563-dd24399412c7', 10351, 'AA_G_07_', 'Ketena 02', 10349, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'd32e73d1-3210-4f62-9c9e-c34f6d688692');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d6f3118b-3385-4932-b4f0-215c0158001f', 10352, 'AA_G_07_', 'Ketena 03', 10349, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '9ed16ce9-8812-4a53-94b4-19136bdba8d8');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('9c6ce653-0a0c-4bd7-b123-563a825cfa13', 10353, 'AA_G_07_', 'Ketena 04', 10349, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '8912d2af-7f34-4a57-a150-04b73624d6ab');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('2f2fd1f7-d681-4ddf-a6b7-759fbd07ef92', 10354, 'AA_G_07_', 'Ketena 05', 10349, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'ef86f9bd-dfb9-4b46-9ede-e8dc4c41f162');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('4f601816-c756-4cf9-aab1-88c5a5f388fd', 10355, 'AA_G_08', 'Woreda 8', 10312, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '56043c28-295c-4dce-a3ab-6215b6cc3b73');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('4f64f2d0-e071-4b59-9aa7-e9ce9878a95d', 10356, 'AA_G_08_', 'Ketena 01', 10355, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'a5bf5a48-2642-4949-bb16-7681321d68e4');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('b690f810-6521-414a-b2ef-56d20d377d38', 10357, 'AA_G_08_', 'Ketena 02', 10355, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '7c752601-41bd-443c-b7e3-6e7c79df98cc');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('7e138dbb-d71a-4bf7-a7d0-9c81327338ee', 10358, 'AA_G_08_', 'Ketena 03', 10355, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '8a36e273-17aa-43bf-843d-d3f76d735831');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('37e3c997-80a4-456e-8934-dd5fec656ac0', 10359, 'AA_G_08_', 'Ketena 04', 10355, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'fca6cb36-8068-4bd1-ab20-f3a0eb09c98c');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('72b980b3-8cdd-48e7-be07-aa923f36288f', 10360, 'AA_G_08_', 'Ketena 05', 10355, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '98515133-429c-4f33-867e-22471e23a150');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('121fd6a7-d590-47a4-a18d-6162ee878824', 10361, 'AA_G_09', 'Woreda 9', 10312, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '1ccedd43-0ab3-49dc-8f83-665ea923ee1b');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('7fe41c48-87cc-446d-a2c5-da7cd51fd08e', 10362, 'AA_G_09_', 'Ketena 01', 10361, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '3ec70aa7-ecd3-4375-96d0-c72d80197b1b');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('b1942040-6d24-4c86-8323-cadaef91d8ee', 10363, 'AA_G_09_', 'Ketena 02', 10361, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '123133cb-d0aa-4975-948c-c3f498a01559');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('03834c83-5590-4c27-8934-2b64d9f0b394', 10364, 'AA_G_09_', 'Ketena 03', 10361, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '831ad829-e71d-4794-8891-60ddb5dbacbf');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('dc15eb6d-c2bb-4312-9377-34af6399cdf5', 10365, 'AA_G_09_', 'Ketena 04', 10361, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'fa9d606a-6ef4-4cd8-bee8-2a5910b0261a');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('04b2068f-82f5-42da-ab3d-f2dbc0865970', 10366, 'AA_G_09_', 'Ketena 05', 10361, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '0553e786-ec3b-4d8a-8ef3-ee508758588f');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ec073e0c-9378-4731-815a-fdcaff1681ec', 10367, 'AA_G_10', 'Woreda 10', 10312, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '240333e5-255d-4135-a629-a977a4d7a946');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('995dfcb0-4215-4dd3-a459-12a52702eca3', 10368, 'AA_G_10_', 'Ketena 01', 10367, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '7b814175-53ca-4a18-9917-738fb63e90b8');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('f103582f-90ea-4311-8502-f3c1d1d46012', 10369, 'AA_G_10_', 'Ketena 02', 10367, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '67b4ae2d-db23-4584-a6d4-3e87d95b153a');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('cf55c05a-6c22-447a-a42f-25553a69af50', 10370, 'AA_G_10_', 'Ketena 03', 10367, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '5d5a332f-a4a7-4c88-a22f-db846f893ed9');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('9bc00caf-e600-46dd-ba43-4937c4efb5f9', 10371, 'AA_G_10_', 'Ketena 04', 10367, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '80ee64eb-71da-4180-bec7-7e9de7d8cec8');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('f4f1ac84-107f-4887-8d76-c00b11265e66', 10372, 'AA_G_10_', 'Ketena 05', 10367, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'b01297d3-1360-4e8a-8776-5b01d6afd47a');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('affef76e-883a-4c4c-8055-b0a2b512fbd2', 10373, 'AA_K', 'Kirkos', 10001, 
 'S', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '881c9566-6c5b-4f78-8dbf-cd60b7986f2b');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('4d098047-a42b-431c-8794-4156d3f2d113', 10374, 'AA_K_01', 'Woreda 1', 10373, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '925b30ed-74c7-4898-8bb6-77c093e45f3f');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('114edf04-a484-4627-a116-84053c4883bb', 10375, 'AA_K_01_', 'Ketena 01', 10374, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '9197b42c-f6ce-4beb-aec9-c8cc67b12bb8');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('5eaafce7-256a-4008-9982-78455301c239', 10376, 'AA_K_01_', 'Ketena 02', 10374, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'c8a7a943-f8cf-41ce-b5aa-c333df64b880');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ef92883e-9e00-4650-85f7-0e8c67f1b19c', 10377, 'AA_K_01_', 'Ketena 03', 10374, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '6faee012-e630-49b7-959b-a807929c9ba8');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('a39fce49-5110-4c28-a273-5cc35fc078ee', 10378, 'AA_K_01_', 'Ketena 04', 10374, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '3a399fdd-1b71-40a8-b1df-6ed89d8cc6c6');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('1696d4e3-076c-4c54-a58b-0d8aa4181019', 10379, 'AA_K_01_', 'Ketena 05', 10374, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'd9a427a1-d410-4ed2-aad0-907d75d71028');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('0ea58daa-7727-4cfb-a3ff-67e21fe0861f', 10380, 'AA_K_02', 'Woreda 2', 10373, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '8e021640-acb1-42d0-b559-4767be2f1b72');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ea47097e-721a-4d48-a89a-bb1ec5bf9ce3', 10381, 'AA_K_02_', 'Ketena 01', 10380, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'e2c475e5-1628-45d5-9b32-4f82343dbac3');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('1fb75a0a-b9f3-4893-a85d-c9394ad59031', 10382, 'AA_K_02_', 'Ketena 02', 10380, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'f75ffda9-8140-4862-8bd3-6e302ca9094f');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d6455890-b61a-4955-bd9b-8b6885dc599f', 10383, 'AA_K_02_', 'Ketena 03', 10380, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'fbf9b38c-a37c-4302-b6ec-93e1c355222d');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('a8be0b3d-edf5-48ec-a515-8ac33eb27884', 10384, 'AA_K_02_', 'Ketena 04', 10380, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '98f377f1-1a04-46d2-8051-d38ab1e689b8');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('988cb070-f52a-4e5b-8131-148157c93378', 10385, 'AA_K_02_', 'Ketena 05', 10380, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '790313da-e5bf-4daf-b062-f93c83033c1c');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('4015f6ff-95b2-4605-b60b-663ff3b06073', 10386, 'AA_K_03', 'Woreda 3', 10373, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'b6d7de24-5b97-4783-bd53-e6887513aa60');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('6c9ec273-6411-46b4-8d98-27ca0561945f', 10387, 'AA_K_03_', 'Ketena 01', 10386, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'dbff1461-d1fe-421f-85e3-23e8fefb83e0');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('641cdd87-e1ed-4a4c-86f1-91eb89995630', 10388, 'AA_K_03_', 'Ketena 02', 10386, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'd3650eb8-f4be-4d00-81b3-a5bb736c8c2d');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('0f506c1e-df29-4f94-8720-2951567392ce', 10389, 'AA_K_03_', 'Ketena 03', 10386, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '07d0a935-6141-4b2e-9bbe-379cf6480694');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('faf87e71-df84-4574-a3a1-ce409bb783d2', 10390, 'AA_K_03_', 'Ketena 04', 10386, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '3a7f2140-61ca-4aa2-920e-41bbfe8f098d');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('117b41c7-97dd-46d3-aa98-47891adf87f8', 10391, 'AA_K_03_', 'Ketena 05', 10386, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '9965edc6-d484-4d6c-bdb8-f3463fe9a801');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('4ce80389-2b2a-40b7-b1bf-b1dfc61a8148', 10392, 'AA_K_04', 'Woreda 4', 10373, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'a03ff828-8ee8-402a-a53a-e72fc5b64a81');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('5b684274-a01a-40e7-9157-ae9c6152de26', 10393, 'AA_K_04_', 'Ketena 01', 10392, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'f8b95cc1-fde4-4d16-9902-293c1d83a69d');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('969b5d6f-206a-4c98-b29e-3f9f9aae66f0', 10394, 'AA_K_04_', 'Ketena 02', 10392, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '9561a3bc-cb4a-4347-a4ce-6ae25f4dd94e');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('83d65cd6-1cb2-4169-bdf6-e952f2f90b05', 10395, 'AA_K_04_', 'Ketena 03', 10392, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'f64d79cf-642c-4e68-94ce-010d638aec55');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('91afb212-46d5-42d7-9848-f34db3308e32', 10396, 'AA_K_04_', 'Ketena 04', 10392, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '2a5f7e20-9f10-4619-b22b-0843b9e87708');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('88f23b38-c435-40c0-82c8-51b96efb1d10', 10397, 'AA_K_04_', 'Ketena 05', 10392, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '8612e44a-0a48-47b5-a9d5-20667402a66a');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('84ece4b6-df7d-4bc0-a10f-0a1c25e165a4', 10398, 'AA_K_05', 'Woreda 5', 10373, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '6e94bec7-8794-483f-8f5a-2ed7d9cfc988');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('2f0142a8-1fd6-424f-abc9-347416b006cd', 10399, 'AA_K_05_', 'Ketena 01', 10398, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '2f3c254c-b24e-433f-a4d8-06b2aabfa2ec');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('2c19de1e-c0fa-4fe9-9e5a-6c3ca42cfd3e', 10400, 'AA_K_05_', 'Ketena 02', 10398, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '4224a34b-7de6-467c-9202-72d9bf6d978f');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('7eebc33d-8048-4e94-83e1-00ee663a0651', 10401, 'AA_K_05_', 'Ketena 03', 10398, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'e54b81ad-56d7-4117-bddb-f1102b6e15e5');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('4ecc4834-af6d-49df-8ace-23c5bd2e51bd', 10402, 'AA_K_05_', 'Ketena 04', 10398, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'b11299a7-4405-4791-bab5-95d9eaabbb32');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('3a27062c-e195-4ebd-aae9-97b015b9dc9e', 10403, 'AA_K_05_', 'Ketena 05', 10398, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '370bc112-aeca-43ec-8aae-ac2c81c21d74');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('96a25db4-fc38-4e29-941a-e138289730d5', 10404, 'AA_K_06', 'Woreda 6', 10373, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '407ce0cf-abdd-4bd0-b07d-15cdcc844db0');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('a81c0fa0-8e8f-4bcf-90fd-cced4beef14e', 10405, 'AA_K_06_', 'Ketena 01', 10404, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '53007cea-fbcb-4492-af60-0ad334b903cb');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('4d00c07e-cf72-4ff9-8d99-0767e2fc9527', 10406, 'AA_K_06_', 'Ketena 02', 10404, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'f393a91c-5620-49ec-bd92-30ee55461e72');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('6da6d586-14d6-4a17-bf2f-ef6c490b34c6', 10407, 'AA_K_06_', 'Ketena 03', 10404, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '99331327-d0f4-4910-838a-8618ec0076b9');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('e91f5ceb-186b-43c2-9305-5a4598a9a54a', 10408, 'AA_K_06_', 'Ketena 04', 10404, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'efe94319-fb41-4400-9807-60425d742438');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('67c170df-afc4-4ed0-b332-3781b57b2cca', 10409, 'AA_K_06_', 'Ketena 05', 10404, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'fbdf4aee-5ee0-43cb-a616-560cbe7e1a92');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('e8e697f6-c682-42a0-9ffe-e3e072798e11', 10410, 'AA_K_07', 'Woreda 7', 10373, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '54180071-17b7-4684-aa9a-67de25a05b99');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ab679abf-fd8c-4057-8226-3cebcd52880c', 10411, 'AA_K_07_', 'Ketena 01', 10410, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'bad50345-81be-4a51-9684-e7335b8ce72d');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('9f1d9a36-86c4-4c36-876b-39ad3bba1500', 10412, 'AA_K_07_', 'Ketena 02', 10410, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '4eb5dfd6-a5be-408d-9b7f-94d9c5949f9e');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('7889761e-d5bd-48a3-b6f7-20e095c248a9', 10413, 'AA_K_07_', 'Ketena 03', 10410, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'efa5e789-00e9-461b-b495-4473d12fdf2f');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('da1d9abd-98a9-4ba2-af13-7bc7f4971639', 10414, 'AA_K_07_', 'Ketena 04', 10410, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '2ccfc10f-4d1f-469d-90b6-3105914e7dc3');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('bb0afa21-3620-44f6-8c70-a252300e320d', 10415, 'AA_K_07_', 'Ketena 05', 10410, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '21e8b02f-934e-4191-8136-b05b71de4f34');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('f39c222c-e070-4b3e-a61b-94c319ee5d44', 10416, 'AA_K_08', 'Woreda 8', 10373, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '6f2ff8bc-7d6c-4793-91ca-1f4f98bd8321');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('532011a2-6b6b-4819-b910-f1f72220a0db', 10417, 'AA_K_08_', 'Ketena 01', 10416, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'af5c9e59-32f7-4fa0-8d53-de353a85cc32');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('fe75c040-da6d-47d7-8fa9-e7df8d71dc27', 10418, 'AA_K_08_', 'Ketena 02', 10416, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '8bc8061d-18b1-47a1-bcd7-dad5c6b5db8e');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('b83edf06-c015-4531-af6b-c0fd46c9f5dc', 10419, 'AA_K_08_', 'Ketena 03', 10416, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '0ee6c2d2-b19a-4311-8cb0-3b692b25071c');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('a094cb55-3377-40b7-97a1-af37a1d9f9c3', 10420, 'AA_K_08_', 'Ketena 04', 10416, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'b586ddaf-22da-4b66-9af0-6b4d289c53a3');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('a7a99b17-d90b-481b-9593-c8523ea06889', 10421, 'AA_K_08_', 'Ketena 05', 10416, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '638fef3b-1dce-467c-9c13-8cbdb4e92c86');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('0a11ff59-5f1a-4d8e-9204-df7b1476d7d4', 10422, 'AA_K_09', 'Woreda 9', 10373, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '0f1934d2-0303-4b81-9bbd-af03200e536e');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('712bdcdc-601f-40f2-afc2-a3395ce448c3', 10423, 'AA_K_09_', 'Ketena 01', 10422, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '99912719-9773-469e-b837-57d345d7d591');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('45b20889-2e1e-4c97-ab42-8f82d6c4727d', 10424, 'AA_K_09_', 'Ketena 02', 10422, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '78153e0b-c84d-4d94-8688-91141c5aab5a');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('8c7eccba-7e29-49b3-8792-61241213a16e', 10425, 'AA_K_09_', 'Ketena 03', 10422, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '86f8e0ef-e44b-42fa-b605-54b3ed892239');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('b18d40bd-7ea2-4d3c-86f2-9f120db6857f', 10426, 'AA_K_09_', 'Ketena 04', 10422, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '8481c2ac-f5ad-4013-9dc6-4a4ec57a0e59');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('0df7df5e-fb3d-4ab2-afc7-62d1cd061f2e', 10427, 'AA_K_09_', 'Ketena 05', 10422, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'e6bd0f87-85e7-42fb-98de-e10386853bce');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('025c00be-e74b-416f-ab08-1b609874a6cb', 10428, 'AA_K_10', 'Woreda 10', 10373, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '385277fc-dbcd-42e4-b028-bc69a434c2eb');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('8a7bcb6d-5c9a-47d5-8031-078ca690af57', 10429, 'AA_K_10_', 'Ketena 01', 10428, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '7b62fd47-2293-4946-894f-d72f2445ca9c');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('64ff8f8e-91c0-4b33-ba73-4776d1bf8735', 10430, 'AA_K_10_', 'Ketena 02', 10428, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'cfe49e45-6c22-44ab-8af3-545178410580');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('f9352a74-3a75-40f9-ab1d-abf62ca1068f', 10431, 'AA_K_10_', 'Ketena 03', 10428, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '44c7afdd-536f-4db0-8398-4756b956e4ee');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('f11ec9fa-fe41-4a5c-8755-c0da53a9fa55', 10432, 'AA_K_10_', 'Ketena 04', 10428, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'b7c3a514-2d07-43e8-a8b0-2d0aa084b969');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d3282a2f-a2b0-48b5-8b17-2bed05f49d28', 10433, 'AA_K_10_', 'Ketena 05', 10428, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '88a19b42-20dd-4142-9c55-7b32835e03db');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('f6e1dc93-3cdc-4a55-9abc-4aad5f2b5921', 10434, 'AA_KK', 'Kolfe Keraniyo', 10001, 
 'S', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '6e6fb804-8200-46bf-85d4-6ac5d3919ab3');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('96482a89-f5f9-49a6-88ec-9b26bc629455', 10435, 'AA_KK_01', 'Woreda 1', 10434, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'd947452e-1621-4f88-b43c-df80d51a4e51');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('75ffde63-7297-4e5e-b75a-a3b1b4175a0d', 10436, 'AA_KK_01', 'Ketena 01', 10435, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '8244af0c-6d96-4324-9b92-96a870727200');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('50ffe505-4fc1-4dfd-b5a3-91981038c3a5', 10437, 'AA_KK_01', 'Ketena 02', 10435, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'b3232619-28da-4293-a6dc-afaca86ebdbd');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('621d36c8-3a0d-4b21-88bc-561cf020cd45', 10438, 'AA_KK_01', 'Ketena 03', 10435, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'ae027168-6431-47d2-bc27-f9605e9dc1e0');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('00a42c97-d2d6-4d98-b82c-67a0f4c9ff07', 10439, 'AA_KK_01', 'Ketena 04', 10435, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'cf30b290-afd1-4ad8-9991-b3af7d7b2c63');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('3fa84441-dc08-4476-bd71-e812c5a1b50e', 10440, 'AA_KK_01', 'Ketena 05', 10435, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'e8151dc3-59d5-4ee8-b572-e96d3d97bca9');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('561393af-ca01-4d20-9771-c67ec3ea9a41', 10441, 'AA_KK_02', 'Woreda 2', 10434, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '8528c952-fbc3-4353-a5e3-d1133b6c42fe');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('14236a43-4ade-4acc-a875-8d9d65cf4aeb', 10442, 'AA_KK_02', 'Ketena 01', 10441, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'c191c844-e0e3-431b-b35f-f92f554edca4');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('9dfa49e9-0dcf-4a46-89ae-4e6bb97a5df3', 10443, 'AA_KK_02', 'Ketena 02', 10441, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'cfb180fb-e879-4181-9086-3e12111950ad');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('a05f0f90-5965-4fc9-ac6f-c2383868d493', 10444, 'AA_KK_02', 'Ketena 03', 10441, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '8924d91e-12e9-4c8a-89ff-fd704b3770ec');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('0f30aeba-2598-4cba-a764-b74f80912686', 10445, 'AA_KK_02', 'Ketena 04', 10441, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '93fdaf25-ab1b-41a6-bec7-2fecd2e0119b');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ab9c2913-c8ca-4552-8215-8506c1a05f8a', 10446, 'AA_KK_02', 'Ketena 05', 10441, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '7fb669df-8462-4e99-ae15-fe759c6ace4c');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('0c010aad-64db-4aa9-a5b5-ac23f4ffa516', 10447, 'AA_KK_03', 'Woreda 3', 10434, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'aa8ae565-b70a-4de7-8ef5-9dd8672dbc7a');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('81d72c3a-2546-4e85-9c2a-a6f9200cc101', 10448, 'AA_KK_03', 'Ketena 01', 10447, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '9a58b60e-f086-4f31-95fc-29f990dc476e');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('e4d4e699-25d5-4253-817e-ca96ea9f9ca1', 10449, 'AA_KK_03', 'Ketena 02', 10447, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '723b8cd0-dbd7-4700-863a-fd6c5accea50');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('05280a1c-e4b5-499a-8716-7bfcf3e82a6f', 10450, 'AA_KK_03', 'Ketena 03', 10447, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'd2576200-8ea4-4f3f-b746-1b2f4dff0b5d');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('8bab5cda-cf83-4c58-bff0-c2e81aeebdec', 10451, 'AA_KK_03', 'Ketena 04', 10447, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'f62605e6-d9c1-4f83-9832-6d66cc80c3c8');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('608ba2f8-2527-4461-b509-5104c9d16772', 10452, 'AA_KK_03', 'Ketena 05', 10447, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'c64f2c86-aef0-432a-b189-f455cc8dd04b');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('a059371e-b9fb-4a66-b20d-fadc5a783939', 10453, 'AA_KK_04', 'Woreda 4', 10434, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'b3fedd67-36e0-45d8-844c-f5fafa2d641f');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('7e46b0a3-0fee-4e95-8871-8e3b7a03f689', 10454, 'AA_KK_04', 'Ketena 01', 10453, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'bb4026fe-3765-4a9b-81fc-133a1278d7fd');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('c5d86465-fcca-4f23-9830-df3b8d4b2a22', 10455, 'AA_KK_04', 'Ketena 02', 10453, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '753e78de-1a1f-4d13-ae0a-4bb5c225797a');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('98a4d57d-efc7-431e-b40e-13f063d77149', 10456, 'AA_KK_04', 'Ketena 03', 10453, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '84842597-3ffd-48aa-9bda-3f13fbed3bd8');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('154ebf81-8bfc-4754-8446-690adf455b06', 10457, 'AA_KK_04', 'Ketena 04', 10453, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '0f70c24d-b6a1-4152-8688-345a3a1c7cb0');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('9710f211-c44b-406b-bca3-3e05ed42f20a', 10458, 'AA_KK_04', 'Ketena 05', 10453, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '2336fa5a-328e-4b19-8b12-93ace039e8cc');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('0cc982b7-4ebf-4d02-aa4d-bf1a3615d845', 10459, 'AA_KK_05', 'Woreda 5', 10434, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '6ddde7b6-0bd5-4a72-bdf0-d6d8afa02647');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('72dac0e3-13b7-4e5b-8f8f-a81a1dcc55a1', 10460, 'AA_KK_05', 'Ketena 01', 10459, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'c32c09d3-3ef9-41ed-9662-e6637d19a578');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d51b2774-6ff4-4ff1-a047-15d79d750c8c', 10461, 'AA_KK_05', 'Ketena 02', 10459, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'a52c19b8-36b4-4159-81ab-dc51b74e8d6f');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('da30ff26-33fe-464a-9379-e678fb949f9d', 10462, 'AA_KK_05', 'Ketena 03', 10459, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'c0248c4e-be54-4e9a-8cb9-c5b8cd692494');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('85088af3-525e-45ac-a4e6-80ec452f0889', 10463, 'AA_KK_05', 'Ketena 04', 10459, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '5816c0c7-2b61-481a-b872-53da2eec87bb');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('2fb14217-0c12-49bb-96c6-3486fa0df321', 10464, 'AA_KK_05', 'Ketena 05', 10459, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '5bcf5811-0ec3-4418-900b-2bbaf67df440');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('b6f22009-5149-4430-997e-c57942e9e30f', 10465, 'AA_KK_06', 'Woreda 6', 10434, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '95434f61-8247-42e6-b014-7058bd58556f');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('1ef874cf-b214-43bc-b0f4-be209597dcdb', 10466, 'AA_KK_06', 'Ketena 01', 10465, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '621f08d7-7abe-415e-8465-1a963cbd180d');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('4ef60620-1eab-4567-91f5-4c05222bbf85', 10467, 'AA_KK_06', 'Ketena 02', 10465, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'd97ca028-32f3-4c7e-ad5a-52bfe34f916d');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('5e8a642c-c59f-4cff-8120-073b56241b26', 10468, 'AA_KK_06', 'Ketena 03', 10465, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '819aabeb-9e15-4455-9d5a-39cd8294200b');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('309eb4f9-451d-49de-b2d0-f05680a625b7', 10469, 'AA_KK_06', 'Ketena 04', 10465, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '104c270a-9ba6-4b09-8c18-0b20cd90ba11');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('5348ed2e-eb78-40dd-9dba-9be04e728359', 10470, 'AA_KK_06', 'Ketena 05', 10465, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'a011a4b5-abd4-46df-b05b-cb1198ebb211');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('064e3fab-f42f-4459-ba40-db46c11fc711', 10471, 'AA_KK_07', 'Woreda 7', 10434, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'd0fb83e5-cf1f-4b34-b4ba-bf169bdf2c37');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('1c6aa567-a1d8-4117-919c-8d9c9b1e8bae', 10472, 'AA_KK_07', 'Ketena 01', 10471, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '4686597c-5297-4872-b406-7ddeb0f04642');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('eef246fb-5988-49f9-902f-62ea6504b24f', 10473, 'AA_KK_07', 'Ketena 02', 10471, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'fe341354-4214-470e-b823-62176e7d6929');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('7886c34c-3de5-4a47-a268-3a3b6fd30aa1', 10474, 'AA_KK_07', 'Ketena 03', 10471, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '7f8caf11-361f-419b-bb3c-fb3f0c2b9bc6');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('038bde54-19cf-4613-ac91-85130be9ee35', 10475, 'AA_KK_07', 'Ketena 04', 10471, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '7f935a04-c791-456a-93a8-deaef11c30ae');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('eefe42f2-d2f3-4991-a3c9-b42e6c45641d', 10476, 'AA_KK_07', 'Ketena 05', 10471, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '22ab36e4-c0e0-4f7c-9bb4-899aa1ee6b35');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('e732f92c-ba25-4824-b9a3-986f221665f8', 10477, 'AA_KK_08', 'Woreda 8', 10434, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '8270d9c9-4e7e-46fb-9143-3dadeb245753');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('fd6cf343-09ff-485f-8d87-2923710f53b1', 10478, 'AA_KK_08', 'Ketena 01', 10477, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '9c8b0e3a-ff7b-4446-8429-8aad75fbea72');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ee6bf268-3fa3-4e1c-9654-924060753ba9', 10479, 'AA_KK_08', 'Ketena 02', 10477, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'ae7a87e1-32d0-459e-a122-652b0532a8cb');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('faa38a69-e3db-44db-9031-e6710b3009a4', 10480, 'AA_KK_08', 'Ketena 03', 10477, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '58f87394-447c-464a-8ea8-ebe2439a47ed');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('826a18e2-c577-4506-8af5-49c368f35898', 10481, 'AA_KK_08', 'Ketena 04', 10477, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '95a3ddbb-bb9b-42d3-959d-65ac1e25f9cc');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('6e818e6a-7f33-421d-b0c2-58c507467fd0', 10482, 'AA_KK_08', 'Ketena 05', 10477, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '174a864e-1cd1-4712-b016-3b715110cf4a');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('413c4e20-4e54-4d53-a0ee-4a31f8b9e09b', 10483, 'AA_KK_09', 'Woreda 9', 10434, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '5c320b05-1a84-47b1-9438-1ccf9fd8e952');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ac0c4762-4795-492a-9647-6d4c0632e0fc', 10484, 'AA_KK_09', 'Ketena 01', 10483, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'de645e65-9210-41a5-bb5e-adcc7668cb5c');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('35bc82b0-05fa-48ab-bc30-aaff36022c63', 10485, 'AA_KK_09', 'Ketena 02', 10483, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '81958baa-31f0-4555-831b-2c1640a20816');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('77c345cb-2816-4a2c-9b95-37f0942b853c', 10486, 'AA_KK_09', 'Ketena 03', 10483, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'a6399f6e-1613-4fea-9a2a-a87f9daa86f6');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('3e6d2024-3357-462d-918e-cf394a390edb', 10487, 'AA_KK_09', 'Ketena 04', 10483, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '6f5585c1-d008-4dc0-9798-b8ae01726a94');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('4580f622-25c4-4525-b17e-d7800033cc54', 10488, 'AA_KK_09', 'Ketena 05', 10483, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '55193700-a959-45d0-b3f1-fd5e6b6deab2');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('f96f402a-fb5b-40d4-814d-a20e3464b55f', 10489, 'AA_KK_10', 'Woreda 10', 10434, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '66e86326-8151-4b51-aa8f-e961b9aa8883');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('52938303-e23b-4fa3-9030-819f4071d4bf', 10490, 'AA_KK_10', 'Ketena 01', 10489, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'ef941a12-9f25-46c0-8102-cc84e05c0fa2');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('f771e66f-fdc0-42c6-a433-52ba4f11cc48', 10491, 'AA_KK_10', 'Ketena 02', 10489, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '6c302655-98b1-432d-83d2-252836d5466a');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('4081766f-7e11-4265-9361-35ba5dbb4d46', 10492, 'AA_KK_10', 'Ketena 03', 10489, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '0b2dd002-0b60-4aee-b650-e55221db14cb');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('dc6c7c7b-563b-4296-a848-56697fdd7860', 10493, 'AA_KK_10', 'Ketena 04', 10489, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '29266c32-9018-48de-90df-6b4412bda0eb');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('01aedcb3-c29f-4121-9515-6a1fc76bf29c', 10494, 'AA_KK_10', 'Ketena 05', 10489, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '62811197-14e7-4b97-af85-c9f70f84bcbb');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('fc62e209-ea5a-4b2f-bc3f-85de06eb4afd', 10495, 'AA_KK_11', 'Woreda 11', 10434, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'e559f1b6-fd4f-4976-ac33-ce341c44987c');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('5130d287-d32f-4142-8d06-c0cec970f4eb', 10496, 'AA_KK_11', 'Ketena 01', 10495, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'c4bcb32d-edda-4cc8-b026-888f746bc77b');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('b61eb669-cec3-40ea-97ac-ae8e16e45a58', 10497, 'AA_KK_11', 'Ketena 02', 10495, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'bdd0c01b-1857-47bc-8ae2-5c4969709e4f');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('9cd09f45-c02a-423d-8c05-22776335c4f1', 10498, 'AA_KK_11', 'Ketena 03', 10495, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '7f82476b-9ec6-4223-b1d5-ec36cd147b86');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d10baf69-f9ba-4682-8d56-e3a984dfb262', 10499, 'AA_KK_11', 'Ketena 04', 10495, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '2177751a-7348-4480-9c69-3d5b4a8eac9f');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('b630f227-6445-43e8-8220-d10253f68e3a', 10500, 'AA_KK_11', 'Ketena 05', 10495, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'e81d6a89-b99b-4979-861d-dba738561ce3');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('a657a6b1-5994-4433-baae-c17b1f3cad1a', 10501, 'AA_LK', 'Lemi Kura', 10001, 
 'S', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '18c7c81d-d150-409b-a86b-0ac6342b7c2e');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('e809a68c-312e-4ac5-b273-510edab4030f', 10502, 'AA_LK_01', 'Woreda 1', 10501, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '57ba1023-2c55-4ed3-91b0-f036b167ffc4');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('db821ef5-2d37-46d5-9b2f-3bef20056bfb', 10503, 'AA_LK_01', 'Ketena 01', 10502, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '373fe0a6-a685-4391-98f6-995bdbc9c747');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('6b6ff3e8-485a-49a9-b384-67ae7f327c17', 10504, 'AA_LK_01', 'Ketena 02', 10502, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '82f5f569-8fd6-4fce-a6db-b7baf379b8ab');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('aff827a5-a348-4cbf-afd3-6435066d7b00', 10505, 'AA_LK_01', 'Ketena 03', 10502, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '0d61043c-78bb-4f3a-9142-2887798f29cf');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ad71ee66-3d68-4e2b-8818-c7a3c2eb4b24', 10506, 'AA_LK_01', 'Ketena 04', 10502, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'da4172f3-8a51-4001-9cc3-f64b0c193186');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('b1f06c97-0748-4ae4-a3ba-2ac10bd8e961', 10507, 'AA_LK_01', 'Ketena 05', 10502, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'e8c21fb5-807f-450b-9482-d5ea8e8c56dc');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('1b92bb2d-b0be-432c-8cb8-68436377ff8d', 10508, 'AA_LK_02', 'Woreda 2', 10501, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '3e2db25f-a885-488d-bce7-e7c87e37d86e');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('fee8691c-5452-4b3e-9dc8-7918ab8ff718', 10509, 'AA_LK_02', 'Ketena 01', 10508, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '3c0de940-9946-4830-bdb6-a6a81efe63f6');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('6b80be04-cc86-4ee2-bbd2-2162a11a95b1', 10510, 'AA_LK_02', 'Ketena 02', 10508, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'ee498482-253b-49c7-8cb8-d6cc2825edce');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('87704911-f3a8-4cb4-a14e-c0c040f6d3a3', 10511, 'AA_LK_02', 'Ketena 03', 10508, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'ff7caeff-dd61-44de-9e9c-fe0926b7c0d9');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('98051ace-3193-484f-8af7-0a64947cd955', 10512, 'AA_LK_02', 'Ketena 04', 10508, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '76dd80c4-0753-46ca-92a9-6f21b6bee1ff');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('af225a0f-14af-4087-a5af-79790d93ee2b', 10513, 'AA_LK_02', 'Ketena 05', 10508, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '8c349e2f-8156-43ba-a76d-de43fba5da79');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('f2dba5c8-975a-4553-bfb4-8e179e2950dc', 10514, 'AA_LK_03', 'Woreda 3', 10501, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '288f0bc7-0faf-42fe-9f54-b6f5cd82ecbe');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('e162792e-b034-463f-8742-0c808aea1b14', 10515, 'AA_LK_03', 'Ketena 01', 10514, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'b22f567a-e87c-447f-a17f-a615654a4917');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('56633ca3-0f80-489e-930b-546cd66de591', 10516, 'AA_LK_03', 'Ketena 02', 10514, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '0c300063-6474-4ce8-8389-6ddf589ddd64');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d40e7771-4970-4854-ac19-1caac13e3801', 10517, 'AA_LK_03', 'Ketena 03', 10514, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '1f33dcc1-3215-498b-936f-dc04da86009e');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('9ef7b2ef-c6f2-49ce-ada3-95016da6d8ea', 10518, 'AA_LK_03', 'Ketena 04', 10514, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'b0133af8-63e1-4e21-a89e-8e6f6434d6fb');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('33ad0272-a866-402c-abeb-38de34845bc4', 10519, 'AA_LK_03', 'Ketena 05', 10514, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'd67911f7-6733-46de-b457-4f8b736e5378');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('a1f8c596-9ac2-46cc-8b2f-b1f73d51df29', 10520, 'AA_LK_04', 'Woreda 4', 10501, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '23fb4b5f-5ae1-4936-987f-4f89be912578');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('5e73643c-e62e-431a-8427-faa0e8b7623f', 10521, 'AA_LK_04', 'Ketena 01', 10520, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '3c381ce2-2f45-4cef-a85e-d3259cf59924');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('53a9a301-5a7c-44c2-905e-059bef54be38', 10522, 'AA_LK_04', 'Ketena 02', 10520, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '5e0cfc20-73a1-4859-ab5b-e3884bf2f774');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('b200f90d-8be4-4877-8d3c-3278d738a5b0', 10523, 'AA_LK_04', 'Ketena 03', 10520, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '51131696-ca63-45f4-81cf-8b21c43cd36d');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ffc66a4a-a9fd-4207-8359-bd18c8947c1f', 10524, 'AA_LK_04', 'Ketena 04', 10520, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '5da21b2d-06eb-42be-a69b-3a97efb2f771');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('5337b997-dba0-4e51-bc8c-83f51ee3fd50', 10525, 'AA_LK_04', 'Ketena 05', 10520, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '1f7ea72a-8817-444c-9217-ad7f2ed9d21e');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('63183243-e73b-41b5-b77a-76041f6f4ef9', 10526, 'AA_LK_05', 'Woreda 5', 10501, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'c8eee957-349a-4be4-b13f-bc4e0bb10441');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('4375b438-eb39-44e3-a414-f6ac0e7aa57a', 10527, 'AA_LK_05', 'Ketena 01', 10526, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'cb08209d-b19d-41b0-9093-2c874227565a');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('b183afca-d191-4e3f-9e06-2a493f61b12a', 10528, 'AA_LK_05', 'Ketena 02', 10526, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '78ecaf54-1de0-474f-9cd0-17e1d4b1c85c');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('0245942a-78ee-464c-be98-7b0436369944', 10529, 'AA_LK_05', 'Ketena 03', 10526, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '88bb14b6-1beb-4440-a512-1868d31ee938');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('7bb8a050-5442-4216-a114-e17e2d902820', 10530, 'AA_LK_05', 'Ketena 04', 10526, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '90d945fb-37a0-434f-aba3-2948f460ed24');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('df22b38f-f9fd-4275-9cab-476ca98efdd2', 10531, 'AA_LK_05', 'Ketena 05', 10526, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '4020e89e-502d-4e15-ab1f-7b7b2018b7e1');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('afb53559-2877-4a6c-bc8b-7e30d592d2c4', 10532, 'AA_LK_06', 'Woreda 6', 10501, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '75caf216-29ca-43b7-aa5b-8232afa88094');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('8090426b-cd47-4fb5-9c53-90e9a4925c57', 10533, 'AA_LK_06', 'Ketena 01', 10532, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '27087bea-6ebb-4724-abeb-4f95df988cec');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('3627399e-8192-4436-a659-8dcf220f797b', 10534, 'AA_LK_06', 'Ketena 02', 10532, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '50ed190d-7975-42f0-93d2-41c517b58677');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('9caba338-26ed-4fe7-9594-cac11ffd6305', 10535, 'AA_LK_06', 'Ketena 03', 10532, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'a05b8d95-996c-4612-8ad9-4500755f120c');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('6a863090-f1dd-4f4d-b951-42efd5a9d6dd', 10536, 'AA_LK_06', 'Ketena 04', 10532, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '2b156eea-c908-4018-af6e-bb1c20e91da9');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('303641c9-a1a3-4806-be47-a7e743755757', 10537, 'AA_LK_06', 'Ketena 05', 10532, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '0f883adb-e518-42c3-a232-e9956d537ebb');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('e4b224a0-24d3-433f-bf7a-ed7baae00ff5', 10538, 'AA_LK_07', 'Woreda 7', 10501, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '5add9f81-c39a-4094-b0e0-356893e7c7cf');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('4583a731-1ae0-45d4-a4ce-097dbcd697aa', 10539, 'AA_LK_07', 'Ketena 01', 10538, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '09a35f92-5863-41c1-894c-03214b918791');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('19e5437c-bcef-4481-9d00-c06ce2d680ab', 10540, 'AA_LK_07', 'Ketena 02', 10538, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '5aeb6f8f-a90c-4277-ac29-7a9e750aa043');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('6d1681ab-3b7c-4154-8c34-846eea31cff5', 10541, 'AA_LK_07', 'Ketena 03', 10538, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '3e8434eb-24f1-46ac-8818-777cc3e9e7cc');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('e22bfb98-f143-47a4-bd69-e5d3db2f106c', 10542, 'AA_LK_07', 'Ketena 04', 10538, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '6d2da06f-2816-4e6a-b6f7-57251ad11efe');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('3434920a-3c31-4d1e-ab4f-3f7293163d9e', 10543, 'AA_LK_07', 'Ketena 05', 10538, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '9a2307d9-e38d-428c-9046-7af4b5d71922');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('f4bef835-def8-4f71-a90a-5eca0d317cea', 10544, 'AA_LK_08', 'Woreda 8', 10501, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'a5e124a1-ba80-49f3-bffe-33be7ac527f5');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('cd2bf42f-7461-495c-913e-deac65df10de', 10545, 'AA_LK_08', 'Ketena 01', 10544, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '44633edd-5365-4bed-a9ab-40acc5cddf1c');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('c25b5253-4501-4c27-982e-e0bf6abf500d', 10546, 'AA_LK_08', 'Ketena 02', 10544, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '16fe80fc-3687-48cf-98a6-9e390b22697b');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('cdebae8f-b416-445a-b42b-7b0efd974db2', 10547, 'AA_LK_08', 'Ketena 03', 10544, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'fa411aa2-eb60-4e63-a24f-c34c664034c9');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('22dae5b3-c1b6-4386-a9f1-8ae60d2fa2ac', 10548, 'AA_LK_08', 'Ketena 04', 10544, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'add79fae-0bd1-4c0c-9aea-9ac814e91010');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('615505af-b87e-4b45-baca-10d86ffeb979', 10549, 'AA_LK_08', 'Ketena 05', 10544, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'f4aa2ad9-fc94-4299-9d9c-e8e52600f3b2');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('5320406f-70b1-4b51-bc85-efac6238af64', 10550, 'AA_LK_09', 'Woreda 9', 10501, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '0d424108-b58f-40ce-af9b-3e195a204d1d');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('fbe457af-4174-4f20-aa18-8396fa55ecfc', 10551, 'AA_LK_09', 'Ketena 01', 10550, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'd4ec51df-f8c5-4ab3-bafe-26a84c01b624');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('9d0d1325-721c-44b5-8c63-461b6a351bb6', 10552, 'AA_LK_09', 'Ketena 02', 10550, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '1ae4571a-bfe5-4509-9276-778635a97d82');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('89d350c3-0630-40b3-ad5b-00365ddc8b5a', 10553, 'AA_LK_09', 'Ketena 03', 10550, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'd18d887e-f316-4f5b-a9ef-a25b5baf9d78');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('1951cd42-d3e9-48e9-bbf8-26bb91687bf2', 10554, 'AA_LK_09', 'Ketena 04', 10550, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '1330a912-b7aa-4993-9c78-9c26ffb41e23');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('9edc5058-1393-44ab-937a-fae8f516ec97', 10555, 'AA_LK_09', 'Ketena 05', 10550, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'b5e81c49-7f8a-40fe-aa87-b91988483782');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('54e24169-8f1a-4eae-b35b-c37b0c8c9794', 10556, 'AA_LK_10', 'Woreda 10', 10501, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '78ef4856-435c-44e2-9ecc-d7dc32f1a3d6');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('287de1a6-b873-40da-bd67-3733bcf1f924', 10557, 'AA_LK_10', 'Ketena 01', 10556, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '159968b9-41b5-404d-8403-b6e877c34ac6');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('eedb399e-d7c1-4aa0-90c0-291cffaf9e49', 10558, 'AA_LK_10', 'Ketena 02', 10556, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '1ba100db-97eb-4977-94b2-9311a74f824e');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('1a7075f0-b656-4728-a7b4-a72f7c88edc0', 10559, 'AA_LK_10', 'Ketena 03', 10556, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'ce3ec660-a80d-467a-bc77-e02a251b2c2a');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('0c9b6baf-38f5-4ff3-a0eb-0d890cab729a', 10560, 'AA_LK_10', 'Ketena 04', 10556, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '9519273b-fb1f-4b7b-a061-3759da61c530');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('7ec3043a-2695-499d-b23a-57ca221a9dde', 10561, 'AA_LK_10', 'Ketena 05', 10556, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'e34ec33f-ba4d-456d-af26-77a334304182');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('1b507276-f3de-4d3d-86b2-0b2748f882e8', 10562, 'AA_LK_11', 'Woreda 11', 10501, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '7ded6a6b-6711-474b-a393-5dd5476925e7');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('dcc4e076-5cba-4014-ae15-858880105b07', 10563, 'AA_LK_11', 'Ketena 01', 10562, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '5c994110-8d76-4dbb-9a5a-72ea9a02b94f');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('e36cecc1-0a58-4586-99de-2f97765c2453', 10564, 'AA_LK_11', 'Ketena 02', 10562, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '001eed5d-ca83-45ee-a4cc-1d7c4bc53507');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('485580d5-5d8a-4570-bc64-2e8ae3ddf77b', 10565, 'AA_LK_11', 'Ketena 03', 10562, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '8ae909ea-d017-4a83-a68e-46b8383100ce');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('b93a9b7e-db4d-48ed-a8f2-6d2affe27fd7', 10566, 'AA_LK_11', 'Ketena 04', 10562, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'd94cb351-d45c-40f9-9ca6-33669287f572');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('e8abe44d-88b5-49c8-b266-09f6e2087340', 10567, 'AA_LK_11', 'Ketena 05', 10562, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '19aef479-ac34-4833-90fd-0e8a8701d015');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('67d3180d-8d41-4560-ad77-68478f3b7f84', 10568, 'AA_LK_12', 'Woreda 12', 10501, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'e980a982-15cf-4ebb-9ce6-01ad41d6bd5c');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('f05c6f13-c193-414c-85fd-164d00770b98', 10569, 'AA_LK_12', 'Ketena 01', 10568, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '48349061-7501-4105-91f2-30e28b53b630');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('869d2977-620c-4038-bea9-c700d54dbb76', 10570, 'AA_LK_12', 'Ketena 02', 10568, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '95a8d4e1-763c-41af-a143-5e0784533b11');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('50ea50c6-4a57-450a-bc41-2917a89e7b1f', 10571, 'AA_LK_12', 'Ketena 03', 10568, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'b3afd83b-a5f7-4425-840d-6b01099fdc0e');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('5ee4d7b6-9512-48bc-b90c-5fd1cb886721', 10572, 'AA_LK_12', 'Ketena 04', 10568, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '751a38e3-29d5-4179-bb01-681569488e36');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('086cfc7e-41f4-46f0-b77b-0680b8d17a2d', 10573, 'AA_LK_12', 'Ketena 05', 10568, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '7a7e9ad1-7b18-4975-9544-399541cfe16b');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('12885aa0-debf-4333-8f40-643cdb6a940f', 10574, 'AA_LK_13', 'Woreda 13', 10501, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'af976a30-dcf3-46f2-916f-9f71d68b8149');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d28ccce0-31b4-4e1a-af75-597b0a69b58f', 10575, 'AA_LK_13', 'Ketena 01', 10574, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'f48caaa7-d505-49e5-b14f-240273519263');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('49f57ad4-4e5f-4d71-9c4b-0ea3a94e2e9e', 10576, 'AA_LK_13', 'Ketena 02', 10574, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'f567a695-f509-4d0f-8fe4-5d8b0c422cc6');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('b230c191-6fe2-4b8e-bbba-8ec4af416e95', 10577, 'AA_LK_13', 'Ketena 03', 10574, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '8ec599e6-8452-47a9-829d-96e42aec8c55');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('dcd25ffe-5824-4098-8a40-08b59cc87cfe', 10578, 'AA_LK_13', 'Ketena 04', 10574, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'fe89a7d0-24fd-4c45-b6c7-3b1781bee9df');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('338242d4-f24a-401a-bdf7-96d870e580d6', 10579, 'AA_LK_13', 'Ketena 05', 10574, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'f0b26654-ef74-4b59-a9a4-be330e053c25');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('1291534a-2bd7-43f5-a226-f7d2dedd4791', 10580, 'AA_LK_14', 'Woreda 14', 10501, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '78f2edbf-4a1c-43e9-8c4b-b122f5e6fe43');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('99d33c7b-0455-48cc-80d2-b832ef3913d6', 10581, 'AA_LK_14', 'Ketena 01', 10580, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'b11e2ff7-8c57-434b-9e0c-0430270a0854');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('f39d23c4-5954-46ba-83f2-d037f529754e', 10582, 'AA_LK_14', 'Ketena 02', 10580, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '999be185-ad57-4b54-a8be-2a2231d5532a');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('198353b9-a3e1-4458-929c-dfa2bc17d6e8', 10583, 'AA_LK_14', 'Ketena 03', 10580, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'de29a688-ed99-4dad-910f-33e7651a1dc5');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('256b5b99-2d1e-48c0-be6e-5ab72e3113ba', 10584, 'AA_LK_14', 'Ketena 04', 10580, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '28edfc78-8c81-419e-91d9-4813d947133f');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('4fe1b9fe-921e-43a8-a48e-ba441e49d0a1', 10585, 'AA_LK_14', 'Ketena 05', 10580, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '6cd54a41-46e2-443c-9d1e-5760c127110e');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('772c1043-a544-4cd6-8d0b-bf79a806cc5a', 10586, 'AA_L', 'Lideta', 10001, 
 'S', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'ade214cd-f9d4-481f-876d-db50bdf87736');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('cb453c54-6d3a-49b1-acca-e1729e759da8', 10587, 'AA_L_01', 'Woreda 1', 10586, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'ccdf5520-1fd6-4bb4-b3f6-f1f1c5db8ce1');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('a9431a65-ab80-44d7-ac5c-019b9d3b8260', 10588, 'AA_L_01_', 'Ketena 01', 10587, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '79b85d21-ab11-43ac-8318-10b5488deb6c');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('b6451d6c-3dfe-4e49-b6e9-5430c9498efa', 10589, 'AA_L_01_', 'Ketena 02', 10587, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '74038cc4-8662-4ae8-ab68-d43f5e0fc794');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('c17744ad-1c02-431b-9911-2aca3aebf09c', 10590, 'AA_L_01_', 'Ketena 03', 10587, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '5b73b262-f648-4a4d-a232-2f8b7cde282b');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('70058e85-79a5-435f-ad20-025f8e9d4ca5', 10591, 'AA_L_01_', 'Ketena 04', 10587, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '8bfcc265-d6ce-4c06-b711-04a853e4d64b');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('367e0671-a47a-4637-803c-5bc304b803b1', 10592, 'AA_L_01_', 'Ketena 05', 10587, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '38aba9a2-d907-49b8-b6a8-a637b2e5eb6b');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('42ba5e0d-46dd-4f69-b036-ce492c8b2aa4', 10593, 'AA_L_02', 'Woreda 2', 10586, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '01b7ea3f-7f4b-4295-8551-6105fc2e4c6e');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('c2342820-bc2b-4d19-9132-621ff2653032', 10594, 'AA_L_02_', 'Ketena 01', 10593, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '8a21750f-f349-44a3-a040-a522776e4bdf');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('77a0d342-d026-4e87-947d-03231685bc83', 10595, 'AA_L_02_', 'Ketena 02', 10593, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'dbd1a34e-445a-4641-b976-106610a8a382');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('33d88c67-b5b1-4c08-940f-1fcf4b7c6f16', 10596, 'AA_L_02_', 'Ketena 03', 10593, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '437d0e0e-9df6-407e-981c-541ccb1ff3af');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d879ce5f-8683-4b55-b02a-fcc136d4ecf5', 10597, 'AA_L_02_', 'Ketena 04', 10593, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '447ba183-f09f-40ec-bb45-1397a0a8ab7a');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('38e1e4e6-4144-471f-a1d1-5f8d702558c5', 10598, 'AA_L_02_', 'Ketena 05', 10593, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '653e797d-ab16-415d-9e01-365608ae31ab');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ecdd0dd4-9d4c-4655-a86f-4efc71043276', 10599, 'AA_L_03', 'Woreda 3', 10586, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '2ef75ee4-6bf0-4c37-ab2a-d0bbf0012658');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('779a6ed2-20bc-419f-8c3a-bfde87d95a2e', 10600, 'AA_L_03_', 'Ketena 01', 10599, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '8cdefb1d-2199-4a5b-a9d5-143a7c902c4e');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('4e21cd65-9b49-4b8d-a663-5499b5a7a4c2', 10601, 'AA_L_03_', 'Ketena 02', 10599, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '5496f904-da52-4082-8881-e007ba9d4c96');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ac7788af-039e-4271-98d1-8edb37eb019d', 10602, 'AA_L_03_', 'Ketena 03', 10599, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'fdda4e27-b3e6-44ad-9866-07cf6eb62bde');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('5d1c037f-74ea-45ab-abf1-6e917b7d3097', 10603, 'AA_L_03_', 'Ketena 04', 10599, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '71062e62-6ec8-4d13-b39d-3772da183a73');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('9902a66a-6440-40c4-82db-3e6d5847b6fc', 10604, 'AA_L_03_', 'Ketena 05', 10599, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '95c58b6a-3bed-436b-a4f0-c4118ae41860');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('98cd0579-ab2a-431a-90ec-0eb4fab62131', 10605, 'AA_L_04', 'Woreda 4', 10586, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '23638c55-7730-4971-9e1c-b0e69fb62650');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('2ad872de-1139-435a-a4e9-7bc592cfba94', 10606, 'AA_L_04_', 'Ketena 01', 10605, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'ad4e81f8-99f2-4a3f-aad0-6c203a5bacf1');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('712aa9cf-f3e8-4174-82b6-1b5cdb9a1004', 10607, 'AA_L_04_', 'Ketena 02', 10605, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '8fb6c7ed-48d2-46ae-86d3-d3c4a37b89e9');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('53af966b-2e52-4ef1-9604-ecf3db76ea75', 10608, 'AA_L_04_', 'Ketena 03', 10605, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '43ecbe41-7503-422a-a2c9-88bf6b0e4bf5');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('2995b05e-f47b-4e8c-93ab-23549cfc6bdb', 10609, 'AA_L_04_', 'Ketena 04', 10605, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '104bd875-1581-4ac8-8885-0c6fba014155');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ad52bc4a-073f-4271-bedd-0d349e7d96b6', 10610, 'AA_L_04_', 'Ketena 05', 10605, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'fa59afe2-815f-48ba-b5b4-c9e18c365e72');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('80447f35-0e9b-49a6-b5e0-85c5eb36195c', 10611, 'AA_L_05', 'Woreda 5', 10586, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'f59a4930-d82b-4a40-ab5d-0f7562780e4d');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('8fcc55de-c79e-4a4e-9514-8f4149d1ede1', 10612, 'AA_L_05_', 'Ketena 01', 10611, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'dc12dbb6-455a-4b13-b367-59882bda3568');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('fc111c62-5e0d-4f48-8f20-0731e5dd2845', 10613, 'AA_L_05_', 'Ketena 02', 10611, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '7f60d7bd-909f-4de2-87a1-3abf0e4d3dcb');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ceaea71e-8294-49c1-a587-511f2a36a906', 10614, 'AA_L_05_', 'Ketena 03', 10611, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '54cb2593-e4d2-4801-883e-dc5cbcc370d5');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('bd87696d-a6bf-4cdd-8d25-467fceb1ca9e', 10615, 'AA_L_05_', 'Ketena 04', 10611, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'ad33e601-793f-4cb3-93bd-fb6b6d271f27');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('8e25120e-656d-488e-b2ee-95dce9bce7e7', 10616, 'AA_L_05_', 'Ketena 05', 10611, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '94ccd44f-5dda-435a-9228-1a0df0e57504');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ef154653-686c-4d58-9c43-8b0399773054', 10617, 'AA_L_06', 'Woreda 6', 10586, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'ef6800cd-0c0e-4a61-9e87-04ca85f822a7');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('c101585e-742f-4ecc-9a3f-d058b1101b5d', 10618, 'AA_L_06_', 'Ketena 01', 10617, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '3f2e6ca8-cc1f-4d5d-828c-642040d8c075');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('9c4b6a4e-bbda-483e-9d15-3cdb342c7f83', 10619, 'AA_L_06_', 'Ketena 02', 10617, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'd2f8e25f-af90-44f4-a651-967f1db933ef');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d9418bc7-5b4c-4a6d-b720-48c62b999294', 10620, 'AA_L_06_', 'Ketena 03', 10617, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'c0b63c82-5d7e-42f0-9fbb-ce829e2fa888');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('46123eca-6082-4603-91b1-c18193bdedf9', 10621, 'AA_L_06_', 'Ketena 04', 10617, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'f6df998c-566a-4a30-8200-fa3c787270e6');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('3de32901-d4cd-45dc-ab32-84110cdd3c6b', 10622, 'AA_L_06_', 'Ketena 05', 10617, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '35349156-3bdb-410f-b736-70f6c9408637');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('75c00927-98be-4748-97dc-ddebb778bc32', 10623, 'AA_L_07', 'Woreda 7', 10586, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'e056538a-6877-4a53-aa8a-5daeac03bdee');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('0c044ad1-7e5d-4ccc-8ee6-e88a485a4d7c', 10624, 'AA_L_07_', 'Ketena 01', 10623, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '0f865292-fbc4-457c-8452-f16942a18711');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('b03e4ad0-1380-4877-8d6c-7947cccfd9bb', 10625, 'AA_L_07_', 'Ketena 02', 10623, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'a60839dc-3756-4778-af23-4234601e1f67');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('4c5f5870-9649-4e82-9aba-daf86293d81f', 10626, 'AA_L_07_', 'Ketena 03', 10623, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '81e9da08-9780-41d2-9a47-c1e86f7e71ba');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('098c991a-f849-4076-8c48-70c3a03fc9e7', 10627, 'AA_L_07_', 'Ketena 04', 10623, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '178a9170-f593-44b4-b5b3-af4908e5ade1');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('5b8a4e65-503c-45a1-ac7c-fe07693b43d0', 10628, 'AA_L_07_', 'Ketena 05', 10623, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'efcb0655-f43b-49b0-b536-5a283ec1c883');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('0881c034-d096-46da-b600-8c056699ea2a', 10629, 'AA_L_08', 'Woreda 8', 10586, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '90efd77e-e7f6-4ef8-a7a4-064e9abf017d');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('442cfbc4-8984-40ba-9a0f-026061755ed4', 10630, 'AA_L_08_', 'Ketena 01', 10629, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '2962c6c4-8611-4206-abd2-3cd8b22705dd');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('6a75de90-3110-4f7c-ae26-4f4a2175c0f6', 10631, 'AA_L_08_', 'Ketena 02', 10629, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'ebeb8a5e-9434-4b2c-be69-ebd0ba30f693');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('c1eaaa41-7e76-423d-95c8-337977011af1', 10632, 'AA_L_08_', 'Ketena 03', 10629, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'ef1791a7-8169-46ba-bca6-feac1763924c');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('5e49fbae-0788-47b1-8013-370c2e709646', 10633, 'AA_L_08_', 'Ketena 04', 10629, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '62f63d33-fbd8-46cb-847d-6563b722f526');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('5ed2449d-8460-4d50-9906-976703ba6001', 10634, 'AA_L_08_', 'Ketena 05', 10629, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '66386c1f-5f3a-44f7-a4f0-81f1b412ed28');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('b2917581-6b5f-4fab-9fcb-eab6077c1324', 10635, 'AA_L_09', 'Woreda 9', 10586, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'e3856ab1-eb8b-4814-a1eb-db4bee89f599');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('0f1b1bce-83e8-4dc7-a499-2acb358c7f79', 10636, 'AA_L_09_', 'Ketena 01', 10635, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'f4c6fc97-2add-45b6-b6f7-2fcaef615524');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('b46424ec-5569-434a-b19d-01a0626b1320', 10637, 'AA_L_09_', 'Ketena 02', 10635, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '53193119-5ac0-4fcd-b341-e1bf34387def');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('cdbc2964-28ba-4e64-a977-c90ee3dac138', 10638, 'AA_L_09_', 'Ketena 03', 10635, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '5a9a770e-74de-4bf5-8731-7e8ee0c8fb58');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ec2cf08c-d2aa-4c09-aaa3-1f655dba24c9', 10639, 'AA_L_09_', 'Ketena 04', 10635, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '0a7424fd-ed53-4af9-a23e-cef37f03a3df');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('955ccb9c-031f-4002-817d-bcf7dd998ce7', 10640, 'AA_L_09_', 'Ketena 05', 10635, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'fbefa8d3-3912-4e3e-ab72-e922276aa853');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('cc96babf-d29d-4d39-b094-9e03621eabff', 10641, 'AA_L_10', 'Woreda 10', 10586, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '5ba614a1-6141-4f55-8f62-51986fc164b9');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('a0462899-e8c8-4248-af7d-b8cfce771c8f', 10642, 'AA_L_10_', 'Ketena 01', 10641, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'c24c451e-fcd4-4702-9641-61a9c800d0ba');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('814f6424-caa2-4b5d-beb2-dad5f4724d71', 10643, 'AA_L_10_', 'Ketena 02', 10641, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'd0587aee-27e3-4e80-829f-72dbbfdeb500');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('e7446bfb-24dc-4613-91b2-bd5d1cefe803', 10644, 'AA_L_10_', 'Ketena 03', 10641, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '787ec381-a4d7-44a7-95c2-5b57fb9ac67e');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('833ff29a-cea7-4166-afb2-92701376c131', 10645, 'AA_L_10_', 'Ketena 04', 10641, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'd0109064-39c0-4648-928f-b1d52d739d02');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('89ec4468-f3b4-4ef3-a255-a065259dc630', 10646, 'AA_L_10_', 'Ketena 05', 10641, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '647c5803-9887-4d0e-9a3c-449253e042e5');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('93bdd8ff-17a2-4a17-8be5-317c5791c163', 10647, 'AA_NSL', 'Nifas Silk Lafto', 10001, 
 'S', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '4f9d3ef7-9ff1-4456-b48e-07783aba358c');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('0b11d3fa-fa60-4eb1-9078-cc6b55fbc547', 10648, 'AA_NSL_0', 'Woreda 1', 10647, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '173b5781-a664-483d-b45f-ef661491a954');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('33b680b3-e927-4a67-adb4-ae17fac7c21c', 10649, 'AA_NSL_0', 'Ketena 01', 10648, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '1a42ef43-7bfc-4b49-9bd5-38f25ad78efc');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('003e198e-a137-47c5-8063-1b1dc3afbf6b', 10650, 'AA_NSL_0', 'Ketena 02', 10648, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '933d1baa-1da4-4b11-98e7-d9a057a137fa');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d9b13471-2f82-4d6c-afbf-d29b7e708dca', 10651, 'AA_NSL_0', 'Ketena 03', 10648, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'fa94f8bd-b7b4-41bf-a133-de1ab944d30b');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('edd83788-1b5f-4205-a2d8-ecf32e69b934', 10652, 'AA_NSL_0', 'Ketena 04', 10648, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'f1b22f1d-d5e1-4602-99a7-150a6a2b99ec');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ca3201f0-2374-49bf-85b5-76e1eb92799c', 10653, 'AA_NSL_0', 'Ketena 05', 10648, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '13b9ed8c-17cc-43c8-b03c-47c96b0f075d');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('7ad8c461-7518-4d7a-b236-3e15281bd53d', 10654, 'AA_NSL_0', 'Woreda 2', 10647, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'a5568dda-556a-44fb-b551-61bc5bcb360e');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('b303719d-fa5a-4b7b-9771-1561c1d9669f', 10655, 'AA_NSL_0', 'Ketena 01', 10654, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '5b2cd470-c558-4112-ad2a-26a77bdc1fd0');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('a1fc1fe4-2761-4d07-b3f5-2eb2d25f5d0e', 10656, 'AA_NSL_0', 'Ketena 02', 10654, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '2cf2a8fc-8ff3-4145-bdac-44a967879d26');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('1310c04f-fa15-4f3b-8e67-0bd87a05cc41', 10657, 'AA_NSL_0', 'Ketena 03', 10654, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '2fb0b2b6-3b00-45d5-97f6-57a0197862e1');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('5777961c-eb29-481e-9e9d-d287654f1ad9', 10658, 'AA_NSL_0', 'Ketena 04', 10654, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '7e3d6b12-0615-43d1-96cc-bc83baa27a70');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('5109f696-64d4-4a34-b235-8367bd0714cd', 10659, 'AA_NSL_0', 'Ketena 05', 10654, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '7e9fe91c-0ac7-4145-9a76-ed85ee0d215c');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('33d387bf-4721-4fae-aa50-4bbcff344dd6', 10660, 'AA_NSL_0', 'Woreda 3', 10647, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'c3d783c0-72fd-4e24-b898-1427c5317501');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('86fe4255-d083-499c-ae4b-b0fd6b710451', 10661, 'AA_NSL_0', 'Ketena 01', 10660, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '1ca77c2b-d2b0-45bc-b0ad-f9f9916ec1b5');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('8cef1b04-21e4-4a49-b181-1a50add02406', 10662, 'AA_NSL_0', 'Ketena 02', 10660, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '023aa576-701e-4be2-a751-433fb0f2149c');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ac7ab747-0bac-4f72-874f-f3fe09ff620a', 10663, 'AA_NSL_0', 'Ketena 03', 10660, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '5ec93f2b-adeb-401e-91c3-f7eb55a9c2ed');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('52356c72-2022-4d02-9a8e-a7d22adb9a84', 10664, 'AA_NSL_0', 'Ketena 04', 10660, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'd035ac7f-fc28-4534-a015-983f809e809f');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('b086d56b-1e3d-4843-bb1c-e306a4e12892', 10665, 'AA_NSL_0', 'Ketena 05', 10660, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '37cff95f-3005-4544-b29c-d10f12dbbb46');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d95aac7c-4f2b-48fb-9cda-6fd30a9c284e', 10666, 'AA_NSL_0', 'Woreda 4', 10647, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '60deaf0c-7811-4487-bcb0-196a1fa4c59a');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('9c6b9663-bced-4525-8a31-c59d2410dbd2', 10667, 'AA_NSL_0', 'Ketena 01', 10666, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '2b882dc6-9464-43c1-8842-28be0ee2a0ee');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('7559ceb6-aea0-4408-9405-38bd6e1dbfcb', 10668, 'AA_NSL_0', 'Ketena 02', 10666, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'b8f85adc-a6e3-427e-8798-4cb8db576176');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('4506e76a-ade9-4d2a-9358-a1738b4499b1', 10669, 'AA_NSL_0', 'Ketena 03', 10666, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '3a708081-e615-4c46-a788-3488745ce8f0');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('bc668c07-30cf-4722-8ba2-703e4364be8b', 10670, 'AA_NSL_0', 'Ketena 04', 10666, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '903da3a3-6d9a-4033-b572-86910f139c29');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('60fe5053-3bf0-466f-8c48-dd42481a16b6', 10671, 'AA_NSL_0', 'Ketena 05', 10666, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'c78d654e-34a5-447f-a322-632d0bd77c83');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('088bd780-823a-4fdd-a510-b1e591c6428c', 10672, 'AA_NSL_0', 'Woreda 5', 10647, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'd1e3066e-9ec5-4997-9283-5fe61549d2bc');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('c1ee72cd-c385-41a4-9eb1-3f0a0becfe4f', 10673, 'AA_NSL_0', 'Ketena 01', 10672, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'c2b34bd1-51cf-4fb2-b356-d81dbca7fa2d');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('aa92f525-d4eb-4751-a6b6-28ad3005648d', 10674, 'AA_NSL_0', 'Ketena 02', 10672, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'c3455945-ca8f-426b-823a-27c4d05e795b');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('c99293a3-9c8d-4b58-a1c9-95f4e5827692', 10675, 'AA_NSL_0', 'Ketena 03', 10672, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '0f4b917a-cb2d-4242-b6ed-73d93f60edc0');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('4a57bd04-fa29-42cd-ac4c-a462768ed199', 10676, 'AA_NSL_0', 'Ketena 04', 10672, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '75b261e1-acf7-4493-86ed-442dbd6ad70c');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('4d107605-3341-4dcf-94a2-1a0ece36ea02', 10677, 'AA_NSL_0', 'Ketena 05', 10672, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '6c1b2b13-52ac-42ef-9258-4f43fb4cb877');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('c6d23443-10ef-43b9-a2da-07bfd73924ad', 10678, 'AA_NSL_0', 'Woreda 6', 10647, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'aec05c3f-c652-4618-b9d2-cb02d164ffc7');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('46a210a0-d608-41b4-8428-e1ea0b5187c8', 10679, 'AA_NSL_0', 'Ketena 01', 10678, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '59b2914e-a348-4c5e-adde-9d45fd512ef7');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('1b93e011-c892-412c-b6f8-0c1b36c76994', 10680, 'AA_NSL_0', 'Ketena 02', 10678, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '31c2378e-3c5f-47bc-a67c-4af5d23925d0');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('7704ee12-5c2f-4324-a829-7cb0c503dcf9', 10681, 'AA_NSL_0', 'Ketena 03', 10678, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '138887c0-b089-46b2-a760-570e5b7514c5');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('96d14282-edc8-425a-85c5-815524e5b300', 10682, 'AA_NSL_0', 'Ketena 04', 10678, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '163b65f1-c164-480a-9f1c-a5afdf13ee2a');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('964c0ed6-43f5-4401-ac8e-3b7ecdaf6712', 10683, 'AA_NSL_0', 'Ketena 05', 10678, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '2774b121-2518-49d5-802d-e8e328310d49');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('0716f69f-bc29-42cf-842c-d2af9ca555ef', 10684, 'AA_NSL_0', 'Woreda 7', 10647, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '52aa7990-12d0-431e-9f42-3349921810e8');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('3cfb9654-794e-4175-a236-248330013a5e', 10685, 'AA_NSL_0', 'Ketena 01', 10684, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '413bc701-6171-4c75-9c60-32bb7e1b33f5');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('4d39a08f-17b2-4552-992d-9578fe8c68b7', 10686, 'AA_NSL_0', 'Ketena 02', 10684, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '6c29dda9-4795-4710-9b26-fc9865f2ebad');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d4e9113e-7b50-42e9-86ce-ce271401854e', 10687, 'AA_NSL_0', 'Ketena 03', 10684, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'cc23a032-4dc0-4819-a284-5f076f8f2a34');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('e66d1d8c-e321-4854-9e6f-6f275259d7c4', 10688, 'AA_NSL_0', 'Ketena 04', 10684, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'ef495dfa-4275-4e6a-83c2-f539af835f2f');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('30b2a253-1919-4bed-a8cb-072524b3adca', 10689, 'AA_NSL_0', 'Ketena 05', 10684, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'e538022f-65e9-4424-9800-900278ba1b27');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('73bee6db-1e73-4a7f-97b6-9341bcf6a87d', 10690, 'AA_NSL_0', 'Woreda 8', 10647, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'bf5361c3-e78a-4ea0-a444-340e8897c2b5');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('6e960ef3-5d3c-46c0-94dc-3c7f9c5ffc73', 10691, 'AA_NSL_0', 'Ketena 01', 10690, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'b66fa6b5-a8e8-440a-b00e-b5a96f0f7978');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('f0320ff0-fe90-4469-a043-efb47c7c1305', 10692, 'AA_NSL_0', 'Ketena 02', 10690, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '860080ce-873e-4fe0-80f4-36f821a8a0aa');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('88d5cd48-c977-467d-a3ce-cf9cfbb263c3', 10693, 'AA_NSL_0', 'Ketena 03', 10690, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '4b5d8db2-761b-4777-af1a-4f3af344c11a');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('cda32d47-af98-4a46-9ceb-239aac3e8687', 10694, 'AA_NSL_0', 'Ketena 04', 10690, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '9620e531-5838-4db7-9712-cb1e8364b170');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('65de5dd5-9f6c-4e8f-be4e-d1b36f59a314', 10695, 'AA_NSL_0', 'Ketena 05', 10690, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '40b93a3b-9f4f-4c14-8619-724e174011a9');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('f28842b5-7ee8-4d01-8079-99415cf0892b', 10696, 'AA_NSL_0', 'Woreda 9', 10647, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'd4360dfe-acae-4009-8790-7d2673671c2b');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('734ad605-cb64-4e11-a96c-f57f08549040', 10697, 'AA_NSL_0', 'Ketena 01', 10696, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '204b931d-2830-4001-a606-08fb3b6c79a1');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('0381e303-de5a-451c-8636-b3b3b2654082', 10698, 'AA_NSL_0', 'Ketena 02', 10696, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '226dc1f4-64dd-4d40-a3e0-8d1093dc7b07');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('9f85a692-a575-40a3-8304-3770f07c34ff', 10699, 'AA_NSL_0', 'Ketena 03', 10696, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '61b74483-bc15-4ab5-9a8d-886e2acc17fc');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('4293f7c3-f624-4123-853e-b11f5d51b4f1', 10700, 'AA_NSL_0', 'Ketena 04', 10696, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '4c705d57-4c45-4141-b351-856fd9fc980f');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('091ec421-0447-443c-a756-fef34605f761', 10701, 'AA_NSL_0', 'Ketena 05', 10696, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '04bcbfa0-22c1-4ac6-8eac-98c5686f3643');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('4db9444e-d476-4f38-a492-50f12beb7583', 10702, 'AA_NSL_1', 'Woreda 10', 10647, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '88775e60-3262-42dd-b196-af66d94f81f5');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('808f4c25-cf00-4a3f-9f9a-534c928b9ec8', 10703, 'AA_NSL_1', 'Ketena 01', 10702, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '063ddb55-833a-4c79-a45d-54d0823a0ef3');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('fa590e0b-a263-4709-941a-1d2e6093f474', 10704, 'AA_NSL_1', 'Ketena 02', 10702, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'aa97f2b8-60cd-4ccc-bd25-fa8dc4c5fa44');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d19a16fd-bbde-466b-8d36-b10bd140ba8f', 10705, 'AA_NSL_1', 'Ketena 03', 10702, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'bab2ab6e-60b8-46db-bbb6-00752ed266a7');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('0e36160c-60d2-4890-9162-b30cb393efc3', 10706, 'AA_NSL_1', 'Ketena 04', 10702, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '27ea2ec1-b417-4526-9a01-8d1f546ed345');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('407226a1-1aac-41f5-8fc8-cda473f3397f', 10707, 'AA_NSL_1', 'Ketena 05', 10702, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '5e13a342-ae4d-4ada-b968-e62fe6f13e8c');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('9bf6ae0c-b5e7-4972-be4b-d6dd084e8fb1', 10708, 'AA_NSL_1', 'Woreda 11', 10647, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'cca63efc-238b-48b7-8f46-aee1bb19558b');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('60bdcca4-6b12-426b-9e5c-0d5d133a8de1', 10709, 'AA_NSL_1', 'Ketena 01', 10708, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'c9c0bb9b-272e-4ebc-8ede-d441af36c55e');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('20a27f84-9cdf-425e-b1e0-b3c3544a3760', 10710, 'AA_NSL_1', 'Ketena 02', 10708, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '0db30467-8a41-4d0f-a78e-9f2d63ab8ab3');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('505caaeb-8d41-4171-9414-127eb5ef1dec', 10711, 'AA_NSL_1', 'Ketena 03', 10708, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '12dbfa7f-ab34-43fa-bcb8-21b8190e01d5');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d62a9db4-ca74-44ec-bf56-7ddd0638c47a', 10712, 'AA_NSL_1', 'Ketena 04', 10708, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'feca6507-a2ce-4235-8441-4d12c14b4486');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('29d62bd5-bbef-4122-a2df-151bd2ec8a49', 10713, 'AA_NSL_1', 'Ketena 05', 10708, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '22e7788c-eb39-47e8-898c-010f0248c1c3');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('fd9d4371-2267-44c5-9500-f7da0c465f4a', 10714, 'AA_NSL_1', 'Woreda 12', 10647, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '854f827b-1847-4488-8ecc-344fdc175e43');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('06372ddf-5cea-41b0-b83b-58c2ce360921', 10715, 'AA_NSL_1', 'Ketena 01', 10714, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'b0a28dca-fada-464b-9fb5-40b39f3820b9');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('92de87f0-a70e-470c-9665-eab7b4aa62c5', 10716, 'AA_NSL_1', 'Ketena 02', 10714, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '894a4b3b-fa52-4bd8-8356-9cb8706bb949');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('e2215134-2932-4345-8d8a-7ac313c64ee3', 10717, 'AA_NSL_1', 'Ketena 03', 10714, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '06045421-52be-4851-83ea-3e0b9180470a');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('74a496f7-871c-4ca7-8249-bc2d574fdf86', 10718, 'AA_NSL_1', 'Ketena 04', 10714, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'e0486e0b-3c46-4f50-8e04-26713ffdb9d7');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('3f93305f-dfac-4c67-9325-3ccab3679679', 10719, 'AA_NSL_1', 'Ketena 05', 10714, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'de7ead80-52a5-45e9-be46-360abe9442c0');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('bd1fa7cb-c73e-4955-aabb-c5039e65e0f6', 10720, 'AA_NSL_1', 'Woreda 13', 10647, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '3e1beb46-ee7c-460a-84e1-95714759d900');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('7a1e55e6-7a82-45e1-80b8-53ed3fc2a7cf', 10721, 'AA_NSL_1', 'Ketena 01', 10720, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '1fe72c05-62e3-4336-9ea0-18a3a24b8807');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('5e7a4068-6500-4b70-b6aa-ebff5fe9088b', 10722, 'AA_NSL_1', 'Ketena 02', 10720, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'eb610451-ab2e-4d31-b3a5-51d6d0325ad2');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('41916455-7499-44c6-be24-0c2b8dc1743d', 10723, 'AA_NSL_1', 'Ketena 03', 10720, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '26543cfd-8ced-40ec-8996-d32ba03d40dd');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('cbe7e485-0612-4ac2-a9b1-0875a4e10b7d', 10724, 'AA_NSL_1', 'Ketena 04', 10720, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '51279cc1-03b9-419f-b3cf-31b7ae12d1ad');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('3d0bfaff-4414-4b08-8014-0259cbd54a19', 10725, 'AA_NSL_1', 'Ketena 05', 10720, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '7a8a0e29-8cbc-4aab-9eb7-4879b5f46116');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('2b7290cd-26f0-4644-b681-398f9faf9af3', 10726, 'AA_NSL_1', 'Woreda 14', 10647, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '2c17a64c-b7a1-409f-91da-f4c54be724c1');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('f9507575-c17e-4238-b761-f72cb32f7383', 10727, 'AA_NSL_1', 'Ketena 01', 10726, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '4d903cbd-69c0-4595-9146-09053757ca57');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('e5f6a1d3-73eb-4a56-ac2f-348053e41880', 10728, 'AA_NSL_1', 'Ketena 02', 10726, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '709b0daa-9710-4961-86ac-c77c18790d37');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('a171803b-0a8f-4e91-a4c1-81efd7b82a9d', 10729, 'AA_NSL_1', 'Ketena 03', 10726, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'd686d218-a498-406e-b7de-b5a6e116bbca');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d814cc71-44c3-42f5-a89b-1e8b5ec24f3c', 10730, 'AA_NSL_1', 'Ketena 04', 10726, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '08dcaec7-d39a-455b-854f-d8a3926210f1');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d4905a92-fd65-4345-ac16-a742435912df', 10731, 'AA_NSL_1', 'Ketena 05', 10726, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '54e19f6a-7be0-4913-838c-ccfb094d1ee2');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('dbf32057-0d95-4ff0-a6ca-d6aecb7f5193', 10732, 'AA_NSL_1', 'Woreda 15', 10647, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '0fe905bc-c61e-4990-af8c-9024b2a69306');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('9ee03b4a-c18d-4b4c-9d5a-a5a4428f7a36', 10733, 'AA_NSL_1', 'Ketena 01', 10732, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '81d34705-12e5-4479-abf8-2d8761a702b0');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('bb912528-d9d2-4d6c-a908-c08f878ac3c0', 10734, 'AA_NSL_1', 'Ketena 02', 10732, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'adfbed85-5742-461a-a02d-4e390e241bc8');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('1877148e-3a50-44d8-abb2-2331f947c2c6', 10735, 'AA_NSL_1', 'Ketena 03', 10732, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '5b9f472c-74b0-4ca6-9607-6d1d7dad0eaf');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('3aad7f7c-0339-4b89-86f2-d07611275311', 10736, 'AA_NSL_1', 'Ketena 04', 10732, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'edf96ffd-515f-48be-be09-e561c7035751');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('10a03575-1dfc-4aa1-b41d-3411d3715d16', 10737, 'AA_NSL_1', 'Ketena 05', 10732, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'fd17dfb8-d07f-4a49-87bd-c6539f4ef051');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('6f6ac536-6375-43ce-aa72-e3ff1c9619d9', 10738, 'AA_Y', 'Yeka', 10001, 
 'S', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'b4aba8b1-06f7-4ee2-9bc0-36da92c98bc7');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('c9213ddc-13d2-4c2a-900a-663f269c8aa6', 10739, 'AA_Y_01', 'Woreda 1', 10738, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '2945a9dc-e010-4da2-8886-f95d67c7399f');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ca7a8164-1a7b-4826-bd6d-e6aaf903bd3b', 10740, 'AA_Y_01_', 'Ketena 01', 10739, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'fcc6a499-3df9-4e1a-93d1-93e61600f3b2');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ad520875-73db-47eb-a0d2-35efd3e484d6', 10741, 'AA_Y_01_', 'Ketena 02', 10739, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '473694ba-b547-4287-90d9-7142ea775ec6');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('7e73043f-6f3f-4940-8500-3204c3d38938', 10742, 'AA_Y_01_', 'Ketena 03', 10739, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '2f89e0d9-2d44-4c27-98ca-afa082e131d8');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('63ff4ed1-dd4d-4639-8b19-0e8bf39908ea', 10743, 'AA_Y_01_', 'Ketena 04', 10739, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'd4fc4390-1de0-4e7b-a9d0-c8329b6e5938');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('461f7fd9-4cef-476d-8f15-655c478bb3f3', 10744, 'AA_Y_01_', 'Ketena 05', 10739, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '1276ad4b-2e85-4cc3-8f2e-0a84ac096e7e');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('4ae6cc6b-712a-426f-82ee-0d23c3df8747', 10745, 'AA_Y_02', 'Woreda 2', 10738, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '1bcb496a-7fa5-4de3-97cc-27ad2c620fdd');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('27dafbe7-df2c-4c3d-bc85-7d0c0a85512d', 10746, 'AA_Y_02_', 'Ketena 01', 10745, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'c96fe95c-8161-4824-b1ee-54044fd7d631');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('0c1662f0-745e-4c0f-aca9-d97f5ab20bc2', 10747, 'AA_Y_02_', 'Ketena 02', 10745, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'd11728a7-e00e-4207-a485-43d57fc2e5d9');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('bdacb6a1-a4e5-458d-be0c-5c9ed1b7b0b9', 10748, 'AA_Y_02_', 'Ketena 03', 10745, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '4b354014-07f7-4152-ad15-26d2b4b91303');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('06714046-1c37-4eae-90b2-8a63058c1dfe', 10749, 'AA_Y_02_', 'Ketena 04', 10745, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '7a501922-0776-42a3-9a37-9d4bf4481447');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('8b7e952b-b51a-4648-a781-017de2770ccf', 10750, 'AA_Y_02_', 'Ketena 05', 10745, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'e6ee5ac0-3954-42e9-912e-c5426fb1f925');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('fc936858-a2ab-4990-aa17-5ef3ed2694c0', 10751, 'AA_Y_03', 'Woreda 3', 10738, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'd90fef4e-35df-4308-9c4c-ba8c8b7bacea');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('b23c387d-3a58-4fba-bf4d-b3fc62dd1780', 10752, 'AA_Y_03_', 'Ketena 01', 10751, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '4bdb73f9-9638-4175-a8b8-c27c1e179045');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('cf863736-88ae-490b-abac-e7e3f11f4714', 10753, 'AA_Y_03_', 'Ketena 02', 10751, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'cfd72ce8-1852-4d8c-81a0-391b3820d492');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('90048ad9-06d9-4ce3-bd6e-4b29502d36f4', 10754, 'AA_Y_03_', 'Ketena 03', 10751, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'c27593d8-70a5-475b-aa37-16ab365d482d');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('816c6936-08c4-4a1f-a4c9-50b13468015f', 10755, 'AA_Y_03_', 'Ketena 04', 10751, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'fa7adfba-2376-4170-86e1-2570007c5233');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d84c1739-ec30-4782-8b6e-f357b6d8ae73', 10756, 'AA_Y_03_', 'Ketena 05', 10751, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '27d558ae-385a-4c6e-8e67-609dfdf619f1');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('8584a6c1-d130-4cb7-9282-c68948ee11aa', 10757, 'AA_Y_04', 'Woreda 4', 10738, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'c1f6e1b4-7767-4383-826b-a5bde68ef408');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('fb24a68f-483f-4ea2-9ff1-18b5ec11ecc1', 10758, 'AA_Y_04_', 'Ketena 01', 10757, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '53aa97cd-046f-40d6-9430-377d3ed6abb7');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('c045600e-b3c1-4953-9090-dfbf653b760d', 10759, 'AA_Y_04_', 'Ketena 02', 10757, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '3f1672f8-095c-4bb7-8e7d-d0a59d1cada9');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('3e78acdb-ae31-4347-aff3-1f764d7f10e3', 10760, 'AA_Y_04_', 'Ketena 03', 10757, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'fd5bec41-90f9-49ed-a1cd-8d0f4e21a909');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('de0dc05d-17ef-4ee4-9d2e-bc1a48f42537', 10761, 'AA_Y_04_', 'Ketena 04', 10757, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '031b5260-fbff-4a19-a1a4-57d3cd4525c4');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('3f5ef82f-713e-4433-8078-10a8079e4f8f', 10762, 'AA_Y_04_', 'Ketena 05', 10757, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'd40f9260-d08c-41cd-98e3-d31f26416aab');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('cdfc05b7-455a-4eaa-880b-11c5d2de2a98', 10763, 'AA_Y_05', 'Woreda 5', 10738, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '9f59fb6b-5175-48ac-b000-8b9ca5ef2ba9');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('80c654df-799e-499d-af11-506427e35710', 10764, 'AA_Y_05_', 'Ketena 01', 10763, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '856c0ae5-938a-4165-92a2-af9622a14f2a');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d92d0772-af0d-4101-8525-a0c4d3c8ed51', 10765, 'AA_Y_05_', 'Ketena 02', 10763, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '26073523-b144-40d5-bf5a-e84b645764ae');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('48faeb51-94d7-44f0-94e8-83e0465c1aa2', 10766, 'AA_Y_05_', 'Ketena 03', 10763, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '72b2aa7f-b234-447f-962e-f2faaea905b8');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('4597d72c-3100-46ac-a324-f5812f48a48e', 10767, 'AA_Y_05_', 'Ketena 04', 10763, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'e8901746-ea2f-40b9-9055-34035803a211');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('891bcec5-8242-4bcf-aab3-e3d7d4373f3c', 10768, 'AA_Y_05_', 'Ketena 05', 10763, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '2d883925-132d-46c2-af97-33e1639f273f');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('74ba776d-8032-47be-b8dc-f19c15a3e5a0', 10769, 'AA_Y_06', 'Woreda 6', 10738, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '4c7a7d43-b480-46aa-89ce-17429d30ac25');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('3b953745-13e3-4902-99ad-372d18e3ed50', 10770, 'AA_Y_06_', 'Ketena 01', 10769, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '3c392cdb-87da-415f-8a71-662de7073341');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('94cd3408-ad02-41a3-b63e-a5b50bc4a70e', 10771, 'AA_Y_06_', 'Ketena 02', 10769, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'b5887a23-4795-4f80-b923-0a6c12e29144');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('fb74c9c7-1701-434b-b21d-9a6bc7b4f1fd', 10772, 'AA_Y_06_', 'Ketena 03', 10769, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '42208f1c-1a0e-44b0-b7ba-a5c27c0eaa51');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('775d67ad-9863-44b3-b0ff-7eb2b20db86a', 10773, 'AA_Y_06_', 'Ketena 04', 10769, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '4c9d0fce-2982-474c-b3ff-d1fc34ba3f40');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('40d07cf3-f054-4f1b-9d81-b2346ff7b18f', 10774, 'AA_Y_06_', 'Ketena 05', 10769, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '6e5cd8ea-dc70-4e35-84c1-b4e1acdab2b4');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('16622a19-1113-4fb6-a840-c8636756caca', 10775, 'AA_Y_07', 'Woreda 7', 10738, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '8efc7b66-bc34-4b05-95c9-b7ff36aa5a98');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('bae1ead1-ef2a-4eda-9673-02738907101e', 10776, 'AA_Y_07_', 'Ketena 01', 10775, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '837e1529-47a9-4b3e-b53e-d7b323b6e7df');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('a15a6c77-3ad7-4b03-bc48-7513a0104a39', 10777, 'AA_Y_07_', 'Ketena 02', 10775, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'd7ef174e-b1e4-42b5-8575-b2c5eeb94d68');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('afadebc9-1459-4cd1-bc1b-662801bd1c5b', 10778, 'AA_Y_07_', 'Ketena 03', 10775, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '09d589a2-7153-435b-9df5-5a11934991e4');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('97762cc6-9ef5-4c28-9bdd-80af0cbe3dd6', 10779, 'AA_Y_07_', 'Ketena 04', 10775, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '32fbabf2-d034-45ff-838c-c20af477442b');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('7da4dd2e-0ecd-48eb-906d-2300717b5388', 10780, 'AA_Y_07_', 'Ketena 05', 10775, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '1fa08b76-d115-4e94-9890-97ba8cdedb35');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('b084b8e5-b5ca-4753-acba-753dbd4bc7b7', 10781, 'AA_Y_08', 'Woreda 8', 10738, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'd167446b-94a1-4607-bebe-e4569c92f7b2');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('37d4b5ae-174a-4c0f-9567-a1a5869c5609', 10782, 'AA_Y_08_', 'Ketena 01', 10781, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '4ff3161c-e33a-4404-a5d9-983c07b711b5');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('69e65ad7-6080-4d14-b82f-7435e3fdaf72', 10783, 'AA_Y_08_', 'Ketena 02', 10781, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '63a5c95d-282f-413d-bc09-8783bd81cb6a');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ade99b0f-bae9-46e9-a9e9-58e3af364741', 10784, 'AA_Y_08_', 'Ketena 03', 10781, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'b6a842e9-d3cd-4449-b67b-0d259f8141cd');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('0f640876-d061-4db0-8c84-50110f62f4b8', 10785, 'AA_Y_08_', 'Ketena 04', 10781, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'ec1b1add-876e-43f0-a2b0-b4cc44b755af');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('c57ea92f-e035-49d2-acce-a056d2d12ba1', 10786, 'AA_Y_08_', 'Ketena 05', 10781, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '14b42da4-fd80-4aa5-9f1a-f2c75fa60d18');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('304f89dc-2314-402b-99cf-6a4faf8be1b1', 10787, 'AA_Y_09', 'Woreda 9', 10738, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'd4effc03-833c-4670-80e5-163a530f3679');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('7dea47d9-cf86-4268-85f3-d6e0ffb03d96', 10788, 'AA_Y_09_', 'Ketena 01', 10787, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '83dbbf17-4c7c-484f-a307-3213add058af');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('e1e5a0a5-d6f0-40eb-848b-d160ec6f778c', 10789, 'AA_Y_09_', 'Ketena 02', 10787, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'dfdeb857-7f0f-4766-9f18-63dd9718deb6');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('fe1b73a8-8290-499d-870f-2f066212552a', 10790, 'AA_Y_09_', 'Ketena 03', 10787, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'a3be5640-77d0-4838-baac-9bdbd76b3d79');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('ffd968f6-7f09-49ce-a205-004e9d922abb', 10791, 'AA_Y_09_', 'Ketena 04', 10787, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '0b721e28-39e3-43df-b632-5062a3a6c507');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('6ed583ce-0fc8-4bd4-936f-51d49d666be1', 10792, 'AA_Y_09_', 'Ketena 05', 10787, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '3335c848-0d43-48dd-a7b0-92830d4d4cfa');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('badf62e8-967f-4731-8eb9-b7e2e1e26c0e', 10793, 'AA_Y_10', 'Woreda 10', 10738, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '2607fb13-9051-413d-91ff-929c7c473e9f');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('eeac7e03-9597-4758-b9d6-0706c6f36c89', 10794, 'AA_Y_10_', 'Ketena 01', 10793, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'b71efcb6-7156-4f03-a955-d4a58064d371');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('b4e5dbc0-e3b7-4bb9-88f2-180c58178417', 10795, 'AA_Y_10_', 'Ketena 02', 10793, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'fb443318-1956-42c9-9b57-9c0e2e9ece49');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('88c1da29-30a8-4611-b245-97ea0abc423f', 10796, 'AA_Y_10_', 'Ketena 03', 10793, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'de309460-9274-445f-bfe4-19ca7c81ce33');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('06e84e8b-5855-4abb-b57e-c32291c7ed44', 10797, 'AA_Y_10_', 'Ketena 04', 10793, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '3764a634-6af5-4600-8a00-aa3a651f20b5');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('e132902d-366e-4efe-883e-6bfe5931336f', 10798, 'AA_Y_10_', 'Ketena 05', 10793, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '3dab2894-70e5-4756-9901-99df742ed3f1');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('512eb13b-9d16-4d82-aaea-078cdfb27566', 10799, 'AA_Y_11', 'Woreda 11', 10738, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '4d756ef7-ef35-4442-abd3-d82e15561c06');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('fd8e9a9c-1f0c-402c-a241-9ea146d1c8eb', 10800, 'AA_Y_11_', 'Ketena 01', 10799, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '73e3788e-efdc-4bb7-9462-2bca467ea313');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('b9079bea-6ecf-49e2-b7e7-e5f2113d9404', 10801, 'AA_Y_11_', 'Ketena 02', 10799, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '224a7f86-4c60-4584-912f-7f1d9cc6bde4');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('d25bb335-32ca-4852-b10d-a542374553f8', 10802, 'AA_Y_11_', 'Ketena 03', 10799, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '67386464-8ec0-4ca3-991a-5379fdc96a2d');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('db585b0f-b03d-4b1b-95d4-12d022fcbb9f', 10803, 'AA_Y_11_', 'Ketena 04', 10799, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'ff36686e-2f90-4bfe-94ca-bcce22958d95');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('84b85241-9e13-4720-9d90-e7355ffe1690', 10804, 'AA_Y_11_', 'Ketena 05', 10799, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'bf4ca37f-dd51-4099-a705-9f89838c32e4');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('bd683bd1-1bbc-471a-995c-09869fad4890', 10805, 'AA_Y_12', 'Woreda 12', 10738, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'dfeadee9-ddf3-40de-ab9f-a988a901ed85');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('6280b6fd-d137-4e4e-993b-4f15398981d2', 10806, 'AA_Y_12_', 'Ketena 01', 10805, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '2c812301-a0f3-45da-a608-0424b0a478b8');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('5134a7a6-1061-4827-af3b-df2e3c431931', 10807, 'AA_Y_12_', 'Ketena 02', 10805, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '54106e28-a23d-4330-9236-d981173af7e7');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('76155e64-f13f-4cbe-9ddb-93a6571dd378', 10808, 'AA_Y_12_', 'Ketena 03', 10805, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '2b973c7a-dfd3-46e7-8cc1-faf151b4b48a');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('2e9589c3-2312-4357-8f62-ae8b4655aafb', 10809, 'AA_Y_12_', 'Ketena 04', 10805, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'e2808465-4fe3-450c-9044-4af2f5c456d0');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('a3c60f07-b8e8-46cb-89fd-bb390da17a0b', 10810, 'AA_Y_12_', 'Ketena 05', 10805, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '3b90b8e1-12c9-499d-af1d-24231d4d2fca');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('bac08a07-f8e8-4fd9-bcba-b8be195e671c', 10811, 'AA_Y_13', 'Woreda 13', 10738, 
 'W', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'd97489a7-a003-4045-b29d-19c13f6db6e9');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('5bca3d1f-08f9-43f5-82a8-b5e9cecf0e65', 10812, 'AA_Y_13_', 'Ketena 01', 10811, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '608ddbc1-bada-4ce5-badd-f2836e2f1dd7');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('0078288c-efb5-42cd-8b3a-04bf17c96167', 10813, 'AA_Y_13_', 'Ketena 02', 10811, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, '65dacdf9-7901-4753-86be-b476e5c76340');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('776e3ba9-1d18-486b-9d71-eecde2093857', 10814, 'AA_Y_13_', 'Ketena 03', 10811, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'bb98b551-2cc8-492f-a76b-455e3ef73c43');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('fc759b7f-53ad-4348-b11d-24bc8c9f2adc', 10815, 'AA_Y_13_', 'Ketena 04', 10811, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'c89e2142-e70a-4cca-9bd5-3f3ca091312d');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('da704387-1b8d-479a-8ff3-4f7bab6c68b4', 10816, 'AA_Y_13_', 'Ketena 05', 10811, 
 'K', CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 
 NULL, NULL, NULL, NULL, 'c80d7492-feb1-4fe7-932d-8f1580dc5a58');

 -- tblHF

 -- Total facilities (one per Woreda): 134
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1000, 'AK01C1', 'Woreda 01 Health Center', 'G', 'C', NULL, 'Address not specified', 10003,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '8bcf31a3-f652-4925-a920-79026258ce75');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1001, 'AK02C1', 'Woreda 02 Health Center', 'G', 'C', NULL, 'Address not specified', 10009,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '9b40a402-0314-4d97-9891-203440ce4ce8');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1002, 'AK03C1', 'Woreda 03 Health Center', 'G', 'C', NULL, 'Address not specified', 10015,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 'a62901ca-b8e0-42aa-92d9-7231cd751607');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1003, 'AK04C1', 'Woreda 04 Health Center', 'G', 'C', NULL, 'Address not specified', 10021,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '30f89f05-aedd-47ee-baae-02d1e32c58e7');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1004, 'AK05C1', 'Woreda 05 Health Center', 'G', 'C', NULL, 'Address not specified', 10027,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '0adf8610-c91e-4d62-b165-9247cb4f38df');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1005, 'AK06C1', 'Woreda 06 Health Center', 'G', 'C', NULL, 'Address not specified', 10033,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 'c3732bbc-cb80-4869-b645-2959febd2c99');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1006, 'AK07C1', 'Woreda 07 Health Center', 'G', 'C', NULL, 'Address not specified', 10039,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '3461f4e1-021d-45e0-b667-73c686e2e236');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1007, 'AK08C1', 'Woreda 08 Health Center', 'G', 'C', NULL, 'Address not specified', 10045,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '94354540-0910-41de-943c-952307b1397a');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1008, 'AK09C1', 'Woreda 09 Health Center', 'G', 'C', NULL, 'Address not specified', 10051,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 'b0aed89a-c4f7-44af-9faa-4167e16c1357');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1009, 'AK10C1', 'Woreda 10 Health Center', 'G', 'C', NULL, 'Address not specified', 10057,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 'de0d20e2-07b3-4c8f-9554-19f16c82bb45');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1010, 'AK11C1', 'Woreda 11 Health Center', 'G', 'C', NULL, 'Address not specified', 10063,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '9d1fd8b9-3418-450e-9fb4-044ca08ecd79');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1011, 'AK12C1', 'Woreda 12 Health Center', 'G', 'C', NULL, 'Address not specified', 10069,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 'a4d2461a-5194-4e15-8bb3-821b8065a1d3');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1012, 'AK13C1', 'Woreda 13 Health Center', 'G', 'C', NULL, 'Address not specified', 10075,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '4a7b03d7-884b-405c-aceb-b3e28971be64');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1013, 'AK14C1', 'Woreda 14 Health Center', 'G', 'C', NULL, 'Address not specified', 10081,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '1bc4a667-206a-400a-baf7-9c659d132d7c');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1014, 'AK01C1', 'Woreda 01 Health Center', 'G', 'C', NULL, 'Address not specified', 10088,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 'a8d0518d-e0a0-4809-b0bd-cd7b5eeb7566');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1015, 'AK02C1', 'Woreda 02 Health Center', 'G', 'C', NULL, 'Address not specified', 10094,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '8af52ed5-976a-4e7f-a705-a12a1708b603');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1016, 'AK03C1', 'Woreda 03 Health Center', 'G', 'C', NULL, 'Address not specified', 10100,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 'd676647e-3ed6-4a55-bbc5-871bd989957d');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1017, 'AK04C1', 'Woreda 04 Health Center', 'G', 'C', NULL, 'Address not specified', 10106,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '99a8c739-9197-4e98-abe1-a30ac303e3ed');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1018, 'AK05C1', 'Woreda 05 Health Center', 'G', 'C', NULL, 'Address not specified', 10112,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '46070465-21bd-4f58-b864-2fe3c07122d7');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1019, 'AK06C1', 'Woreda 06 Health Center', 'G', 'C', NULL, 'Address not specified', 10118,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '420f8393-0709-423b-9865-5faa8ce870cf');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1020, 'AK07C1', 'Woreda 07 Health Center', 'G', 'C', NULL, 'Address not specified', 10124,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '53bc83ef-c1b5-4947-8f2f-8b819d7951db');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1021, 'AK08C1', 'Woreda 08 Health Center', 'G', 'C', NULL, 'Address not specified', 10130,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 'd5565015-1eef-46e2-a846-ed0d7de2f262');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1022, 'AK09C1', 'Woreda 09 Health Center', 'G', 'C', NULL, 'Address not specified', 10136,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 'd0fb4593-7230-4746-898e-d1500ded59bc');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1023, 'AK10C1', 'Woreda 10 Health Center', 'G', 'C', NULL, 'Address not specified', 10142,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '9c7966d8-6e66-4c5d-829a-f38f620fad49');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1024, 'AK11C1', 'Woreda 11 Health Center', 'G', 'C', NULL, 'Address not specified', 10148,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 'ce2485f6-eb06-44c2-803b-cd9d7b16ce5a');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1025, 'AK12C1', 'Woreda 12 Health Center', 'G', 'C', NULL, 'Address not specified', 10154,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 'f5991da9-93e0-4404-adf7-3dc316a5b219');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1026, 'AK13C1', 'Woreda 13 Health Center', 'G', 'C', NULL, 'Address not specified', 10160,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '3ed30c9c-1dd3-409a-9726-e5920eb7fd6a');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1027, 'AR01C1', 'Woreda 01 Health Center', 'G', 'C', NULL, 'Address not specified', 10167,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 'e6554b79-cd59-4166-b61a-970b9bc384c1');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1028, 'AR02C1', 'Woreda 02 Health Center', 'G', 'C', NULL, 'Address not specified', 10173,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 'f64154e2-c792-4c0b-b391-596b3711420f');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1029, 'AR03C1', 'Woreda 03 Health Center', 'G', 'C', NULL, 'Address not specified', 10179,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '275f6018-cad0-486f-8234-67a6f448887b');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1030, 'AR04C1', 'Woreda 04 Health Center', 'G', 'C', NULL, 'Address not specified', 10185,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '6a5636d7-4930-4890-a378-a818e751e8da');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1031, 'AR05C1', 'Woreda 05 Health Center', 'G', 'C', NULL, 'Address not specified', 10191,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '2b25148b-41ba-4088-a45e-8a4f3273a527');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1032, 'AR06C1', 'Woreda 06 Health Center', 'G', 'C', NULL, 'Address not specified', 10197,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 'e20155f1-a09a-4595-94f1-731fc7efcbae');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1033, 'AR07C1', 'Woreda 07 Health Center', 'G', 'C', NULL, 'Address not specified', 10203,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '60cfb9b3-e798-486a-a547-a1f2ee682490');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1034, 'AR08C1', 'Woreda 08 Health Center', 'G', 'C', NULL, 'Address not specified', 10209,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 'bdb27739-cca3-48de-83be-c95a1c73dd64');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1035, 'AR09C1', 'Woreda 09 Health Center', 'G', 'C', NULL, 'Address not specified', 10215,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '45f40ac9-744d-4c85-8eaa-b5a08425d995');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1036, 'AR10C1', 'Woreda 10 Health Center', 'G', 'C', NULL, 'Address not specified', 10221,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '60269d4f-f0ab-4afc-95e9-4e4e4884232a');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1037, 'BO01C1', 'Woreda 01 Health Center', 'G', 'C', NULL, 'Address not specified', 10228,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '62d8c7e0-cc93-4b44-99e7-8e625471bb0f');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1038, 'BO02C1', 'Woreda 02 Health Center', 'G', 'C', NULL, 'Address not specified', 10234,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 'da64499a-6a85-48a0-ad67-3a4178996fd9');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1039, 'BO03C1', 'Woreda 03 Health Center', 'G', 'C', NULL, 'Address not specified', 10240,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '7c26870e-03f0-4ea0-87b8-3735ebc34403');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1040, 'BO04C1', 'Woreda 04 Health Center', 'G', 'C', NULL, 'Address not specified', 10246,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '881f380c-2ff9-4696-a26e-0e311a0f1f60');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1041, 'BO05C1', 'Woreda 05 Health Center', 'G', 'C', NULL, 'Address not specified', 10252,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 'd75d2969-b0c3-4643-bdcf-b414f922e18f');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1042, 'BO06C1', 'Woreda 06 Health Center', 'G', 'C', NULL, 'Address not specified', 10258,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '20cb2f91-a441-4e11-934a-7d85fdd67c95');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1043, 'BO07C1', 'Woreda 07 Health Center', 'G', 'C', NULL, 'Address not specified', 10264,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '7a5de96e-2e13-4493-8099-134dbe1a7399');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1044, 'BO08C1', 'Woreda 08 Health Center', 'G', 'C', NULL, 'Address not specified', 10270,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '383f6b4d-09ec-46d1-ad43-dd7830531d77');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1045, 'BO09C1', 'Woreda 09 Health Center', 'G', 'C', NULL, 'Address not specified', 10276,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '2937beb8-92f7-4993-9dcb-633a8e82c7f0');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1046, 'BO10C1', 'Woreda 10 Health Center', 'G', 'C', NULL, 'Address not specified', 10282,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 'd99406bd-8a09-4096-b0cb-49f70ef85f7b');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1047, 'BO11C1', 'Woreda 11 Health Center', 'G', 'C', NULL, 'Address not specified', 10288,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 'bf9f00c5-20ad-4741-baca-5298c8409227');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1048, 'BO12C1', 'Woreda 12 Health Center', 'G', 'C', NULL, 'Address not specified', 10294,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '0c6bb4d2-e03b-4c08-929e-a5e1f57c9484');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1049, 'BO13C1', 'Woreda 13 Health Center', 'G', 'C', NULL, 'Address not specified', 10300,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 'f6b3260e-701f-4c39-b39c-b5ee6a84d7a0');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1050, 'BO14C1', 'Woreda 14 Health Center', 'G', 'C', NULL, 'Address not specified', 10306,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '4d8ceb29-75ca-40fd-a747-570d51939709');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1051, 'GU01C1', 'Woreda 01 Health Center', 'G', 'C', NULL, 'Address not specified', 10313,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '4dec3913-b3e9-455f-8fca-b628deca597f');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1052, 'GU02C1', 'Woreda 02 Health Center', 'G', 'C', NULL, 'Address not specified', 10319,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '1e017998-7a7a-4c20-87f2-f404b9980ac1');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1053, 'GU03C1', 'Woreda 03 Health Center', 'G', 'C', NULL, 'Address not specified', 10325,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 'a5fe69ae-3c00-4e42-b2bf-3e22290e6cca');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1054, 'GU04C1', 'Woreda 04 Health Center', 'G', 'C', NULL, 'Address not specified', 10331,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '7f42b2ac-cc7e-4bb2-8ba7-e1af3d964eaa');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1055, 'GU05C1', 'Woreda 05 Health Center', 'G', 'C', NULL, 'Address not specified', 10337,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '38b669b0-27ef-4884-baed-cf27fe5828ab');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1056, 'GU06C1', 'Woreda 06 Health Center', 'G', 'C', NULL, 'Address not specified', 10343,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 'ebf83545-9782-42cc-902c-2ab2f99344fb');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1057, 'GU07C1', 'Woreda 07 Health Center', 'G', 'C', NULL, 'Address not specified', 10349,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 'fea24028-5a25-4fb9-aa26-1626be82584a');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1058, 'GU08C1', 'Woreda 08 Health Center', 'G', 'C', NULL, 'Address not specified', 10355,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 'fb2e7b8a-b5b3-4cf9-98b5-9861aac81073');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1059, 'GU09C1', 'Woreda 09 Health Center', 'G', 'C', NULL, 'Address not specified', 10361,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 'ac0d7f4b-6ce5-4400-844e-c03ee04de87d');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1060, 'GU10C1', 'Woreda 10 Health Center', 'G', 'C', NULL, 'Address not specified', 10367,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 'a0be05ea-4cb4-435c-8f43-f2e2f51ad7fa');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1061, 'KI01C1', 'Woreda 01 Health Center', 'G', 'C', NULL, 'Address not specified', 10374,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '57a2a993-c8b7-4a57-bb48-1e986f5cfba4');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1062, 'KI02C1', 'Woreda 02 Health Center', 'G', 'C', NULL, 'Address not specified', 10380,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '74863744-eff8-4ad6-a56f-087222050ddf');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1063, 'KI03C1', 'Woreda 03 Health Center', 'G', 'C', NULL, 'Address not specified', 10386,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 'f192be15-8860-40b6-b1bc-3c6d52f496bb');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1064, 'KI04C1', 'Woreda 04 Health Center', 'G', 'C', NULL, 'Address not specified', 10392,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 'eff8cf0b-c1a1-4c98-a976-148d93171a2f');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1065, 'KI05C1', 'Woreda 05 Health Center', 'G', 'C', NULL, 'Address not specified', 10398,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '3224e163-0bce-4f4b-930b-b44249197fef');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1066, 'KI06C1', 'Woreda 06 Health Center', 'G', 'C', NULL, 'Address not specified', 10404,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 'a1c340f2-c8a9-4cc0-95fb-262756623140');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1067, 'KI07C1', 'Woreda 07 Health Center', 'G', 'C', NULL, 'Address not specified', 10410,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '03a88920-a7a3-43ae-8c74-ce7a96014b38');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1068, 'KI08C1', 'Woreda 08 Health Center', 'G', 'C', NULL, 'Address not specified', 10416,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '7fb83dea-bab3-45c9-942a-a6eba85139e2');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1069, 'KI09C1', 'Woreda 09 Health Center', 'G', 'C', NULL, 'Address not specified', 10422,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '82410835-fb4f-48f1-a27f-3ec5a16ab105');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1070, 'KI10C1', 'Woreda 10 Health Center', 'G', 'C', NULL, 'Address not specified', 10428,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '00c46239-33bd-4ec4-be7a-4eb66c3b5a80');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1071, 'KK01C1', 'Woreda 01 Health Center', 'G', 'C', NULL, 'Address not specified', 10435,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 'e2b0e558-45a0-446a-9dd4-9e85e56ee795');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1072, 'KK02C1', 'Woreda 02 Health Center', 'G', 'C', NULL, 'Address not specified', 10441,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '3c457365-563f-49c3-9f8e-9ad51b5238da');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1073, 'KK03C1', 'Woreda 03 Health Center', 'G', 'C', NULL, 'Address not specified', 10447,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '1757c17c-0870-4d33-91f2-dcab8ad66f1f');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1074, 'KK04C1', 'Woreda 04 Health Center', 'G', 'C', NULL, 'Address not specified', 10453,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 'a67bc862-4ede-4260-89d6-844f22719778');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1075, 'KK05C1', 'Woreda 05 Health Center', 'G', 'C', NULL, 'Address not specified', 10459,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '35a1009a-346c-49bb-b72c-8085b869147a');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1076, 'KK06C1', 'Woreda 06 Health Center', 'G', 'C', NULL, 'Address not specified', 10465,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '3be04baf-f1a7-4ca4-9f89-c07013a65f97');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1077, 'KK07C1', 'Woreda 07 Health Center', 'G', 'C', NULL, 'Address not specified', 10471,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '77f64ee8-66da-43f1-9b64-4700971fe4f2');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1078, 'KK08C1', 'Woreda 08 Health Center', 'G', 'C', NULL, 'Address not specified', 10477,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '8cc2c02c-d671-4859-8e75-b7d5e9c4a6e5');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1079, 'KK09C1', 'Woreda 09 Health Center', 'G', 'C', NULL, 'Address not specified', 10483,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '03e900a7-c125-47f5-bd12-62dd86578fb0');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1080, 'KK10C1', 'Woreda 10 Health Center', 'G', 'C', NULL, 'Address not specified', 10489,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 'f680c437-f403-4797-81d4-6741f2d7889f');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1081, 'KK11C1', 'Woreda 11 Health Center', 'G', 'C', NULL, 'Address not specified', 10495,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '3500609a-5d59-46ac-8b61-0e9633bb43a1');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1082, 'LK01C1', 'Woreda 01 Health Center', 'G', 'C', NULL, 'Address not specified', 10502,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '076176b0-1097-467f-b3c1-8cbc210b8ac4');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1083, 'LK02C1', 'Woreda 02 Health Center', 'G', 'C', NULL, 'Address not specified', 10508,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '7df5307c-ac80-4452-9e34-81c7f54c312c');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1084, 'LK03C1', 'Woreda 03 Health Center', 'G', 'C', NULL, 'Address not specified', 10514,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '72c67adf-38dd-480f-8178-a57005a75b7e');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1085, 'LK04C1', 'Woreda 04 Health Center', 'G', 'C', NULL, 'Address not specified', 10520,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '494e9970-0cfa-42d7-83e7-9a7b876e108e');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1086, 'LK05C1', 'Woreda 05 Health Center', 'G', 'C', NULL, 'Address not specified', 10526,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '70cd05c0-e21e-44f1-9214-639093a9fc33');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1087, 'LK06C1', 'Woreda 06 Health Center', 'G', 'C', NULL, 'Address not specified', 10532,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '58defe5a-df5b-49b6-898c-1ba758557908');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1088, 'LK07C1', 'Woreda 07 Health Center', 'G', 'C', NULL, 'Address not specified', 10538,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 'dc20854f-d507-4769-ab41-0defd0bb2daa');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1089, 'LK08C1', 'Woreda 08 Health Center', 'G', 'C', NULL, 'Address not specified', 10544,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '983bd547-3f92-4ffc-961d-7c3739c071ae');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1090, 'LK09C1', 'Woreda 09 Health Center', 'G', 'C', NULL, 'Address not specified', 10550,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 'bf622927-1970-429f-8a39-c7f7a2dc7129');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1091, 'LK10C1', 'Woreda 10 Health Center', 'G', 'C', NULL, 'Address not specified', 10556,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '52d7758d-3b84-4427-802a-1f5425cd4ba2');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1092, 'LK11C1', 'Woreda 11 Health Center', 'G', 'C', NULL, 'Address not specified', 10562,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 'e942faa9-74eb-41e9-a5a0-fc4129353646');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1093, 'LK12C1', 'Woreda 12 Health Center', 'G', 'C', NULL, 'Address not specified', 10568,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 'bd08d614-e8cc-4623-ae21-349f1e6f73ef');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1094, 'LK13C1', 'Woreda 13 Health Center', 'G', 'C', NULL, 'Address not specified', 10574,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '3cfad607-9215-4eb7-a152-f9cba5ca96fa');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1095, 'LK14C1', 'Woreda 14 Health Center', 'G', 'C', NULL, 'Address not specified', 10580,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 'ad8e2a32-f08d-4219-b090-d9991eeaa7bd');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1096, 'LI01C1', 'Woreda 01 Health Center', 'G', 'C', NULL, 'Address not specified', 10587,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 'cddfa767-f3a4-4b0e-9124-71cb3bd54d8c');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1097, 'LI02C1', 'Woreda 02 Health Center', 'G', 'C', NULL, 'Address not specified', 10593,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 'e916642f-5ae2-4ad6-8b03-3a0d01841a92');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1098, 'LI03C1', 'Woreda 03 Health Center', 'G', 'C', NULL, 'Address not specified', 10599,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '40b07a7b-c27f-4f6c-8611-ba942b606183');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1099, 'LI04C1', 'Woreda 04 Health Center', 'G', 'C', NULL, 'Address not specified', 10605,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '4789a60a-6d34-4850-b383-a0bdb155105f');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1100, 'LI05C1', 'Woreda 05 Health Center', 'G', 'C', NULL, 'Address not specified', 10611,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '5ab858ec-14fe-4037-8230-924fe7ef52ae');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1101, 'LI06C1', 'Woreda 06 Health Center', 'G', 'C', NULL, 'Address not specified', 10617,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '3bbae9ee-b9d1-4982-9676-f7ccd080def8');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1102, 'LI07C1', 'Woreda 07 Health Center', 'G', 'C', NULL, 'Address not specified', 10623,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 'adb500ba-fbfd-4479-b348-cb921b41ee0b');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1103, 'LI08C1', 'Woreda 08 Health Center', 'G', 'C', NULL, 'Address not specified', 10629,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 'ad89a43c-3d50-46ee-9c59-216d0a82af9d');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1104, 'LI09C1', 'Woreda 09 Health Center', 'G', 'C', NULL, 'Address not specified', 10635,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '6bf00914-3d1c-48e2-945b-0293a97ed488');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1105, 'LI10C1', 'Woreda 10 Health Center', 'G', 'C', NULL, 'Address not specified', 10641,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '5440d118-44e0-4fe9-b978-9568930f1321');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1106, 'NS01C1', 'Woreda 01 Health Center', 'G', 'C', NULL, 'Address not specified', 10648,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '657f8374-584a-45e6-82f5-944d5813375d');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1107, 'NS02C1', 'Woreda 02 Health Center', 'G', 'C', NULL, 'Address not specified', 10654,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 'a5db16f3-b3d7-4010-b78f-4fbd54fe1a10');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1108, 'NS03C1', 'Woreda 03 Health Center', 'G', 'C', NULL, 'Address not specified', 10660,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '8adb1854-2757-4ce8-8248-fb72860cd8f2');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1109, 'NS04C1', 'Woreda 04 Health Center', 'G', 'C', NULL, 'Address not specified', 10666,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 'a4530402-4703-45b0-aa8a-7b1e4800421d');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1110, 'NS05C1', 'Woreda 05 Health Center', 'G', 'C', NULL, 'Address not specified', 10672,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 'da031741-9256-48c8-934a-aba164688477');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1111, 'NS06C1', 'Woreda 06 Health Center', 'G', 'C', NULL, 'Address not specified', 10678,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 'e5819d9e-8527-4c53-801c-4632001dae0c');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1112, 'NS07C1', 'Woreda 07 Health Center', 'G', 'C', NULL, 'Address not specified', 10684,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '8a6c869d-2444-445d-a296-48ca17bec365');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1113, 'NS08C1', 'Woreda 08 Health Center', 'G', 'C', NULL, 'Address not specified', 10690,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '48261deb-785c-460d-a5e7-bf931d5060ee');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1114, 'NS09C1', 'Woreda 09 Health Center', 'G', 'C', NULL, 'Address not specified', 10696,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '218ca8ff-baae-49ee-9469-98323a01965c');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1115, 'NS10C1', 'Woreda 10 Health Center', 'G', 'C', NULL, 'Address not specified', 10702,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 'c66e8425-15bf-4d9d-b7c0-a57a973b250b');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1116, 'NS11C1', 'Woreda 11 Health Center', 'G', 'C', NULL, 'Address not specified', 10708,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 'f58733e6-46a8-4eb3-b4bc-139413e60005');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1117, 'NS12C1', 'Woreda 12 Health Center', 'G', 'C', NULL, 'Address not specified', 10714,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 'd4c3e973-d56d-46b4-99f4-249cd3e984b4');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1118, 'NS13C1', 'Woreda 13 Health Center', 'G', 'C', NULL, 'Address not specified', 10720,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 'd2e76711-e009-4eed-afa6-f6f81f71ffca');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1119, 'NS14C1', 'Woreda 14 Health Center', 'G', 'C', NULL, 'Address not specified', 10726,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '44f792d8-2ed3-4871-a571-3ee31840b4b8');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1120, 'NS15C1', 'Woreda 15 Health Center', 'G', 'C', NULL, 'Address not specified', 10732,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '9ff7d4ce-4e88-4a8e-85c2-397415f71561');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1121, 'YE01C1', 'Woreda 01 Health Center', 'G', 'C', NULL, 'Address not specified', 10739,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '0bd40c28-4a61-462e-9499-8570d6c49543');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1122, 'YE02C1', 'Woreda 02 Health Center', 'G', 'C', NULL, 'Address not specified', 10745,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '5050f549-b0a6-4760-b691-3c6cc87acece');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1123, 'YE03C1', 'Woreda 03 Health Center', 'G', 'C', NULL, 'Address not specified', 10751,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '82d49fa0-e591-4167-8450-9d92a0640b37');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1124, 'YE04C1', 'Woreda 04 Health Center', 'G', 'C', NULL, 'Address not specified', 10757,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 'a2292936-831d-4eb4-9f1d-69a739ac76e7');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1125, 'YE05C1', 'Woreda 05 Health Center', 'G', 'C', NULL, 'Address not specified', 10763,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '35c9dd60-003d-4e94-904c-4ab3aabbd3d2');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1126, 'YE06C1', 'Woreda 06 Health Center', 'G', 'C', NULL, 'Address not specified', 10769,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '7d36a541-8804-4f6e-9cda-cba5f93e37cf');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1127, 'YE07C1', 'Woreda 07 Health Center', 'G', 'C', NULL, 'Address not specified', 10775,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '7475d853-eb52-4226-95d1-8b9506dc5020');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1128, 'YE08C1', 'Woreda 08 Health Center', 'G', 'C', NULL, 'Address not specified', 10781,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 'd138a247-c615-4b0a-b6d1-8252faf39f33');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1129, 'YE09C1', 'Woreda 09 Health Center', 'G', 'C', NULL, 'Address not specified', 10787,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '9cb2a376-b0e0-4348-9d5e-f76d38292f4e');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1130, 'YE10C1', 'Woreda 10 Health Center', 'G', 'C', NULL, 'Address not specified', 10793,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '55adf1b5-63fd-49a4-a1eb-1bda28bb107b');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1131, 'YE11C1', 'Woreda 11 Health Center', 'G', 'C', NULL, 'Address not specified', 10799,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 'f017f35f-78fd-49c9-8836-303fd5eaf3ac');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1132, 'YE12C1', 'Woreda 12 Health Center', 'G', 'C', NULL, 'Address not specified', 10805,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, 'cebacddc-c52d-4e54-8a88-2b432fd9312b');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1133, 'YE13C1', 'Woreda 13 Health Center', 'G', 'C', NULL, 'Address not specified', 10811,
'', '', '', 'O', NULL, NULL, '', 0::boolean,
CAST(N'2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '905fd33b-1c42-4810-ad56-d6386aa7a23b');

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

