--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.11
-- Dumped by pg_dump version 9.6.11

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ApiClaims; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ApiClaims" (
    "Id" integer NOT NULL,
    "ApiResourceId" integer NOT NULL,
    "Type" character varying(200) NOT NULL
);


ALTER TABLE public."ApiClaims" OWNER TO postgres;

--
-- Name: ApiClaims_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."ApiClaims_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ApiClaims_Id_seq" OWNER TO postgres;

--
-- Name: ApiClaims_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."ApiClaims_Id_seq" OWNED BY public."ApiClaims"."Id";


--
-- Name: ApiProperties; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ApiProperties" (
    "Id" integer NOT NULL,
    "Key" character varying(250) NOT NULL,
    "Value" character varying(2000) NOT NULL,
    "ApiResourceId" integer NOT NULL
);


ALTER TABLE public."ApiProperties" OWNER TO postgres;

--
-- Name: ApiProperties_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."ApiProperties_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ApiProperties_Id_seq" OWNER TO postgres;

--
-- Name: ApiProperties_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."ApiProperties_Id_seq" OWNED BY public."ApiProperties"."Id";


--
-- Name: ApiResources; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ApiResources" (
    "Id" integer NOT NULL,
    "Description" character varying(1000),
    "DisplayName" character varying(200),
    "Enabled" boolean NOT NULL,
    "Name" character varying(200) NOT NULL,
    "Created" timestamp(6) without time zone DEFAULT '0001-01-01 00:00:00'::timestamp without time zone NOT NULL,
    "LastAccessed" timestamp(6) without time zone,
    "NonEditable" boolean DEFAULT false NOT NULL,
    "Updated" timestamp(6) without time zone
);


ALTER TABLE public."ApiResources" OWNER TO postgres;

--
-- Name: ApiResources_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."ApiResources_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ApiResources_Id_seq" OWNER TO postgres;

--
-- Name: ApiResources_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."ApiResources_Id_seq" OWNED BY public."ApiResources"."Id";


--
-- Name: ApiScopeClaims; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ApiScopeClaims" (
    "Id" integer NOT NULL,
    "ApiScopeId" integer NOT NULL,
    "Type" character varying(200) NOT NULL
);


ALTER TABLE public."ApiScopeClaims" OWNER TO postgres;

--
-- Name: ApiScopeClaims_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."ApiScopeClaims_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ApiScopeClaims_Id_seq" OWNER TO postgres;

--
-- Name: ApiScopeClaims_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."ApiScopeClaims_Id_seq" OWNED BY public."ApiScopeClaims"."Id";


--
-- Name: ApiScopes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ApiScopes" (
    "Id" integer NOT NULL,
    "ApiResourceId" integer NOT NULL,
    "Description" character varying(1000),
    "DisplayName" character varying(200),
    "Emphasize" boolean NOT NULL,
    "Name" character varying(200) NOT NULL,
    "Required" boolean NOT NULL,
    "ShowInDiscoveryDocument" boolean NOT NULL
);


ALTER TABLE public."ApiScopes" OWNER TO postgres;

--
-- Name: ApiScopes_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."ApiScopes_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ApiScopes_Id_seq" OWNER TO postgres;

--
-- Name: ApiScopes_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."ApiScopes_Id_seq" OWNED BY public."ApiScopes"."Id";


--
-- Name: ApiSecrets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ApiSecrets" (
    "Id" integer NOT NULL,
    "ApiResourceId" integer NOT NULL,
    "Description" character varying(1000),
    "Expiration" timestamp(6) without time zone,
    "Type" character varying(250) NOT NULL,
    "Value" character varying(4000) NOT NULL,
    "Created" timestamp(6) without time zone DEFAULT '0001-01-01 00:00:00'::timestamp without time zone NOT NULL
);


ALTER TABLE public."ApiSecrets" OWNER TO postgres;

--
-- Name: ApiSecrets_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."ApiSecrets_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ApiSecrets_Id_seq" OWNER TO postgres;

--
-- Name: ApiSecrets_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."ApiSecrets_Id_seq" OWNED BY public."ApiSecrets"."Id";


--
-- Name: AspNetRoleClaims; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."AspNetRoleClaims" (
    "Id" integer NOT NULL,
    "ClaimType" text,
    "ClaimValue" text,
    "RoleId" text NOT NULL
);


ALTER TABLE public."AspNetRoleClaims" OWNER TO postgres;

--
-- Name: AspNetRoleClaims_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."AspNetRoleClaims_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AspNetRoleClaims_Id_seq" OWNER TO postgres;

--
-- Name: AspNetRoleClaims_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."AspNetRoleClaims_Id_seq" OWNED BY public."AspNetRoleClaims"."Id";


--
-- Name: AspNetRoles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."AspNetRoles" (
    "Id" text NOT NULL,
    "ConcurrencyStamp" text,
    "Name" character varying(256),
    "NormalizedName" character varying(256)
);


ALTER TABLE public."AspNetRoles" OWNER TO postgres;

--
-- Name: AspNetUserClaims; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."AspNetUserClaims" (
    "Id" integer NOT NULL,
    "ClaimType" text,
    "ClaimValue" text,
    "UserId" text NOT NULL
);


ALTER TABLE public."AspNetUserClaims" OWNER TO postgres;

--
-- Name: AspNetUserClaims_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."AspNetUserClaims_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."AspNetUserClaims_Id_seq" OWNER TO postgres;

--
-- Name: AspNetUserClaims_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."AspNetUserClaims_Id_seq" OWNED BY public."AspNetUserClaims"."Id";


--
-- Name: AspNetUserLogins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."AspNetUserLogins" (
    "LoginProvider" text NOT NULL,
    "ProviderKey" text NOT NULL,
    "ProviderDisplayName" text,
    "UserId" text NOT NULL
);


ALTER TABLE public."AspNetUserLogins" OWNER TO postgres;

--
-- Name: AspNetUserRoles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."AspNetUserRoles" (
    "UserId" text NOT NULL,
    "RoleId" text NOT NULL
);


ALTER TABLE public."AspNetUserRoles" OWNER TO postgres;

--
-- Name: AspNetUserTokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."AspNetUserTokens" (
    "UserId" text NOT NULL,
    "LoginProvider" text NOT NULL,
    "Name" text NOT NULL,
    "Value" text
);


ALTER TABLE public."AspNetUserTokens" OWNER TO postgres;

