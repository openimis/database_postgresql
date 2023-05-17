
--
-- TOC entry 292 (class 1259 OID 21003)
-- Name: claim_ClaimAttachment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."claim_ClaimAttachment" (
    "id" "uuid" NOT NULL,
    "ValidityFrom" timestamp with time zone NOT NULL,
    "ValidityTo" timestamp with time zone,
    "LegacyID" "uuid",
    "type" "text",
    "title" "text",
    "date" "date",
    "filename" "text",
    "mime" "text",
    "url" "text",
    "document" "text",
    "claim_id" integer NOT NULL
);


-- ALTER TABLE "public"."claim_ClaimAttachment" OWNER TO "postgres";

--
-- TOC entry 339 (class 1259 OID 21734)
-- Name: claim_ClaimAttachmentsCountView; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW "public"."claim_ClaimAttachmentsCountView" AS
 SELECT "claim_ClaimAttachment"."claim_id",
    "count"(*) AS "attachments_count"
   FROM "public"."claim_ClaimAttachment"
  GROUP BY "claim_ClaimAttachment"."claim_id";


-- ALTER TABLE "public"."claim_ClaimAttachmentsCountView" OWNER TO "postgres";

--
-- TOC entry 297 (class 1259 OID 21030)
-- Name: claim_ClaimMutation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."claim_ClaimMutation" (
    "id" "uuid" NOT NULL,
    "claim_id" integer NOT NULL,
    "mutation_id" "uuid" NOT NULL
);


-- ALTER TABLE "public"."claim_ClaimMutation" OWNER TO "postgres";


--
-- TOC entry 245 (class 1259 OID 20558)
-- Name: location_HealthFacilityMutation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."location_HealthFacilityMutation" (
    "id" "uuid" NOT NULL,
    "health_facility_id" integer NOT NULL,
    "mutation_id" "uuid" NOT NULL
);


-- ALTER TABLE "public"."location_HealthFacilityMutation" OWNER TO "postgres";

--
-- TOC entry 249 (class 1259 OID 20578)
-- Name: location_LocationMutation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."location_LocationMutation" (
    "id" "uuid" NOT NULL,
    "location_id" integer NOT NULL,
    "mutation_id" "uuid" NOT NULL
);


-- ALTER TABLE "public"."location_LocationMutation" OWNER TO "postgres";

--
-- TOC entry 308 (class 1259 OID 21358)
-- Name: report_ReportDefinition; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."report_ReportDefinition" (
    "id" "uuid" NOT NULL,
    "name" character varying(255) NOT NULL,
    "engine" integer NOT NULL,
    "definition" "text" NOT NULL,
    "validity_from" timestamp with time zone,
    "validity_to" timestamp with time zone
);



--
-- TOC entry 215 (class 1259 OID 20305)
-- Name: core_FieldControl; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."core_FieldControl" (
    "id" "uuid" NOT NULL,
    "field" character varying(250) NOT NULL,
    "usage" integer,
    "module_id" "uuid" NOT NULL
);


-- ALTER TABLE "public"."core_FieldControl" OWNER TO "postgres";

--
-- TOC entry 219 (class 1259 OID 20330)
-- Name: core_ModuleConfiguration; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."core_ModuleConfiguration" (
    "id" "uuid" NOT NULL,
    "module" character varying(20) NOT NULL,
    "layer" character varying(2) NOT NULL,
    "version" character varying(10) NOT NULL,
    "config" "text" NOT NULL,
    "is_exposed" boolean NOT NULL,
    "is_disabled_until" timestamp with time zone
);


-- ALTER TABLE "public"."core_ModuleConfiguration" OWNER TO "postgres";

--
-- TOC entry 220 (class 1259 OID 20338)
-- Name: core_Mutation_Log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."core_Mutation_Log" (
    "id" "uuid" NOT NULL,
    "json_content" "text" NOT NULL,
    "request_date_time" timestamp with time zone NOT NULL,
    "client_mutation_id" character varying(255),
    "client_mutation_label" character varying(255),
    "client_mutation_details" "text",
    "status" integer NOT NULL,
    "error" "text",
    "user_id" "uuid"
);


