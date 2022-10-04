--
-- TOC entry 233 (class 1259 OID 20483)
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."django_admin_log" (
    "id" integer NOT NULL,
    "action_time" timestamp with time zone NOT NULL,
    "object_id" "text",
    "object_repr" character varying(200) NOT NULL,
    "action_flag" smallint NOT NULL,
    "change_message" "text" NOT NULL,
    "content_type_id" integer,
    "user_id" "uuid" NOT NULL,
    CONSTRAINT "django_admin_log_action_flag_check" CHECK (("action_flag" >= 0))
);


-- ALTER TABLE "public"."django_admin_log" OWNER TO "postgres";

--
-- TOC entry 232 (class 1259 OID 20481)
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "public"."django_admin_log_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- ALTER TABLE "public"."django_admin_log_id_seq" OWNER TO "postgres";

--
-- TOC entry 3996 (class 0 OID 0)
-- Dependencies: 232
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "public"."django_admin_log_id_seq" OWNED BY "public"."django_admin_log"."id";


--
-- TOC entry 205 (class 1259 OID 20223)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."django_content_type" (
    "id" integer NOT NULL,
    "app_label" character varying(100) NOT NULL,
    "model" character varying(100) NOT NULL
);


-- ALTER TABLE "public"."django_content_type" OWNER TO "postgres";

--
-- TOC entry 204 (class 1259 OID 20221)
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "public"."django_content_type_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- ALTER TABLE "public"."django_content_type_id_seq" OWNER TO "postgres";

--
-- TOC entry 3997 (class 0 OID 0)
-- Dependencies: 204
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "public"."django_content_type_id_seq" OWNED BY "public"."django_content_type"."id";


--
-- TOC entry 203 (class 1259 OID 20212)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."django_migrations" (
    "id" integer NOT NULL,
    "app" character varying(255) NOT NULL,
    "name" character varying(255) NOT NULL,
    "applied" timestamp with time zone NOT NULL
);


-- ALTER TABLE "public"."django_migrations" OWNER TO "postgres";

--
-- TOC entry 202 (class 1259 OID 20210)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "public"."django_migrations_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- ALTER TABLE "public"."django_migrations_id_seq" OWNER TO "postgres";

--
-- TOC entry 3998 (class 0 OID 0)
-- Dependencies: 202
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "public"."django_migrations_id_seq" OWNED BY "public"."django_migrations"."id";


--
-- TOC entry 309 (class 1259 OID 21369)
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."django_session" (
    "session_key" character varying(40) NOT NULL,
    "session_data" "text" NOT NULL,
    "expire_date" timestamp with time zone NOT NULL
);


-- ALTER TABLE "public"."django_session" OWNER TO "postgres";
--
-- TOC entry 3336 (class 2604 OID 20486)
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."django_admin_log" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."django_admin_log_id_seq"'::"regclass");


--
-- TOC entry 3325 (class 2604 OID 20226)
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."django_content_type" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."django_content_type_id_seq"'::"regclass");


--
-- TOC entry 3324 (class 2604 OID 20215)
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."django_migrations" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."django_migrations_id_seq"'::"regclass");

--
-- TOC entry 3455 (class 2606 OID 20492)
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."django_admin_log"
    ADD CONSTRAINT "django_admin_log_pkey" PRIMARY KEY ("id");


--
-- TOC entry 3374 (class 2606 OID 20230)
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."django_content_type"
    ADD CONSTRAINT "django_content_type_app_label_model_76bd3d3b_uniq" UNIQUE ("app_label", "model");


--
-- TOC entry 3376 (class 2606 OID 20228)
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."django_content_type"
    ADD CONSTRAINT "django_content_type_pkey" PRIMARY KEY ("id");


--
-- TOC entry 3372 (class 2606 OID 20220)
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."django_migrations"
    ADD CONSTRAINT "django_migrations_pkey" PRIMARY KEY ("id");


--
-- TOC entry 3684 (class 2606 OID 21376)
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."django_session"
    ADD CONSTRAINT "django_session_pkey" PRIMARY KEY ("session_key");

--
-- TOC entry 3453 (class 1259 OID 20503)
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "django_admin_log_content_type_id_c4bce8eb" ON "public"."django_admin_log" USING "btree" ("content_type_id");