--
-- Name: AspNetUsers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."AspNetUsers" (
    "Id" text NOT NULL,
    "AccessFailedCount" integer NOT NULL,
    "ConcurrencyStamp" text,
    "Email" character varying(256),
    "EmailConfirmed" boolean NOT NULL,
    "LockoutEnabled" boolean NOT NULL,
    "LockoutEnd" timestamp(6) with time zone,
    "NormalizedEmail" character varying(256),
    "NormalizedUserName" character varying(256),
    "PasswordHash" text,
    "PhoneNumber" text,
    "PhoneNumberConfirmed" boolean NOT NULL,
    "SecurityStamp" text,
    "TwoFactorEnabled" boolean NOT NULL,
    "UserName" character varying(256)
);


ALTER TABLE public."AspNetUsers" OWNER TO postgres;

--
-- Name: ClientClaims; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ClientClaims" (
    "Id" integer NOT NULL,
    "ClientId" integer NOT NULL,
    "Type" character varying(250) NOT NULL,
    "Value" character varying(250) NOT NULL
);


ALTER TABLE public."ClientClaims" OWNER TO postgres;

--
-- Name: ClientClaims_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."ClientClaims_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ClientClaims_Id_seq" OWNER TO postgres;

--
-- Name: ClientClaims_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."ClientClaims_Id_seq" OWNED BY public."ClientClaims"."Id";


--
-- Name: ClientCorsOrigins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ClientCorsOrigins" (
    "Id" integer NOT NULL,
    "ClientId" integer NOT NULL,
    "Origin" character varying(150) NOT NULL
);


ALTER TABLE public."ClientCorsOrigins" OWNER TO postgres;

--
-- Name: ClientCorsOrigins_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."ClientCorsOrigins_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ClientCorsOrigins_Id_seq" OWNER TO postgres;

--
-- Name: ClientCorsOrigins_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."ClientCorsOrigins_Id_seq" OWNED BY public."ClientCorsOrigins"."Id";


--
-- Name: ClientGrantTypes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ClientGrantTypes" (
    "Id" integer NOT NULL,
    "ClientId" integer NOT NULL,
    "GrantType" character varying(250) NOT NULL
);


ALTER TABLE public."ClientGrantTypes" OWNER TO postgres;

--
-- Name: ClientGrantTypes_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."ClientGrantTypes_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ClientGrantTypes_Id_seq" OWNER TO postgres;

--
-- Name: ClientGrantTypes_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."ClientGrantTypes_Id_seq" OWNED BY public."ClientGrantTypes"."Id";


--
-- Name: ClientIdPRestrictions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ClientIdPRestrictions" (
    "Id" integer NOT NULL,
    "ClientId" integer NOT NULL,
    "Provider" character varying(200) NOT NULL
);


ALTER TABLE public."ClientIdPRestrictions" OWNER TO postgres;

--
-- Name: ClientIdPRestrictions_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."ClientIdPRestrictions_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ClientIdPRestrictions_Id_seq" OWNER TO postgres;

--
-- Name: ClientIdPRestrictions_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."ClientIdPRestrictions_Id_seq" OWNED BY public."ClientIdPRestrictions"."Id";


--
-- Name: ClientPostLogoutRedirectUris; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ClientPostLogoutRedirectUris" (
    "Id" integer NOT NULL,
    "ClientId" integer NOT NULL,
    "PostLogoutRedirectUri" character varying(2000) NOT NULL
);


ALTER TABLE public."ClientPostLogoutRedirectUris" OWNER TO postgres;

--
-- Name: ClientPostLogoutRedirectUris_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."ClientPostLogoutRedirectUris_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ClientPostLogoutRedirectUris_Id_seq" OWNER TO postgres;

--
-- Name: ClientPostLogoutRedirectUris_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."ClientPostLogoutRedirectUris_Id_seq" OWNED BY public."ClientPostLogoutRedirectUris"."Id";


--
-- Name: ClientProperties; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ClientProperties" (
    "Id" integer NOT NULL,
    "ClientId" integer NOT NULL,
    "Key" character varying(250) NOT NULL,
    "Value" character varying(2000) NOT NULL
);


ALTER TABLE public."ClientProperties" OWNER TO postgres;

--
-- Name: ClientProperties_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."ClientProperties_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ClientProperties_Id_seq" OWNER TO postgres;

--
-- Name: ClientProperties_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."ClientProperties_Id_seq" OWNED BY public."ClientProperties"."Id";


--
-- Name: ClientRedirectUris; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ClientRedirectUris" (
    "Id" integer NOT NULL,
    "ClientId" integer NOT NULL,
    "RedirectUri" character varying(2000) NOT NULL
);


ALTER TABLE public."ClientRedirectUris" OWNER TO postgres;

--
-- Name: ClientRedirectUris_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."ClientRedirectUris_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ClientRedirectUris_Id_seq" OWNER TO postgres;

--
-- Name: ClientRedirectUris_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."ClientRedirectUris_Id_seq" OWNED BY public."ClientRedirectUris"."Id";


--
-- Name: ClientScopes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ClientScopes" (
    "Id" integer NOT NULL,
    "ClientId" integer NOT NULL,
    "Scope" character varying(200) NOT NULL
);


ALTER TABLE public."ClientScopes" OWNER TO postgres;

--
-- Name: ClientScopes_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."ClientScopes_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ClientScopes_Id_seq" OWNER TO postgres;

--
-- Name: ClientScopes_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."ClientScopes_Id_seq" OWNED BY public."ClientScopes"."Id";


--
-- Name: ClientSecrets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ClientSecrets" (
    "Id" integer NOT NULL,
    "ClientId" integer NOT NULL,
    "Description" character varying(2000),
    "Expiration" timestamp(6) without time zone,
    "Type" character varying(250) NOT NULL,
    "Value" character varying(4000) NOT NULL,
    "Created" timestamp(6) without time zone DEFAULT '0001-01-01 00:00:00'::timestamp without time zone NOT NULL
);


ALTER TABLE public."ClientSecrets" OWNER TO postgres;

--
-- Name: ClientSecrets_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."ClientSecrets_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ClientSecrets_Id_seq" OWNER TO postgres;

--
-- Name: ClientSecrets_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."ClientSecrets_Id_seq" OWNED BY public."ClientSecrets"."Id";