-- ALTER TABLE "public"."core_Mutation_Log" OWNER TO "postgres";

--
-- TOC entry 227 (class 1259 OID 20372)
-- Name: core_TechnicalUser; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."core_TechnicalUser" (
    "password" character varying(128) NOT NULL,
    "last_login" timestamp with time zone,
    "id" "uuid" NOT NULL,
    "username" character varying(150) NOT NULL,
    "email" character varying(254),
    "is_staff" boolean NOT NULL,
    "is_superuser" boolean NOT NULL,
    "validity_from" timestamp with time zone,
    "validity_to" timestamp with time zone
);


-- ALTER TABLE "public"."core_TechnicalUser" OWNER TO "postgres";

--
-- TOC entry 212 (class 1259 OID 20290)
-- Name: core_User; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."core_User" (
    "id" "uuid" NOT NULL,
    "username" character varying(25) NOT NULL,
    "i_user_id" integer,
    "t_user_id" "uuid",
    claim_admin_id integer,
    officer_id integer
);


-- ALTER TABLE "public"."core_User" OWNER TO "postgres";

--
-- TOC entry 214 (class 1259 OID 20299)
-- Name: Core_User_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."Core_User_groups" (
    "id" integer NOT NULL,
    "user_id" "uuid" NOT NULL,
    "group_id" integer NOT NULL
);


-- ALTER TABLE "public"."Core_User_groups" OWNER TO "postgres";

--
-- TOC entry 213 (class 1259 OID 20297)
-- Name: Core_User_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "public"."Core_User_groups_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- ALTER TABLE "public"."Core_User_groups_id_seq" OWNER TO "postgres";

--
-- TOC entry 3994 (class 0 OID 0)
-- Dependencies: 213
-- Name: Core_User_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "public"."Core_User_groups_id_seq" OWNED BY "public"."Core_User_groups"."id";


--
-- TOC entry 231 (class 1259 OID 20392)
-- Name: core_User_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."core_User_user_permissions" (
    "id" integer NOT NULL,
    "user_id" "uuid" NOT NULL,
    "permission_id" integer NOT NULL
);


-- ALTER TABLE "public"."core_User_user_permissions" OWNER TO "postgres";

--
-- TOC entry 230 (class 1259 OID 20390)
-- Name: core_User_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "public"."core_User_user_permissions_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- ALTER TABLE "public"."core_User_user_permissions_id_seq" OWNER TO "postgres";

--
-- TOC entry 3995 (class 0 OID 0)
-- Dependencies: 230
-- Name: core_User_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "public"."core_User_user_permissions_id_seq" OWNED BY "public"."core_User_user_permissions"."id";


-- SECTION mutations

create table "public"."core_UserMutation"
(
    id          uuid primary key,
    core_user_id   integer not null,
    mutation_id uuid not null
);


create index "core_UserMutation_mutation_id_10b94d76"
    on "public"."core_UserMutation" (mutation_id);

create index "core_UserMutation_core_user_id_12d89786"
    on "public"."core_UserMutation" (core_user_id);

create table "public"."insuree_FamilyMutation"
(
    id          uuid primary key,
    family_id   integer not null,
    mutation_id uuid not null
);


create index "insuree_FamilyMutation_mutation_id_10b94d76"
    on "public"."insuree_FamilyMutation" (mutation_id);

create index "insuree_FamilyMutation_family_id_12d89786"
    on "public"."insuree_FamilyMutation" (family_id);

create table "public"."insuree_InsureeMutation"
(
    id          uuid primary key,
    insuree_id   integer not null,
    mutation_id uuid not null
);


create index "insuree_InsureeMutation_mutation_id_88cab16e"
    on "public"."insuree_InsureeMutation" (mutation_id);

