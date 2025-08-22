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
-- 1 City, 11 SubCities, 134 Woredas, 670 Ketenas
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('1',  1,   'AA',   'Addis Ababa',   NULL,   
 'C',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL, N'5345ef14-12ab-4e98-a07c-1e08d7105df4');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('2',  2,   'AA_AK',   'Addis Ketema',  1,   
 'S',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL, N'e50da11b-3e50-483c-846b-0991c13c0935');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('3',  3,   'AA_AK_01',   'Woreda 1',  2,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'8ed4eb0d-61ae-4022-8b4c-3076a619f957');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('4',  4,   'AA_AK_01',   'Ketena 01',  3,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'691083ca-8fd0-4243-b792-0fe021bc4ae9');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('5',  5,   'AA_AK_01',   'Ketena 02',  3,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'5c9428cf-1987-4f8c-a2fa-8fb752811744');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('6',  6,   'AA_AK_01',   'Ketena 03',  3,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'332a0dd6-6177-4906-98c3-3d42919464cd');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('7',  7,   'AA_AK_01',   'Ketena 04',  3,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'46d7252f-5865-43e5-a013-407343bdf1f7');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('8',  8,   'AA_AK_01',   'Ketena 05',  3,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'ae749fd3-de35-4d80-80c4-2f96060fbe5b');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('9',  9,   'AA_AK_02',   'Woreda 2',  2,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'2df975e7-ff0a-4903-9ad4-d82dd0e4a11b');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('10',  10,   'AA_AK_02',   'Ketena 01',  9,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'66005631-e46c-4d23-9a01-6e75b87243b8');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('11',  11,   'AA_AK_02',   'Ketena 02',  9,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'b898ee26-406b-448e-be54-19e60ea0da25');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('12',  12,   'AA_AK_02',   'Ketena 03',  9,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'b8b0e7de-11cf-46be-8dbb-5d95fa861a81');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('13',  13,   'AA_AK_02',   'Ketena 04',  9,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'992816e2-39e7-463f-9242-97b03dee31b5');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('14',  14,   'AA_AK_02',   'Ketena 05',  9,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'07aff311-b8e1-4439-994c-b83bfca75b6c');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('15',  15,   'AA_AK_03',   'Woreda 3',  2,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'610317e2-629f-4fc0-83c8-9adb576b95b2');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('16',  16,   'AA_AK_03',   'Ketena 01',  15,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'8d307f12-d7f0-49c4-829b-f1bca4312781');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('17',  17,   'AA_AK_03',   'Ketena 02',  15,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'5dd7e1cc-b3f4-4832-8420-bbe70505f4fc');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('18',  18,   'AA_AK_03',   'Ketena 03',  15,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'4c1215c6-8d00-4eb9-9295-607a6cf524f7');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('19',  19,   'AA_AK_03',   'Ketena 04',  15,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'1c0102e0-426b-414a-80d6-6b96ee036a3f');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('20',  20,   'AA_AK_03',   'Ketena 05',  15,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'535e51fb-89e0-45fd-a276-97f141462d89');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('21',  21,   'AA_AK_04',   'Woreda 4',  2,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'9fcc9e92-4b50-41b2-975c-559cc7140b51');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('22',  22,   'AA_AK_04',   'Ketena 01',  21,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'3a884966-bb74-443f-816c-d9131893ea01');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('23',  23,   'AA_AK_04',   'Ketena 02',  21,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'931bf5ca-c19e-4cfc-914b-34018464e62d');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('24',  24,   'AA_AK_04',   'Ketena 03',  21,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'cdbee36a-d0e1-4ff9-b4d6-3c56f620002a');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('25',  25,   'AA_AK_04',   'Ketena 04',  21,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'558d673c-1061-411b-a7d8-665a0d580b50');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('26',  26,   'AA_AK_04',   'Ketena 05',  21,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'a8c7dd0f-feb0-41bc-915d-a6a92f69ff8d');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('27',  27,   'AA_AK_05',   'Woreda 5',  2,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'65a8f16d-c11c-48ff-830b-8b447905dfa5');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('28',  28,   'AA_AK_05',   'Ketena 01',  27,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'f8cf1d3b-7599-443c-bf1d-c43681cebb57');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('29',  29,   'AA_AK_05',   'Ketena 02',  27,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'd8fcb84b-93df-40bf-b949-376edc953b67');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('30',  30,   'AA_AK_05',   'Ketena 03',  27,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'f2e1d58b-de64-47f5-ad77-78f3d3e4ae35');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('31',  31,   'AA_AK_05',   'Ketena 04',  27,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'f5e0dc9a-a7e8-48f7-8a44-ff5f4f597e4b');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('32',  32,   'AA_AK_05',   'Ketena 05',  27,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'fb742d5b-f489-4323-9619-661a19b8fce1');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('33',  33,   'AA_AK_06',   'Woreda 6',  2,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'87dc84f6-a15a-4849-862e-09bbf93e7587');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('34',  34,   'AA_AK_06',   'Ketena 01',  33,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'93e34296-a8cd-4cda-9ff3-553320454b59');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('35',  35,   'AA_AK_06',   'Ketena 02',  33,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'1fdf921b-e9cf-417b-861c-0d2b8730d4de');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('36',  36,   'AA_AK_06',   'Ketena 03',  33,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'4f699727-e84e-4979-88c7-deb7ebc4d801');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('37',  37,   'AA_AK_06',   'Ketena 04',  33,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'0bdf24f4-b716-45af-bf56-42524e58975b');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('38',  38,   'AA_AK_06',   'Ketena 05',  33,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'abbf04fa-0f7e-4c37-91d5-0015045ede54');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('39',  39,   'AA_AK_07',   'Woreda 7',  2,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'8b1bb487-b9dc-44db-bc69-dd97c3a1bad9');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('40',  40,   'AA_AK_07',   'Ketena 01',  39,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'1d2b10b2-ec39-4a86-b771-87e976fe5a81');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('41',  41,   'AA_AK_07',   'Ketena 02',  39,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'4f22447a-e036-4c13-b86e-8d3adf8645fb');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('42',  42,   'AA_AK_07',   'Ketena 03',  39,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'fcdf1a01-9fdc-47ea-8b53-86948ff5cffa');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('43',  43,   'AA_AK_07',   'Ketena 04',  39,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'18f0cced-6415-40d9-ba0f-56ce7058c381');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('44',  44,   'AA_AK_07',   'Ketena 05',  39,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'da865992-0250-4f42-906d-950a46ace8c5');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('45',  45,   'AA_AK_08',   'Woreda 8',  2,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'4ff8b2db-7aec-4935-867d-227fee04d254');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('46',  46,   'AA_AK_08',   'Ketena 01',  45,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'255b52e9-e026-422c-942f-9601dd56cc63');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('47',  47,   'AA_AK_08',   'Ketena 02',  45,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'a2686836-0032-4fc0-9ed9-aec0ff060b6e');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('48',  48,   'AA_AK_08',   'Ketena 03',  45,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'ef6ff83a-2383-4f00-b866-3007a00c280a');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('49',  49,   'AA_AK_08',   'Ketena 04',  45,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'a2a04ff2-f578-4c48-b1e7-f3611ba99240');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('50',  50,   'AA_AK_08',   'Ketena 05',  45,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'cf88617f-3d0a-4482-b65e-44f89710fb82');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('51',  51,   'AA_AK_09',   'Woreda 9',  2,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'ccc2e1dc-5fa7-450d-ace1-887529f18dda');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('52',  52,   'AA_AK_09',   'Ketena 01',  51,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'b4f058a9-d02e-4bb7-ad6a-ad022170d835');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('53',  53,   'AA_AK_09',   'Ketena 02',  51,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'b709392e-c005-40ed-92a3-748f4b90cd70');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('54',  54,   'AA_AK_09',   'Ketena 03',  51,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'cc6aa926-84d7-4096-8672-d2349b012f75');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('55',  55,   'AA_AK_09',   'Ketena 04',  51,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'da95e63c-320f-4850-b9d1-a5d309f99439');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('56',  56,   'AA_AK_09',   'Ketena 05',  51,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'8ae52839-f973-400c-99c4-0fa03d7cd1b1');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('57',  57,   'AA_AK_10',   'Woreda 10',  2,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'd72e1b49-9e06-4815-8077-cc2e242647b8');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('58',  58,   'AA_AK_10',   'Ketena 01',  57,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'6cc15cf9-eea7-43fb-bfc2-643396fb02ef');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('59',  59,   'AA_AK_10',   'Ketena 02',  57,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'8fd6dbf3-2ad8-4ad3-87bf-7ab425ff4704');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('60',  60,   'AA_AK_10',   'Ketena 03',  57,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'48d96705-20bd-4163-9f11-36a69c927251');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('61',  61,   'AA_AK_10',   'Ketena 04',  57,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'9695bc2d-d783-46d4-af0c-e717c4dd09d0');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('62',  62,   'AA_AK_10',   'Ketena 05',  57,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'b886ecc4-f44d-4c38-a869-9dcadd62da2c');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('63',  63,   'AA_AK_11',   'Woreda 11',  2,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'c0cacaf2-6ae9-42ab-8a42-66b4ad25f5cc');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('64',  64,   'AA_AK_11',   'Ketena 01',  63,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'4253f890-6d7e-4aba-ac18-7c2ba270175a');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('65',  65,   'AA_AK_11',   'Ketena 02',  63,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'0fe3ec00-b92c-470d-a61e-c7611859743e');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('66',  66,   'AA_AK_11',   'Ketena 03',  63,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'8e36288a-65ea-4586-9a2e-b3f04f5db249');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('67',  67,   'AA_AK_11',   'Ketena 04',  63,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'0a360772-7bef-48a8-a65d-a78b7bf0205b');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('68',  68,   'AA_AK_11',   'Ketena 05',  63,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'2b0c5230-d6b1-41b5-97b5-1a0d77d78de3');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('69',  69,   'AA_AK_12',   'Woreda 12',  2,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'300f69fd-eddf-4b53-a97a-85dcfb2ddd66');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('70',  70,   'AA_AK_12',   'Ketena 01',  69,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'813b47d0-2f4b-4d22-9fac-cce3aaf66587');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('71',  71,   'AA_AK_12',   'Ketena 02',  69,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'fe4b8e57-d2fb-4ac7-80f0-58f96126a537');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('72',  72,   'AA_AK_12',   'Ketena 03',  69,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'82c8b47d-6dff-4267-a51c-2c902cc1070d');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('73',  73,   'AA_AK_12',   'Ketena 04',  69,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'ac463169-7166-42e1-95b9-c8562e6add20');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('74',  74,   'AA_AK_12',   'Ketena 05',  69,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'702b08d0-ed7f-4fe7-b5c3-b2637237247b');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('75',  75,   'AA_AK_13',   'Woreda 13',  2,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'00053bc3-271b-408b-9689-3f6df2144bd9');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('76',  76,   'AA_AK_13',   'Ketena 01',  75,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'de3372b5-d08f-467b-a50a-252c22e048dc');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('77',  77,   'AA_AK_13',   'Ketena 02',  75,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'e837d877-d4cf-4e5e-b99b-2768c5fe9d86');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('78',  78,   'AA_AK_13',   'Ketena 03',  75,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'854314a7-d8c6-4b62-85e5-5980ed9982a5');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('79',  79,   'AA_AK_13',   'Ketena 04',  75,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'3c4a1260-4ca0-4d38-a81a-c1af7afa9ac8');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('80',  80,   'AA_AK_13',   'Ketena 05',  75,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'c21b2e78-6763-4ad8-9fb0-04dcba783157');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('81',  81,   'AA_AK_14',   'Woreda 14',  2,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'e5006f7d-009a-44dc-b8a9-d798c71286f3');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('82',  82,   'AA_AK_14',   'Ketena 01',  81,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'17f48b01-094a-4dd9-afb5-67b6f2c62498');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('83',  83,   'AA_AK_14',   'Ketena 02',  81,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'9e6a0ad7-09dc-41f5-8366-80bdeee3fd6c');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('84',  84,   'AA_AK_14',   'Ketena 03',  81,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'8e6bbb56-7512-46a7-84a4-754272175cfb');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('85',  85,   'AA_AK_14',   'Ketena 04',  81,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'55e3ab54-a565-445d-9f20-16f899aa2b8b');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('86',  86,   'AA_AK_14',   'Ketena 05',  81,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'092c7cd6-c5d5-4c10-8b54-c383289493d7');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('87',  87,   'AA_AK',   'Akaki Kality',  1,   
 'S',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'aabde359-7588-42ae-96b7-bb85c777b317');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('88',  88,   'AA_AK_01',   'Woreda 1',  87,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'496f471d-579d-4386-9b2e-fb90b8f4d055');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('89',  89,   'AA_AK_01',   'Ketena 01',  88,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'b7d1e547-ac4e-4cb6-84c6-de7ffd7e423c');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('90',  90,   'AA_AK_01',   'Ketena 02',  88,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'f1e902a6-89e7-4a58-9b99-2a90ca988bdb');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('91',  91,   'AA_AK_01',   'Ketena 03',  88,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'3e9dab65-ca6a-4ffd-bb5b-650ead05981b');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('92',  92,   'AA_AK_01',   'Ketena 04',  88,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'6abb7ba8-f4df-4366-b50a-484d711bf478');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('93',  93,   'AA_AK_01',   'Ketena 05',  88,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'58247dae-c3d0-4e43-9e47-5f27b7cdc4cd');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('94',  94,   'AA_AK_02',   'Woreda 2',  87,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'8c3eeda0-7a0d-45c5-81fc-b352fa93965d');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('95',  95,   'AA_AK_02',   'Ketena 01',  94,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'ac9e0171-22fc-4491-96ac-8445718e71c0');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('96',  96,   'AA_AK_02',   'Ketena 02',  94,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'ff95c475-e861-46af-81b4-e391596d9a23');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('97',  97,   'AA_AK_02',   'Ketena 03',  94,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'75204021-8966-4f46-bad7-6e2822084056');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('98',  98,   'AA_AK_02',   'Ketena 04',  94,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'30ce6a03-727a-4cc8-a689-586177d71c1f');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('99',  99,   'AA_AK_02',   'Ketena 05',  94,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'190c66ae-c5ae-402a-b571-6ed80b190eee');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('100',  100,   'AA_AK_03',   'Woreda 3',  87,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'191fd68f-e413-439a-8220-9e6644cd502d');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('101',  101,   'AA_AK_03',   'Ketena 01',  100,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'07e965e4-0d55-4536-8282-749e667851e6');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('102',  102,   'AA_AK_03',   'Ketena 02',  100,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'd82c0677-5d27-4819-b454-ac95a884a364');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('103',  103,   'AA_AK_03',   'Ketena 03',  100,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'c862c0ed-3371-4305-a9c7-8115659388a9');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('104',  104,   'AA_AK_03',   'Ketena 04',  100,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'7d56fa4a-202f-43d3-8da6-4db90317a894');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('105',  105,   'AA_AK_03',   'Ketena 05',  100,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'3e5c9f9b-2c59-42a8-9382-c46cf63d09ed');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('106',  106,   'AA_AK_04',   'Woreda 4',  87,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'80ef7757-779f-4f67-a17b-cf29a13d4316');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('107',  107,   'AA_AK_04',   'Ketena 01',  106,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'398b4513-bbc2-4af9-befb-5aec02dc0b8c');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('108',  108,   'AA_AK_04',   'Ketena 02',  106,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'd8f465df-ecde-4826-8122-68b5b7a6da12');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('109',  109,   'AA_AK_04',   'Ketena 03',  106,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'f2861487-8ab6-4936-8c8c-fc2cbfb4fbda');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('110',  110,   'AA_AK_04',   'Ketena 04',  106,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'9c0da32d-bfe3-4419-b1cc-56d2b9382ee2');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('111',  111,   'AA_AK_04',   'Ketena 05',  106,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'd115ae67-3468-468f-b53a-e0d496496429');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('112',  112,   'AA_AK_05',   'Woreda 5',  87,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'e0f56dba-c402-41c2-ac18-cb1730e582df');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('113',  113,   'AA_AK_05',   'Ketena 01',  112,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'94822050-35a0-47d3-98bb-426ae07dfb16');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('114',  114,   'AA_AK_05',   'Ketena 02',  112,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'4db3b8d2-58d4-4043-b4c7-ff9fd0ea485b');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('115',  115,   'AA_AK_05',   'Ketena 03',  112,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'a2c027a5-0f89-4b77-93da-bb812482f9d4');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('116',  116,   'AA_AK_05',   'Ketena 04',  112,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'f3c40a12-3a46-476c-958b-709fa8bf7305');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('117',  117,   'AA_AK_05',   'Ketena 05',  112,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'898ac0b2-89be-44a2-b9be-cacf27ba4e9a');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('118',  118,   'AA_AK_06',   'Woreda 6',  87,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'845c610a-43ee-4719-b144-1ffd95fd0b20');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('119',  119,   'AA_AK_06',   'Ketena 01',  118,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'ea240bcf-1f92-4f5d-a7d3-9f64667d96bc');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('120',  120,   'AA_AK_06',   'Ketena 02',  118,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'9406b5f9-2cd0-4e77-adc2-2ef431a34854');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('121',  121,   'AA_AK_06',   'Ketena 03',  118,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'61293098-4f9b-43be-9f69-945df09d76b5');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('122',  122,   'AA_AK_06',   'Ketena 04',  118,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'cecfc691-2a27-4e76-9b1f-466d59e9bb20');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('123',  123,   'AA_AK_06',   'Ketena 05',  118,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'fcf63fd2-bfef-48a9-91c2-8bb18108b210');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('124',  124,   'AA_AK_07',   'Woreda 7',  87,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'4d2c3f0a-b0e0-4a14-bc2c-84ee1e6ec006');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('125',  125,   'AA_AK_07',   'Ketena 01',  124,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'14aad254-f565-4ba9-b5b5-1de89ca5d721');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('126',  126,   'AA_AK_07',   'Ketena 02',  124,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'ea93f1d5-2f45-47aa-9fdd-cfdfecad1a46');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('127',  127,   'AA_AK_07',   'Ketena 03',  124,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'dd0660c1-4f59-4a85-b99f-633a43adadef');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('128',  128,   'AA_AK_07',   'Ketena 04',  124,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'792934fb-57e1-407e-896d-ab21b69756d6');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('129',  129,   'AA_AK_07',   'Ketena 05',  124,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'6b88e819-6fb8-40e6-9b2f-28f71eaf513d');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('130',  130,   'AA_AK_08',   'Woreda 8',  87,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'9b4e833b-5e32-4d90-b540-df6966770d9f');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('131',  131,   'AA_AK_08',   'Ketena 01',  130,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'b1f385eb-82c8-45c9-b333-94544d6c2099');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('132',  132,   'AA_AK_08',   'Ketena 02',  130,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'02c67942-859a-45c6-905e-92baca43bbac');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('133',  133,   'AA_AK_08',   'Ketena 03',  130,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'5041e4ae-b4c9-4768-9e10-a5248806155d');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('134',  134,   'AA_AK_08',   'Ketena 04',  130,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'c279e927-4b31-4c92-a70b-838ef54f1109');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('135',  135,   'AA_AK_08',   'Ketena 05',  130,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'29756b30-f6a9-4c87-bb3a-2e1633b077e8');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('136',  136,   'AA_AK_09',   'Woreda 9',  87,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'69b3b297-cb98-40f0-abd5-e64807a1c3fd');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('137',  137,   'AA_AK_09',   'Ketena 01',  136,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'8a5b04f5-8cb5-405a-8765-fd6e09c76909');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('138',  138,   'AA_AK_09',   'Ketena 02',  136,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'33fa235b-1395-4e8e-8406-354a9081e9df');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('139',  139,   'AA_AK_09',   'Ketena 03',  136,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'14092ee3-b3e2-4530-aded-df4a1861b5d5');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('140',  140,   'AA_AK_09',   'Ketena 04',  136,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'baf0deae-e4c9-4d22-a9dd-51af46793f1a');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('141',  141,   'AA_AK_09',   'Ketena 05',  136,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'5b4dfd1d-534c-45df-ac04-7f87b362e2e4');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('142',  142,   'AA_AK_10',   'Woreda 10',  87,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'3390722d-30fd-43df-af58-8606d56c98f5');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('143',  143,   'AA_AK_10',   'Ketena 01',  142,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'b82afe9c-b0f2-426f-9cbb-1c3fcb1e6458');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('144',  144,   'AA_AK_10',   'Ketena 02',  142,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'dbdaf9d4-57a4-455e-851e-b9d94ffa3e0c');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('145',  145,   'AA_AK_10',   'Ketena 03',  142,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'5c0bb185-5950-46af-987e-bbe4cc6ca313');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('146',  146,   'AA_AK_10',   'Ketena 04',  142,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'59b22438-aaf8-499d-a75f-bb551ef0040a');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('147',  147,   'AA_AK_10',   'Ketena 05',  142,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'84ab245d-140d-4e4d-8a77-83067f6caeff');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('148',  148,   'AA_AK_11',   'Woreda 11',  87,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'180e1169-f664-4895-bd42-ca30de29f8ce');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('149',  149,   'AA_AK_11',   'Ketena 01',  148,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'56976787-adf9-4209-87de-d876a4f8a1e7');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('150',  150,   'AA_AK_11',   'Ketena 02',  148,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'0d1497a7-b441-4878-b4b2-df1812417cb9');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('151',  151,   'AA_AK_11',   'Ketena 03',  148,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'0d23554c-6c40-4e5e-a22c-dcbf3df46b80');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('152',  152,   'AA_AK_11',   'Ketena 04',  148,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'b29adedb-8f6f-43bc-8708-816295d5ca0d');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('153',  153,   'AA_AK_11',   'Ketena 05',  148,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'73f053ce-d9e4-4f9f-833a-1e3665ba3872');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('154',  154,   'AA_AK_12',   'Woreda 12',  87,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'677eb3f5-6294-4991-891c-ca6d2228e423');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('155',  155,   'AA_AK_12',   'Ketena 01',  154,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'60351a99-b24e-4832-93b7-32f75974ab4a');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('156',  156,   'AA_AK_12',   'Ketena 02',  154,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'a6950001-fb86-40a4-894e-ff5282e71359');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('157',  157,   'AA_AK_12',   'Ketena 03',  154,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'664620bb-308d-42ff-a79b-75e6cc178832');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('158',  158,   'AA_AK_12',   'Ketena 04',  154,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'b4391337-fe04-4508-b4f9-eebf94423b5d');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('159',  159,   'AA_AK_12',   'Ketena 05',  154,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'a2fafd8e-d02c-4a26-a63c-854b1aadf655');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('160',  160,   'AA_AK_13',   'Woreda 13',  87,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'c779549f-1f2e-4c9b-8675-8fcc36b96357');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('161',  161,   'AA_AK_13',   'Ketena 01',  160,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'5474ad8b-3896-4d10-b3bc-28a95e8b8feb');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('162',  162,   'AA_AK_13',   'Ketena 02',  160,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'5154a809-2b1d-4650-bc67-7fa8821b80ed');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('163',  163,   'AA_AK_13',   'Ketena 03',  160,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'05e5c0ab-5124-4bec-bb64-cfed056cd89a');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('164',  164,   'AA_AK_13',   'Ketena 04',  160,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'a0deee18-fa93-4831-b7e7-78f54269311a');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('165',  165,   'AA_AK_13',   'Ketena 05',  160,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'14462a29-889b-44d8-891e-5ac4954e72b2');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('166',  166,   'AA_A',   'Arada',  1,   
 'S',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'e33fba12-ad59-4225-b27a-2aaec5e6cbac');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('167',  167,   'AA_A_01',   'Woreda 1',  166,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'f4435926-2fae-4078-939a-2e9a88c56cf0');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('168',  168,   'AA_A_01_',   'Ketena 01',  167,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'2518af09-2b79-4eb3-8a21-23cb95093887');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('169',  169,   'AA_A_01_',   'Ketena 02',  167,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'57c993dc-3bf9-4d64-9ded-418f1b140e61');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('170',  170,   'AA_A_01_',   'Ketena 03',  167,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'4b40fbbf-8ed8-4e22-a155-167f03720113');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('171',  171,   'AA_A_01_',   'Ketena 04',  167,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'9ba1cbb7-613c-4367-b18e-fe766433016e');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('172',  172,   'AA_A_01_',   'Ketena 05',  167,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'62db92f4-9622-49c1-bc45-50bbefd9d8f2');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('173',  173,   'AA_A_02',   'Woreda 2',  166,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'6d91805f-4e75-4f3a-a45f-42775977a508');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('174',  174,   'AA_A_02_',   'Ketena 01',  173,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'9f8d63b8-df91-4540-8137-f3f0f0396f46');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('175',  175,   'AA_A_02_',   'Ketena 02',  173,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'878853cf-5e3a-40ca-91f2-4e98387f1b3a');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('176',  176,   'AA_A_02_',   'Ketena 03',  173,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'3d1990a9-0729-4882-8b8d-9f6d1d5d0029');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('177',  177,   'AA_A_02_',   'Ketena 04',  173,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'653d93c0-ef2b-41c0-a539-5ff4074f3638');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('178',  178,   'AA_A_02_',   'Ketena 05',  173,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'fa4c2310-9bb4-4e05-a6a2-912a8da133f5');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('179',  179,   'AA_A_03',   'Woreda 3',  166,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'65252996-d1e2-4f85-a771-d2007e583e39');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('180',  180,   'AA_A_03_',   'Ketena 01',  179,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'06aabe60-2894-4faa-8ddd-f2a638114343');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('181',  181,   'AA_A_03_',   'Ketena 02',  179,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'ce1d37f6-23a5-429c-a14a-a74abb10efd7');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('182',  182,   'AA_A_03_',   'Ketena 03',  179,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'c842f5b3-87b9-4a1b-9cab-b6658d612c3b');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('183',  183,   'AA_A_03_',   'Ketena 04',  179,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'1f614a0c-a734-4d5f-8a4d-b9b865b4ca8f');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('184',  184,   'AA_A_03_',   'Ketena 05',  179,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'debe7a1b-aeaf-4e70-accb-739c8e68de32');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('185',  185,   'AA_A_04',   'Woreda 4',  166,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'44a3c2b8-c42f-4331-b6e3-f03af1d9df03');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('186',  186,   'AA_A_04_',   'Ketena 01',  185,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'8aa1f5f0-c9e4-4219-9e7b-a3a82c290340');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('187',  187,   'AA_A_04_',   'Ketena 02',  185,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'fb3de4c3-18b7-402b-ba54-19ade8a5831d');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('188',  188,   'AA_A_04_',   'Ketena 03',  185,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'26163210-9055-4046-b78e-a7857e9049df');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('189',  189,   'AA_A_04_',   'Ketena 04',  185,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'84d35538-aee7-4329-9f15-84b69816ec15');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('190',  190,   'AA_A_04_',   'Ketena 05',  185,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'2be332a1-bd16-4242-87d0-c3bc735050b2');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('191',  191,   'AA_A_05',   'Woreda 5',  166,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'019f7b92-1440-4dc7-ae8c-9f81bc2725e2');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('192',  192,   'AA_A_05_',   'Ketena 01',  191,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'8171265c-2a02-4ba1-9d09-fda92eaf06a2');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('193',  193,   'AA_A_05_',   'Ketena 02',  191,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'8df7d220-d49f-463b-aec1-094411adbdf2');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('194',  194,   'AA_A_05_',   'Ketena 03',  191,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'f6e0ee28-b89f-4ed1-866f-9bf034ce2b52');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('195',  195,   'AA_A_05_',   'Ketena 04',  191,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'5b092c05-4e25-4cc6-86e9-97a4397b7bc7');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('196',  196,   'AA_A_05_',   'Ketena 05',  191,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'e14f7d4a-27f4-46b9-8e39-0fbaa6ce439a');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('197',  197,   'AA_A_06',   'Woreda 6',  166,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'3bf7fd19-5c2c-43e0-9c2c-be0a120f96b5');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('198',  198,   'AA_A_06_',   'Ketena 01',  197,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'5fe3b2f9-561f-4816-8eed-9f2f83ccd732');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('199',  199,   'AA_A_06_',   'Ketena 02',  197,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'f1f9665a-6845-498c-b639-8d521dd9fd53');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('200',  200,   'AA_A_06_',   'Ketena 03',  197,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'8862fd65-ca3f-4487-9e02-12551d160930');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('201',  201,   'AA_A_06_',   'Ketena 04',  197,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'ff51a312-3904-48ee-ad3f-646883517d7e');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('202',  202,   'AA_A_06_',   'Ketena 05',  197,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'6dbdb7ea-eeba-49c7-9352-3216bbdfacc9');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('203',  203,   'AA_A_07',   'Woreda 7',  166,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'6e5757e4-dc86-48df-a9ef-f90365810c36');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('204',  204,   'AA_A_07_',   'Ketena 01',  203,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'961f5ca1-b5f9-4fdf-971b-148fac4bf12d');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('205',  205,   'AA_A_07_',   'Ketena 02',  203,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'79e2293d-31c6-463f-a20c-d84aa316547f');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('206',  206,   'AA_A_07_',   'Ketena 03',  203,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'dca5a505-a40f-46fd-b096-d21d2ab4ad7b');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('207',  207,   'AA_A_07_',   'Ketena 04',  203,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'10d3015a-eb8e-4080-a89e-b641f50e0cbc');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('208',  208,   'AA_A_07_',   'Ketena 05',  203,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'669f6f56-756a-4ffa-aa1a-d808a3b05958');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('209',  209,   'AA_A_08',   'Woreda 8',  166,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'9a61abbf-39ce-4536-9a8a-9a8347ed2e15');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('210',  210,   'AA_A_08_',   'Ketena 01',  209,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'858c34cc-b42b-47b9-a5d9-d629fe1e6e3b');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('211',  211,   'AA_A_08_',   'Ketena 02',  209,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'12faf4e1-0c91-4d38-8e91-2d9c1f6a547e');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('212',  212,   'AA_A_08_',   'Ketena 03',  209,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'f735f8c9-f2b0-4f1e-b407-3c3822adcc6a');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('213',  213,   'AA_A_08_',   'Ketena 04',  209,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'c24b9913-2c8d-4bf9-8b29-4cf71fdad24c');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('214',  214,   'AA_A_08_',   'Ketena 05',  209,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'9c5d5ee5-4ff6-4383-b72b-040dc1a4970b');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('215',  215,   'AA_A_09',   'Woreda 9',  166,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'a620b863-4f3b-4af0-bd40-aa45fed875c5');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('216',  216,   'AA_A_09_',   'Ketena 01',  215,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'c2f8ffc9-6ee1-405d-8a1f-c72ba18cc75e');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('217',  217,   'AA_A_09_',   'Ketena 02',  215,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'79b65a8a-55ad-4e61-961b-066817d69aeb');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('218',  218,   'AA_A_09_',   'Ketena 03',  215,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'93b36d26-4165-4e25-972e-2ad5928c6a06');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('219',  219,   'AA_A_09_',   'Ketena 04',  215,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'fc4b9329-d2ef-4cf9-b682-9fd4079438df');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('220',  220,   'AA_A_09_',   'Ketena 05',  215,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'630e687f-e3b3-469e-ab27-63cef2ca1472');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('221',  221,   'AA_A_10',   'Woreda 10',  166,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'0629366b-27af-4287-8e0d-4406df8c9d08');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('222',  222,   'AA_A_10_',   'Ketena 01',  221,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'69b3553f-b828-4933-a0a9-74882ce12bbd');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('223',  223,   'AA_A_10_',   'Ketena 02',  221,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'cc55288b-703a-46ef-981e-fad51584aeda');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('224',  224,   'AA_A_10_',   'Ketena 03',  221,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'351417f9-24af-4296-91a9-235d053d82af');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('225',  225,   'AA_A_10_',   'Ketena 04',  221,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'ea61249a-8830-47f4-913e-2dc489de73dd');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('226',  226,   'AA_A_10_',   'Ketena 05',  221,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'ede93a78-c2e0-4e49-944e-5ac46a9998a8');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('227',  227,   'AA_B',   'Bole',  1,   
 'S',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'4275562a-3f63-46ae-b946-2a108f486093');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('228',  228,   'AA_B_01',   'Woreda 1',  227,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'2d300199-5be8-408f-bbfa-d56fbc41d594');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('229',  229,   'AA_B_01_',   'Ketena 01',  228,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'e53e7393-358b-4739-baa8-3737b591d3db');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('230',  230,   'AA_B_01_',   'Ketena 02',  228,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'd4cc49ca-d90d-470f-965d-b086430c1999');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('231',  231,   'AA_B_01_',   'Ketena 03',  228,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'30132030-e55d-48db-a7b9-a6dfd3550639');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('232',  232,   'AA_B_01_',   'Ketena 04',  228,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'5f91f568-303e-451f-afbc-3e5b6ac25915');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('233',  233,   'AA_B_01_',   'Ketena 05',  228,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'4713ef97-d747-4314-895a-5be67ca8f93b');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('234',  234,   'AA_B_02',   'Woreda 2',  227,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'0cc9a2cb-aaa0-4c13-b7b2-f0f3f93976d0');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('235',  235,   'AA_B_02_',   'Ketena 01',  234,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'45cd6043-66be-4895-857d-1eb9f2a8d2bb');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('236',  236,   'AA_B_02_',   'Ketena 02',  234,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'4b1ccd4b-0c1d-4354-89d8-08cdadbbeaa3');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('237',  237,   'AA_B_02_',   'Ketena 03',  234,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'94859764-8a3d-4b7a-9258-c84e3786b72d');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('238',  238,   'AA_B_02_',   'Ketena 04',  234,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'6be668fd-9e5d-41ac-a5f1-5b92406aec65');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('239',  239,   'AA_B_02_',   'Ketena 05',  234,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'971abe86-0cbc-4e15-875f-6e86ec2051e1');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('240',  240,   'AA_B_03',   'Woreda 3',  227,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'969a7af2-625a-4fa4-9ba9-a5d38565a315');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('241',  241,   'AA_B_03_',   'Ketena 01',  240,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'233beb88-b139-47b4-84b1-2f856806dd63');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('242',  242,   'AA_B_03_',   'Ketena 02',  240,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'34c2075c-f2d2-40a6-81d9-20d8ef0d4e8c');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('243',  243,   'AA_B_03_',   'Ketena 03',  240,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'd4f6ba6d-a416-4923-835c-03fdefadca2f');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('244',  244,   'AA_B_03_',   'Ketena 04',  240,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'74ef3b9d-f895-4eea-91c1-ef0152390e2c');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('245',  245,   'AA_B_03_',   'Ketena 05',  240,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'3d78dd3e-2c81-4abf-9ae3-88ea7393662f');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('246',  246,   'AA_B_04',   'Woreda 4',  227,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'3a354707-855d-456e-a482-21430637448c');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('247',  247,   'AA_B_04_',   'Ketena 01',  246,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'4a591b1f-8b98-4e9f-92be-68b277ea875b');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('248',  248,   'AA_B_04_',   'Ketena 02',  246,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'74cb449a-d309-4104-b8c9-6450436e9743');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('249',  249,   'AA_B_04_',   'Ketena 03',  246,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'4f56124d-fc4e-4b3b-a055-2a5fbf4ef6ad');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('250',  250,   'AA_B_04_',   'Ketena 04',  246,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'7660d908-b7b2-4033-8a18-6c23281a5ecf');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('251',  251,   'AA_B_04_',   'Ketena 05',  246,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'5b817042-0311-48f7-9a2d-ec8f34144f55');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('252',  252,   'AA_B_05',   'Woreda 5',  227,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'25680590-f0ff-418c-a76f-114a151e8c89');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('253',  253,   'AA_B_05_',   'Ketena 01',  252,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'1e347d5f-cc1d-420e-bb6d-1685af270d61');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('254',  254,   'AA_B_05_',   'Ketena 02',  252,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'23aac90e-6797-42f6-b923-6a4b3110e03c');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('255',  255,   'AA_B_05_',   'Ketena 03',  252,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'd5316e21-3de7-47db-8551-d5d6a9ecc287');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('256',  256,   'AA_B_05_',   'Ketena 04',  252,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'5d0e1d6b-df0e-40f1-81ef-48f125291925');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('257',  257,   'AA_B_05_',   'Ketena 05',  252,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'b994b013-a044-4b16-8401-594492457852');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('258',  258,   'AA_B_06',   'Woreda 6',  227,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'4929fff5-15af-4143-a7e8-62559b322eec');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('259',  259,   'AA_B_06_',   'Ketena 01',  258,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'6bab724a-5600-4edc-bd51-8391a9656f68');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('260',  260,   'AA_B_06_',   'Ketena 02',  258,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'3952bdef-8842-471d-8441-4a25a9e5fe82');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('261',  261,   'AA_B_06_',   'Ketena 03',  258,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'dcc4f661-e2f3-47ba-906b-6f78e8bbf44e');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('262',  262,   'AA_B_06_',   'Ketena 04',  258,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'6bfcfe3d-c855-4c09-b6da-daf7ca76466c');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('263',  263,   'AA_B_06_',   'Ketena 05',  258,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'e65344dc-b1f5-4245-85ac-c75b5b65ee1a');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('264',  264,   'AA_B_07',   'Woreda 7',  227,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'63683ec5-4fe9-43b6-a0b8-beed66a24348');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('265',  265,   'AA_B_07_',   'Ketena 01',  264,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'a1ddc1d2-bda8-4ae8-acdc-ebea5a6cbb84');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('266',  266,   'AA_B_07_',   'Ketena 02',  264,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'a8f4bf3b-45ee-427b-9b98-55a551c6eb49');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('267',  267,   'AA_B_07_',   'Ketena 03',  264,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'd458c9ab-2535-4c5c-9d5f-d336fd619e50');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('268',  268,   'AA_B_07_',   'Ketena 04',  264,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'f4d930ac-e5ae-43e0-8cd1-fbee8ff49d48');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('269',  269,   'AA_B_07_',   'Ketena 05',  264,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'082915c2-a1a0-4ac5-aa60-da10f20e9cca');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('270',  270,   'AA_B_08',   'Woreda 8',  227,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'ed407132-00da-4ede-98ea-7734bc2ff45c');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('271',  271,   'AA_B_08_',   'Ketena 01',  270,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'700996f7-e2b2-47fa-a4fe-089ddfc072a3');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('272',  272,   'AA_B_08_',   'Ketena 02',  270,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'f0050055-9ed6-4b1b-b60f-5c8a52b019b1');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('273',  273,   'AA_B_08_',   'Ketena 03',  270,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'c453419c-5728-4daa-9430-7d4fecfec275');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('274',  274,   'AA_B_08_',   'Ketena 04',  270,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'f08626da-5f25-476f-8071-ffd539fe8c97');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('275',  275,   'AA_B_08_',   'Ketena 05',  270,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'0c28556e-5dad-4b79-8c2b-e0829dd8cfc8');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('276',  276,   'AA_B_09',   'Woreda 9',  227,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'7918968f-00cc-417f-a345-0d1d61f559b5');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('277',  277,   'AA_B_09_',   'Ketena 01',  276,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'f0bab2c4-8764-48e6-bc0e-e23dc06324f5');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('278',  278,   'AA_B_09_',   'Ketena 02',  276,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'4dc4ea00-4f81-4b7f-9bb9-c4047369413f');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('279',  279,   'AA_B_09_',   'Ketena 03',  276,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'ec575bce-fa1a-4fe7-bbda-ed605836f3c9');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('280',  280,   'AA_B_09_',   'Ketena 04',  276,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'a2196214-61cc-4ceb-b4da-ad8e76d3b727');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('281',  281,   'AA_B_09_',   'Ketena 05',  276,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'35a3d2ab-f974-4a8d-9ad4-5be8ce2c8b03');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('282',  282,   'AA_B_10',   'Woreda 10',  227,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'ef663d6c-1e33-4e87-a91c-7ec34f735ef1');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('283',  283,   'AA_B_10_',   'Ketena 01',  282,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'e6aa4dc3-09fa-442a-98a9-c6ac754ed376');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('284',  284,   'AA_B_10_',   'Ketena 02',  282,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'7ab4c667-ef2b-4385-bc6c-3abefbe430d2');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('285',  285,   'AA_B_10_',   'Ketena 03',  282,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'5da42cab-adb2-47d2-a8f9-9d6c1e527577');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('286',  286,   'AA_B_10_',   'Ketena 04',  282,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'9bae2c81-0bbd-4b05-8ea8-afb8f635e802');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('287',  287,   'AA_B_10_',   'Ketena 05',  282,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'f66ca2d9-94c0-4ed7-a71c-0cf1164d57bb');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('288',  288,   'AA_B_11',   'Woreda 11',  227,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'aa3db02a-b778-466e-aa79-e2b208dd8379');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('289',  289,   'AA_B_11_',   'Ketena 01',  288,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'8413e045-25fb-4bec-8f13-45f08dc5fd43');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('290',  290,   'AA_B_11_',   'Ketena 02',  288,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'488f25cb-4da7-43b6-b0b0-f6ab540137b7');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('291',  291,   'AA_B_11_',   'Ketena 03',  288,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'725b4507-a9da-4bda-aeec-5ed211680613');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('292',  292,   'AA_B_11_',   'Ketena 04',  288,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'01b0b177-9bf9-4623-9934-6a5b955677de');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('293',  293,   'AA_B_11_',   'Ketena 05',  288,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'a0ab8379-ca1c-4d1c-b0a4-7eb79ff5a44f');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('294',  294,   'AA_B_12',   'Woreda 12',  227,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'86f4552a-9cac-432e-9d79-5b735ee29b6e');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('295',  295,   'AA_B_12_',   'Ketena 01',  294,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'95ed7eb6-6e66-4fa2-a6bb-f2abeed393c9');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('296',  296,   'AA_B_12_',   'Ketena 02',  294,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'69576689-6672-4007-82b5-0fae61245dd9');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('297',  297,   'AA_B_12_',   'Ketena 03',  294,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'8ce9da4d-bc6b-4d7a-8c3d-59f97185c238');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('298',  298,   'AA_B_12_',   'Ketena 04',  294,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'844aec9f-f124-41e0-ba83-a7f2b3172a47');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('299',  299,   'AA_B_12_',   'Ketena 05',  294,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'd1e080a7-4cba-4dd6-88f4-6e5f8b246fb4');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('300',  300,   'AA_B_13',   'Woreda 13',  227,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'6b61bf5f-609e-4995-a607-0453393a5f69');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('301',  301,   'AA_B_13_',   'Ketena 01',  300,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'3a645429-1c1b-4528-9fc0-c211ff2afa66');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('302',  302,   'AA_B_13_',   'Ketena 02',  300,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'ca03e093-f058-40fc-b159-3b24470db161');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('303',  303,   'AA_B_13_',   'Ketena 03',  300,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'52b2ada9-4af4-43c6-9570-b53ff5d4829c');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('304',  304,   'AA_B_13_',   'Ketena 04',  300,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'c0243305-e06c-4fc8-b552-c307c39f5ff0');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('305',  305,   'AA_B_13_',   'Ketena 05',  300,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'e20c9fb9-9344-4352-909a-f1822b0a0f67');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('306',  306,   'AA_B_14',   'Woreda 14',  227,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'59ae07f0-a69a-43fb-b58f-f95f87206fe2');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('307',  307,   'AA_B_14_',   'Ketena 01',  306,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'9543c1da-0e49-4263-9f4a-3b73ec5f8225');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('308',  308,   'AA_B_14_',   'Ketena 02',  306,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'1cf1bf89-882e-42d5-9de8-784324eaf986');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('309',  309,   'AA_B_14_',   'Ketena 03',  306,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'1672b9a6-e725-4135-801b-ebb0eeaa80d1');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('310',  310,   'AA_B_14_',   'Ketena 04',  306,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'd9a5c3fe-7315-4a4f-98a6-ee3b708c8fc8');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('311',  311,   'AA_B_14_',   'Ketena 05',  306,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'1716ff79-0ae7-4ee9-9d72-0d397792b079');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('312',  312,   'AA_G',   'Gulele',  1,   
 'S',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'09fee6ba-4c8d-4db9-8cb4-a4a86dc1765f');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('313',  313,   'AA_G_01',   'Woreda 1',  312,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'bb48a71a-ca81-4589-984e-efc0d1c71589');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('314',  314,   'AA_G_01_',   'Ketena 01',  313,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'30fb0d34-f432-423d-b468-96e5563261bc');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('315',  315,   'AA_G_01_',   'Ketena 02',  313,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'2f1190c0-6f11-4190-81bd-4233351a0978');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('316',  316,   'AA_G_01_',   'Ketena 03',  313,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'badb5f1e-4152-4560-848f-0018a0141aef');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('317',  317,   'AA_G_01_',   'Ketena 04',  313,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'eba7bac2-ab32-4983-9bc2-78e9b82de073');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('318',  318,   'AA_G_01_',   'Ketena 05',  313,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'38df13ff-16eb-42d3-9068-21f5106681b6');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('319',  319,   'AA_G_02',   'Woreda 2',  312,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'bfa4e4f8-0e2e-4f8d-89b5-2bed860e33d3');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('320',  320,   'AA_G_02_',   'Ketena 01',  319,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'6648dee0-ffb1-40a5-8d7b-9443601bf15a');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('321',  321,   'AA_G_02_',   'Ketena 02',  319,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'e328fb36-55fb-4af1-93c1-cbb1d311e831');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('322',  322,   'AA_G_02_',   'Ketena 03',  319,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'252f90ad-8a49-440f-b262-5122e8959fd2');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('323',  323,   'AA_G_02_',   'Ketena 04',  319,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'72e18847-2c91-46d3-9f20-4244501278dd');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('324',  324,   'AA_G_02_',   'Ketena 05',  319,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'c462b5ab-1063-474f-8753-ef361ede552f');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('325',  325,   'AA_G_03',   'Woreda 3',  312,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'e4978cc1-ebaa-4baf-9603-ab31221dd611');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('326',  326,   'AA_G_03_',   'Ketena 01',  325,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'9a2a56f2-6056-4e59-b39d-eb7755014b14');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('327',  327,   'AA_G_03_',   'Ketena 02',  325,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'dd08b294-45cd-457c-ac52-1266bfdeb1f5');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('328',  328,   'AA_G_03_',   'Ketena 03',  325,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'ae5e2256-e126-4d09-b328-93353f41cd4c');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('329',  329,   'AA_G_03_',   'Ketena 04',  325,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'9b65929c-e292-449a-a832-2bd59af86473');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('330',  330,   'AA_G_03_',   'Ketena 05',  325,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'535ca4c6-4944-4d5c-acc1-d65f1b303b29');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('331',  331,   'AA_G_04',   'Woreda 4',  312,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'1d3583c1-9585-47f1-ab0b-b590ffc538ca');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('332',  332,   'AA_G_04_',   'Ketena 01',  331,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'd9c0ae68-15f7-44d1-994d-b3ed94b40b33');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('333',  333,   'AA_G_04_',   'Ketena 02',  331,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'2fd45318-905e-4c61-a7f5-3f40dbb4e972');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('334',  334,   'AA_G_04_',   'Ketena 03',  331,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'9da3ab67-10ad-4b9f-be9f-20518c51a50d');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('335',  335,   'AA_G_04_',   'Ketena 04',  331,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'de5618a3-5cea-44aa-9a3b-c61c4952b7ff');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('336',  336,   'AA_G_04_',   'Ketena 05',  331,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'e89688c0-c3c4-49f0-94b3-ee75917129fe');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('337',  337,   'AA_G_05',   'Woreda 5',  312,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'311d93c7-794b-450e-bb43-1efcbea3497f');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('338',  338,   'AA_G_05_',   'Ketena 01',  337,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'71083ff0-00b4-4e57-957f-708dfec8ec09');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('339',  339,   'AA_G_05_',   'Ketena 02',  337,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'093340d2-49e1-4a60-a8ba-c94db08244c6');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('340',  340,   'AA_G_05_',   'Ketena 03',  337,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'56187b53-93fb-4307-b9ef-cd76af990acb');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('341',  341,   'AA_G_05_',   'Ketena 04',  337,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'e9165439-5bb7-4f71-a0c6-82d476410b34');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('342',  342,   'AA_G_05_',   'Ketena 05',  337,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'343a99f2-6219-43cf-994c-c9c2e2d912c6');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('343',  343,   'AA_G_06',   'Woreda 6',  312,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'be34f608-321f-428a-892f-d1d3da07b709');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('344',  344,   'AA_G_06_',   'Ketena 01',  343,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'cea2b178-b060-46a5-b5e9-30c25e505025');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('345',  345,   'AA_G_06_',   'Ketena 02',  343,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'4f5f9eba-5853-402f-bc20-49e1a314ef34');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('346',  346,   'AA_G_06_',   'Ketena 03',  343,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'd740b742-4700-4d4d-9d93-599222716f8e');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('347',  347,   'AA_G_06_',   'Ketena 04',  343,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'd6e941ba-0a42-4530-a74c-a02ae7a6ce11');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('348',  348,   'AA_G_06_',   'Ketena 05',  343,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'47592505-486b-441c-8bfc-2e4532b643b9');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('349',  349,   'AA_G_07',   'Woreda 7',  312,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'4d7437d0-cb31-47e3-8139-48e3935a97c1');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('350',  350,   'AA_G_07_',   'Ketena 01',  349,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'e89baef8-08df-4faa-a597-3a1c573ff247');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('351',  351,   'AA_G_07_',   'Ketena 02',  349,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'642c8fa6-1c68-4562-bf22-933e43ae9f89');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('352',  352,   'AA_G_07_',   'Ketena 03',  349,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'1c8a54a8-c758-418d-8fbe-83fa6fc704e3');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('353',  353,   'AA_G_07_',   'Ketena 04',  349,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'1fc8a7a7-9978-4275-a92d-d58a3c4f7801');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('354',  354,   'AA_G_07_',   'Ketena 05',  349,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'56f4c654-f7df-494c-b5d5-77c4e7a6251b');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('355',  355,   'AA_G_08',   'Woreda 8',  312,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'5159c3ce-e363-45fb-a327-250d0b9de15a');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('356',  356,   'AA_G_08_',   'Ketena 01',  355,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'9c482698-79b1-4d63-a77a-4a1a273bb398');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('357',  357,   'AA_G_08_',   'Ketena 02',  355,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'd4a6f712-1fe9-4d91-a419-925a821f9492');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('358',  358,   'AA_G_08_',   'Ketena 03',  355,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'7381a65a-7795-46a8-a728-289ebec644a5');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('359',  359,   'AA_G_08_',   'Ketena 04',  355,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'449fc98e-0502-41b8-9d47-6ac98f717be7');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('360',  360,   'AA_G_08_',   'Ketena 05',  355,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'7ff11a66-daa2-4369-8099-0f063136ceed');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('361',  361,   'AA_G_09',   'Woreda 9',  312,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'a99d070e-f423-4a71-8769-aefce6ab62d5');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('362',  362,   'AA_G_09_',   'Ketena 01',  361,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'3afaa7ac-a67c-4a8c-acbe-905c66557f66');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('363',  363,   'AA_G_09_',   'Ketena 02',  361,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'b50d4d4a-a15b-4445-9457-90597913f0ff');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('364',  364,   'AA_G_09_',   'Ketena 03',  361,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'a926d9ab-a39f-4bb9-bdc0-7e8a133e6b9e');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('365',  365,   'AA_G_09_',   'Ketena 04',  361,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'8a34cf87-c720-4f87-a330-36637f3496df');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('366',  366,   'AA_G_09_',   'Ketena 05',  361,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'c01c0261-6fbf-4f63-8351-3da4aca24356');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('367',  367,   'AA_G_10',   'Woreda 10',  312,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'4b829772-0978-46f1-b131-d2461e129d8b');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('368',  368,   'AA_G_10_',   'Ketena 01',  367,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'75e60f8c-9988-4840-91cf-3da9b73d4a10');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('369',  369,   'AA_G_10_',   'Ketena 02',  367,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'c2bb6cca-7153-4740-bc19-6f0935a0cd85');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('370',  370,   'AA_G_10_',   'Ketena 03',  367,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'9ec3173b-2ef2-4735-b162-948f4b6dd0a2');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('371',  371,   'AA_G_10_',   'Ketena 04',  367,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'36f1e00c-dd5e-4bd9-8612-776ba59f5697');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('372',  372,   'AA_G_10_',   'Ketena 05',  367,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'b72bed93-ebd1-4a56-bf60-77d4cb50526d');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('373',  373,   'AA_K',   'Kirkos',  1,   
 'S',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'168df3c2-cd9f-4679-83b8-cc3dfa01efd5');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('374',  374,   'AA_K_01',   'Woreda 1',  373,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'66ddd974-2c6f-435c-80d1-610d9ca3d1c4');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('375',  375,   'AA_K_01_',   'Ketena 01',  374,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'0f8d352b-31f9-4307-b3a5-e02e53c43416');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('376',  376,   'AA_K_01_',   'Ketena 02',  374,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'ea0d34c4-4f1a-42eb-a26e-e1da95cf80ab');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('377',  377,   'AA_K_01_',   'Ketena 03',  374,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'0ea44abd-4b55-4786-9c93-2901e119e54f');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('378',  378,   'AA_K_01_',   'Ketena 04',  374,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'1192ecbe-3f5a-4de6-8e1f-fc6e5a9e6f5d');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('379',  379,   'AA_K_01_',   'Ketena 05',  374,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'f7c15e79-d431-4c31-a789-0b64b92dcf46');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('380',  380,   'AA_K_02',   'Woreda 2',  373,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'3ecf5fab-2712-489f-a978-23a81b2bb130');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('381',  381,   'AA_K_02_',   'Ketena 01',  380,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'b94494d8-5432-455f-adb1-875cdedc65fd');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('382',  382,   'AA_K_02_',   'Ketena 02',  380,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'8fa3e7b4-f867-412b-b734-c22444e5c16c');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('383',  383,   'AA_K_02_',   'Ketena 03',  380,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'6976f66e-06b9-41f3-a632-f5d63f502e66');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('384',  384,   'AA_K_02_',   'Ketena 04',  380,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'c7adb387-91a0-4f2a-8c3f-a7cd702f450a');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('385',  385,   'AA_K_02_',   'Ketena 05',  380,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'b2e68f0d-9c08-4ab1-8c0d-85b40381a1d3');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('386',  386,   'AA_K_03',   'Woreda 3',  373,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'941255b9-80cf-454d-8332-83c66bfc760c');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('387',  387,   'AA_K_03_',   'Ketena 01',  386,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'520248f6-4935-40c7-ac6e-a2787689953c');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('388',  388,   'AA_K_03_',   'Ketena 02',  386,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'256a1e09-4b66-4d7f-b56e-e0c25052575f');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('389',  389,   'AA_K_03_',   'Ketena 03',  386,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'b8a2ffaa-6f12-4c9d-b946-f7a153781ca4');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('390',  390,   'AA_K_03_',   'Ketena 04',  386,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'64e6adfe-2a16-4885-af1e-0e53fce769fc');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('391',  391,   'AA_K_03_',   'Ketena 05',  386,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'c3bada54-4c7f-4d9e-9afc-1bb06ab5b0fe');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('392',  392,   'AA_K_04',   'Woreda 4',  373,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'962b1e3e-64f1-4ff9-965b-56f006e88dbd');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('393',  393,   'AA_K_04_',   'Ketena 01',  392,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'a4ad3639-5ce0-4405-951c-496f580e7050');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('394',  394,   'AA_K_04_',   'Ketena 02',  392,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'934f6ec7-35dd-46e9-a50d-c37d4014045d');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('395',  395,   'AA_K_04_',   'Ketena 03',  392,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'a0579dc3-4e0c-4a4e-a306-82a8346156a3');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('396',  396,   'AA_K_04_',   'Ketena 04',  392,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'2ebf5232-2de7-464c-b6f8-4eeb8132b9e4');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('397',  397,   'AA_K_04_',   'Ketena 05',  392,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'9af28c55-70bb-41be-9b9f-217beb0318f6');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('398',  398,   'AA_K_05',   'Woreda 5',  373,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'cfb66248-2534-421b-b241-f1da309f1363');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('399',  399,   'AA_K_05_',   'Ketena 01',  398,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'488e58e0-9da9-44c0-88fa-a6217c2ed9db');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('400',  400,   'AA_K_05_',   'Ketena 02',  398,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'3ba106fa-3c93-4439-8bbf-b8fe33baf511');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('401',  401,   'AA_K_05_',   'Ketena 03',  398,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'c98843f0-202b-4528-a894-71e94ec462fd');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('402',  402,   'AA_K_05_',   'Ketena 04',  398,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'a8dfadd6-968a-4369-9189-ff3d1f79148d');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('403',  403,   'AA_K_05_',   'Ketena 05',  398,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'd246d94e-4c69-46b1-b714-e13366b5b9aa');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('404',  404,   'AA_K_06',   'Woreda 6',  373,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'50da7422-3916-4fda-bbf7-bea483b18fe6');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('405',  405,   'AA_K_06_',   'Ketena 01',  404,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'66daeb42-4976-444d-ad91-795f12640041');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('406',  406,   'AA_K_06_',   'Ketena 02',  404,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'1855a58a-3e6e-4dcf-ab38-5260c10faf7f');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('407',  407,   'AA_K_06_',   'Ketena 03',  404,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'9a4ec061-4341-4fb3-967d-ec812e0670b3');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('408',  408,   'AA_K_06_',   'Ketena 04',  404,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'2ca3abcf-b624-4ab6-9b2c-b94138291fa2');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('409',  409,   'AA_K_06_',   'Ketena 05',  404,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'f06dfec1-6af3-4ec8-aa54-62eb84fbd488');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('410',  410,   'AA_K_07',   'Woreda 7',  373,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'6d1c7cc4-5dd6-43c9-a4f8-26384bec1e20');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('411',  411,   'AA_K_07_',   'Ketena 01',  410,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'cb7cb9db-ae85-4db9-a03c-42824f802f23');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('412',  412,   'AA_K_07_',   'Ketena 02',  410,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'5e49606d-4d03-4bd4-aa58-8f4dc64a93d1');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('413',  413,   'AA_K_07_',   'Ketena 03',  410,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'acda84c7-7bb1-4e2f-950f-b2ae3b7118f7');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('414',  414,   'AA_K_07_',   'Ketena 04',  410,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'3e313452-d1dd-4fd7-bd95-4c6710c6a2b9');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('415',  415,   'AA_K_07_',   'Ketena 05',  410,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'cb67a533-aae6-4cc4-8a25-97b9a0039d22');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('416',  416,   'AA_K_08',   'Woreda 8',  373,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'4ef44fd8-9501-4ed7-9807-cb816811105d');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('417',  417,   'AA_K_08_',   'Ketena 01',  416,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'0751b8f8-b297-4234-a5dd-8003c492bdf0');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('418',  418,   'AA_K_08_',   'Ketena 02',  416,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'7a8c7a4d-996a-413b-bfc9-4deb82ed49cf');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('419',  419,   'AA_K_08_',   'Ketena 03',  416,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'3065a11e-c0d1-4e94-a62d-10ee8e0725cd');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('420',  420,   'AA_K_08_',   'Ketena 04',  416,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'31397ab2-e5c2-4936-a11e-6d541ac1d75e');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('421',  421,   'AA_K_08_',   'Ketena 05',  416,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'3e7b7540-06ef-4659-ab98-6accd55150e1');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('422',  422,   'AA_K_09',   'Woreda 9',  373,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'a41a056d-c7be-4df1-9bb6-a3b58373b63d');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('423',  423,   'AA_K_09_',   'Ketena 01',  422,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'be42d05a-78ef-4d5d-a2c5-7c1d53e60bf0');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('424',  424,   'AA_K_09_',   'Ketena 02',  422,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'4444c6ea-f22a-452e-b4d4-2d5c1d000ac8');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('425',  425,   'AA_K_09_',   'Ketena 03',  422,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'5e9162dc-63d5-4815-899e-cea5462d9d02');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('426',  426,   'AA_K_09_',   'Ketena 04',  422,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'b4dc7a57-428b-4575-89f6-852c636c89a8');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('427',  427,   'AA_K_09_',   'Ketena 05',  422,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'47f9b2e2-44e9-4327-ad72-a43d332e797c');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('428',  428,   'AA_K_10',   'Woreda 10',  373,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'77706bde-d6c6-4cab-b40b-a1a75b0a741b');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('429',  429,   'AA_K_10_',   'Ketena 01',  428,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'a89e8f9f-e27e-488b-b857-46bd43291f42');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('430',  430,   'AA_K_10_',   'Ketena 02',  428,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'26015ba5-219e-4526-9fa1-1d37d8c6dedf');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('431',  431,   'AA_K_10_',   'Ketena 03',  428,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'4130acb4-984b-4577-80e1-c928fae689a6');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('432',  432,   'AA_K_10_',   'Ketena 04',  428,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'f22a030c-3eb7-4f66-86ea-577c37601873');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('433',  433,   'AA_K_10_',   'Ketena 05',  428,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'599da3e5-d383-4c35-ae3b-ebee1fb34c32');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('434',  434,   'AA_KK',   'Kolfe Keraniyo',  1,   
 'S',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'5f2c1c8c-bca2-4dfa-b31e-158ec67091d4');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('435',  435,   'AA_KK_01',   'Woreda 1',  434,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'411dd292-8538-4b80-b7fb-3279c7e5292e');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('436',  436,   'AA_KK_01',   'Ketena 01',  435,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'5d74bcf1-b430-4473-9853-4ae6267da028');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('437',  437,   'AA_KK_01',   'Ketena 02',  435,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'7d95133c-03ca-437e-a634-c77d7e757097');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('438',  438,   'AA_KK_01',   'Ketena 03',  435,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'dc4f3d15-1dc9-4c56-a8c4-652355b2055b');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('439',  439,   'AA_KK_01',   'Ketena 04',  435,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'97c36bfa-976e-47a4-84f9-09cb375a48f8');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('440',  440,   'AA_KK_01',   'Ketena 05',  435,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'5efd5584-c77f-4caa-8a68-1c33ac0e55f1');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('441',  441,   'AA_KK_02',   'Woreda 2',  434,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'066fd208-be53-43d3-88d4-e0f2e822bece');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('442',  442,   'AA_KK_02',   'Ketena 01',  441,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'01aea5eb-cfda-4c1a-9e14-80eb0ce6fbff');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('443',  443,   'AA_KK_02',   'Ketena 02',  441,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'93c56578-e153-485c-9bd3-ace7e86eca55');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('444',  444,   'AA_KK_02',   'Ketena 03',  441,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'6f0e10ce-48cd-4f53-895e-33f9dcc59436');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('445',  445,   'AA_KK_02',   'Ketena 04',  441,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'60c5678a-a22e-4433-b631-6a3ede9c95c2');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('446',  446,   'AA_KK_02',   'Ketena 05',  441,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'5642a304-8e95-4240-a10b-5d16b1b109e6');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('447',  447,   'AA_KK_03',   'Woreda 3',  434,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'feb1c2ab-64f3-4386-881a-5ff3f301dfd8');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('448',  448,   'AA_KK_03',   'Ketena 01',  447,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'5ab718f2-d91d-4a75-8e48-04aad7611c0f');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('449',  449,   'AA_KK_03',   'Ketena 02',  447,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'3213dc9c-b2c8-4f40-866f-f969b3ed82bc');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('450',  450,   'AA_KK_03',   'Ketena 03',  447,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'8532a101-b38e-4ea5-bf0d-c1f4c72db2fc');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('451',  451,   'AA_KK_03',   'Ketena 04',  447,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'ba279240-c2d9-4756-a479-96b33f525a05');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('452',  452,   'AA_KK_03',   'Ketena 05',  447,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'e162033d-5d11-4087-8f19-3b2301599a41');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('453',  453,   'AA_KK_04',   'Woreda 4',  434,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'5026e231-8c49-4f1f-972f-7e1d4504825e');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('454',  454,   'AA_KK_04',   'Ketena 01',  453,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'389b32e5-64a5-40b0-bce9-701a8ceef17b');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('455',  455,   'AA_KK_04',   'Ketena 02',  453,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'89dab493-bbe9-4425-a826-260a9192e6ef');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('456',  456,   'AA_KK_04',   'Ketena 03',  453,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'0d7e669a-afd9-4516-99a3-8fadc3bf13bb');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('457',  457,   'AA_KK_04',   'Ketena 04',  453,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'1bf2e990-d3cd-4c70-ad65-a32251061e51');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('458',  458,   'AA_KK_04',   'Ketena 05',  453,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'38c2a111-829d-4efc-b198-b1cc128658ec');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('459',  459,   'AA_KK_05',   'Woreda 5',  434,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'ef1ca637-a9c4-445e-88d0-71ae8025f664');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('460',  460,   'AA_KK_05',   'Ketena 01',  459,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'6735867d-3b31-42e5-aa00-1c53d9753cb9');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('461',  461,   'AA_KK_05',   'Ketena 02',  459,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'bfab4b6a-ba52-4cfa-89a2-67796fe6cbb8');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('462',  462,   'AA_KK_05',   'Ketena 03',  459,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'e5bf1231-7928-4958-afd7-e93fbfa516fb');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('463',  463,   'AA_KK_05',   'Ketena 04',  459,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'00d1f041-fd8a-4abc-a53f-73861a33ec7f');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('464',  464,   'AA_KK_05',   'Ketena 05',  459,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'8504ba76-2544-4b29-8b08-e8f56814813c');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('465',  465,   'AA_KK_06',   'Woreda 6',  434,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'266b873b-a08c-40ac-b896-c6960ffd157e');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('466',  466,   'AA_KK_06',   'Ketena 01',  465,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'8956e9c5-64a4-45b6-ad05-19da383db9b4');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('467',  467,   'AA_KK_06',   'Ketena 02',  465,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'90086997-2455-44d3-ba96-54b1fe8f15cc');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('468',  468,   'AA_KK_06',   'Ketena 03',  465,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'492521e1-0b4f-491e-9e1e-1f4d29dfc1ca');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('469',  469,   'AA_KK_06',   'Ketena 04',  465,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'0ef283c3-d5ba-4f40-8f0e-87564ebffdcf');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('470',  470,   'AA_KK_06',   'Ketena 05',  465,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'bf28e524-cac1-4302-8053-069a2d9cc57f');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('471',  471,   'AA_KK_07',   'Woreda 7',  434,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'2cffd6fa-a14f-43aa-87d8-20a5e6a78d74');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('472',  472,   'AA_KK_07',   'Ketena 01',  471,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'5edf4b37-1070-419f-b8f6-c8083ce97b19');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('473',  473,   'AA_KK_07',   'Ketena 02',  471,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'1f7bbd7f-10a3-42bf-ab8b-82f7251b2c40');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('474',  474,   'AA_KK_07',   'Ketena 03',  471,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'c3bf255f-9cd5-4bcf-b157-52eb26f26da3');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('475',  475,   'AA_KK_07',   'Ketena 04',  471,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'2630d294-7129-465a-972f-e60154c4b74f');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('476',  476,   'AA_KK_07',   'Ketena 05',  471,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'7bbb9040-34f9-4228-b783-5dcac210cdc0');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('477',  477,   'AA_KK_08',   'Woreda 8',  434,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'37267c67-b64c-4c8a-b47e-8d6c8287bc55');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('478',  478,   'AA_KK_08',   'Ketena 01',  477,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'2cd8869d-f5bf-4366-956f-02a0e392f001');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('479',  479,   'AA_KK_08',   'Ketena 02',  477,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'b17491b3-8612-4633-8ae6-d4d6a07bdf20');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('480',  480,   'AA_KK_08',   'Ketena 03',  477,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'5921e612-469a-44b3-9c67-6d86bf877200');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('481',  481,   'AA_KK_08',   'Ketena 04',  477,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'4050d0a4-e08f-470d-b493-6515e45d405b');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('482',  482,   'AA_KK_08',   'Ketena 05',  477,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'efb05d69-f241-463f-98fa-fad547c33b6a');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('483',  483,   'AA_KK_09',   'Woreda 9',  434,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'45af54ec-5019-4d0a-9003-72dbc7c91b93');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('484',  484,   'AA_KK_09',   'Ketena 01',  483,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'5b926532-8d2f-41a0-8197-255566888b2b');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('485',  485,   'AA_KK_09',   'Ketena 02',  483,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'd52a9a88-8476-4790-8ace-4f7e63f4091a');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('486',  486,   'AA_KK_09',   'Ketena 03',  483,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'efcc5ed9-237d-4e13-8e6a-aa7985e84f91');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('487',  487,   'AA_KK_09',   'Ketena 04',  483,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'88c32436-29c6-494d-a056-450a6ed505a9');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('488',  488,   'AA_KK_09',   'Ketena 05',  483,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'62bbc54e-e2cd-4b10-9560-aa5d9f760152');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('489',  489,   'AA_KK_10',   'Woreda 10',  434,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'eb4dd241-e6a3-411c-86b4-9db0db5bdb9e');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('490',  490,   'AA_KK_10',   'Ketena 01',  489,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'23114bff-0ed7-4071-8587-db359de60348');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('491',  491,   'AA_KK_10',   'Ketena 02',  489,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'353865c5-e4b8-4b88-bae2-c6a77b7e4c1a');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('492',  492,   'AA_KK_10',   'Ketena 03',  489,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'96a348ae-6847-4695-a92a-81ac8979d65f');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('493',  493,   'AA_KK_10',   'Ketena 04',  489,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'7ab7e40a-7a72-4ae4-84e8-428a7701a9c4');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('494',  494,   'AA_KK_10',   'Ketena 05',  489,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'ecf020d8-780d-4085-9fe5-877533f2cfec');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('495',  495,   'AA_KK_11',   'Woreda 11',  434,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'3659b091-61d6-4e34-a97b-3b9bea1ef70a');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('496',  496,   'AA_KK_11',   'Ketena 01',  495,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'b15b9f52-30ef-4166-b798-feb80dce2e06');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('497',  497,   'AA_KK_11',   'Ketena 02',  495,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'17735a5b-ca5d-4387-bfcb-b8fd1664e6c9');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('498',  498,   'AA_KK_11',   'Ketena 03',  495,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'7d6ae027-971c-4b56-97d4-881baeda6611');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('499',  499,   'AA_KK_11',   'Ketena 04',  495,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'ada27c09-fe94-445c-9477-916ae06cbb25');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('500',  500,   'AA_KK_11',   'Ketena 05',  495,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'b51b6efe-e98a-4f57-a447-d325cf8d4326');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('501',  501,   'AA_LK',   'Lemi Kura',  1,   
 'S',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'55552041-aff9-4869-8445-471ad1fe9df9');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('502',  502,   'AA_LK_01',   'Woreda 1',  501,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'5e138122-aefe-447e-a795-fccf601a69c0');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('503',  503,   'AA_LK_01',   'Ketena 01',  502,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'f3f8259c-0251-4ea6-a191-5f4585526576');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('504',  504,   'AA_LK_01',   'Ketena 02',  502,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'fddefbfd-d86f-448d-acc8-28bcf648e71b');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('505',  505,   'AA_LK_01',   'Ketena 03',  502,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'93321f7c-644b-4b86-bc3c-2fe17fd77afe');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('506',  506,   'AA_LK_01',   'Ketena 04',  502,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'f6d0d5c9-7d03-4497-998d-c25638ef8684');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('507',  507,   'AA_LK_01',   'Ketena 05',  502,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'1ce2e809-e9d1-4e09-ae88-22fe410df53d');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('508',  508,   'AA_LK_02',   'Woreda 2',  501,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'25812100-e9eb-4e71-ac11-b7a11ebf0d7d');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('509',  509,   'AA_LK_02',   'Ketena 01',  508,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'7eb18797-ef81-41d5-8bf7-bd352fae4cea');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('510',  510,   'AA_LK_02',   'Ketena 02',  508,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'd5236ab7-845a-4664-b3bf-82dfae1a2396');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('511',  511,   'AA_LK_02',   'Ketena 03',  508,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'358fe965-2646-4939-875b-d748a756c896');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('512',  512,   'AA_LK_02',   'Ketena 04',  508,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'1d3c488b-8347-4bf4-a01d-4b6d6cb4a59e');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('513',  513,   'AA_LK_02',   'Ketena 05',  508,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'4285d262-9f0f-492b-90fd-027351daa50f');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('514',  514,   'AA_LK_03',   'Woreda 3',  501,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'02cd1c7a-2faf-4b11-9fc4-cd32c89b41a3');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('515',  515,   'AA_LK_03',   'Ketena 01',  514,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'1f42e500-7252-4c44-a9bb-574283ee10b9');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('516',  516,   'AA_LK_03',   'Ketena 02',  514,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'197988a1-65e3-47bf-ac6c-6a279adbc0c2');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('517',  517,   'AA_LK_03',   'Ketena 03',  514,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'e21cf05b-dcb6-4c8d-b9a8-54f2d8d6d487');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('518',  518,   'AA_LK_03',   'Ketena 04',  514,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'86190ba8-b729-4a07-b81a-1bd006e12d61');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('519',  519,   'AA_LK_03',   'Ketena 05',  514,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'fb04df5f-9ee9-4233-82ef-dedd9d2343d1');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('520',  520,   'AA_LK_04',   'Woreda 4',  501,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'782fe481-0fe4-4a5e-b3fb-7e06e83c357f');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('521',  521,   'AA_LK_04',   'Ketena 01',  520,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'530e78d8-4c58-47dd-b194-dcac370d7623');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('522',  522,   'AA_LK_04',   'Ketena 02',  520,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'471ff350-f578-47ed-b1a1-8c8016d3a4bd');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('523',  523,   'AA_LK_04',   'Ketena 03',  520,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'8d776753-6f8e-4e8f-ba31-4aa24e2a0a0e');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('524',  524,   'AA_LK_04',   'Ketena 04',  520,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'2f57537c-8dd7-4c35-9a35-37ef377f44f1');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('525',  525,   'AA_LK_04',   'Ketena 05',  520,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'766578ff-6cac-432c-bd8b-4a76521eb850');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('526',  526,   'AA_LK_05',   'Woreda 5',  501,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'2d7d70df-0542-4ba0-91eb-6c8683b1836b');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('527',  527,   'AA_LK_05',   'Ketena 01',  526,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'c06245a7-4422-4903-8aa8-c22abcacdf1e');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('528',  528,   'AA_LK_05',   'Ketena 02',  526,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'45177580-b75b-478a-956f-a5b699ecf42b');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('529',  529,   'AA_LK_05',   'Ketena 03',  526,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'bb8e848c-15e4-4b6e-a73b-c88941f5a3cb');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('530',  530,   'AA_LK_05',   'Ketena 04',  526,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'6ceb6665-32dc-487e-84ef-c9b83065bf2d');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('531',  531,   'AA_LK_05',   'Ketena 05',  526,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'455d1a37-d879-49cd-b81a-8818147310bd');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('532',  532,   'AA_LK_06',   'Woreda 6',  501,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'1367f2fb-719b-4211-b4ab-5baace504559');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('533',  533,   'AA_LK_06',   'Ketena 01',  532,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'b1dfac6d-0b76-4a04-b9a1-ca3e56e7cf53');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('534',  534,   'AA_LK_06',   'Ketena 02',  532,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'5974b58e-39c1-43b0-8f44-8229f6aef7f8');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('535',  535,   'AA_LK_06',   'Ketena 03',  532,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'e889b294-150d-43b0-87ee-9449f32b78e1');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('536',  536,   'AA_LK_06',   'Ketena 04',  532,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'bf9e5fcd-eab2-4a3c-afb7-13b3b1e5e8b6');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('537',  537,   'AA_LK_06',   'Ketena 05',  532,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'ef9e9ce9-29a8-4be2-85ef-c98323d3e3d3');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('538',  538,   'AA_LK_07',   'Woreda 7',  501,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'f7e6b64c-6b44-47c7-89d1-224cfa94e135');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('539',  539,   'AA_LK_07',   'Ketena 01',  538,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'8dbad3db-6b6c-471c-9562-c8ded35354cc');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('540',  540,   'AA_LK_07',   'Ketena 02',  538,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'78c172c3-7975-483f-b1ac-da3454121795');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('541',  541,   'AA_LK_07',   'Ketena 03',  538,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'1893ed84-5cab-47c4-b8f7-9d6c6287d564');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('542',  542,   'AA_LK_07',   'Ketena 04',  538,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'bce1b7e6-83de-494f-b6ec-1a873833c781');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('543',  543,   'AA_LK_07',   'Ketena 05',  538,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'500a0bb9-11d8-44ff-94e0-4b80e25f96dd');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('544',  544,   'AA_LK_08',   'Woreda 8',  501,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'4390b26c-7a52-4bb7-a2b1-9e4591876bbe');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('545',  545,   'AA_LK_08',   'Ketena 01',  544,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'8aa810c8-f87c-446a-bb4c-797f0df625e7');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('546',  546,   'AA_LK_08',   'Ketena 02',  544,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'1b4dda85-a8be-4958-b438-682407aa2d71');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('547',  547,   'AA_LK_08',   'Ketena 03',  544,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'a6945555-337d-4e8d-8e74-685c96c0d44f');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('548',  548,   'AA_LK_08',   'Ketena 04',  544,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'7a201d28-2051-49ec-9886-2598af3bb117');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('549',  549,   'AA_LK_08',   'Ketena 05',  544,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'd8ec86a1-6588-4985-9027-4a9dc84b1d8f');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('550',  550,   'AA_LK_09',   'Woreda 9',  501,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'b3d6ca67-d90b-4540-adf9-861e62ade410');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('551',  551,   'AA_LK_09',   'Ketena 01',  550,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'20683a4c-8abe-4cdd-a11c-f7cdd5c4c2b2');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('552',  552,   'AA_LK_09',   'Ketena 02',  550,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'e29b0a8d-fdc3-4357-aa92-97aa44c7d64d');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('553',  553,   'AA_LK_09',   'Ketena 03',  550,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'0fd5aec7-0729-4185-9f31-f21bb390a993');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('554',  554,   'AA_LK_09',   'Ketena 04',  550,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'43752db4-878a-45b7-b4d0-3e2248cef561');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('555',  555,   'AA_LK_09',   'Ketena 05',  550,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'05b6b071-2907-4fb8-8e0e-6d84034fd9a8');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('556',  556,   'AA_LK_10',   'Woreda 10',  501,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'6e61e62a-531d-4f82-a64f-51d1a7b5759f');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('557',  557,   'AA_LK_10',   'Ketena 01',  556,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'cc27af5d-280c-4ae8-85b7-a943a73cc160');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('558',  558,   'AA_LK_10',   'Ketena 02',  556,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'c33d5709-5b2e-4700-9352-bf9352d558d8');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('559',  559,   'AA_LK_10',   'Ketena 03',  556,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'cb7290cb-c90b-47da-99e0-2e924a504d43');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('560',  560,   'AA_LK_10',   'Ketena 04',  556,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'1a1d7a8b-5417-4baf-8e74-89ae71c711f7');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('561',  561,   'AA_LK_10',   'Ketena 05',  556,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'ff175a46-ec85-4a21-9557-7ded525e2a1e');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('562',  562,   'AA_LK_11',   'Woreda 11',  501,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'12a22afd-3f2d-4376-8ed7-9a283a6c212f');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('563',  563,   'AA_LK_11',   'Ketena 01',  562,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'a1540089-5977-4b0c-80b8-b618d1a9bf34');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('564',  564,   'AA_LK_11',   'Ketena 02',  562,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'0e82b70e-3829-4882-9018-be831e6e0135');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('565',  565,   'AA_LK_11',   'Ketena 03',  562,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'30e5b77d-48b3-416b-bcd5-6cefc84b746d');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('566',  566,   'AA_LK_11',   'Ketena 04',  562,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'b287bd94-49db-4cbc-9104-e4c55378c354');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('567',  567,   'AA_LK_11',   'Ketena 05',  562,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'58a75da4-23a6-4024-ae5b-2199bdf1ce97');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('568',  568,   'AA_LK_12',   'Woreda 12',  501,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'd06254e4-2fe8-471e-9316-6b901aba43c1');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('569',  569,   'AA_LK_12',   'Ketena 01',  568,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'f5cd8307-52ba-4b9f-bdf0-cfd7d60d8b9d');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('570',  570,   'AA_LK_12',   'Ketena 02',  568,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'd5642dca-f762-42db-a3d1-3a7218ad9ecd');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('571',  571,   'AA_LK_12',   'Ketena 03',  568,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'1092876f-1016-4321-81a9-d1691b8e869c');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('572',  572,   'AA_LK_12',   'Ketena 04',  568,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'1a6245f0-6915-4895-be9e-efb6e9a3e46d');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('573',  573,   'AA_LK_12',   'Ketena 05',  568,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'91c3169e-026b-4815-8ce8-69348edd0afb');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('574',  574,   'AA_LK_13',   'Woreda 13',  501,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'02f384d2-a312-4d5c-a086-08c9a06c30a8');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('575',  575,   'AA_LK_13',   'Ketena 01',  574,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'36a98012-7801-4515-a5de-1b40bcf785f7');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('576',  576,   'AA_LK_13',   'Ketena 02',  574,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'16b01d4c-857c-4fb7-bbdb-844fec22a675');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('577',  577,   'AA_LK_13',   'Ketena 03',  574,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'a87d99e7-99d7-437c-9bfb-fd369133555b');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('578',  578,   'AA_LK_13',   'Ketena 04',  574,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'79a85498-76dd-400a-80d4-a02064a34590');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('579',  579,   'AA_LK_13',   'Ketena 05',  574,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'2640cb3a-6197-48f8-a668-6e939493254a');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('580',  580,   'AA_LK_14',   'Woreda 14',  501,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'6c578b26-0189-429c-ae28-499dbd35c538');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('581',  581,   'AA_LK_14',   'Ketena 01',  580,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'ff141395-9d40-47a0-a793-40494761687a');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('582',  582,   'AA_LK_14',   'Ketena 02',  580,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'fe725806-efe8-48e6-a1a2-1086c307f517');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('583',  583,   'AA_LK_14',   'Ketena 03',  580,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'ef481d88-a739-4b0b-9545-071341662066');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('584',  584,   'AA_LK_14',   'Ketena 04',  580,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'fffba80c-e9f0-4ced-a027-ad041f850019');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('585',  585,   'AA_LK_14',   'Ketena 05',  580,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'5105b99d-d5d0-4e05-94d1-b083c005cf4c');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('586',  586,   'AA_L',   'Lideta',  1,   
 'S',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'7c83af25-d9d9-47bc-8f34-4cbe5d892ef5');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('587',  587,   'AA_L_01',   'Woreda 1',  586,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'b58d7a5c-9c55-490e-9a61-0775bbe87d66');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('588',  588,   'AA_L_01_',   'Ketena 01',  587,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'cb11c794-fadc-49d6-80f9-44d19df919b3');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('589',  589,   'AA_L_01_',   'Ketena 02',  587,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'0165495e-1137-4cf8-a238-6fc44d5692f0');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('590',  590,   'AA_L_01_',   'Ketena 03',  587,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'c5addd9a-8920-4bdf-8b8e-7d2201f4f77e');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('591',  591,   'AA_L_01_',   'Ketena 04',  587,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'f6eed0c3-e0a9-4858-b5a6-ec5e25b4d719');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('592',  592,   'AA_L_01_',   'Ketena 05',  587,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'775b479f-9f9c-4545-a0f6-68bdbc067a94');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('593',  593,   'AA_L_02',   'Woreda 2',  586,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'69a02b16-33ea-45ca-8a16-7ad27f1aee38');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('594',  594,   'AA_L_02_',   'Ketena 01',  593,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'4fe554fd-a1b9-4433-bfbe-4c23b2dfba07');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('595',  595,   'AA_L_02_',   'Ketena 02',  593,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'8a2095e0-7a05-4a3d-872c-a3e7cb8a1142');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('596',  596,   'AA_L_02_',   'Ketena 03',  593,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'db138214-1199-4098-87cd-cd27149bc98a');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('597',  597,   'AA_L_02_',   'Ketena 04',  593,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'8ccf7a84-e5b7-457b-bf2b-60e63158a1b7');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('598',  598,   'AA_L_02_',   'Ketena 05',  593,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'be0723ee-f3d6-469d-a405-7ee771c6f109');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('599',  599,   'AA_L_03',   'Woreda 3',  586,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'86ef9a35-dc9a-4ce7-8ae4-86c3672c42d0');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('600',  600,   'AA_L_03_',   'Ketena 01',  599,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'7a19ce80-850d-4ef6-9812-6eff5dc25a28');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('601',  601,   'AA_L_03_',   'Ketena 02',  599,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'b5fe6388-c79b-4fef-8355-5732d5e13e28');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('602',  602,   'AA_L_03_',   'Ketena 03',  599,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'51b13d06-a993-4200-935e-e9871430d5cf');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('603',  603,   'AA_L_03_',   'Ketena 04',  599,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'90ee8e49-dd21-4167-b824-1f19220e19e2');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('604',  604,   'AA_L_03_',   'Ketena 05',  599,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'92ce2fb9-0a95-4b21-a941-9d844a5e3c50');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('605',  605,   'AA_L_04',   'Woreda 4',  586,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'c2ab304d-e7e1-4dcb-b563-6b8062df5ddd');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('606',  606,   'AA_L_04_',   'Ketena 01',  605,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'117802b9-7e05-43ef-b33b-12139abab55e');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('607',  607,   'AA_L_04_',   'Ketena 02',  605,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'f5d14813-01ef-4cbf-9951-f20276165993');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('608',  608,   'AA_L_04_',   'Ketena 03',  605,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'527a52bf-7fb3-4ef3-9246-a173c6258dd2');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('609',  609,   'AA_L_04_',   'Ketena 04',  605,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'f1dc0bfb-76ad-4898-a07e-ae9ddd4c8adf');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('610',  610,   'AA_L_04_',   'Ketena 05',  605,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'57b93d37-147d-4975-8036-930b809f27ee');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('611',  611,   'AA_L_05',   'Woreda 5',  586,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'992a0fbb-5329-46e3-b57c-03f0bc422d60');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('612',  612,   'AA_L_05_',   'Ketena 01',  611,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'5a99f314-eed2-418e-a1b4-83fbb73a6631');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('613',  613,   'AA_L_05_',   'Ketena 02',  611,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'833cf04f-ccae-4774-a8d9-76c072d583fb');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('614',  614,   'AA_L_05_',   'Ketena 03',  611,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'1b3904e1-18ca-4598-af82-65877df8e83a');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('615',  615,   'AA_L_05_',   'Ketena 04',  611,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'a5955f93-ef87-426f-b612-e83cf4b76857');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('616',  616,   'AA_L_05_',   'Ketena 05',  611,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'c5127ee3-55c8-40dd-acc4-fedeab443d12');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('617',  617,   'AA_L_06',   'Woreda 6',  586,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'34da827f-3a68-4537-a888-d40a286c2074');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('618',  618,   'AA_L_06_',   'Ketena 01',  617,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'c3554b24-f689-4c0c-84cf-cdf31a4f8d13');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('619',  619,   'AA_L_06_',   'Ketena 02',  617,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'eb780e20-8dd8-4dfd-8407-4170d4b86fd4');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('620',  620,   'AA_L_06_',   'Ketena 03',  617,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'8fff7bed-13fa-43cc-9d2b-bcbeb661d901');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('621',  621,   'AA_L_06_',   'Ketena 04',  617,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'f11d161b-7b57-4729-8273-cb6218eec85b');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('622',  622,   'AA_L_06_',   'Ketena 05',  617,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'f3ba1579-5bae-4079-af53-3b66536efc9f');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('623',  623,   'AA_L_07',   'Woreda 7',  586,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'b0235a59-2b3d-45e2-8cba-1c96f64c83da');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('624',  624,   'AA_L_07_',   'Ketena 01',  623,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'd2af119f-4f04-407a-8f3e-fdc627fcd76d');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('625',  625,   'AA_L_07_',   'Ketena 02',  623,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'4a9b14af-90bb-4821-8902-910379f001d5');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('626',  626,   'AA_L_07_',   'Ketena 03',  623,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'59369d65-0e42-474b-b872-167a0cb653ed');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('627',  627,   'AA_L_07_',   'Ketena 04',  623,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'4c4bec74-5ed1-45cd-9d69-fe364bb43ea8');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('628',  628,   'AA_L_07_',   'Ketena 05',  623,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'a916a1c3-3c78-42fa-ba45-07e0b129384b');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('629',  629,   'AA_L_08',   'Woreda 8',  586,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'b3daa258-a2f0-477d-98df-b6588c44b764');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('630',  630,   'AA_L_08_',   'Ketena 01',  629,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'8f921bc7-5548-4985-be3a-1521d0413520');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('631',  631,   'AA_L_08_',   'Ketena 02',  629,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'99bec064-2299-45ce-9298-b240ffe6edc4');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('632',  632,   'AA_L_08_',   'Ketena 03',  629,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'874651dc-61b4-4b65-85a2-ed01508da7fe');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('633',  633,   'AA_L_08_',   'Ketena 04',  629,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'f2472af0-e185-4745-ac68-5b1afdc802d5');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('634',  634,   'AA_L_08_',   'Ketena 05',  629,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'ce0aabcf-2399-496f-be6f-b366ab72414a');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('635',  635,   'AA_L_09',   'Woreda 9',  586,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'0f51018a-8472-426b-a474-ffa9c1d7a59d');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('636',  636,   'AA_L_09_',   'Ketena 01',  635,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'8a6d17c1-f188-4029-ad19-da6e3679e6cd');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('637',  637,   'AA_L_09_',   'Ketena 02',  635,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'3ad3f09d-fef6-4938-9f6c-328984cad2bd');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('638',  638,   'AA_L_09_',   'Ketena 03',  635,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'069736a7-e4ba-4e97-8d34-1dc6f62c385a');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('639',  639,   'AA_L_09_',   'Ketena 04',  635,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'68ba6a39-8332-4b26-8817-ada4baa18d06');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('640',  640,   'AA_L_09_',   'Ketena 05',  635,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'cd09c879-bb42-4d06-a295-7d5fe8ecfeab');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('641',  641,   'AA_L_10',   'Woreda 10',  586,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'dc519e13-deca-4812-a0dd-2b4cbf54ee3c');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('642',  642,   'AA_L_10_',   'Ketena 01',  641,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'f64714f1-1346-4bf8-9c00-e24fd8c78f01');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('643',  643,   'AA_L_10_',   'Ketena 02',  641,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'85cffa3e-468a-48c7-a1e7-d9c343373908');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('644',  644,   'AA_L_10_',   'Ketena 03',  641,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'432bc459-deb7-48f0-ab1e-5c5df06b8663');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('645',  645,   'AA_L_10_',   'Ketena 04',  641,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'c80662e3-73f3-425f-9ee0-d427c725b7cc');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('646',  646,   'AA_L_10_',   'Ketena 05',  641,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'e400e6b1-8881-4823-a6fc-0b86c628ad55');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('647',  647,   'AA_NSL',   'Nifas Silk Lafto',  1,   
 'S',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'136ac99f-9240-42a7-b96a-ff30da430478');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('648',  648,   'AA_NSL_0',   'Woreda 1',  647,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'5a393c62-b3af-4e35-aa53-12485fde3c23');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('649',  649,   'AA_NSL_0',   'Ketena 01',  648,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'f826e61f-8495-4c80-af60-2b2ad80be8ec');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('650',  650,   'AA_NSL_0',   'Ketena 02',  648,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'547f354c-95fb-45a6-bed6-588ee2631a2b');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('651',  651,   'AA_NSL_0',   'Ketena 03',  648,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'62b6f66d-d6ed-4a4f-a1eb-28b3a5fc0472');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('652',  652,   'AA_NSL_0',   'Ketena 04',  648,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'26cb4894-3669-404f-ab2a-54c82b826568');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('653',  653,   'AA_NSL_0',   'Ketena 05',  648,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'849b3273-3c81-465f-8408-1e14ddfe0fc8');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('654',  654,   'AA_NSL_0',   'Woreda 2',  647,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'73ae81bd-fcb8-49f7-943b-2dd69fe9f6ca');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('655',  655,   'AA_NSL_0',   'Ketena 01',  654,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'd45c68db-76c7-4c52-866f-35619ac7d328');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('656',  656,   'AA_NSL_0',   'Ketena 02',  654,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'0538131f-4e49-4b5e-9ded-7c8051ae90a3');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('657',  657,   'AA_NSL_0',   'Ketena 03',  654,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'f013ce71-f00c-47dc-8768-a2882595dbb5');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('658',  658,   'AA_NSL_0',   'Ketena 04',  654,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'9e7ccf70-8d70-4385-ad3c-f5e1ef3d896f');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('659',  659,   'AA_NSL_0',   'Ketena 05',  654,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'5ab2759b-c1cc-4ecc-a5a4-6d841227646f');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('660',  660,   'AA_NSL_0',   'Woreda 3',  647,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'79462b25-0119-49ce-80de-edb5130d99c1');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('661',  661,   'AA_NSL_0',   'Ketena 01',  660,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'54a365ca-ff76-4fbc-8ebd-18c2933463f9');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('662',  662,   'AA_NSL_0',   'Ketena 02',  660,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'03e2adda-86a1-4449-b7d3-b4affe45c728');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('663',  663,   'AA_NSL_0',   'Ketena 03',  660,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'9c87a3ed-d320-4471-a1ee-b9864d12a6ad');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('664',  664,   'AA_NSL_0',   'Ketena 04',  660,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'49677b31-500e-4792-965a-25ae3042f811');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('665',  665,   'AA_NSL_0',   'Ketena 05',  660,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'b9d082b2-8d4b-4004-a847-033d034a2f57');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('666',  666,   'AA_NSL_0',   'Woreda 4',  647,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'e75ab4b4-59bf-455d-923d-2b885258d67d');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('667',  667,   'AA_NSL_0',   'Ketena 01',  666,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'5a2190f2-f363-4a00-9dd2-3e65beb9437a');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('668',  668,   'AA_NSL_0',   'Ketena 02',  666,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'ab4d46b9-04d8-4f61-bec0-9b44133fb3fa');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('669',  669,   'AA_NSL_0',   'Ketena 03',  666,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'83eab8e6-c209-41dc-b7cc-08b8d79ae821');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('670',  670,   'AA_NSL_0',   'Ketena 04',  666,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'9a26ee81-e1a0-4e80-9951-7f0bec9c3c3c');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('671',  671,   'AA_NSL_0',   'Ketena 05',  666,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'345a4d84-2b0e-4a7b-a6cd-acfbd4a069b8');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('672',  672,   'AA_NSL_0',   'Woreda 5',  647,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'c1a2e876-59d1-4ab5-a1bb-73ab7b152faa');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('673',  673,   'AA_NSL_0',   'Ketena 01',  672,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'f4b03a15-9311-4f27-adb3-4becd72dc4ea');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('674',  674,   'AA_NSL_0',   'Ketena 02',  672,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'dcfe5189-a38c-48d4-92e5-294266eda760');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('675',  675,   'AA_NSL_0',   'Ketena 03',  672,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'dbdfd719-a797-4464-b2e5-549014a5ad07');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('676',  676,   'AA_NSL_0',   'Ketena 04',  672,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'54664213-b7fa-4f3b-8b95-46b6ab83776e');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('677',  677,   'AA_NSL_0',   'Ketena 05',  672,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'55800b92-4a2a-4830-845b-351e384aba7a');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('678',  678,   'AA_NSL_0',   'Woreda 6',  647,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'31968616-b587-4038-999a-2a0248776dc0');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('679',  679,   'AA_NSL_0',   'Ketena 01',  678,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'c5921962-0fd2-4e17-9f25-dabdec40dc9d');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('680',  680,   'AA_NSL_0',   'Ketena 02',  678,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'0abc90de-7c34-4afd-a5d6-1b2018156e7f');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('681',  681,   'AA_NSL_0',   'Ketena 03',  678,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'786e12de-e7c5-44ce-9cc5-765ded52c224');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('682',  682,   'AA_NSL_0',   'Ketena 04',  678,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'ac4b9eb4-3b77-4736-a7f3-1ca3a16fe809');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('683',  683,   'AA_NSL_0',   'Ketena 05',  678,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'a0860f99-7c95-45a0-946a-67589b081bf8');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('684',  684,   'AA_NSL_0',   'Woreda 7',  647,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'c1b5e50e-421e-4b2b-9169-f784fe0e09e1');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('685',  685,   'AA_NSL_0',   'Ketena 01',  684,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'4c7f7c16-01ee-4036-94a3-d976942c9c5b');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('686',  686,   'AA_NSL_0',   'Ketena 02',  684,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'06ee90fc-a213-49b3-b568-9716a7d51e63');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('687',  687,   'AA_NSL_0',   'Ketena 03',  684,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'72ec2fd3-d185-40bc-b49d-33382c189c0b');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('688',  688,   'AA_NSL_0',   'Ketena 04',  684,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'2a85385f-6ad4-4ffb-ade0-32c44cdd0482');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('689',  689,   'AA_NSL_0',   'Ketena 05',  684,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'4d30a53d-9a22-4269-9858-aa5730fd97a8');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('690',  690,   'AA_NSL_0',   'Woreda 8',  647,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'8fa30789-0226-4432-9814-4fd22ab2a234');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('691',  691,   'AA_NSL_0',   'Ketena 01',  690,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'12e658e9-ca67-418c-bab7-f809434091f6');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('692',  692,   'AA_NSL_0',   'Ketena 02',  690,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'0f7733f6-99b8-4bf6-95f8-16f4da476bed');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('693',  693,   'AA_NSL_0',   'Ketena 03',  690,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'5edadf75-1332-4496-b794-8ba307fa42b5');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('694',  694,   'AA_NSL_0',   'Ketena 04',  690,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'd81bfbc9-abca-4249-b77a-57227e507113');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('695',  695,   'AA_NSL_0',   'Ketena 05',  690,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'157a0dd3-01d5-45ac-81d2-eb1dc5c51bb5');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('696',  696,   'AA_NSL_0',   'Woreda 9',  647,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'38356739-24bb-4ee3-a67c-8ec2efc22034');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('697',  697,   'AA_NSL_0',   'Ketena 01',  696,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'571d9017-4ccf-41ca-8443-bee681afce04');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('698',  698,   'AA_NSL_0',   'Ketena 02',  696,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'44b1a3bd-b853-4bf4-b0c1-1bea7ac2f023');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('699',  699,   'AA_NSL_0',   'Ketena 03',  696,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'f54b28f2-1d12-42fd-8729-82fce853f0c6');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('700',  700,   'AA_NSL_0',   'Ketena 04',  696,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'76e0c745-4cca-4fd5-9c6b-562253604f45');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('701',  701,   'AA_NSL_0',   'Ketena 05',  696,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'403a0323-b750-455a-8d50-5e1d0ff3b104');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('702',  702,   'AA_NSL_1',   'Woreda 10',  647,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'803f34a3-9349-4ef7-867d-a124ac344a25');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('703',  703,   'AA_NSL_1',   'Ketena 01',  702,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'50e66f22-531c-4f93-ac14-4f8e0cde6a0f');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('704',  704,   'AA_NSL_1',   'Ketena 02',  702,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'4e7ced43-0b92-4cc0-8cdd-fc4bc164e368');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('705',  705,   'AA_NSL_1',   'Ketena 03',  702,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'e854cdcc-0bdb-422e-9478-af60c15360d7');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('706',  706,   'AA_NSL_1',   'Ketena 04',  702,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'cb8c710e-c06d-429f-bf38-a4508611666d');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('707',  707,   'AA_NSL_1',   'Ketena 05',  702,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'a92d47fc-908f-4bbf-bd70-fe4a20ca8264');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('708',  708,   'AA_NSL_1',   'Woreda 11',  647,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'3df3a466-2290-4638-bad3-65acb8681c73');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('709',  709,   'AA_NSL_1',   'Ketena 01',  708,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'9c2677b7-0ad7-4129-8806-e5a7079530b2');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('710',  710,   'AA_NSL_1',   'Ketena 02',  708,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'b0d5df41-7fe7-4453-a1af-bf0f6c403970');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('711',  711,   'AA_NSL_1',   'Ketena 03',  708,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'cdfe52ac-f92d-4c23-9ccb-f3c4ac4d2167');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('712',  712,   'AA_NSL_1',   'Ketena 04',  708,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'1ed3b05a-a214-4f30-8e30-94b726a42240');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('713',  713,   'AA_NSL_1',   'Ketena 05',  708,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'9534f2ee-a5a5-43e8-b858-2cd684756163');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('714',  714,   'AA_NSL_1',   'Woreda 12',  647,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'5d528399-4148-44d9-aeb7-3504b2f2a5c6');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('715',  715,   'AA_NSL_1',   'Ketena 01',  714,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'e195d61d-3fa7-48e3-a3e4-3bf8710e90a4');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('716',  716,   'AA_NSL_1',   'Ketena 02',  714,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'b68a413e-712f-481b-9392-ee3c2a252784');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('717',  717,   'AA_NSL_1',   'Ketena 03',  714,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'f9045b51-b621-4efb-affd-2392319b8748');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('718',  718,   'AA_NSL_1',   'Ketena 04',  714,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'36a00755-1da3-4445-98cc-977799f08b96');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('719',  719,   'AA_NSL_1',   'Ketena 05',  714,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'c796f191-27b0-43ea-a279-db3121b93f56');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('720',  720,   'AA_NSL_1',   'Woreda 13',  647,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'826f63e8-a4c0-4fa7-bdee-d08a74fa767b');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('721',  721,   'AA_NSL_1',   'Ketena 01',  720,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'91643e97-6408-4736-9412-1e4db4d0c273');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('722',  722,   'AA_NSL_1',   'Ketena 02',  720,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'aad88079-b753-450e-9b03-109db8ca5367');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('723',  723,   'AA_NSL_1',   'Ketena 03',  720,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'5edb53fe-fcd9-417f-af5f-f81f01d69331');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('724',  724,   'AA_NSL_1',   'Ketena 04',  720,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'7db0410b-14f9-4d5f-bae0-b6c18396ff52');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('725',  725,   'AA_NSL_1',   'Ketena 05',  720,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'e4283d57-2d4d-4f12-b340-73dac98726a9');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('726',  726,   'AA_NSL_1',   'Woreda 14',  647,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'5922d670-7341-4ea8-af0d-53cbbbbc8dab');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('727',  727,   'AA_NSL_1',   'Ketena 01',  726,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'ab12266e-25a8-4650-bb96-cfe5d41e4ddf');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('728',  728,   'AA_NSL_1',   'Ketena 02',  726,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'368f0f06-1777-4aa7-acea-66b9187c08f7');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('729',  729,   'AA_NSL_1',   'Ketena 03',  726,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'96765560-226c-4ee5-96ce-6c9589f754dd');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('730',  730,   'AA_NSL_1',   'Ketena 04',  726,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'44de760d-693c-4a85-808a-148b6b5df699');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('731',  731,   'AA_NSL_1',   'Ketena 05',  726,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'7bc56fba-fc25-4f59-83b9-409c1cb0df7a');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('732',  732,   'AA_NSL_1',   'Woreda 15',  647,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'095912ee-1904-4d9c-a476-45a81e62fb70');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('733',  733,   'AA_NSL_1',   'Ketena 01',  732,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'ef9b0905-8dba-49b0-9305-65e0bdc4d2b1');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('734',  734,   'AA_NSL_1',   'Ketena 02',  732,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'a30a27a7-fc28-498c-b90b-cf9fb0ab12ff');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('735',  735,   'AA_NSL_1',   'Ketena 03',  732,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'3ede70e8-6f11-4fd5-a055-86e4083b4500');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('736',  736,   'AA_NSL_1',   'Ketena 04',  732,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'9ad35eaa-e745-438a-9898-09dc13de7670');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('737',  737,   'AA_NSL_1',   'Ketena 05',  732,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'22e9259f-5f31-48aa-b549-dd66bfec60f1');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('738',  738,   'AA_Y',   'Yeka',  1,   
 'S',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'919209f0-242e-483d-ba9d-a57877b48d16');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('739',  739,   'AA_Y_01',   'Woreda 1',  738,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'8911cbf9-b157-4c4d-b063-656343c9b47e');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('740',  740,   'AA_Y_01_',   'Ketena 01',  739,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'67b7bc22-77d3-4253-9250-5fed9e7a7650');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('741',  741,   'AA_Y_01_',   'Ketena 02',  739,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'36ba2124-253d-48a6-b4a3-41d32aee8a36');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('742',  742,   'AA_Y_01_',   'Ketena 03',  739,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'791197bf-a262-4cc7-90b9-0711565b1f1a');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('743',  743,   'AA_Y_01_',   'Ketena 04',  739,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'a5dcfeb1-2eb5-40da-a9b9-4af96b119f70');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('744',  744,   'AA_Y_01_',   'Ketena 05',  739,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'ff3e40dd-33af-4276-a298-a4c2a19c74a1');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('745',  745,   'AA_Y_02',   'Woreda 2',  738,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'860b5915-faec-4b3e-87c6-b615dbdc53f3');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('746',  746,   'AA_Y_02_',   'Ketena 01',  745,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'bbe0f003-a52a-4e09-83fd-0e6bcf0bffad');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('747',  747,   'AA_Y_02_',   'Ketena 02',  745,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'94c6eafa-b4e1-452c-9b07-352461806209');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('748',  748,   'AA_Y_02_',   'Ketena 03',  745,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'9b90b648-3edb-4a19-9f4e-de98cddf87b8');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('749',  749,   'AA_Y_02_',   'Ketena 04',  745,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'269b091f-b3e5-442e-9045-55bc36ba0984');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('750',  750,   'AA_Y_02_',   'Ketena 05',  745,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'f378ee74-bba0-4cd0-a10a-a650bb80ad0a');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('751',  751,   'AA_Y_03',   'Woreda 3',  738,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'fecdbd7c-b79a-46d9-8978-0f99501af70f');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('752',  752,   'AA_Y_03_',   'Ketena 01',  751,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'33968e53-b9a1-4985-a146-6c1cf94053f8');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('753',  753,   'AA_Y_03_',   'Ketena 02',  751,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'de53038b-295a-4c6d-816b-655f9fe6290b');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('754',  754,   'AA_Y_03_',   'Ketena 03',  751,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'1d348dfe-07f1-4847-bf60-0c4ed3121ee3');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('755',  755,   'AA_Y_03_',   'Ketena 04',  751,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'29dbab7c-5a67-4e71-aae4-391632c24640');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('756',  756,   'AA_Y_03_',   'Ketena 05',  751,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'27b98486-6018-454a-8eae-aa697da2cc98');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('757',  757,   'AA_Y_04',   'Woreda 4',  738,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'e508e753-9116-4903-a872-495fbc6d8b62');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('758',  758,   'AA_Y_04_',   'Ketena 01',  757,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'525a9613-7251-42e7-a53c-a8c7fd57c068');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('759',  759,   'AA_Y_04_',   'Ketena 02',  757,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'28005a98-fc7c-4367-91ff-fef10953e623');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('760',  760,   'AA_Y_04_',   'Ketena 03',  757,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'a90faecf-7be6-4301-8434-e8d82f4392c1');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('761',  761,   'AA_Y_04_',   'Ketena 04',  757,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'36559c0e-754e-4750-bfef-4360b7fc25e0');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('762',  762,   'AA_Y_04_',   'Ketena 05',  757,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'f4fa83f0-fbd2-41e6-a7bd-77576135901d');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('763',  763,   'AA_Y_05',   'Woreda 5',  738,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'06e4d2aa-585f-46b3-ab98-147cbbbbaf2e');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('764',  764,   'AA_Y_05_',   'Ketena 01',  763,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'cd967cc7-a818-4c03-83dd-0c2d216d877c');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('765',  765,   'AA_Y_05_',   'Ketena 02',  763,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'2c803fdf-6d89-448a-8eee-3184f1bf7600');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('766',  766,   'AA_Y_05_',   'Ketena 03',  763,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'141f7098-e60c-4b9f-adea-33a57141cc27');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('767',  767,   'AA_Y_05_',   'Ketena 04',  763,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'9391de2c-df6b-4be2-99e2-45490325847c');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('768',  768,   'AA_Y_05_',   'Ketena 05',  763,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'd6468e31-8c39-4e0f-bb55-7bbe41776638');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('769',  769,   'AA_Y_06',   'Woreda 6',  738,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'270a4044-0a71-4e73-bfec-9b5ccbfbd1c6');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('770',  770,   'AA_Y_06_',   'Ketena 01',  769,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'5afb8c09-184b-466d-a81b-9c6bfb607ba5');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('771',  771,   'AA_Y_06_',   'Ketena 02',  769,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'd237a1da-0d37-4e75-b4d4-24ab4b14db39');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('772',  772,   'AA_Y_06_',   'Ketena 03',  769,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'72ff5734-828d-4de6-b7b3-52a1f830fd7d');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('773',  773,   'AA_Y_06_',   'Ketena 04',  769,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'f25c906f-ba0f-4572-bae6-a40890131790');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('774',  774,   'AA_Y_06_',   'Ketena 05',  769,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'bff38df1-e7db-4244-bcf4-ca713d73cc44');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('775',  775,   'AA_Y_07',   'Woreda 7',  738,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'e500ed53-8100-484d-b9fe-2e3c712e6f0b');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('776',  776,   'AA_Y_07_',   'Ketena 01',  775,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'4132eb91-5f96-432d-981c-540ccd05ba7b');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('777',  777,   'AA_Y_07_',   'Ketena 02',  775,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'4b25b2cd-0922-4ac9-b7dd-e8d2b51408d8');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('778',  778,   'AA_Y_07_',   'Ketena 03',  775,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'f7edece7-0afc-486a-aab1-6171da15b2b9');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('779',  779,   'AA_Y_07_',   'Ketena 04',  775,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'e8bef969-df6a-42ab-8462-d893b69ee8c1');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('780',  780,   'AA_Y_07_',   'Ketena 05',  775,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'f34741a7-7c66-4222-afeb-6d2aebb5c1b6');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('781',  781,   'AA_Y_08',   'Woreda 8',  738,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'5f265cae-cafd-4c33-bf61-42bfe4c82ca5');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('782',  782,   'AA_Y_08_',   'Ketena 01',  781,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'7454a2fe-dba2-4b86-bfc7-3352d8538290');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('783',  783,   'AA_Y_08_',   'Ketena 02',  781,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'520422ce-19c5-4009-96fd-54e6e427f935');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('784',  784,   'AA_Y_08_',   'Ketena 03',  781,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'cd1f9651-606e-40b0-b348-d7e55e9cd7f3');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('785',  785,   'AA_Y_08_',   'Ketena 04',  781,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'ee79e388-bbab-419e-b386-49179beae832');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('786',  786,   'AA_Y_08_',   'Ketena 05',  781,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'4f72c19a-da14-491f-8fb9-11492a16d98a');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('787',  787,   'AA_Y_09',   'Woreda 9',  738,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'c5f6d9fc-abe8-4399-9546-a307a6a361e0');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('788',  788,   'AA_Y_09_',   'Ketena 01',  787,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'46e85fa9-82c4-4fc0-8fea-ae2a0b0dbc78');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('789',  789,   'AA_Y_09_',   'Ketena 02',  787,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'75456d08-d70b-4fa0-9e72-ebe4b951e03c');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('790',  790,   'AA_Y_09_',   'Ketena 03',  787,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'94a806fa-fb58-49ad-bf36-0a7c9d41997a');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('791',  791,   'AA_Y_09_',   'Ketena 04',  787,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'11cee2d9-cfce-4655-8034-0be320d16291');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('792',  792,   'AA_Y_09_',   'Ketena 05',  787,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'c9e986b8-e856-4601-beff-74b7f551a24a');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('793',  793,   'AA_Y_10',   'Woreda 10',  738,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'dee1ba26-0cb4-4c0e-9c01-6157c6fdfe4b');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('794',  794,   'AA_Y_10_',   'Ketena 01',  793,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'3d5b9e8a-1b6e-483d-a166-06b655a577fd');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('795',  795,   'AA_Y_10_',   'Ketena 02',  793,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'4648623a-10b8-4ff8-ae47-a07f478724ea');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('796',  796,   'AA_Y_10_',   'Ketena 03',  793,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'b83605d2-663e-4d28-8a64-7c25ab006d76');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('797',  797,   'AA_Y_10_',   'Ketena 04',  793,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'30dcc068-49bd-4d8d-9499-5e825cf8c2af');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('798',  798,   'AA_Y_10_',   'Ketena 05',  793,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'9637d5e9-8454-4b06-9690-adc3b717e66a');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('799',  799,   'AA_Y_11',   'Woreda 11',  738,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'e0c38d99-074c-4704-810a-9c06b76a415c');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('800',  800,   'AA_Y_11_',   'Ketena 01',  799,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'14fafb10-05eb-45eb-bd98-fc29c6c99c31');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('801',  801,   'AA_Y_11_',   'Ketena 02',  799,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'687827eb-f265-4470-b06e-2054485a1a09');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('802',  802,   'AA_Y_11_',   'Ketena 03',  799,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'42f3abab-702f-4d48-9ceb-fb70ea42763c');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('803',  803,   'AA_Y_11_',   'Ketena 04',  799,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'72db4f8e-c9f9-46c7-a180-0628730e8cd0');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('804',  804,   'AA_Y_11_',   'Ketena 05',  799,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'd7e9879e-e541-4984-b173-89207ef9e2fa');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('805',  805,   'AA_Y_12',   'Woreda 12',  738,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'54eb3488-e5f0-4eaf-8a81-c0387499128e');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('806',  806,   'AA_Y_12_',   'Ketena 01',  805,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'6ec34471-48da-4b8b-9954-1edc67d2e85f');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('807',  807,   'AA_Y_12_',   'Ketena 02',  805,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'7780eaf5-b05b-43ab-87e3-963c98374ab0');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('808',  808,   'AA_Y_12_',   'Ketena 03',  805,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'80e9f5d2-cad5-40b5-9bb4-d461d399447d');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('809',  809,   'AA_Y_12_',   'Ketena 04',  805,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'ca29c4fc-2ac9-41fa-a99c-1a27a964bf88');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('810',  810,   'AA_Y_12_',   'Ketena 05',  805,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'0b406222-26d0-4b73-8b8f-dbb3cccd0482');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('811',  811,   'AA_Y_13',   'Woreda 13',  738,   
 'W',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'3c28900f-69c9-4bee-bed5-9ca5141c8919');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('812',  812,   'AA_Y_13_',   'Ketena 01',  811,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'0de392da-fab4-48f5-85d3-0dab5890d294');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('813',  813,   'AA_Y_13_',   'Ketena 02',  811,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'bf9fad9c-f9dd-4656-af16-d56597f4eaaa');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('814',  814,   'AA_Y_13_',   'Ketena 03',  811,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'cb32f464-9125-4033-87c3-32f519b02b02');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('815',  815,   'AA_Y_13_',   'Ketena 04',  811,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'16fb03c8-b127-44f9-86b3-49d18b0c8bea');