--
-- Name: Clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Clients" (
    "Id" integer NOT NULL,
    "AbsoluteRefreshTokenLifetime" integer NOT NULL,
    "AccessTokenLifetime" integer NOT NULL,
    "AccessTokenType" integer NOT NULL,
    "AllowAccessTokensViaBrowser" boolean NOT NULL,
    "AllowOfflineAccess" boolean NOT NULL,
    "AllowPlainTextPkce" boolean NOT NULL,
    "AllowRememberConsent" boolean NOT NULL,
    "AlwaysIncludeUserClaimsInIdToken" boolean NOT NULL,
    "AlwaysSendClientClaims" boolean NOT NULL,
    "AuthorizationCodeLifetime" integer NOT NULL,
    "BackChannelLogoutSessionRequired" boolean NOT NULL,
    "BackChannelLogoutUri" character varying(2000),
    "ClientClaimsPrefix" character varying(200),
    "ClientId" character varying(200) NOT NULL,
    "ClientName" character varying(200),
    "ClientUri" character varying(2000),
    "ConsentLifetime" integer,
    "Description" character varying(1000),
    "EnableLocalLogin" boolean NOT NULL,
    "Enabled" boolean NOT NULL,
    "FrontChannelLogoutSessionRequired" boolean NOT NULL,
    "FrontChannelLogoutUri" character varying(2000),
    "IdentityTokenLifetime" integer NOT NULL,
    "IncludeJwtId" boolean NOT NULL,
    "LogoUri" character varying(2000),
    "PairWiseSubjectSalt" character varying(200),
    "ProtocolType" character varying(200) NOT NULL,
    "RefreshTokenExpiration" integer NOT NULL,
    "RefreshTokenUsage" integer NOT NULL,
    "RequireClientSecret" boolean NOT NULL,
    "RequireConsent" boolean NOT NULL,
    "RequirePkce" boolean NOT NULL,
    "SlidingRefreshTokenLifetime" integer NOT NULL,
    "UpdateAccessTokenClaimsOnRefresh" boolean NOT NULL,
    "Created" timestamp(6) without time zone DEFAULT '0001-01-01 00:00:00'::timestamp without time zone NOT NULL,
    "DeviceCodeLifetime" integer DEFAULT 0 NOT NULL,
    "LastAccessed" timestamp(6) without time zone,
    "NonEditable" boolean DEFAULT false NOT NULL,
    "Updated" timestamp(6) without time zone,
    "UserCodeType" character varying(100),
    "UserSsoLifetime" integer
);


ALTER TABLE public."Clients" OWNER TO postgres;

--
-- Name: Clients_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Clients_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Clients_Id_seq" OWNER TO postgres;

--
-- Name: Clients_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Clients_Id_seq" OWNED BY public."Clients"."Id";


--
-- Name: DeviceCodes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."DeviceCodes" (
    "UserCode" character varying(200) NOT NULL,
    "DeviceCode" character varying(200) NOT NULL,
    "SubjectId" character varying(200),
    "ClientId" character varying(200) NOT NULL,
    "CreationTime" timestamp(6) without time zone NOT NULL,
    "Expiration" timestamp(6) without time zone NOT NULL,
    "Data" character varying(50000) NOT NULL
);


ALTER TABLE public."DeviceCodes" OWNER TO postgres;

--
-- Name: IdentityClaims; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."IdentityClaims" (
    "Id" integer NOT NULL,
    "IdentityResourceId" integer NOT NULL,
    "Type" character varying(200) NOT NULL
);


ALTER TABLE public."IdentityClaims" OWNER TO postgres;

--
-- Name: IdentityClaims_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."IdentityClaims_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."IdentityClaims_Id_seq" OWNER TO postgres;

--
-- Name: IdentityClaims_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."IdentityClaims_Id_seq" OWNED BY public."IdentityClaims"."Id";


--
-- Name: IdentityProperties; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."IdentityProperties" (
    "Id" integer NOT NULL,
    "Key" character varying(250) NOT NULL,
    "Value" character varying(2000) NOT NULL,
    "IdentityResourceId" integer NOT NULL
);


ALTER TABLE public."IdentityProperties" OWNER TO postgres;

--
-- Name: IdentityProperties_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."IdentityProperties_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."IdentityProperties_Id_seq" OWNER TO postgres;

--
-- Name: IdentityProperties_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."IdentityProperties_Id_seq" OWNED BY public."IdentityProperties"."Id";


--
-- Name: IdentityResources; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."IdentityResources" (
    "Id" integer NOT NULL,
    "Description" character varying(1000),
    "DisplayName" character varying(200),
    "Emphasize" boolean NOT NULL,
    "Enabled" boolean NOT NULL,
    "Name" character varying(200) NOT NULL,
    "Required" boolean NOT NULL,
    "ShowInDiscoveryDocument" boolean NOT NULL,
    "Created" timestamp(6) without time zone DEFAULT '0001-01-01 00:00:00'::timestamp without time zone NOT NULL,
    "NonEditable" boolean DEFAULT false NOT NULL,
    "Updated" timestamp(6) without time zone
);


ALTER TABLE public."IdentityResources" OWNER TO postgres;

--
-- Name: IdentityResources_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."IdentityResources_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."IdentityResources_Id_seq" OWNER TO postgres;

--
-- Name: IdentityResources_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."IdentityResources_Id_seq" OWNED BY public."IdentityResources"."Id";


--
-- Name: PersistedGrants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."PersistedGrants" (
    "Key" character varying(200) NOT NULL,
    "ClientId" character varying(200) NOT NULL,
    "CreationTime" timestamp(6) without time zone NOT NULL,
    "Data" character varying(50000) NOT NULL,
    "Expiration" timestamp(6) without time zone,
    "SubjectId" character varying(200),
    "Type" character varying(50) NOT NULL
);


ALTER TABLE public."PersistedGrants" OWNER TO postgres;

--
-- Name: __EFMigrationsHistory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."__EFMigrationsHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ProductVersion" character varying(32) NOT NULL
);


ALTER TABLE public."__EFMigrationsHistory" OWNER TO postgres;

--
-- Name: ApiClaims Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ApiClaims" ALTER COLUMN "Id" SET DEFAULT nextval('public."ApiClaims_Id_seq"'::regclass);


--
-- Name: ApiProperties Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ApiProperties" ALTER COLUMN "Id" SET DEFAULT nextval('public."ApiProperties_Id_seq"'::regclass);


--
-- Name: ApiResources Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ApiResources" ALTER COLUMN "Id" SET DEFAULT nextval('public."ApiResources_Id_seq"'::regclass);


--
-- Name: ApiScopeClaims Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ApiScopeClaims" ALTER COLUMN "Id" SET DEFAULT nextval('public."ApiScopeClaims_Id_seq"'::regclass);