create index "insuree_InsureeMutation_insuree_id_d9f5ddbd"
    on "public"."insuree_InsureeMutation" (insuree_id);

-- create table "insuree_batch_InsureeBatchMutation"
-- (
--     id          uuid primary key,
--     insuree_batch_id   integer not null,
--     mutation_id uuid not null
-- );
--
--
-- create index "insuree_batch_InsureeBatchMutation_mutation_id_d2502256"
--     on "insuree_InsureeMutation" (mutation_id);
--
-- create index "insuree_batch_InsureeBatchMutation_insuree_batch_id_ae5ea5f0"
--     on "insuree_batch_insureebatch" (insuree_batch_id);



--
-- TOC entry 3633 (class 2606 OID 21010)
-- Name: claim_ClaimAttachment claim_ClaimAttachment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."claim_ClaimAttachment"
    ADD CONSTRAINT "claim_ClaimAttachment_pkey" PRIMARY KEY ("id");


--
-- TOC entry 3648 (class 2606 OID 21034)
-- Name: claim_ClaimMutation claim_ClaimMutation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."claim_ClaimMutation"
    ADD CONSTRAINT "claim_ClaimMutation_pkey" PRIMARY KEY ("id");


--
-- TOC entry 3408 (class 2606 OID 20311)
-- Name: core_FieldControl core_FieldControl_field_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."core_FieldControl"
    ADD CONSTRAINT "core_FieldControl_field_key" UNIQUE ("field");


--
-- TOC entry 3411 (class 2606 OID 20309)
-- Name: core_FieldControl core_FieldControl_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."core_FieldControl"
    ADD CONSTRAINT "core_FieldControl_pkey" PRIMARY KEY ("id");


--
-- TOC entry 3423 (class 2606 OID 20337)
-- Name: core_ModuleConfiguration core_ModuleConfiguration_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."core_ModuleConfiguration"
    ADD CONSTRAINT "core_ModuleConfiguration_pkey" PRIMARY KEY ("id");


--
-- TOC entry 3425 (class 2606 OID 20345)
-- Name: core_Mutation_Log core_Mutation_Log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."core_Mutation_Log"
    ADD CONSTRAINT "core_Mutation_Log_pkey" PRIMARY KEY ("id");


--
-- TOC entry 3439 (class 2606 OID 20379)
-- Name: core_TechnicalUser core_TechnicalUser_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."core_TechnicalUser"
    ADD CONSTRAINT "core_TechnicalUser_pkey" PRIMARY KEY ("id");


--
-- TOC entry 3442 (class 2606 OID 20381)
-- Name: core_TechnicalUser core_TechnicalUser_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."core_TechnicalUser"
    ADD CONSTRAINT "core_TechnicalUser_username_key" UNIQUE ("username");


--
-- TOC entry 3402 (class 2606 OID 20304)
-- Name: Core_User_groups Core_User_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."Core_User_groups"
    ADD CONSTRAINT "Core_User_groups_pkey" PRIMARY KEY ("id");


--
-- TOC entry 3405 (class 2606 OID 20410)
-- Name: Core_User_groups Core_User_groups_user_id_group_id_8ec5911a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."Core_User_groups"
    ADD CONSTRAINT "Core_User_groups_user_id_group_id_8ec5911a_uniq" UNIQUE ("user_id", "group_id");


--
-- TOC entry 3395 (class 2606 OID 20294)
-- Name: core_User core_User_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."core_User"
    ADD CONSTRAINT "core_User_pkey" PRIMARY KEY ("id");


--
-- TOC entry 3449 (class 2606 OID 20397)
-- Name: core_User_user_permissions core_User_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."core_User_user_permissions"
    ADD CONSTRAINT "core_User_user_permissions_pkey" PRIMARY KEY ("id");


