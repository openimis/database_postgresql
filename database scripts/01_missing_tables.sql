CREATE TABLE public."tblCeilingInterpretation"
(
    "CeilingIntCode" character(1) COLLATE pg_catalog."default" NOT NULL,
    "CeilingIntDesc" character varying(100) COLLATE pg_catalog."default" NOT NULL,
    "AltLanguage" character varying(100) COLLATE pg_catalog."default",
    "SortOrder" integer,
    CONSTRAINT "tblCeilingInterpretation_pkey" PRIMARY KEY ("CeilingIntCode")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."tblCeilingInterpretation"
    OWNER to postgres;



CREATE TABLE public."tblControlNumber"
(
    "ControlNumberID" bigint NOT NULL,
    "RequestedDate" timestamp with time zone,
    "ReceivedDate" timestamp with time zone,
    "RequestOrigin" character varying(50) COLLATE pg_catalog."default",
    "ResponseOrigin" character varying(50) COLLATE pg_catalog."default",
    "Status" integer,
    "LegacyID" bigint,
    "ValidityFrom" timestamp with time zone,
    "ValidityTo" timestamp with time zone,
    "AuditedUserID" integer,
    "PaymentID" bigint,
    "ControlNumber" character varying(50) COLLATE pg_catalog."default",
    "IssuedDate" timestamp with time zone,
    "Comment" character varying COLLATE pg_catalog."default",
    CONSTRAINT "tblControlNumber_pkey" PRIMARY KEY ("ControlNumberID")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."tblControlNumber"
    OWNER to postgres;



CREATE TABLE public."tblControls"
(
    "FieldName" character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "Adjustibility" character varying(1) COLLATE pg_catalog."default" NOT NULL,
    "Usage" character varying(200) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "tblControls_pkey" PRIMARY KEY ("FieldName")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."tblControls"
    OWNER to postgres;



CREATE TABLE public."tblEmailSettings"
(
    "EmailId" character varying(200) COLLATE pg_catalog."default" NOT NULL,
    "EmailPassword" character varying(200) COLLATE pg_catalog."default" NOT NULL,
    "SMTPHost" character varying(200) COLLATE pg_catalog."default" NOT NULL,
    "Port" integer NOT NULL,
    "EnableSSL" bit(1) NOT NULL
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."tblEmailSettings"
    OWNER to postgres;



CREATE TABLE public."tblExtracts"
(
    "ExtractID" integer NOT NULL,
    "ExtractDirection" smallint NOT NULL,
    "ExtractType" smallint NOT NULL,
    "ExtractSequence" integer NOT NULL,
    "ExtractDate" timestamp with time zone NOT NULL,
    "ExtractFileName" character varying(255) COLLATE pg_catalog."default",
    "ExtractFolder" character varying(255) COLLATE pg_catalog."default",
    "LocationId" integer NOT NULL,
    "HFID" integer,
    "AppVersionBackend" numeric(3,1) NOT NULL,
    "ValidityFrom" timestamp with time zone NOT NULL,
    "ValidityTo" timestamp with time zone,
    "LegacyID" integer,
    "AuditUserID" integer NOT NULL,
    "RowID" bigint,
    "ExtractUUID" uuid NOT NULL,
    CONSTRAINT "tblExtracts_pkey" PRIMARY KEY ("ExtractID")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."tblExtracts"
    OWNER to postgres;



CREATE TABLE public."tblFromPhone"
(
    "FromPhoneId" integer NOT NULL,
    "DocType" character varying(3) COLLATE pg_catalog."default" NOT NULL,
    "DocName" character varying(200) COLLATE pg_catalog."default" NOT NULL,
    "DocStatus" character varying(3) COLLATE pg_catalog."default",
    "LandedDate" timestamp with time zone NOT NULL,
    "OfficerCode" character varying(8) COLLATE pg_catalog."default",
    "CHFID" character varying(12) COLLATE pg_catalog."default",
    "PhotoSumittedDate" timestamp with time zone,
    "ClaimId" integer,
    CONSTRAINT "tblFromPhone_pkey" PRIMARY KEY ("FromPhoneId"),
    CONSTRAINT "chk_DocType" CHECK ("DocType" = N'C' OR "DocType" = N'F' OR "DocType" = N'R' OR "DocType" = N'E')
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."tblFromPhone"
    OWNER to postgres;



CREATE TABLE public."tblHealthStatus"
(
    "HealthStatusID" integer NOT NULL,
    "InsureeID" integer NOT NULL,
    "Description" character varying(255) COLLATE pg_catalog."default",
    "ValidityFrom" timestamp with time zone,
    "ValidityTo" timestamp with time zone,
    "AuditUserID" integer,
    "LegacyID" integer,
    CONSTRAINT "tblHealthStatus_pkey" PRIMARY KEY ("HealthStatusID"),
    CONSTRAINT "FK_tblHealthStatus_tblInsuree" FOREIGN KEY ("InsureeID")
        REFERENCES public."tblInsuree" ("InsureeID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        DEFERRABLE INITIALLY DEFERRED
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."tblHealthStatus"
    OWNER to postgres;



CREATE TABLE public."tblIdentificationTypes"
(
    "IdentificationCode" character varying(1) COLLATE pg_catalog."default" NOT NULL,
    "IdentificationTypes" character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "AltLanguage" character varying(50) COLLATE pg_catalog."default",
    "SortOrder" integer,
    CONSTRAINT "tblIdentificationTypes_pkey" PRIMARY KEY ("IdentificationCode")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."tblIdentificationTypes"
    OWNER to postgres;



CREATE TABLE public."tblFeedbackPrompt"
(
    "ClaimID" integer,
    "FeedbackPromptDate" date NOT NULL,
    "FeedbackPromptID" integer NOT NULL,
    "LegacyID" integer,
    "OfficerID" integer,
    "PhoneNumber" character varying(25) COLLATE pg_catalog."default",
    "SMSStatus" smallint DEFAULT 0,
    "ValidityFrom" timestamp with time zone,
    "ValidityTo" timestamp with time zone,
    "AuditUserID" integer,
    CONSTRAINT "tblFeedbackPrompt_pkey" PRIMARY KEY ("FeedbackPromptID")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."tblFeedbackPrompt"
    OWNER to postgres;



CREATE TABLE "tblIMISDefaults"
(
	"DefaultID" int NOT NULL,
	"PolicyRenewalInterval" int,
	"FTPHost" varchar(50) COLLATE pg_catalog."default",
	"FTPUser" varchar(50) COLLATE pg_catalog."default",
	"FTPPassword" varchar(20) COLLATE pg_catalog."default",
	"FTPPort" int,
	"FTPEnrollmentFolder" varchar(255) COLLATE pg_catalog."default",
	"AssociatedPhotoFolder" varchar(255) COLLATE pg_catalog."default",
	"FTPClaimFolder" varchar(255) COLLATE pg_catalog."default",
	"FTPFeedbackFolder" varchar(255) COLLATE pg_catalog."default",
	"FTPPolicyRenewalFolder" varchar(255) COLLATE pg_catalog."default",
	"FTPPhoneExtractFolder" varchar(255) COLLATE pg_catalog."default",
	"FTPOffLineExtractFolder" varchar(255) COLLATE pg_catalog."default",
	"AppVersionBackEnd" decimal(3, 1),
	"AppVersionEnquire" decimal(3, 1),
	"AppVersionEnroll" decimal(3, 1),
	"AppVersionRenewal" decimal(3, 1),
	"AppVersionFeedback" decimal(3, 1),
	"AppVersionClaim" decimal(3, 1),
	"OffLineHF" int ,
	"WinRarFolder" varchar(255) COLLATE pg_catalog."default",
	"DatabaseBackupFolder" varchar(255) COLLATE pg_catalog."default",
	"OfflineCHF" int,
	"SMSLink" varchar(500) COLLATE pg_catalog."default",
	"SMSIP" varchar(15) COLLATE pg_catalog."default",
	"SMSUserName" varchar(15) COLLATE pg_catalog."default",
	"SMSPassword" varchar(50) COLLATE pg_catalog."default",
	"SMSSource" varchar(15) COLLATE pg_catalog."default",
	"SMSDlr" int,
	"SMSType" int,
	"AppVersionFeedbackRenewal" decimal(3, 1),
	"AppVersionImis" decimal(3, 1),
	"APIKey" varchar(100) COLLATE pg_catalog."default",
	CONSTRAINT "PK_tblIMISDefaults" PRIMARY KEY ("DefaultID")
)
WITH (
	OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."tblIMISDefaults"
    OWNER to postgres;



CREATE TABLE "tblIMISDefaultsPhone"(
	"RuleName" varchar(100),
	"RuleValue" bool
)
TABLESPACE pg_default;

ALTER TABLE public."tblIMISDefaultsPhone"
    OWNER to postgres;



CREATE TABLE public."tblLogins"
(
    "LoginId" integer NOT NULL,
    "UserId" integer,
    "LogTime" timestamp with time zone,
    "LogAction" integer,
    CONSTRAINT "tblLogins_pkey" PRIMARY KEY ("LoginId"),
    CONSTRAINT "FK_tblLogins_tblUsers" FOREIGN KEY ("UserId")
        REFERENCES public."tblUsers" ("UserID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        DEFERRABLE INITIALLY DEFERRED
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."tblLogins"
    OWNER to postgres;



CREATE TABLE public."tblOfficerVillages"
(
    "OfficerVillageId" integer NOT NULL,
    "OfficerId" integer,
    "LocationId" integer,
    "ValidityFrom" timestamp with time zone,
    "ValidityTo" timestamp with time zone,
    "LegacyId" integer,
    "AuditUserId" integer,
    "RowId" text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "tblOfficerVillages_pkey" PRIMARY KEY ("OfficerVillageId"),
    CONSTRAINT "FK_tblOfficerVillages_tblLocations" FOREIGN KEY ("LocationId")
        REFERENCES public."tblLocations" ("LocationId") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT "FK_tblOfficerVillages_tblOfficer" FOREIGN KEY ("OfficerId")
        REFERENCES public."tblOfficer" ("OfficerID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        DEFERRABLE INITIALLY DEFERRED
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."tblOfficerVillages"
    OWNER to postgres;



CREATE TABLE public."tblPayerType"
(
    "Code" character(1) COLLATE pg_catalog."default" NOT NULL,
    "PayerType" character varying(50) COLLATE pg_catalog."default" NOT NULL,
    "AltLanguage" character varying(50) COLLATE pg_catalog."default",
    "SortOrder" integer,
    CONSTRAINT "tblPayerType_pkey" PRIMARY KEY ("PayerType")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."tblPayerType"
    OWNER to postgres;



CREATE TABLE public."tblPayment"
(
    "PaymentID" bigint NOT NULL,
    "PaymentUUID" uuid NOT NULL,
    "ExpectedAmount" numeric(18,2),
    "ReceivedAmount" numeric(18,2),
    "OfficerCode" character varying(50) COLLATE pg_catalog."default",
    "PhoneNumber" character varying(12) COLLATE pg_catalog."default",
    "RequestDate" timestamp with time zone,
    "ReceivedDate" timestamp with time zone,
    "PaymentStatus" integer,
    "LegacyID" bigint,
    "ValidityFrom" timestamp with time zone,
    "ValidityTo" timestamp with time zone,
    "RowID" timestamp with time zone,
    "AuditedUSerID" integer,
    "TransactionNo" character varying(50) COLLATE pg_catalog."default",
    "PaymentOrigin" character varying(50) COLLATE pg_catalog."default",
    "MatchedDate" timestamp with time zone,
    "ReceiptNo" character varying(100) COLLATE pg_catalog."default",
    "PaymentDate" timestamp with time zone,
    "RejectedReason" character varying(255) COLLATE pg_catalog."default",
    "DateLastSMS" timestamp with time zone,
    "LanguageName" character varying(10) COLLATE pg_catalog."default",
    "TypeOfPayment" character varying(50) COLLATE pg_catalog."default",
    "TransferFee" numeric(18,2),
    CONSTRAINT "tblPayment_pkey" PRIMARY KEY ("PaymentID")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."tblPayment"
    OWNER to postgres;



CREATE TABLE public."tblPaymentDetails"
(
    "PaymentDetailsID" bigint NOT NULL,
    "PaymentID" bigint NOT NULL,
    "ProductCode" character varying(8) COLLATE pg_catalog."default",
    "InsuranceNumber" character varying(12) COLLATE pg_catalog."default",
    "PolicyStage" character varying(1) COLLATE pg_catalog."default",
    "Amount" numeric(18,2),
    "LegacyID" bigint,
    "ValidityFrom" timestamp with time zone,
    "ValidityTo" timestamp with time zone,
    "RowID" timestamp with time zone,
    "PremiumID" integer,
    "AuditedUserId" integer,
    "enrollmentDate" date,
    "ExpectedAmount" numeric(18,2),
    CONSTRAINT "tblPaymentDetails_pkey" PRIMARY KEY ("PaymentDetailsID")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."tblPaymentDetails"
    OWNER to postgres;



CREATE TABLE public."tblPolicyRenewals"
(
    "RenewalID" integer NOT NULL,
    "RenewalPromptDate" date NOT NULL,
    "RenewalDate" date NOT NULL,
    "NewOfficerID" integer,
    "PhoneNumber" character varying(25) COLLATE pg_catalog."default",
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
    "RenewalUUID" uuid NOT NULL,
    CONSTRAINT "tblPolicyRenewals_pkey" PRIMARY KEY ("RenewalID"),
    CONSTRAINT "FK_tblPolicyRenewals_tblInsuree" FOREIGN KEY ("InsureeID")
        REFERENCES public."tblInsuree" ("InsureeID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT "FK_tblPolicyRenewals_tblOfficer" FOREIGN KEY ("NewOfficerID")
        REFERENCES public."tblOfficer" ("OfficerID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT "FK_tblPolicyRenewals_tblPolicy" FOREIGN KEY ("PolicyID")
        REFERENCES public."tblPolicy" ("PolicyID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT "FK_tblPolicyRenewals_tblProduct" FOREIGN KEY ("NewProdID")
        REFERENCES public."tblProduct" ("ProdID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        DEFERRABLE INITIALLY DEFERRED
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."tblPolicyRenewals"
    OWNER to postgres;



CREATE TABLE public."tblPolicyRenewalDetails"
(
    "RenewalDetailID" integer NOT NULL,
    "RenewalID" integer NOT NULL,
    "InsureeID" integer NOT NULL,
    "ValidityFrom" timestamp with time zone NOT NULL,
    "ValidityTo" timestamp with time zone,
    "LegacyID" integer,
    "AuditCreateUser" integer NOT NULL,
    CONSTRAINT "tblPolicyRenewalDetails_pkey" PRIMARY KEY ("RenewalDetailID"),
    CONSTRAINT "FK_tblPolicyRenewalDetails_tblInsuree" FOREIGN KEY ("InsureeID")
        REFERENCES public."tblInsuree" ("InsureeID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        DEFERRABLE INITIALLY DEFERRED,
    CONSTRAINT "FK_tblPolicyRenewalDetails_tblPolicyRenewals" FOREIGN KEY ("RenewalID")
        REFERENCES public."tblPolicyRenewals" ("RenewalID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        DEFERRABLE INITIALLY DEFERRED
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."tblPolicyRenewalDetails"
    OWNER to postgres;



CREATE TABLE public."tblReporting"
(
    "ReportingId" integer NOT NULL,
    "ReportingDate" timestamp with time zone NOT NULL,
    "LocationId" integer NOT NULL,
    "ProdId" integer NOT NULL,
    "PayerId" integer,
    "StartDate" date NOT NULL,
    "EndDate" date NOT NULL,
    "RecordFound" integer NOT NULL,
    "OfficerID" integer,
    "ReportType" integer,
    "CammissionRate" numeric(18,2),
    "CommissionRate" numeric(18,2),
    CONSTRAINT "tblReporting_pkey" PRIMARY KEY ("ReportingId")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."tblReporting"
    OWNER to postgres;



CREATE TABLE public."tblSubmittedPhotos"
(
    "PhotoId" integer NOT NULL,
    "ImageName" character varying(50) COLLATE pg_catalog."default",
    "CHFID" character varying(12) COLLATE pg_catalog."default",
    "OfficerCode" character varying(8) COLLATE pg_catalog."default",
    "PhotoDate" date,
    "RegisterDate" timestamp with time zone,
    CONSTRAINT "tblSubmittedPhotos_pkey" PRIMARY KEY ("PhotoId")
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."tblSubmittedPhotos"
    OWNER to postgres;