--
-- Name: ApiScopes Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ApiScopes" ALTER COLUMN "Id" SET DEFAULT nextval('public."ApiScopes_Id_seq"'::regclass);


--
-- Name: ApiSecrets Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ApiSecrets" ALTER COLUMN "Id" SET DEFAULT nextval('public."ApiSecrets_Id_seq"'::regclass);


--
-- Name: AspNetRoleClaims Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AspNetRoleClaims" ALTER COLUMN "Id" SET DEFAULT nextval('public."AspNetRoleClaims_Id_seq"'::regclass);


--
-- Name: AspNetUserClaims Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AspNetUserClaims" ALTER COLUMN "Id" SET DEFAULT nextval('public."AspNetUserClaims_Id_seq"'::regclass);


--
-- Name: ClientClaims Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ClientClaims" ALTER COLUMN "Id" SET DEFAULT nextval('public."ClientClaims_Id_seq"'::regclass);


--
-- Name: ClientCorsOrigins Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ClientCorsOrigins" ALTER COLUMN "Id" SET DEFAULT nextval('public."ClientCorsOrigins_Id_seq"'::regclass);


--
-- Name: ClientGrantTypes Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ClientGrantTypes" ALTER COLUMN "Id" SET DEFAULT nextval('public."ClientGrantTypes_Id_seq"'::regclass);


--
-- Name: ClientIdPRestrictions Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ClientIdPRestrictions" ALTER COLUMN "Id" SET DEFAULT nextval('public."ClientIdPRestrictions_Id_seq"'::regclass);


--
-- Name: ClientPostLogoutRedirectUris Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ClientPostLogoutRedirectUris" ALTER COLUMN "Id" SET DEFAULT nextval('public."ClientPostLogoutRedirectUris_Id_seq"'::regclass);


--
-- Name: ClientProperties Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ClientProperties" ALTER COLUMN "Id" SET DEFAULT nextval('public."ClientProperties_Id_seq"'::regclass);


--
-- Name: ClientRedirectUris Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ClientRedirectUris" ALTER COLUMN "Id" SET DEFAULT nextval('public."ClientRedirectUris_Id_seq"'::regclass);


--
-- Name: ClientScopes Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ClientScopes" ALTER COLUMN "Id" SET DEFAULT nextval('public."ClientScopes_Id_seq"'::regclass);


--
-- Name: ClientSecrets Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ClientSecrets" ALTER COLUMN "Id" SET DEFAULT nextval('public."ClientSecrets_Id_seq"'::regclass);


--
-- Name: Clients Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Clients" ALTER COLUMN "Id" SET DEFAULT nextval('public."Clients_Id_seq"'::regclass);


--
-- Name: IdentityClaims Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."IdentityClaims" ALTER COLUMN "Id" SET DEFAULT nextval('public."IdentityClaims_Id_seq"'::regclass);


--
-- Name: IdentityProperties Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."IdentityProperties" ALTER COLUMN "Id" SET DEFAULT nextval('public."IdentityProperties_Id_seq"'::regclass);


--
-- Name: IdentityResources Id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."IdentityResources" ALTER COLUMN "Id" SET DEFAULT nextval('public."IdentityResources_Id_seq"'::regclass);


--
-- Data for Name: ApiClaims; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ApiClaims" ("Id", "ApiResourceId", "Type") FROM stdin;
\.


--
-- Name: ApiClaims_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ApiClaims_Id_seq"', 5, false);


--
-- Data for Name: ApiProperties; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ApiProperties" ("Id", "Key", "Value", "ApiResourceId") FROM stdin;
\.


--
-- Name: ApiProperties_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ApiProperties_Id_seq"', 5, false);


--
-- Data for Name: ApiResources; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ApiResources" ("Id", "Description", "DisplayName", "Enabled", "Name", "Created", "LastAccessed", "NonEditable", "Updated") FROM stdin;
1	\N	PrimeApps Api	t	api1	0001-01-01 00:00:00	\N	f	\N
\.


--
-- Name: ApiResources_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ApiResources_Id_seq"', 5, false);


--
-- Data for Name: ApiScopeClaims; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ApiScopeClaims" ("Id", "ApiScopeId", "Type") FROM stdin;
\.


--
-- Name: ApiScopeClaims_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ApiScopeClaims_Id_seq"', 5, false);


--
-- Data for Name: ApiScopes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ApiScopes" ("Id", "ApiResourceId", "Description", "DisplayName", "Emphasize", "Name", "Required", "ShowInDiscoveryDocument") FROM stdin;
1	1	\N	PrimeApps Api	f	api1	f	t
\.


--
-- Name: ApiScopes_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ApiScopes_Id_seq"', 5, false);


--
-- Data for Name: ApiSecrets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ApiSecrets" ("Id", "ApiResourceId", "Description", "Expiration", "Type", "Value", "Created") FROM stdin;
\.


--
-- Name: ApiSecrets_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ApiSecrets_Id_seq"', 5, false);


--
-- Data for Name: AspNetRoleClaims; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."AspNetRoleClaims" ("Id", "ClaimType", "ClaimValue", "RoleId") FROM stdin;
\.


--
-- Name: AspNetRoleClaims_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."AspNetRoleClaims_Id_seq"', 5, false);


--
-- Data for Name: AspNetRoles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."AspNetRoles" ("Id", "ConcurrencyStamp", "Name", "NormalizedName") FROM stdin;
\.


--
-- Data for Name: AspNetUserClaims; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."AspNetUserClaims" ("Id", "ClaimType", "ClaimValue", "UserId") FROM stdin;
3	name	Master User	0d7cd43e-deef-431a-a0d1-f20f6fe921e3
4	given_name	Master	0d7cd43e-deef-431a-a0d1-f20f6fe921e3
5	family_name	User	0d7cd43e-deef-431a-a0d1-f20f6fe921e3
6	email	app@primeapps.io	0d7cd43e-deef-431a-a0d1-f20f6fe921e3
7	email_verified	false	0d7cd43e-deef-431a-a0d1-f20f6fe921e3
\.


--
-- Name: AspNetUserClaims_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."AspNetUserClaims_Id_seq"', 9, true);


--
-- Data for Name: AspNetUserLogins; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."AspNetUserLogins" ("LoginProvider", "ProviderKey", "ProviderDisplayName", "UserId") FROM stdin;
\.


--
-- Data for Name: AspNetUserRoles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."AspNetUserRoles" ("UserId", "RoleId") FROM stdin;
\.


--
-- Data for Name: AspNetUserTokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."AspNetUserTokens" ("UserId", "LoginProvider", "Name", "Value") FROM stdin;
\.