--
-- TOC entry 3452 (class 2606 OID 20478)
-- Name: core_User_user_permissions core_User_user_permissions_user_id_permission_id_a3c26725_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."core_User_user_permissions"
    ADD CONSTRAINT "core_User_user_permissions_user_id_permission_id_a3c26725_uniq" UNIQUE ("user_id", "permission_id");


--
-- TOC entry 3399 (class 2606 OID 20296)
-- Name: core_User core_User_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."core_User"
    ADD CONSTRAINT "core_User_username_key" UNIQUE ("username");



--
-- TOC entry 3406 (class 1259 OID 20413)
-- Name: core_FieldControl_field_f7925479_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "core_FieldControl_field_f7925479_like" ON "public"."core_FieldControl" USING "btree" ("field" "varchar_pattern_ops");


--
-- TOC entry 3409 (class 1259 OID 20449)
-- Name: core_FieldControl_module_id_bc15aba5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "core_FieldControl_module_id_bc15aba5" ON "public"."core_FieldControl" USING "btree" ("module_id");


--
-- TOC entry 3426 (class 1259 OID 20421)
-- Name: core_Mutation_Log_user_id_f2b2dc10; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "core_Mutation_Log_user_id_f2b2dc10" ON "public"."core_Mutation_Log" USING "btree" ("user_id");


--
-- TOC entry 3440 (class 1259 OID 20429)
-- Name: core_TechnicalUser_username_6f41c923_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "core_TechnicalUser_username_6f41c923_like" ON "public"."core_TechnicalUser" USING "btree" ("username" "varchar_pattern_ops");


--
-- TOC entry 3400 (class 1259 OID 20412)
-- Name: Core_User_groups_group_id_197830ae; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Core_User_groups_group_id_197830ae" ON "public"."Core_User_groups" USING "btree" ("group_id");


--
-- TOC entry 3403 (class 1259 OID 20411)
-- Name: Core_User_groups_user_id_06a128ce; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Core_User_groups_user_id_06a128ce" ON "public"."Core_User_groups" USING "btree" ("user_id");


--
-- TOC entry 3393 (class 1259 OID 20455)
-- Name: core_User_i_user_id_0537e04c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "core_User_i_user_id_0537e04c" ON "public"."core_User" USING "btree" ("i_user_id");

CREATE INDEX "core_User_officer_id" ON "public"."core_User" USING "btree" ("officer_id");
CREATE INDEX "core_User_claim_admin_id" ON "public"."core_User" USING "btree" ("claim_admin_id");


--
-- TOC entry 3396 (class 1259 OID 20461)
-- Name: core_User_t_user_id_c850bf43; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "core_User_t_user_id_c850bf43" ON "public"."core_User" USING "btree" ("t_user_id");


--
-- TOC entry 3447 (class 1259 OID 20480)
-- Name: core_User_user_permissions_permission_id_f70a87da; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "core_User_user_permissions_permission_id_f70a87da" ON "public"."core_User_user_permissions" USING "btree" ("permission_id");


--
-- TOC entry 3450 (class 1259 OID 20479)
-- Name: core_User_user_permissions_user_id_bf794316; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "core_User_user_permissions_user_id_bf794316" ON "public"."core_User_user_permissions" USING "btree" ("user_id");


--
-- TOC entry 3397 (class 1259 OID 20398)
-- Name: core_User_username_109df633_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "core_User_username_109df633_like" ON "public"."core_User" USING "btree" ("username" "varchar_pattern_ops");



--
-- TOC entry 3799 (class 2606 OID 21158)
-- Name: claim_ClaimAttachment claim_ClaimAttachment_claim_id_6d421217_fk_tblClaim_ClaimID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."claim_ClaimAttachment"
    ADD CONSTRAINT "claim_ClaimAttachment_claim_id_6d421217_fk_tblClaim_ClaimID" FOREIGN KEY ("claim_id") REFERENCES "public"."tblClaim"("ClaimID") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3808 (class 2606 OID 21104)