INSERT INTO "tblLocations" 
("RowId", "LocationId", "LocationCode", "LocationName", "ParentLocationId", 
 "LocationType", "ValidityFrom", "ValidityTo", "LegacyID", "AuditUserId", 
 "MalePopulation", "FemalePopulation", "OtherPopulation", "Families", "LocationUUID")
VALUES ('816',  816,   'AA_Y_13_',   'Ketena 05',  811,   
 'K',   CAST(N'2024-01-01T00:00:00.000' AS timestamptz),   NULL,   NULL,   1,   
 NULL,   NULL,   NULL,   NULL,   N'7da50ae7-cd5e-4500-a7fe-604f24b1c0d6');
--tblHF

INSERT INTO "tblHFSublevel" ("HFSublevel", "HFSublevelDesc", "SortOrder", "AltLanguage") VALUES (N'I', N'Integrated', NULL, NULL);
INSERT INTO "tblHFSublevel" ("HFSublevel", "HFSublevelDesc", "SortOrder", "AltLanguage") VALUES (N'N', N'No Sublevel', NULL, NULL);
INSERT INTO "tblHFSublevel" ("HFSublevel", "HFSublevelDesc", "SortOrder", "AltLanguage") VALUES (N'R', N'Reference', NULL, NULL);

COMMIT;