--
-- Data for Name: AspNetUsers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."AspNetUsers" ("Id", "AccessFailedCount", "ConcurrencyStamp", "Email", "EmailConfirmed", "LockoutEnabled", "LockoutEnd", "NormalizedEmail", "NormalizedUserName", "PasswordHash", "PhoneNumber", "PhoneNumberConfirmed", "SecurityStamp", "TwoFactorEnabled", "UserName") FROM stdin;
0d7cd43e-deef-431a-a0d1-f20f6fe921e3	0	179be37c-65c9-4b86-bfe3-c7c52704ad23	app@primeapps.io	f	t	\N	APP@PRIMEAPPS.IO	APP@PRIMEAPPS.IO	AQAAAAEAACcQAAAAEBdBU5Lii7pd5iC9tMbg4pUxxBcetHfeNmHvu7SZ1iJpZhFKTwzV7Pu1hG2HnP7YbQ==	\N	f	MPJYHTSMCS6USI5ENUQNSQBVL6IVC4DN	f	app@primeapps.io
\.


--
-- Data for Name: ClientClaims; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ClientClaims" ("Id", "ClientId", "Type", "Value") FROM stdin;
\.


--
-- Name: ClientClaims_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ClientClaims_Id_seq"', 5, false);


--
-- Data for Name: ClientCorsOrigins; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ClientCorsOrigins" ("Id", "ClientId", "Origin") FROM stdin;
\.


--
-- Name: ClientCorsOrigins_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ClientCorsOrigins_Id_seq"', 5, false);


--
-- Data for Name: ClientGrantTypes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ClientGrantTypes" ("Id", "ClientId", "GrantType") FROM stdin;
1	1	hybrid
2	1	client_credentials
12	4	password
\.


--
-- Name: ClientGrantTypes_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ClientGrantTypes_Id_seq"', 14, true);


--
-- Data for Name: ClientIdPRestrictions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ClientIdPRestrictions" ("Id", "ClientId", "Provider") FROM stdin;
\.


--
-- Name: ClientIdPRestrictions_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ClientIdPRestrictions_Id_seq"', 5, false);


--
-- Data for Name: ClientPostLogoutRedirectUris; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ClientPostLogoutRedirectUris" ("Id", "ClientId", "PostLogoutRedirectUri") FROM stdin;
1	1	http://localhost:5000/signout-callback-oidc
\.


--
-- Name: ClientPostLogoutRedirectUris_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ClientPostLogoutRedirectUris_Id_seq"', 9, true);


--
-- Data for Name: ClientProperties; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ClientProperties" ("Id", "ClientId", "Key", "Value") FROM stdin;
\.


--
-- Name: ClientProperties_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ClientProperties_Id_seq"', 5, false);


--
-- Data for Name: ClientRedirectUris; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ClientRedirectUris" ("Id", "ClientId", "RedirectUri") FROM stdin;
1	1	http://localhost:5001/signin-oidc
\.


--
-- Name: ClientRedirectUris_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ClientRedirectUris_Id_seq"', 8, true);


--
-- Data for Name: ClientScopes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ClientScopes" ("Id", "ClientId", "Scope") FROM stdin;
1	1	email
2	1	profile
3	1	openid
4	1	api1
21	4	openid
22	4	profile
23	4	email
24	4	api1
\.


--
-- Name: ClientScopes_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ClientScopes_Id_seq"', 32, true);


--
-- Data for Name: ClientSecrets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ClientSecrets" ("Id", "ClientId", "Description", "Expiration", "Type", "Value", "Created") FROM stdin;
1	1	\N	\N	SharedSecret	K7gNU3sdo+OL0wNhqoVWhr3g6s1xYv72ol/pe/Unols=	0001-01-01 00:00:00
9	4	\N	\N	SharedSecret	K7gNU3sdo+OL0wNhqoVWhr3g6s1xYv72ol/pe/Unols=	2019-04-05 09:04:39.753634
\.


--
-- Name: ClientSecrets_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ClientSecrets_Id_seq"', 11, true);


--
-- Data for Name: Clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Clients" ("Id", "AbsoluteRefreshTokenLifetime", "AccessTokenLifetime", "AccessTokenType", "AllowAccessTokensViaBrowser", "AllowOfflineAccess", "AllowPlainTextPkce", "AllowRememberConsent", "AlwaysIncludeUserClaimsInIdToken", "AlwaysSendClientClaims", "AuthorizationCodeLifetime", "BackChannelLogoutSessionRequired", "BackChannelLogoutUri", "ClientClaimsPrefix", "ClientId", "ClientName", "ClientUri", "ConsentLifetime", "Description", "EnableLocalLogin", "Enabled", "FrontChannelLogoutSessionRequired", "FrontChannelLogoutUri", "IdentityTokenLifetime", "IncludeJwtId", "LogoUri", "PairWiseSubjectSalt", "ProtocolType", "RefreshTokenExpiration", "RefreshTokenUsage", "RequireClientSecret", "RequireConsent", "RequirePkce", "SlidingRefreshTokenLifetime", "UpdateAccessTokenClaimsOnRefresh", "Created", "DeviceCodeLifetime", "LastAccessed", "NonEditable", "Updated", "UserCodeType", "UserSsoLifetime") FROM stdin;
1	2592000	864000	0	f	f	f	f	f	t	300	t	\N	client_	sample	Sample		\N	\N	t	t	t	\N	300	f	\N	\N	oidc	1	1	t	f	f	1296000	f	2019-02-17 22:41:42.926301	300	\N	f	\N	\N	\N
4	2592000	864000	0	f	f	f	f	f	t	300	t	\N	client_	sample-integration	Sample Integration	\N	\N	\N	t	t	t	\N	300	f	\N	\N	oidc	1	1	t	f	f	1296000	f	2019-04-05 09:04:39.750758	300	\N	f	\N	\N	\N
\.


--
-- Name: Clients_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Clients_Id_seq"', 5, false);


--
-- Data for Name: DeviceCodes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."DeviceCodes" ("UserCode", "DeviceCode", "SubjectId", "ClientId", "CreationTime", "Expiration", "Data") FROM stdin;
\.


--
-- Data for Name: IdentityClaims; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."IdentityClaims" ("Id", "IdentityResourceId", "Type") FROM stdin;
1	1	sub
2	3	zoneinfo
3	3	birthdate
4	3	gender
5	3	website
6	3	picture
7	3	profile
8	3	locale
9	3	preferred_username
10	3	middle_name
11	3	given_name
12	3	family_name
13	3	name
14	2	email_verified
15	2	email
16	3	nickname
17	3	updated_at
\.