-- Name: claim_ClaimMutation claim_ClaimMutation_claim_id_22e307c0_fk_tblClaim_ClaimID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."claim_ClaimMutation"
    ADD CONSTRAINT "claim_ClaimMutation_claim_id_22e307c0_fk_tblClaim_ClaimID" FOREIGN KEY ("claim_id") REFERENCES "public"."tblClaim"("ClaimID") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3807 (class 2606 OID 21110)
-- Name: claim_ClaimMutation claim_ClaimMutation_mutation_id_6492ecd0_fk_core_Muta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."claim_ClaimMutation"
    ADD CONSTRAINT "claim_ClaimMutation_mutation_id_6492ecd0_fk_core_Muta" FOREIGN KEY ("mutation_id") REFERENCES "public"."core_Mutation_Log"("id") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3729 (class 2606 OID 20450)
-- Name: core_FieldControl core_FieldControl_module_id_bc15aba5_fk_core_Modu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."core_FieldControl"
    ADD CONSTRAINT "core_FieldControl_module_id_bc15aba5_fk_core_Modu" FOREIGN KEY ("module_id") REFERENCES "public"."core_ModuleConfiguration"("id") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3731 (class 2606 OID 20416)
-- Name: core_Mutation_Log core_Mutation_Log_user_id_f2b2dc10_fk_core_User_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."core_Mutation_Log"
    ADD CONSTRAINT "core_Mutation_Log_user_id_f2b2dc10_fk_core_User_id" FOREIGN KEY ("user_id") REFERENCES "public"."core_User"("id") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3727 (class 2606 OID 20399)
-- Name: Core_User_groups Core_User_groups_user_id_06a128ce_fk_core_User_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."Core_User_groups"
    ADD CONSTRAINT "Core_User_groups_user_id_06a128ce_fk_core_User_id" FOREIGN KEY ("user_id") REFERENCES "public"."core_User"("id") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3725 (class 2606 OID 20456)
-- Name: core_User core_User_i_user_id_0537e04c_fk_tblUsers_UserID; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."core_User"
    ADD CONSTRAINT "core_User_i_user_id_0537e04c_fk_tblUsers_UserID" FOREIGN KEY ("i_user_id") REFERENCES "public"."tblUsers"("UserID") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3726 (class 2606 OID 20462)
-- Name: core_User core_User_t_user_id_c850bf43_fk_core_TechnicalUser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."core_User"
    ADD CONSTRAINT "core_User_t_user_id_c850bf43_fk_core_TechnicalUser_id" FOREIGN KEY ("t_user_id") REFERENCES "public"."core_TechnicalUser"("id") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3737 (class 2606 OID 20467)
-- Name: core_User_user_permissions core_User_user_permissions_user_id_bf794316_fk_core_User_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."core_User_user_permissions"
    ADD CONSTRAINT "core_User_user_permissions_user_id_bf794316_fk_core_User_id" FOREIGN KEY ("user_id") REFERENCES "public"."core_User"("id") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3749 (class 2606 OID 20599)
-- Name: location_HealthFacilityMutation location_HealthFacil_health_facility_id_c99eb971_fk_tblHF_HfI; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."location_HealthFacilityMutation"
    ADD CONSTRAINT "location_HealthFacil_health_facility_id_c99eb971_fk_tblHF_HfI" FOREIGN KEY ("health_facility_id") REFERENCES "public"."tblHF"("HfID") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3748 (class 2606 OID 20604)
-- Name: location_HealthFacilityMutation location_HealthFacil_mutation_id_8c14c145_fk_core_Muta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."location_HealthFacilityMutation"
    ADD CONSTRAINT "location_HealthFacil_mutation_id_8c14c145_fk_core_Muta" FOREIGN KEY ("mutation_id") REFERENCES "public"."core_Mutation_Log"("id") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3752 (class 2606 OID 20619)
-- Name: location_LocationMutation location_LocationMut_location_id_4a54c595_fk_tblLocati; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."location_LocationMutation"
    ADD CONSTRAINT "location_LocationMut_location_id_4a54c595_fk_tblLocati" FOREIGN KEY ("location_id") REFERENCES "public"."tblLocations"("LocationId") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3751 (class 2606 OID 20624)
