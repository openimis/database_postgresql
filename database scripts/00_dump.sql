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
INSERT INTO "tblGender" ("Code", "Gender", "AltLanguage", "SortOrder") VALUES (N'O', N'Other', NULL, 3);

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
INSERT INTO "tblLocations" ("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID") VALUES ('1', 1, N'R1', N'Region 1', NULL, N'R', CAST(N'2017-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 2, NULL, NULL, NULL, NULL, N'75250515-40d7-4c77-bafe-a2c65ffc5a72');
INSERT INTO "tblLocations" ("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID") VALUES ('17', 17, N'R1D1', N'District 1', 1, N'D', CAST(N'2017-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 2, NULL, NULL, NULL, NULL, N'5345ef14-12ab-4e98-a07c-1e08d7105df4');
INSERT INTO "tblLocations" ("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID") VALUES ('34', 34, N'R1D1M1', N'Achi', 17, N'W', CAST(N'2017-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 2, NULL, NULL, NULL, NULL, N'e50da11b-3e50-483c-846b-0991c13c0935');
INSERT INTO "tblLocations" ("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID") VALUES ('35', 35, N'R1D1M1V1', N'Rachla', 34, N'V', CAST(N'2017-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 2, NULL, NULL, NULL, NULL, N'8ed4eb0d-61ae-4022-8b4c-3076a619f957');

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