--
-- Name: IdentityClaims_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."IdentityClaims_Id_seq"', 5, false);


--
-- Data for Name: IdentityProperties; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."IdentityProperties" ("Id", "Key", "Value", "IdentityResourceId") FROM stdin;
\.


--
-- Name: IdentityProperties_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."IdentityProperties_Id_seq"', 5, false);


--
-- Data for Name: IdentityResources; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."IdentityResources" ("Id", "Description", "DisplayName", "Emphasize", "Enabled", "Name", "Required", "ShowInDiscoveryDocument", "Created", "NonEditable", "Updated") FROM stdin;
1	\N	Your user identifier	f	t	openid	t	t	0001-01-01 00:00:00	f	\N
2	\N	Your email address	t	t	email	f	t	0001-01-01 00:00:00	f	\N
3	Your user profile information (first name, last name, etc.)	User profile	t	t	profile	f	t	0001-01-01 00:00:00	f	\N
\.


--
-- Name: IdentityResources_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."IdentityResources_Id_seq"', 5, false);


--
-- Data for Name: PersistedGrants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."PersistedGrants" ("Key", "ClientId", "CreationTime", "Data", "Expiration", "SubjectId", "Type") FROM stdin;
\.


--
-- Data for Name: __EFMigrationsHistory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."__EFMigrationsHistory" ("MigrationId", "ProductVersion") FROM stdin;
00000000000000_CreateIdentitySchema	2.2.0-rtm-35687
20180508135334_InitialIdentityServerPersistedGrantDbMigration	2.2.0-rtm-35687
20180531085523_IdentityServerPersistedGrantDbMigrationVersionUpgrade	2.2.0-rtm-35687
20190102170309_PersistedGrantDbContextUpgrade2	2.2.0-rtm-35687
20180508135535_InitialIdentityServerConfigurationDbMigration	2.2.0-rtm-35687
20180531085557_IdentityServerConfigurationDbMigrationVersionUpgrade	2.2.0-rtm-35687
20190102170417_ConfigurationDbContextUpgrade2	2.2.0-rtm-35687
\.


--
-- Name: ApiClaims PK_ApiClaims; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ApiClaims"
    ADD CONSTRAINT "PK_ApiClaims" PRIMARY KEY ("Id");


--
-- Name: ApiProperties PK_ApiProperties; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ApiProperties"
    ADD CONSTRAINT "PK_ApiProperties" PRIMARY KEY ("Id");


--
-- Name: ApiResources PK_ApiResources; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ApiResources"
    ADD CONSTRAINT "PK_ApiResources" PRIMARY KEY ("Id");


--
-- Name: ApiScopeClaims PK_ApiScopeClaims; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ApiScopeClaims"
    ADD CONSTRAINT "PK_ApiScopeClaims" PRIMARY KEY ("Id");


--
-- Name: ApiScopes PK_ApiScopes; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ApiScopes"
    ADD CONSTRAINT "PK_ApiScopes" PRIMARY KEY ("Id");


--
-- Name: ApiSecrets PK_ApiSecrets; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ApiSecrets"
    ADD CONSTRAINT "PK_ApiSecrets" PRIMARY KEY ("Id");


--
-- Name: AspNetRoleClaims PK_AspNetRoleClaims; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AspNetRoleClaims"
    ADD CONSTRAINT "PK_AspNetRoleClaims" PRIMARY KEY ("Id");


--
-- Name: AspNetRoles PK_AspNetRoles; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AspNetRoles"
    ADD CONSTRAINT "PK_AspNetRoles" PRIMARY KEY ("Id");


--
-- Name: AspNetUserClaims PK_AspNetUserClaims; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AspNetUserClaims"
    ADD CONSTRAINT "PK_AspNetUserClaims" PRIMARY KEY ("Id");


--
-- Name: AspNetUserLogins PK_AspNetUserLogins; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AspNetUserLogins"
    ADD CONSTRAINT "PK_AspNetUserLogins" PRIMARY KEY ("LoginProvider", "ProviderKey");


--
-- Name: AspNetUserRoles PK_AspNetUserRoles; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AspNetUserRoles"
    ADD CONSTRAINT "PK_AspNetUserRoles" PRIMARY KEY ("UserId", "RoleId");


--
-- Name: AspNetUserTokens PK_AspNetUserTokens; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AspNetUserTokens"
    ADD CONSTRAINT "PK_AspNetUserTokens" PRIMARY KEY ("UserId", "LoginProvider", "Name");


--
-- Name: AspNetUsers PK_AspNetUsers; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AspNetUsers"
    ADD CONSTRAINT "PK_AspNetUsers" PRIMARY KEY ("Id");


--
-- Name: ClientClaims PK_ClientClaims; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ClientClaims"
    ADD CONSTRAINT "PK_ClientClaims" PRIMARY KEY ("Id");


--
-- Name: ClientCorsOrigins PK_ClientCorsOrigins; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ClientCorsOrigins"
    ADD CONSTRAINT "PK_ClientCorsOrigins" PRIMARY KEY ("Id");


--
-- Name: ClientGrantTypes PK_ClientGrantTypes; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ClientGrantTypes"
    ADD CONSTRAINT "PK_ClientGrantTypes" PRIMARY KEY ("Id");


--
-- Name: ClientIdPRestrictions PK_ClientIdPRestrictions; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ClientIdPRestrictions"
    ADD CONSTRAINT "PK_ClientIdPRestrictions" PRIMARY KEY ("Id");


--
-- Name: ClientPostLogoutRedirectUris PK_ClientPostLogoutRedirectUris; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ClientPostLogoutRedirectUris"
    ADD CONSTRAINT "PK_ClientPostLogoutRedirectUris" PRIMARY KEY ("Id");


--
-- Name: ClientProperties PK_ClientProperties; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ClientProperties"
    ADD CONSTRAINT "PK_ClientProperties" PRIMARY KEY ("Id");


--
-- Name: ClientRedirectUris PK_ClientRedirectUris; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ClientRedirectUris"
    ADD CONSTRAINT "PK_ClientRedirectUris" PRIMARY KEY ("Id");


--
-- Name: ClientScopes PK_ClientScopes; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ClientScopes"
    ADD CONSTRAINT "PK_ClientScopes" PRIMARY KEY ("Id");