-- Name: location_LocationMutation location_LocationMut_mutation_id_299edb4e_fk_core_Muta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."location_LocationMutation"
    ADD CONSTRAINT "location_LocationMut_mutation_id_299edb4e_fk_core_Muta" FOREIGN KEY ("mutation_id") REFERENCES "public"."core_Mutation_Log"("id") DEFERRABLE INITIALLY DEFERRED;


-- TODO
-- ALTER TABLE ONLY "public"."core_UserMutation"
--     ADD CONSTRAINT "FK_core_UserMutation_core_user_id"
--         FOREIGN KEY ("core_user_id") REFERENCES "public"."core_User"("id")
--             DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE ONLY "public"."core_UserMutation"
    ADD CONSTRAINT "FK_core_UserMutation_core_Mutation_Log_id"
        FOREIGN KEY ("mutation_id") REFERENCES "public"."core_Mutation_Log"("id")
            DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY "public"."insuree_FamilyMutation"
    ADD CONSTRAINT "FK_insuree_FamilyMutation_tblFamilies_FamilyID"
        FOREIGN KEY ("family_id") REFERENCES "public"."tblFamilies"("FamilyID")
            DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE ONLY "public"."insuree_FamilyMutation"
    ADD CONSTRAINT "FK_insuree_FamilyMutation_core_Mutation_Log_id"
        FOREIGN KEY ("mutation_id") REFERENCES "public"."core_Mutation_Log"("id")
            DEFERRABLE INITIALLY DEFERRED;

ALTER TABLE ONLY "public"."insuree_InsureeMutation"
    ADD CONSTRAINT "FK_insuree_InsureeMutation_tblInsuree_InsureeID"
        FOREIGN KEY ("insuree_id") REFERENCES "public"."tblInsuree"("InsureeID")
            DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE ONLY "public"."insuree_InsureeMutation"
    ADD CONSTRAINT "FK_insuree_InsureeMutation_core_Mutation_Log_id"
        FOREIGN KEY ("mutation_id") REFERENCES "public"."core_Mutation_Log"("id")
            DEFERRABLE INITIALLY DEFERRED;

-- ALTER TABLE ONLY "public"."insuree_batch_InsureeBatchMutation"
--     ADD CONSTRAINT "FK_insuree_batch_InsureeBatchMutation_insuree_batch"
--         FOREIGN KEY ("insuree_batch_id") REFERENCES "public"."insuree_batch_insureebatch"("insuree_batch_id")
--             DEFERRABLE INITIALLY DEFERRED;
-- ALTER TABLE ONLY "public"."insuree_batch_InsureeBatchMutation"
--     ADD CONSTRAINT "FK_insuree_batch_InsureeBatchMutation_core_Mutation_Log_id"
--         FOREIGN KEY ("mutation_id") REFERENCES "public"."core_Mutation_Log"("id")
--             DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3329 (class 2604 OID 20302)
-- Name: Core_User_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."Core_User_groups" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."Core_User_groups_id_seq"'::"regclass");


--
-- TOC entry 3335 (class 2604 OID 20395)
-- Name: core_User_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."core_User_user_permissions" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."core_User_user_permissions_id_seq"'::"regclass");


--
-- TOC entry 3491 (class 2606 OID 20562)
-- Name: location_HealthFacilityMutation location_HealthFacilityMutation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."location_HealthFacilityMutation"
    ADD CONSTRAINT "location_HealthFacilityMutation_pkey" PRIMARY KEY ("id");


--
-- TOC entry 3504 (class 2606 OID 20582)
-- Name: location_LocationMutation location_LocationMutation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."location_LocationMutation"
    ADD CONSTRAINT "location_LocationMutation_pkey" PRIMARY KEY ("id");