-- tblHF
-- Total facilities (one per Woreda): 134
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (1, 'AK01C1', 'Woreda 01 Health Center', 'G', 'C', NULL, 'Address not specified', 3,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000' AS timestamptz), NULL, NULL, 1, '8bcf31a3-f652-4925-a920-79026258ce75');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (2, 'AK02C1', 'Woreda 02 Health Center', 'G', 'C', NULL, 'Address not specified', 9,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '9b40a402-0314-4d97-9891-203440ce4ce8');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (3, 'AK03C1', 'Woreda 03 Health Center', 'G', 'C', NULL, 'Address not specified', 15,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, 'a62901ca-b8e0-42aa-92d9-7231cd751607');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (4, 'AK04C1', 'Woreda 04 Health Center', 'G', 'C', NULL, 'Address not specified', 21,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '30f89f05-aedd-47ee-baae-02d1e32c58e7');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (5, 'AK05C1', 'Woreda 05 Health Center', 'G', 'C', NULL, 'Address not specified', 27,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '0adf8610-c91e-4d62-b165-9247cb4f38df');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (6, 'AK06C1', 'Woreda 06 Health Center', 'G', 'C', NULL, 'Address not specified', 33,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, 'c3732bbc-cb80-4869-b645-2959febd2c99');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (7, 'AK07C1', 'Woreda 07 Health Center', 'G', 'C', NULL, 'Address not specified', 39,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '3461f4e1-021d-45e0-b667-73c686e2e236');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (8, 'AK08C1', 'Woreda 08 Health Center', 'G', 'C', NULL, 'Address not specified', 45,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '94354540-0910-41de-943c-952307b1397a');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (9, 'AK09C1', 'Woreda 09 Health Center', 'G', 'C', NULL, 'Address not specified', 51,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, 'b0aed89a-c4f7-44af-9faa-4167e16c1357');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (10, 'AK10C1', 'Woreda 10 Health Center', 'G', 'C', NULL, 'Address not specified', 57,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, 'de0d20e2-07b3-4c8f-9554-19f16c82bb45');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (11, 'AK11C1', 'Woreda 11 Health Center', 'G', 'C', NULL, 'Address not specified', 63,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '9d1fd8b9-3418-450e-9fb4-044ca08ecd79');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (12, 'AK12C1', 'Woreda 12 Health Center', 'G', 'C', NULL, 'Address not specified', 69,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, 'a4d2461a-5194-4e15-8bb3-821b8065a1d3');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (13, 'AK13C1', 'Woreda 13 Health Center', 'G', 'C', NULL, 'Address not specified', 75,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '4a7b03d7-884b-405c-aceb-b3e28971be64');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (14, 'AK14C1', 'Woreda 14 Health Center', 'G', 'C', NULL, 'Address not specified', 81,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '1bc4a667-206a-400a-baf7-9c659d132d7c');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (15, 'AK01C1', 'Woreda 01 Health Center', 'G', 'C', NULL, 'Address not specified', 88,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, 'a8d0518d-e0a0-4809-b0bd-cd7b5eeb7566');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (16, 'AK02C1', 'Woreda 02 Health Center', 'G', 'C', NULL, 'Address not specified', 94,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '8af52ed5-976a-4e7f-a705-a12a1708b603');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (17, 'AK03C1', 'Woreda 03 Health Center', 'G', 'C', NULL, 'Address not specified', 100,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, 'd676647e-3ed6-4a55-bbc5-871bd989957d');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (18, 'AK04C1', 'Woreda 04 Health Center', 'G', 'C', NULL, 'Address not specified', 106,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '99a8c739-9197-4e98-abe1-a30ac303e3ed');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (19, 'AK05C1', 'Woreda 05 Health Center', 'G', 'C', NULL, 'Address not specified', 112,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '46070465-21bd-4f58-b864-2fe3c07122d7');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (20, 'AK06C1', 'Woreda 06 Health Center', 'G', 'C', NULL, 'Address not specified', 118,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '420f8393-0709-423b-9865-5faa8ce870cf');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (21, 'AK07C1', 'Woreda 07 Health Center', 'G', 'C', NULL, 'Address not specified', 124,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '53bc83ef-c1b5-4947-8f2f-8b819d7951db');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (22, 'AK08C1', 'Woreda 08 Health Center', 'G', 'C', NULL, 'Address not specified', 130,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, 'd5565015-1eef-46e2-a846-ed0d7de2f262');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (23, 'AK09C1', 'Woreda 09 Health Center', 'G', 'C', NULL, 'Address not specified', 136,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, 'd0fb4593-7230-4746-898e-d1500ded59bc');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (24, 'AK10C1', 'Woreda 10 Health Center', 'G', 'C', NULL, 'Address not specified', 142,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '9c7966d8-6e66-4c5d-829a-f38f620fad49');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (25, 'AK11C1', 'Woreda 11 Health Center', 'G', 'C', NULL, 'Address not specified', 148,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, 'ce2485f6-eb06-44c2-803b-cd9d7b16ce5a');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (26, 'AK12C1', 'Woreda 12 Health Center', 'G', 'C', NULL, 'Address not specified', 154,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, 'f5991da9-93e0-4404-adf7-3dc316a5b219');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (27, 'AK13C1', 'Woreda 13 Health Center', 'G', 'C', NULL, 'Address not specified', 160,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '3ed30c9c-1dd3-409a-9726-e5920eb7fd6a');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (28, 'AR01C1', 'Woreda 01 Health Center', 'G', 'C', NULL, 'Address not specified', 167,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, 'e6554b79-cd59-4166-b61a-970b9bc384c1');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (29, 'AR02C1', 'Woreda 02 Health Center', 'G', 'C', NULL, 'Address not specified', 173,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, 'f64154e2-c792-4c0b-b391-596b3711420f');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (30, 'AR03C1', 'Woreda 03 Health Center', 'G', 'C', NULL, 'Address not specified', 179,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '275f6018-cad0-486f-8234-67a6f448887b');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (31, 'AR04C1', 'Woreda 04 Health Center', 'G', 'C', NULL, 'Address not specified', 185,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '6a5636d7-4930-4890-a378-a818e751e8da');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (32, 'AR05C1', 'Woreda 05 Health Center', 'G', 'C', NULL, 'Address not specified', 191,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '2b25148b-41ba-4088-a45e-8a4f3273a527');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (33, 'AR06C1', 'Woreda 06 Health Center', 'G', 'C', NULL, 'Address not specified', 197,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, 'e20155f1-a09a-4595-94f1-731fc7efcbae');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (34, 'AR07C1', 'Woreda 07 Health Center', 'G', 'C', NULL, 'Address not specified', 203,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '60cfb9b3-e798-486a-a547-a1f2ee682490');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (35, 'AR08C1', 'Woreda 08 Health Center', 'G', 'C', NULL, 'Address not specified', 209,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, 'bdb27739-cca3-48de-83be-c95a1c73dd64');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (36, 'AR09C1', 'Woreda 09 Health Center', 'G', 'C', NULL, 'Address not specified', 215,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '45f40ac9-744d-4c85-8eaa-b5a08425d995');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (37, 'AR10C1', 'Woreda 10 Health Center', 'G', 'C', NULL, 'Address not specified', 221,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '60269d4f-f0ab-4afc-95e9-4e4e4884232a');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (38, 'BO01C1', 'Woreda 01 Health Center', 'G', 'C', NULL, 'Address not specified', 228,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '62d8c7e0-cc93-4b44-99e7-8e625471bb0f');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (39, 'BO02C1', 'Woreda 02 Health Center', 'G', 'C', NULL, 'Address not specified', 234,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, 'da64499a-6a85-48a0-ad67-3a4178996fd9');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (40, 'BO03C1', 'Woreda 03 Health Center', 'G', 'C', NULL, 'Address not specified', 240,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '7c26870e-03f0-4ea0-87b8-3735ebc34403');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (41, 'BO04C1', 'Woreda 04 Health Center', 'G', 'C', NULL, 'Address not specified', 246,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '881f380c-2ff9-4696-a26e-0e311a0f1f60');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (42, 'BO05C1', 'Woreda 05 Health Center', 'G', 'C', NULL, 'Address not specified', 252,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, 'd75d2969-b0c3-4643-bdcf-b414f922e18f');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (43, 'BO06C1', 'Woreda 06 Health Center', 'G', 'C', NULL, 'Address not specified', 258,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '20cb2f91-a441-4e11-934a-7d85fdd67c95');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (44, 'BO07C1', 'Woreda 07 Health Center', 'G', 'C', NULL, 'Address not specified', 264,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '7a5de96e-2e13-4493-8099-134dbe1a7399');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (45, 'BO08C1', 'Woreda 08 Health Center', 'G', 'C', NULL, 'Address not specified', 270,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '383f6b4d-09ec-46d1-ad43-dd7830531d77');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (46, 'BO09C1', 'Woreda 09 Health Center', 'G', 'C', NULL, 'Address not specified', 276,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '2937beb8-92f7-4993-9dcb-633a8e82c7f0');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (47, 'BO10C1', 'Woreda 10 Health Center', 'G', 'C', NULL, 'Address not specified', 282,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, 'd99406bd-8a09-4096-b0cb-49f70ef85f7b');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (48, 'BO11C1', 'Woreda 11 Health Center', 'G', 'C', NULL, 'Address not specified', 288,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, 'bf9f00c5-20ad-4741-baca-5298c8409227');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (49, 'BO12C1', 'Woreda 12 Health Center', 'G', 'C', NULL, 'Address not specified', 294,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '0c6bb4d2-e03b-4c08-929e-a5e1f57c9484');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (50, 'BO13C1', 'Woreda 13 Health Center', 'G', 'C', NULL, 'Address not specified', 300,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, 'f6b3260e-701f-4c39-b39c-b5ee6a84d7a0');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (51, 'BO14C1', 'Woreda 14 Health Center', 'G', 'C', NULL, 'Address not specified', 306,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '4d8ceb29-75ca-40fd-a747-570d51939709');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (52, 'GU01C1', 'Woreda 01 Health Center', 'G', 'C', NULL, 'Address not specified', 313,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '4dec3913-b3e9-455f-8fca-b628deca597f');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (53, 'GU02C1', 'Woreda 02 Health Center', 'G', 'C', NULL, 'Address not specified', 319,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '1e017998-7a7a-4c20-87f2-f404b9980ac1');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (54, 'GU03C1', 'Woreda 03 Health Center', 'G', 'C', NULL, 'Address not specified', 325,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, 'a5fe69ae-3c00-4e42-b2bf-3e22290e6cca');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (55, 'GU04C1', 'Woreda 04 Health Center', 'G', 'C', NULL, 'Address not specified', 331,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '7f42b2ac-cc7e-4bb2-8ba7-e1af3d964eaa');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (56, 'GU05C1', 'Woreda 05 Health Center', 'G', 'C', NULL, 'Address not specified', 337,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '38b669b0-27ef-4884-baed-cf27fe5828ab');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (57, 'GU06C1', 'Woreda 06 Health Center', 'G', 'C', NULL, 'Address not specified', 343,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, 'ebf83545-9782-42cc-902c-2ab2f99344fb');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (58, 'GU07C1', 'Woreda 07 Health Center', 'G', 'C', NULL, 'Address not specified', 349,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, 'fea24028-5a25-4fb9-aa26-1626be82584a');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (59, 'GU08C1', 'Woreda 08 Health Center', 'G', 'C', NULL, 'Address not specified', 355,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, 'fb2e7b8a-b5b3-4cf9-98b5-9861aac81073');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (60, 'GU09C1', 'Woreda 09 Health Center', 'G', 'C', NULL, 'Address not specified', 361,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, 'ac0d7f4b-6ce5-4400-844e-c03ee04de87d');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (61, 'GU10C1', 'Woreda 10 Health Center', 'G', 'C', NULL, 'Address not specified', 367,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, 'a0be05ea-4cb4-435c-8f43-f2e2f51ad7fa');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (62, 'KI01C1', 'Woreda 01 Health Center', 'G', 'C', NULL, 'Address not specified', 374,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '57a2a993-c8b7-4a57-bb48-1e986f5cfba4');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (63, 'KI02C1', 'Woreda 02 Health Center', 'G', 'C', NULL, 'Address not specified', 380,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '74863744-eff8-4ad6-a56f-087222050ddf');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (64, 'KI03C1', 'Woreda 03 Health Center', 'G', 'C', NULL, 'Address not specified', 386,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, 'f192be15-8860-40b6-b1bc-3c6d52f496bb');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (65, 'KI04C1', 'Woreda 04 Health Center', 'G', 'C', NULL, 'Address not specified', 392,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, 'eff8cf0b-c1a1-4c98-a976-148d93171a2f');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (66, 'KI05C1', 'Woreda 05 Health Center', 'G', 'C', NULL, 'Address not specified', 398,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '3224e163-0bce-4f4b-930b-b44249197fef');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (67, 'KI06C1', 'Woreda 06 Health Center', 'G', 'C', NULL, 'Address not specified', 404,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, 'a1c340f2-c8a9-4cc0-95fb-262756623140');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (68, 'KI07C1', 'Woreda 07 Health Center', 'G', 'C', NULL, 'Address not specified', 410,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '03a88920-a7a3-43ae-8c74-ce7a96014b38');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (69, 'KI08C1', 'Woreda 08 Health Center', 'G', 'C', NULL, 'Address not specified', 416,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '7fb83dea-bab3-45c9-942a-a6eba85139e2');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (70, 'KI09C1', 'Woreda 09 Health Center', 'G', 'C', NULL, 'Address not specified', 422,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '82410835-fb4f-48f1-a27f-3ec5a16ab105');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (71, 'KI10C1', 'Woreda 10 Health Center', 'G', 'C', NULL, 'Address not specified', 428,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '00c46239-33bd-4ec4-be7a-4eb66c3b5a80');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (72, 'KK01C1', 'Woreda 01 Health Center', 'G', 'C', NULL, 'Address not specified', 435,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, 'e2b0e558-45a0-446a-9dd4-9e85e56ee795');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (73, 'KK02C1', 'Woreda 02 Health Center', 'G', 'C', NULL, 'Address not specified', 441,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '3c457365-563f-49c3-9f8e-9ad51b5238da');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (74, 'KK03C1', 'Woreda 03 Health Center', 'G', 'C', NULL, 'Address not specified', 447,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '1757c17c-0870-4d33-91f2-dcab8ad66f1f');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (75, 'KK04C1', 'Woreda 04 Health Center', 'G', 'C', NULL, 'Address not specified', 453,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, 'a67bc862-4ede-4260-89d6-844f22719778');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (76, 'KK05C1', 'Woreda 05 Health Center', 'G', 'C', NULL, 'Address not specified', 459,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '35a9a-346c-49bb-b72c-8085b869147a');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (77, 'KK06C1', 'Woreda 06 Health Center', 'G', 'C', NULL, 'Address not specified', 465,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '3be04baf-f1a7-4ca4-9f89-c07013a65f97');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (78, 'KK07C1', 'Woreda 07 Health Center', 'G', 'C', NULL, 'Address not specified', 471,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '77f64ee8-66da-43f1-9b64-4700971fe4f2');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (79, 'KK08C1', 'Woreda 08 Health Center', 'G', 'C', NULL, 'Address not specified', 477,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '8cc2c02c-d671-4859-8e75-b7d5e9c4a6e5');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (80, 'KK09C1', 'Woreda 09 Health Center', 'G', 'C', NULL, 'Address not specified',483,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '03e900a7-c125-47f5-bd12-62dd86578fb0');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (81, 'KK10C1', 'Woreda 10 Health Center', 'G', 'C', NULL, 'Address not specified', 489,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, 'f680c437-f403-4797-81d4-6741f2d7889f');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (82, 'KK11C1', 'Woreda 11 Health Center', 'G', 'C', NULL, 'Address not specified', 495,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '3500609a-5d59-46ac-8b61-0e9633bb43a1');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (83, 'LK01C1', 'Woreda 01 Health Center', 'G', 'C', NULL, 'Address not specified', 502,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '076176b0-1097-467f-b3c1-8cbc210b8ac4');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (84, 'LK02C1', 'Woreda 02 Health Center', 'G', 'C', NULL, 'Address not specified', 508,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '7df5307c-ac80-4452-9e34-81c7f54c312c');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (85, 'LK03C1', 'Woreda 03 Health Center', 'G', 'C', NULL, 'Address not specified', 514,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '72c67adf-38dd-480f-8178-a57005a75b7e');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (86, 'LK04C1', 'Woreda 04 Health Center', 'G', 'C', NULL, 'Address not specified', 520,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '494e9970-0cfa-42d7-83e7-9a7b876e108e');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (87, 'LK05C1', 'Woreda 05 Health Center', 'G', 'C', NULL, 'Address not specified', 526,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '70cd05c0-e21e-44f1-9214-639093a9fc33');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (88, 'LK06C1', 'Woreda 06 Health Center', 'G', 'C', NULL, 'Address not specified', 532,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '58defe5a-df5b-49b6-898c-1ba758557908');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (89, 'LK07C1', 'Woreda 07 Health Center', 'G', 'C', NULL, 'Address not specified', 538,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, 'dc20854f-d507-4769-ab41-0defd0bb2daa');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (90, 'LK08C1', 'Woreda 08 Health Center', 'G', 'C', NULL, 'Address not specified', 544,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '983bd547-3f92-4ffc-961d-7c3739c071ae');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (91, 'LK09C1', 'Woreda 09 Health Center', 'G', 'C', NULL, 'Address not specified', 550,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, 'bf622927-1970-429f-8a39-c7f7a2dc7129');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (92, 'LK10C1', 'Woreda 10 Health Center', 'G', 'C', NULL, 'Address not specified', 556,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '52d7758d-3b84-4427-802a-1f5425cd4ba2');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (93, 'LK11C1', 'Woreda 11 Health Center', 'G', 'C', NULL, 'Address not specified', 562,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, 'e942faa9-74eb-41e9-a5a0-fc4129353646');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (94, 'LK12C1', 'Woreda 12 Health Center', 'G', 'C', NULL, 'Address not specified', 568,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, 'bd08d614-e8cc-4623-ae21-349f1e6f73ef');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (95, 'LK13C1', 'Woreda 13 Health Center', 'G', 'C', NULL, 'Address not specified', 574,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '3cfad607-9215-4eb7-a152-f9cba5ca96fa');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (96, 'LK14C1', 'Woreda 14 Health Center', 'G', 'C', NULL, 'Address not specified', 580,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, 'ad8e2a32-f08d-4219-b090-d9991eeaa7bd');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (97, 'LI01C1', 'Woreda 01 Health Center', 'G', 'C', NULL, 'Address not specified', 587,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, 'cddfa767-f3a4-4b0e-9124-71cb3bd54d8c');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (98, 'LI02C1', 'Woreda 02 Health Center', 'G', 'C', NULL, 'Address not specified', 593,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, 'e916642f-5ae2-4ad6-8b03-3a0d01841a92');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (99, 'LI03C1', 'Woreda 03 Health Center', 'G', 'C', NULL, 'Address not specified', 599,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '40b07a7b-c27f-4f6c-8611-ba942b606183');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (100, 'LI04C1', 'Woreda 04 Health Center', 'G', 'C', NULL, 'Address not specified', 605,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '4789a60a-6d34-4850-b383-a0bdb155105f');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (101, 'LI05C1', 'Woreda 05 Health Center', 'G', 'C', NULL, 'Address not specified', 611,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '5ab858ec-14fe-4037-8230-924fe7ef52ae');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (102, 'LI06C1', 'Woreda 06 Health Center', 'G', 'C', NULL, 'Address not specified', 617,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '3bbae9ee-b9d1-4982-9676-f7ccd080def8');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (103, 'LI07C1', 'Woreda 07 Health Center', 'G', 'C', NULL, 'Address not specified', 623,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, 'adb500ba-fbfd-4479-b348-cb921b41ee0b');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (104, 'LI08C1', 'Woreda 08 Health Center', 'G', 'C', NULL, 'Address not specified', 629,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, 'ad89a43c-3d50-46ee-9c59-216d0a82af9d');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (105, 'LI09C1', 'Woreda 09 Health Center', 'G', 'C', NULL, 'Address not specified', 635,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '6bf00914-3d1c-48e2-945b-0293a97ed488');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (106, 'LI10C1', 'Woreda 10 Health Center', 'G', 'C', NULL, 'Address not specified', 641,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '5440d118-44e0-4fe9-b978-9568930f1321');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (107, 'NS01C1', 'Woreda 01 Health Center', 'G', 'C', NULL, 'Address not specified', 648,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '657f8374-584a-45e6-82f5-944d5813375d');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (108, 'NS02C1', 'Woreda 02 Health Center', 'G', 'C', NULL, 'Address not specified', 654,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, 'a5db16f3-b3d7-4010-b78f-4fbd54fe1a10');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (109, 'NS03C1', 'Woreda 03 Health Center', 'G', 'C', NULL, 'Address not specified', 660,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '8adb1854-2757-4ce8-8248-fb72860cd8f2');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (110, 'NS04C1', 'Woreda 04 Health Center', 'G', 'C', NULL, 'Address not specified', 666,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, 'a4530402-4703-45b0-aa8a-7b1e4800421d');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (111, 'NS05C1', 'Woreda 05 Health Center', 'G', 'C', NULL, 'Address not specified', 672,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, 'da031741-9256-48c8-934a-aba164688477');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (112, 'NS06C1', 'Woreda 06 Health Center', 'G', 'C', NULL, 'Address not specified', 678,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, 'e5819d9e-8527-4c53-801c-4632001dae0c');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (113, 'NS07C1', 'Woreda 07 Health Center', 'G', 'C', NULL, 'Address not specified', 684,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '8a6c869d-2444-445d-a296-48ca17bec365');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (114, 'NS08C1', 'Woreda 08 Health Center', 'G', 'C', NULL, 'Address not specified', 690,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '48261deb-785c-460d-a5e7-bf931d5060ee');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (115, 'NS09C1', 'Woreda 09 Health Center', 'G', 'C', NULL, 'Address not specified', 696,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '218ca8ff-baae-49ee-9469-98323a01965c');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (116, 'NS10C1', 'Woreda 10 Health Center', 'G', 'C', NULL, 'Address not specified', 702,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, 'c66e8425-15bf-4d9d-b7c0-a57a973b250b');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (117, 'NS11C1', 'Woreda 11 Health Center', 'G', 'C', NULL, 'Address not specified', 708,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, 'f58733e6-46a8-4eb3-b4bc-139413e60005');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (118, 'NS12C1', 'Woreda 12 Health Center', 'G', 'C', NULL, 'Address not specified', 714,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, 'd4c3e973-d56d-46b4-99f4-249cd3e984b4');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (119, 'NS13C1', 'Woreda 13 Health Center', 'G', 'C', NULL, 'Address not specified', 720,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, 'd2e76711-e009-4eed-afa6-f6f81f71ffca');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (120, 'NS14C1', 'Woreda 14 Health Center', 'G', 'C', NULL, 'Address not specified', 726,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '44f792d8-2ed3-4871-a571-3ee31840b4b8');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (121, 'NS15C1', 'Woreda 15 Health Center', 'G', 'C', NULL, 'Address not specified', 732,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '9ff7d4ce-4e88-4a8e-85c2-397415f71561');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (122, 'YE01C1', 'Woreda 01 Health Center', 'G', 'C', NULL, 'Address not specified', 739,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '0bd40c28-4a61-462e-9499-8570d6c49543');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (123, 'YE02C1', 'Woreda 02 Health Center', 'G', 'C', NULL, 'Address not specified', 745,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '5050f549-b0a6-4760-b691-3c6cc87acece');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (124, 'YE03C1', 'Woreda 03 Health Center', 'G', 'C', NULL, 'Address not specified', 751,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '82d49fa0-e591-4167-8450-9d92a0640b37');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (125, 'YE04C1', 'Woreda 04 Health Center', 'G', 'C', NULL, 'Address not specified', 757,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, 'a2292936-831d-4eb4-9f1d-69a739ac76e7');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (126, 'YE05C1', 'Woreda 05 Health Center', 'G', 'C', NULL, 'Address not specified', 763,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '35c9dd60-003d-4e94-904c-4ab3aabbd3d2');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (127, 'YE06C1', 'Woreda 06 Health Center', 'G', 'C', NULL, 'Address not specified', 769,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '7d36a541-8804-4f6e-9cda-cba5f93e37cf');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (128, 'YE07C1', 'Woreda 07 Health Center', 'G', 'C', NULL, 'Address not specified', 775,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '7475d853-eb52-4226-95d1-8b9506dc5020');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (129, 'YE08C1', 'Woreda 08 Health Center', 'G', 'C', NULL, 'Address not specified', 781,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, 'd138a247-c615-4b0a-b6d1-8252faf39f33');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (130, 'YE09C1', 'Woreda 09 Health Center', 'G', 'C', NULL, 'Address not specified', 787,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '9cb2a376-b0e0-4348-9d5e-f76d38292f4e');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (131, 'YE10C1', 'Woreda 10 Health Center', 'G', 'C', NULL, 'Address not specified', 793,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '55adf1b5-63fd-49a4-a1eb-1bda28bb107b');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (132, 'YE11C1', 'Woreda 11 Health Center', 'G', 'C', NULL, 'Address not specified', 799,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, 'f017f35f-78fd-49c9-8836-303fd5eaf3ac');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (133, 'YE12C1', 'Woreda 12 Health Center', 'G', 'C', NULL, 'Address not specified', 805,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, 'cebacddc-c52d-4e54-8a88-2b432fd9312b');
INSERT INTO "tblHF"
("HfID","HFCode","HFName","LegalForm","HFLevel","HFSublevel","HFAddress","LocationId",
"Phone","Fax","eMail","HFCareType","PLServiceID","PLItemID","AccCode","OffLine",
"ValidityFrom","ValidityTo","LegacyID","AuditUserID","HfUUID")
VALUES (134, 'YE13C1', 'Woreda 13 Health Center', 'G', 'C', NULL, 'Address not specified', 811,
'', '', '', 'O', NULL, NULL, '', FALSE,
CAST('2024-01-01T00:00:00.000N' AS timestamptz), NULL, NULL, 1, '905fd33b-1c42-4810-ad56-d6386aa7a23b');

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