--
-- Name: ClientSecrets PK_ClientSecrets; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ClientSecrets"
    ADD CONSTRAINT "PK_ClientSecrets" PRIMARY KEY ("Id");


--
-- Name: Clients PK_Clients; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Clients"
    ADD CONSTRAINT "PK_Clients" PRIMARY KEY ("Id");


--
-- Name: DeviceCodes PK_DeviceCodes; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DeviceCodes"
    ADD CONSTRAINT "PK_DeviceCodes" PRIMARY KEY ("UserCode");


--
-- Name: IdentityClaims PK_IdentityClaims; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."IdentityClaims"
    ADD CONSTRAINT "PK_IdentityClaims" PRIMARY KEY ("Id");


--
-- Name: IdentityProperties PK_IdentityProperties; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."IdentityProperties"
    ADD CONSTRAINT "PK_IdentityProperties" PRIMARY KEY ("Id");


--
-- Name: IdentityResources PK_IdentityResources; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."IdentityResources"
    ADD CONSTRAINT "PK_IdentityResources" PRIMARY KEY ("Id");


--
-- Name: PersistedGrants PK_PersistedGrants; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PersistedGrants"
    ADD CONSTRAINT "PK_PersistedGrants" PRIMARY KEY ("Key");


--
-- Name: __EFMigrationsHistory PK___EFMigrationsHistory; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."__EFMigrationsHistory"
    ADD CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId");


--
-- Name: EmailIndex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "EmailIndex" ON public."AspNetUsers" USING btree ("NormalizedEmail");


--
-- Name: IX_ApiClaims_ApiResourceId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_ApiClaims_ApiResourceId" ON public."ApiClaims" USING btree ("ApiResourceId");


--
-- Name: IX_ApiProperties_ApiResourceId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_ApiProperties_ApiResourceId" ON public."ApiProperties" USING btree ("ApiResourceId");


--
-- Name: IX_ApiResources_Name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IX_ApiResources_Name" ON public."ApiResources" USING btree ("Name");


--
-- Name: IX_ApiScopeClaims_ApiScopeId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_ApiScopeClaims_ApiScopeId" ON public."ApiScopeClaims" USING btree ("ApiScopeId");


--
-- Name: IX_ApiScopes_ApiResourceId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_ApiScopes_ApiResourceId" ON public."ApiScopes" USING btree ("ApiResourceId");


--
-- Name: IX_ApiScopes_Name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IX_ApiScopes_Name" ON public."ApiScopes" USING btree ("Name");


--
-- Name: IX_ApiSecrets_ApiResourceId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_ApiSecrets_ApiResourceId" ON public."ApiSecrets" USING btree ("ApiResourceId");


--
-- Name: IX_AspNetRoleClaims_RoleId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_AspNetRoleClaims_RoleId" ON public."AspNetRoleClaims" USING btree ("RoleId");


--
-- Name: IX_AspNetUserClaims_UserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_AspNetUserClaims_UserId" ON public."AspNetUserClaims" USING btree ("UserId");


--
-- Name: IX_AspNetUserLogins_UserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_AspNetUserLogins_UserId" ON public."AspNetUserLogins" USING btree ("UserId");


--
-- Name: IX_AspNetUserRoles_RoleId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_AspNetUserRoles_RoleId" ON public."AspNetUserRoles" USING btree ("RoleId");


--
-- Name: IX_AspNetUserRoles_UserId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_AspNetUserRoles_UserId" ON public."AspNetUserRoles" USING btree ("UserId");


--
-- Name: IX_ClientClaims_ClientId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_ClientClaims_ClientId" ON public."ClientClaims" USING btree ("ClientId");


--
-- Name: IX_ClientCorsOrigins_ClientId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_ClientCorsOrigins_ClientId" ON public."ClientCorsOrigins" USING btree ("ClientId");


--
-- Name: IX_ClientGrantTypes_ClientId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_ClientGrantTypes_ClientId" ON public."ClientGrantTypes" USING btree ("ClientId");


--
-- Name: IX_ClientIdPRestrictions_ClientId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_ClientIdPRestrictions_ClientId" ON public."ClientIdPRestrictions" USING btree ("ClientId");


--
-- Name: IX_ClientPostLogoutRedirectUris_ClientId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_ClientPostLogoutRedirectUris_ClientId" ON public."ClientPostLogoutRedirectUris" USING btree ("ClientId");


--
-- Name: IX_ClientProperties_ClientId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_ClientProperties_ClientId" ON public."ClientProperties" USING btree ("ClientId");


--
-- Name: IX_ClientRedirectUris_ClientId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_ClientRedirectUris_ClientId" ON public."ClientRedirectUris" USING btree ("ClientId");


--
-- Name: IX_ClientScopes_ClientId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_ClientScopes_ClientId" ON public."ClientScopes" USING btree ("ClientId");


--
-- Name: IX_ClientSecrets_ClientId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_ClientSecrets_ClientId" ON public."ClientSecrets" USING btree ("ClientId");


--
-- Name: IX_Clients_ClientId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IX_Clients_ClientId" ON public."Clients" USING btree ("ClientId");


--
-- Name: IX_DeviceCodes_DeviceCode; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IX_DeviceCodes_DeviceCode" ON public."DeviceCodes" USING btree ("DeviceCode");


--
-- Name: IX_IdentityClaims_IdentityResourceId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_IdentityClaims_IdentityResourceId" ON public."IdentityClaims" USING btree ("IdentityResourceId");


--
-- Name: IX_IdentityProperties_IdentityResourceId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_IdentityProperties_IdentityResourceId" ON public."IdentityProperties" USING btree ("IdentityResourceId");


--
-- Name: IX_IdentityResources_Name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IX_IdentityResources_Name" ON public."IdentityResources" USING btree ("Name");


--
-- Name: IX_PersistedGrants_SubjectId_ClientId_Type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_PersistedGrants_SubjectId_ClientId_Type" ON public."PersistedGrants" USING btree ("SubjectId", "ClientId", "Type");


--
-- Name: RoleNameIndex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "RoleNameIndex" ON public."AspNetRoles" USING btree ("NormalizedName");


--
-- Name: UserNameIndex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "UserNameIndex" ON public."AspNetUsers" USING btree ("NormalizedUserName");


--
-- Name: ApiClaims FK_ApiClaims_ApiResources_ApiResourceId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ApiClaims"
    ADD CONSTRAINT "FK_ApiClaims_ApiResources_ApiResourceId" FOREIGN KEY ("ApiResourceId") REFERENCES public."ApiResources"("Id") ON DELETE CASCADE;