--
-- TOC entry 3631 (class 1259 OID 21157)
-- Name: claim_ClaimAttachment_claim_id_6d421217; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "claim_ClaimAttachment_claim_id_6d421217" ON "public"."claim_ClaimAttachment" USING "btree" ("claim_id");


--
-- TOC entry 3645 (class 1259 OID 21103)
-- Name: claim_ClaimMutation_claim_id_22e307c0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "claim_ClaimMutation_claim_id_22e307c0" ON "public"."claim_ClaimMutation" USING "btree" ("claim_id");


--
-- TOC entry 3646 (class 1259 OID 21109)
-- Name: claim_ClaimMutation_mutation_id_6492ecd0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "claim_ClaimMutation_mutation_id_6492ecd0" ON "public"."claim_ClaimMutation" USING "btree" ("mutation_id");


--
-- TOC entry 3488 (class 1259 OID 20609)
-- Name: location_HealthFacilityMutation_health_facility_id_c99eb971; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "location_HealthFacilityMutation_health_facility_id_c99eb971" ON "public"."location_HealthFacilityMutation" USING "btree" ("health_facility_id");


--
-- TOC entry 3489 (class 1259 OID 20610)
-- Name: location_HealthFacilityMutation_mutation_id_8c14c145; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "location_HealthFacilityMutation_mutation_id_8c14c145" ON "public"."location_HealthFacilityMutation" USING "btree" ("mutation_id");


--
-- TOC entry 3501 (class 1259 OID 20629)
-- Name: location_LocationMutation_location_id_4a54c595; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "location_LocationMutation_location_id_4a54c595" ON "public"."location_LocationMutation" USING "btree" ("location_id");


--
-- TOC entry 3502 (class 1259 OID 20630)
-- Name: location_LocationMutation_mutation_id_299edb4e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "location_LocationMutation_mutation_id_299edb4e" ON "public"."location_LocationMutation" USING "btree" ("mutation_id");


--
-- TOC entry 3677 (class 1259 OID 21368)
-- Name: report_ReportDefinition_name_5246bc7a_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "report_ReportDefinition_name_5246bc7a_like" ON "public"."report_ReportDefinition" USING "btree" ("name" "varchar_pattern_ops");

--
-- TOC entry 3681 (class 2606 OID 21365)
-- Name: report_ReportDefinition report_ReportDefinition_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."report_ReportDefinition"
    ADD CONSTRAINT "report_ReportDefinition_pkey" PRIMARY KEY ("id");


--
-- TOC entry 307 (class 1259 OID 21276)
-- Name: health_check_db_testmodel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."health_check_db_testmodel" (
    "id" integer NOT NULL,
    "title" character varying(128) NOT NULL
);


-- ALTER TABLE "public"."health_check_db_testmodel" OWNER TO "postgres";

--
-- TOC entry 306 (class 1259 OID 21274)
-- Name: health_check_db_testmodel_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "public"."health_check_db_testmodel_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- ALTER TABLE "public"."health_check_db_testmodel_id_seq" OWNER TO "postgres";

--
-- TOC entry 3999 (class 0 OID 0)
-- Dependencies: 306
-- Name: health_check_db_testmodel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "public"."health_check_db_testmodel_id_seq" OWNED BY "public"."health_check_db_testmodel"."id";


--
-- TOC entry 3368 (class 2604 OID 21279)
-- Name: health_check_db_testmodel id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."health_check_db_testmodel" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."health_check_db_testmodel_id_seq"'::"regclass");

--
-- TOC entry 3676 (class 2606 OID 21281)
-- Name: health_check_db_testmodel health_check_db_testmodel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."health_check_db_testmodel"
    ADD CONSTRAINT "health_check_db_testmodel_pkey" PRIMARY KEY ("id");

CREATE OR REPLACE VIEW "public"."claim_ClaimAttachmentsCountView" AS
	select "claim_id", count(*) "attachments_count" from "claim_ClaimAttachment" GROUP BY "claim_id"
;