--
-- TOC entry 3456 (class 1259 OID 20504)
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "django_admin_log_user_id_c564eba6" ON "public"."django_admin_log" USING "btree" ("user_id");


--
-- TOC entry 3682 (class 1259 OID 21378)
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "django_session_expire_date_a5c62663" ON "public"."django_session" USING "btree" ("expire_date");


--
-- TOC entry 3685 (class 1259 OID 21377)
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "django_session_session_key_c0390e0f_like" ON "public"."django_session" USING "btree" ("session_key" "varchar_pattern_ops");

--
-- TOC entry 3722 (class 2606 OID 20267)
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."auth_permission"
    ADD CONSTRAINT "auth_permission_content_type_id_2f476e4b_fk_django_co" FOREIGN KEY ("content_type_id") REFERENCES "public"."django_content_type"("id") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3739 (class 2606 OID 20493)
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."django_admin_log"
    ADD CONSTRAINT "django_admin_log_content_type_id_c4bce8eb_fk_django_co" FOREIGN KEY ("content_type_id") REFERENCES "public"."django_content_type"("id") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3740 (class 2606 OID 20498)
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_core_User_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."django_admin_log"
    ADD CONSTRAINT "django_admin_log_user_id_c564eba6_fk_core_User_id" FOREIGN KEY ("user_id") REFERENCES "public"."core_User"("id") DEFERRABLE INITIALLY DEFERRED;


SELECT setval('"public"."django_migrations_id_seq"', (select coalesce(max("id"), 1) from "public"."django_migrations"), true);


--
-- TOC entry 207 (class 1259 OID 20243)
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "public"."auth_permission" (
    "id" integer NOT NULL,
    "name" character varying(255) NOT NULL,
    "content_type_id" integer NOT NULL,
    "codename" character varying(100) NOT NULL
);


ALTER TABLE "public"."auth_permission" OWNER TO "postgres";

--
-- TOC entry 206 (class 1259 OID 20241)
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "public"."auth_permission_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "public"."auth_permission_id_seq" OWNER TO "postgres";

--
-- TOC entry 3993 (class 0 OID 0)
-- Dependencies: 206
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "public"."auth_permission_id_seq" OWNED BY "public"."auth_permission"."id";

--
-- TOC entry 3326 (class 2604 OID 20246)
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."auth_permission" ALTER COLUMN "id" SET DEFAULT "nextval"('"public"."auth_permission_id_seq"'::"regclass");

--
-- TOC entry 3379 (class 2606 OID 20273)
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."auth_permission"
    ADD CONSTRAINT "auth_permission_content_type_id_codename_01ab375a_uniq" UNIQUE ("content_type_id", "codename");


--
-- TOC entry 3381 (class 2606 OID 20248)
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."auth_permission"
    ADD CONSTRAINT "auth_permission_pkey" PRIMARY KEY ("id");

--
-- TOC entry 3377 (class 1259 OID 20274)
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "auth_permission_content_type_id_2f476e4b" ON "public"."auth_permission" USING "btree" ("content_type_id");

--
-- TOC entry 3724 (class 2606 OID 20281)
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."auth_group_permissions"
    ADD CONSTRAINT "auth_group_permissio_permission_id_84c5c92e_fk_auth_perm" FOREIGN KEY ("permission_id") REFERENCES "public"."auth_permission"("id") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3723 (class 2606 OID 20276)
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."auth_group_permissions"
    ADD CONSTRAINT "auth_group_permissions_group_id_b120cbf9_fk_auth_group_id" FOREIGN KEY ("group_id") REFERENCES "public"."auth_group"("id") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3722 (class 2606 OID 20267)
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."auth_permission"
    ADD CONSTRAINT "auth_permission_content_type_id_2f476e4b_fk_django_co" FOREIGN KEY ("content_type_id") REFERENCES "public"."django_content_type"("id") DEFERRABLE INITIALLY DEFERRED;

--
-- TOC entry 3738 (class 2606 OID 20472)
-- Name: core_User_user_permissions core_User_user_permi_permission_id_f70a87da_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "public"."core_User_user_permissions"
    ADD CONSTRAINT "core_User_user_permi_permission_id_f70a87da_fk_auth_perm" FOREIGN KEY ("permission_id") REFERENCES "public"."auth_permission"("id") DEFERRABLE INITIALLY DEFERRED;