--
-- Name: ApiProperties FK_ApiProperties_ApiResources_ApiResourceId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ApiProperties"
    ADD CONSTRAINT "FK_ApiProperties_ApiResources_ApiResourceId" FOREIGN KEY ("ApiResourceId") REFERENCES public."ApiResources"("Id") ON DELETE CASCADE;


--
-- Name: ApiScopeClaims FK_ApiScopeClaims_ApiScopes_ApiScopeId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ApiScopeClaims"
    ADD CONSTRAINT "FK_ApiScopeClaims_ApiScopes_ApiScopeId" FOREIGN KEY ("ApiScopeId") REFERENCES public."ApiScopes"("Id") ON DELETE CASCADE;


--
-- Name: ApiScopes FK_ApiScopes_ApiResources_ApiResourceId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ApiScopes"
    ADD CONSTRAINT "FK_ApiScopes_ApiResources_ApiResourceId" FOREIGN KEY ("ApiResourceId") REFERENCES public."ApiResources"("Id") ON DELETE CASCADE;


--
-- Name: ApiSecrets FK_ApiSecrets_ApiResources_ApiResourceId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ApiSecrets"
    ADD CONSTRAINT "FK_ApiSecrets_ApiResources_ApiResourceId" FOREIGN KEY ("ApiResourceId") REFERENCES public."ApiResources"("Id") ON DELETE CASCADE;


--
-- Name: AspNetRoleClaims FK_AspNetRoleClaims_AspNetRoles_RoleId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AspNetRoleClaims"
    ADD CONSTRAINT "FK_AspNetRoleClaims_AspNetRoles_RoleId" FOREIGN KEY ("RoleId") REFERENCES public."AspNetRoles"("Id") ON DELETE CASCADE;


--
-- Name: AspNetUserClaims FK_AspNetUserClaims_AspNetUsers_UserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AspNetUserClaims"
    ADD CONSTRAINT "FK_AspNetUserClaims_AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES public."AspNetUsers"("Id") ON DELETE CASCADE;


--
-- Name: AspNetUserLogins FK_AspNetUserLogins_AspNetUsers_UserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AspNetUserLogins"
    ADD CONSTRAINT "FK_AspNetUserLogins_AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES public."AspNetUsers"("Id") ON DELETE CASCADE;


--
-- Name: AspNetUserRoles FK_AspNetUserRoles_AspNetRoles_RoleId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AspNetUserRoles"
    ADD CONSTRAINT "FK_AspNetUserRoles_AspNetRoles_RoleId" FOREIGN KEY ("RoleId") REFERENCES public."AspNetRoles"("Id") ON DELETE CASCADE;


--
-- Name: AspNetUserRoles FK_AspNetUserRoles_AspNetUsers_UserId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AspNetUserRoles"
    ADD CONSTRAINT "FK_AspNetUserRoles_AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES public."AspNetUsers"("Id") ON DELETE CASCADE;


--
-- Name: ClientClaims FK_ClientClaims_Clients_ClientId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ClientClaims"
    ADD CONSTRAINT "FK_ClientClaims_Clients_ClientId" FOREIGN KEY ("ClientId") REFERENCES public."Clients"("Id") ON DELETE CASCADE;


--
-- Name: ClientCorsOrigins FK_ClientCorsOrigins_Clients_ClientId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ClientCorsOrigins"
    ADD CONSTRAINT "FK_ClientCorsOrigins_Clients_ClientId" FOREIGN KEY ("ClientId") REFERENCES public."Clients"("Id") ON DELETE CASCADE;


--
-- Name: ClientGrantTypes FK_ClientGrantTypes_Clients_ClientId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ClientGrantTypes"
    ADD CONSTRAINT "FK_ClientGrantTypes_Clients_ClientId" FOREIGN KEY ("ClientId") REFERENCES public."Clients"("Id") ON DELETE CASCADE;


--
-- Name: ClientIdPRestrictions FK_ClientIdPRestrictions_Clients_ClientId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ClientIdPRestrictions"
    ADD CONSTRAINT "FK_ClientIdPRestrictions_Clients_ClientId" FOREIGN KEY ("ClientId") REFERENCES public."Clients"("Id") ON DELETE CASCADE;


--
-- Name: ClientPostLogoutRedirectUris FK_ClientPostLogoutRedirectUris_Clients_ClientId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ClientPostLogoutRedirectUris"
    ADD CONSTRAINT "FK_ClientPostLogoutRedirectUris_Clients_ClientId" FOREIGN KEY ("ClientId") REFERENCES public."Clients"("Id") ON DELETE CASCADE;


--
-- Name: ClientProperties FK_ClientProperties_Clients_ClientId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ClientProperties"
    ADD CONSTRAINT "FK_ClientProperties_Clients_ClientId" FOREIGN KEY ("ClientId") REFERENCES public."Clients"("Id") ON DELETE CASCADE;


--
-- Name: ClientRedirectUris FK_ClientRedirectUris_Clients_ClientId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ClientRedirectUris"
    ADD CONSTRAINT "FK_ClientRedirectUris_Clients_ClientId" FOREIGN KEY ("ClientId") REFERENCES public."Clients"("Id") ON DELETE CASCADE;


--
-- Name: ClientScopes FK_ClientScopes_Clients_ClientId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ClientScopes"
    ADD CONSTRAINT "FK_ClientScopes_Clients_ClientId" FOREIGN KEY ("ClientId") REFERENCES public."Clients"("Id") ON DELETE CASCADE;


--
-- Name: ClientSecrets FK_ClientSecrets_Clients_ClientId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ClientSecrets"
    ADD CONSTRAINT "FK_ClientSecrets_Clients_ClientId" FOREIGN KEY ("ClientId") REFERENCES public."Clients"("Id") ON DELETE CASCADE;


--
-- Name: IdentityClaims FK_IdentityClaims_IdentityResources_IdentityResourceId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."IdentityClaims"
    ADD CONSTRAINT "FK_IdentityClaims_IdentityResources_IdentityResourceId" FOREIGN KEY ("IdentityResourceId") REFERENCES public."IdentityResources"("Id") ON DELETE CASCADE;


--
-- Name: IdentityProperties FK_IdentityProperties_IdentityResources_IdentityResourceId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."IdentityProperties"
    ADD CONSTRAINT "FK_IdentityProperties_IdentityResources_IdentityResourceId" FOREIGN KEY ("IdentityResourceId") REFERENCES public."IdentityResources"("Id") ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

