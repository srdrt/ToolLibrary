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
-- Name: _migration_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._migration_history (
    migration_id character varying(150) NOT NULL,
    product_version character varying(32) NOT NULL
);


ALTER TABLE public._migration_history OWNER TO postgres;

--
-- Name: app_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_settings (
    app_id integer NOT NULL,
    app_domain text,
    auth_domain text,
    currency text,
    culture text,
    time_zone text,
    language text,
    auth_theme jsonb,
    app_theme jsonb,
    mail_sender_name text,
    mail_sender_email text,
    google_analytics_code text,
    tenant_operation_webhook text,
    external_auth jsonb,
    registration_type integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.app_settings OWNER TO postgres;

--
-- Name: app_templates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_templates (
    id integer NOT NULL,
    created_by integer NOT NULL,
    updated_by integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone,
    deleted boolean NOT NULL,
    app_id integer NOT NULL,
    name character varying(200),
    subject character varying(200),
    content text,
    language text,
    type integer NOT NULL,
    system_code text,
    active boolean NOT NULL,
    settings jsonb
);


ALTER TABLE public.app_templates OWNER TO postgres;

--
-- Name: app_templates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.app_templates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_templates_id_seq OWNER TO postgres;

--
-- Name: app_templates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.app_templates_id_seq OWNED BY public.app_templates.id;


--
-- Name: apps; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.apps (
    id integer NOT NULL,
    created_by integer NOT NULL,
    updated_by integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone,
    deleted boolean NOT NULL,
    name character varying(50),
    label character varying(400),
    description character varying(4000),
    logo text,
    use_tenant_settings boolean NOT NULL,
    app_draft_id integer DEFAULT 0 NOT NULL,
    secret character varying(4000)
);


ALTER TABLE public.apps OWNER TO postgres;

--
-- Name: apps_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.apps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.apps_id_seq OWNER TO postgres;

--
-- Name: apps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.apps_id_seq OWNED BY public.apps.id;


--
-- Name: exchange_rates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.exchange_rates (
    id integer NOT NULL,
    usd numeric NOT NULL,
    eur numeric NOT NULL,
    date timestamp(6) without time zone NOT NULL,
    year integer NOT NULL,
    month integer NOT NULL,
    day integer NOT NULL
);


ALTER TABLE public.exchange_rates OWNER TO postgres;

--
-- Name: exchange_rates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.exchange_rates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exchange_rates_id_seq OWNER TO postgres;

--
-- Name: exchange_rates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.exchange_rates_id_seq OWNED BY public.exchange_rates.id;


--
-- Name: tenant_licenses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tenant_licenses (
    tenant_id integer NOT NULL,
    user_license_count integer NOT NULL,
    module_license_count integer NOT NULL,
    analytics_license_count integer NOT NULL,
    sip_license_count integer NOT NULL,
    is_paid_customer boolean NOT NULL,
    is_deactivated boolean NOT NULL,
    is_suspended boolean NOT NULL,
    deactivated_at timestamp(6) without time zone,
    suspended_at timestamp(6) without time zone
);


ALTER TABLE public.tenant_licenses OWNER TO postgres;

--
-- Name: tenant_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tenant_settings (
    tenant_id integer NOT NULL,
    currency text,
    culture text,
    time_zone text,
    language text,
    logo text,
    mail_sender_name text,
    mail_sender_email text,
    custom_domain text,
    custom_title text,
    custom_description text,
    custom_favicon text,
    custom_color text,
    custom_image text,
    has_sample_data boolean NOT NULL
);


ALTER TABLE public.tenant_settings OWNER TO postgres;

--
-- Name: tenants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tenants (
    id integer NOT NULL,
    created_by integer NOT NULL,
    updated_by integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone,
    deleted boolean NOT NULL,
    app_id integer NOT NULL,
    guid_id uuid NOT NULL,
    title text,
    owner_id integer NOT NULL,
    use_user_settings boolean NOT NULL
);


ALTER TABLE public.tenants OWNER TO postgres;

--
-- Name: tenants_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tenants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tenants_id_seq OWNER TO postgres;

--
-- Name: tenants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tenants_id_seq OWNED BY public.tenants.id;


--
-- Name: user_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_settings (
    user_id integer NOT NULL,
    phone text,
    culture text,
    currency text,
    time_zone text,
    language text
);


ALTER TABLE public.user_settings OWNER TO postgres;

--
-- Name: user_tenants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_tenants (
    user_id integer NOT NULL,
    tenant_id integer NOT NULL
);


ALTER TABLE public.user_tenants OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email text NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone,
    is_integration_user boolean DEFAULT false NOT NULL,
    profile_picture text,
    integration_user_client_id text
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: warehouses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.warehouses (
    id integer NOT NULL,
    created_by integer NOT NULL,
    updated_by integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone,
    deleted boolean NOT NULL,
    tenant_id integer NOT NULL,
    database_name text,
    database_user text,
    powerbi_workspace_id text,
    completed boolean NOT NULL
);


ALTER TABLE public.warehouses OWNER TO postgres;

--
-- Name: warehouses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.warehouses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.warehouses_id_seq OWNER TO postgres;

--
-- Name: warehouses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.warehouses_id_seq OWNED BY public.warehouses.id;


--
-- Name: app_templates id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_templates ALTER COLUMN id SET DEFAULT nextval('public.app_templates_id_seq'::regclass);


--
-- Name: apps id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.apps ALTER COLUMN id SET DEFAULT nextval('public.apps_id_seq'::regclass);


--
-- Name: exchange_rates id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exchange_rates ALTER COLUMN id SET DEFAULT nextval('public.exchange_rates_id_seq'::regclass);


--
-- Name: tenants id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenants ALTER COLUMN id SET DEFAULT nextval('public.tenants_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: warehouses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.warehouses ALTER COLUMN id SET DEFAULT nextval('public.warehouses_id_seq'::regclass);


--
-- Data for Name: _migration_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._migration_history (migration_id, product_version) FROM stdin;
20181001152119_Initial	2.2.0-rtm-35687
20181125161005_Task2865	2.2.0-rtm-35687
20181129123413_Task2985	2.2.0-rtm-35687
20181205062410_Task2863	2.2.0-rtm-35687
20181213124105_Task3053	2.2.0-rtm-35687
20170126230815_InitialDatabase	2.2.0-rtm-35687
20170312161610_Events	2.2.0-rtm-35687
20170507214430_ControlStructures	2.2.0-rtm-35687
20170519231452_PersistOutcome	2.2.0-rtm-35687
20170722200412_WfReference	2.2.0-rtm-35687
20171223020844_StepScope	2.2.0-rtm-35687
20190110102730_Task2814	2.2.0-rtm-35687
20190216151947_Task3224	2.2.0-rtm-35687
20190304143526_Task3227	2.2.0-rtm-35687
20190407134814_Task3230	2.2.0-rtm-35687
\.


--
-- Data for Name: app_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_settings (app_id, app_domain, auth_domain, currency, culture, time_zone, language, auth_theme, app_theme, mail_sender_name, mail_sender_email, google_analytics_code, tenant_operation_webhook, external_auth, registration_type) FROM stdin;
100	localhost:5001	localhost:5000	\N	\N	\N	\N	{"logo": "https://storage.primeapps.io/organization101/app100/app_logo/170_be403479-7bc7-48e8-8995-b65be7e1c70a.png?AWSAccessKeyId=47059d03d1224a4505c517aaca18ef55&Expires=4720866406&Signature=tLljZ5exgP5sgQzrjm%2BDyzGn9%2Bc%3D", "color": "#1F4688", "title": "Sample App", "banner": [{"image": "https://storage.primeapps.io/organization101/app100/app_logo/170_545b959d-cb7a-4b74-b944-2109a38afdad.jpg?AWSAccessKeyId=47059d03d1224a4505c517aaca18ef55&Expires=4720862564&Signature=rO4ilGsM5qaR8Nbvy4LG9wM1y2s%3D", "descriptions": {"en": "Welcome to Sample App"}}], "favicon": "https://storage.primeapps.io/organization101/app100/app_logo/170_f696fbb6-b142-4dd1-9b3d-46008dc9ab4f.ico?AWSAccessKeyId=47059d03d1224a4505c517aaca18ef55&Expires=4720861950&Signature=XbR6YAYfUmLkg7LWvoUPcnmsWFc%3D", "headLine": {}}	{"logo": "https://storage.primeapps.io/organization101/app100/app_logo/170_03234239-7814-4151-b526-870715f728cb.png?AWSAccessKeyId=47059d03d1224a4505c517aaca18ef55&Expires=4720866421&Signature=FTr81w6v3TB%2BUUum7CSnz1uH2Fs%3D", "color": "#1F4688", "title": "Sample App", "favicon": "https://storage.primeapps.io/organization101/app100/app_logo/170_7ca8da9f-b36e-4378-b24d-78c0d366c0ab.ico?AWSAccessKeyId=47059d03d1224a4505c517aaca18ef55&Expires=4720862594&Signature=PJD8xHf0pgBICnTvNGsYjE5KMFk%3D"}	Gaboras	app@gaboras.com.tr	\N	\N	\N	2
\.


--
-- Data for Name: app_templates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_templates (id, created_by, updated_by, created_at, updated_at, deleted, app_id, name, subject, content, language, type, system_code, active, settings) FROM stdin;
1	1	\N	2018-10-01 11:41:02.829818	\N	f	100	E-Posta Onaylama	E-Posta Onaylama	<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml"\n      xmlns:v="urn:schemas-microsoft-com:vml"\n      xmlns:o="urn:schemas-microsoft-com:office:office">\n<head>\n    <title>Ofisim CRM'e Hoşgeldiniz!</title>\n    <meta http-equiv="Content-Type"\n          content="text/html; charset=utf-8" />\n    <style type="text/css">\n        body, .maintable {\n            height: 100% !important;\n            width: 100% !important;\n            margin: 0;\n            padding: 0;\n        }\n\n        img, a img {\n            border: 0;\n            outline: none;\n            text-decoration: none;\n        }\n\n        .imagefix {\n            display: block;\n        }\n\n        p {\n            margin-top: 0;\n            margin-right: 0;\n            margin-left: 0;\n            padding: 0;\n        }\n\n        .ReadMsgBody {\n            width: 100%;\n        }\n\n        .ExternalClass {\n            width: 100%;\n        }\n\n            .ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div {\n                line-height: 100%;\n            }\n\n        img {\n            -ms-interpolation-mode: bicubic;\n        }\n\n        body, table, td, p, a, li, blockquote {\n            -ms-text-size-adjust: 100%;\n            -webkit-text-size-adjust: 100%;\n        }\n    </style>\n    <style type="text/css">\n        @media only screen and (max-width: 600px) {\n            .rtable {\n                width: 100% !important;\n                table-layout: fixed;\n            }\n\n                .rtable tr {\n                    height: auto !important;\n                    display: block;\n                }\n\n            .contenttd {\n                max-width: 100% !important;\n                display: block;\n            }\n\n                .contenttd:after {\n                    content: "";\n                    display: table;\n                    clear: both;\n                }\n\n            .hiddentds {\n                display: none;\n            }\n\n            .imgtable, .imgtable table {\n                max-width: 100% !important;\n                height: auto;\n                float: none;\n                margin: 0 auto;\n            }\n\n                .imgtable.btnset td {\n                    display: inline-block;\n                }\n\n                .imgtable img {\n                    width: 100%;\n                    height: auto;\n                    display: block;\n                }\n\n            table {\n                float: none;\n                table-layout: fixed;\n            }\n        }\n    </style>\n    <!--[if gte mso 9]> \n    <xml>\n      <o:OfficeDocumentSettings>\n        <o:AllowPNG/>\n        <o:PixelsPerInch>96</o:PixelsPerInch>\n      </o:OfficeDocumentSettings>\n    </xml>\n    <![endif]-->\n</head>\n<body style="overflow: auto; padding:0; margin:0; font-size: 12px; font-family: arial, helvetica, sans-serif; cursor:auto; background-color:#f4f4f4">\n    <table cellspacing="0" cellpadding="0" width="100%"\n           bgcolor="#f4f4f4">\n        <tr>\n            <td style="FONT-SIZE: 0px; HEIGHT: 20px; LINE-HEIGHT: 0"></td>\n        </tr>\n        <tr>\n            <td valign="top">\n                <table class="rtable" style="WIDTH: 600px; MARGIN: 0px auto"\n                       cellspacing="0" cellpadding="0" width="600" align="center"\n                       border="0">\n                    <tr>\n                        <td class="contenttd"\n                            style="BORDER-TOP: medium none; BORDER-RIGHT: medium none; BORDER-BOTTOM: medium none; PADDING-BOTTOM: 0px; PADDING-TOP: 0px; PADDING-LEFT: 0px; BORDER-LEFT: medium none; PADDING-RIGHT: 0px; BACKGROUND-COLOR: transparent">\n                            <table style="WIDTH: 100%" cellspacing="0" cellpadding="0"\n                                   align="left">\n                                <tr class="hiddentds">\n                                    <td style="FONT-SIZE: 0px; HEIGHT: 0px; WIDTH: 367px; LINE-HEIGHT: 0; mso-line-height-rule: exactly"></td>\n                                    <td style="FONT-SIZE: 0px; HEIGHT: 0px; WIDTH: 233px; LINE-HEIGHT: 0; mso-line-height-rule: exactly"></td>\n                                </tr>\n                                <tr style="HEIGHT: 10px">\n                                    <th class="contenttd" style="BORDER-TOP: medium none; BORDER-RIGHT: medium none; VERTICAL-ALIGN: middle; BORDER-BOTTOM: medium none; FONT-WEIGHT: normal; PADDING-BOTTOM: 20px; TEXT-ALIGN:center !important; PADDING-TOP: 20px; PADDING-LEFT: 0px; BORDER-LEFT: medium none; PADDING-RIGHT: 15px; BACKGROUND-COLOR: transparent; text-aling:center;">\n                                        <table class="imgtable" cellspacing="0" cellpadding="0"\n                                               align=" center" border="0">\n                                            <tr>\n                                                <td style="PADDING-BOTTOM: 2px; PADDING-TOP: 2px; PADDING-LEFT: 2px; PADDING-RIGHT: 2px; text-aling:center;" align="center">\n                                                    <table cellspacing="0" cellpadding="0" border="0">\n                                                        <tr>\n                                                            <td style="BORDER-TOP: medium none; BORDER-RIGHT: medium none;  BORDER-BOTTOM: medium none; BORDER-LEFT: medium none; BACKGROUND-COLOR: transparent; text-align:center;">\n                                                                <a href="http://www.ofisim.com/crm/" target="_blank"><img style="BORDER-TOP: medium none; BORDER-RIGHT: medium none; BORDER-BOTTOM: medium none; BORDER-LEFT: medium none; DISPLAY: block" alt="" src="https://ofisimcom.azureedge.net/web/crmLogo.png?v=1" width="200" hspace="0" vspace="0" border="0" /></a>\n                                                            </td>\n                                                        </tr>\n                                                    </table>\n                                                </td>\n                                            </tr>\n                                        </table>\n                                    </th>\n                                    <th class="contenttd" style="BORDER-TOP: medium none; BORDER-RIGHT: medium none; VERTICAL-ALIGN: middle; BORDER-BOTTOM: medium none; FONT-WEIGHT: normal; PADDING-BOTTOM: 20px; TEXT-ALIGN: center; PADDING-TOP: 20px; PADDING-LEFT: 15px; BORDER-LEFT: medium none; PADDING-RIGHT: 0px; BACKGROUND-COLOR: transparent">\n                                    </th>\n                                </tr>\n                            </table>\n                        </td>\n                    </tr>\n                    <tr>\n                        <td class="contenttd" style="BORDER-TOP: #fff 5px solid; BORDER-RIGHT: medium none; BORDER-BOTTOM: medium none; PADDING-BOTTOM: 0px; PADDING-TOP: 0px; PADDING-LEFT: 0px; BORDER-LEFT: medium none; PADDING-RIGHT: 0px; BACKGROUND-COLOR: #fff;">\n                            <table style="WIDTH: 100%" cellspacing="0" cellpadding="0" align="center">\n                                <tr class="hiddentds">\n                                    <td style="FONT-SIZE: 0px; HEIGHT: 0px; WIDTH: 600px; LINE-HEIGHT: 0; mso-line-height-rule: exactly"></td>\n                                </tr>\n                                <tr style="HEIGHT: 10px">\n                                    <th class="contenttd" style="BORDER-TOP: medium none; BORDER-RIGHT: medium none; VERTICAL-ALIGN: top; BORDER-BOTTOM: medium none; FONT-WEIGHT: normal; PADDING-BOTTOM: 0px; TEXT-ALIGN: left; PADDING-TOP: 0px; PADDING-LEFT: 0px; BORDER-LEFT: medium none; PADDING-RIGHT: 0px; BACKGROUND-COLOR: transparent">\n                                        <!--[if gte mso 12]>\n                                            <table cellspacing="0" cellpadding="0" border="0" width="100%"><tr><td align="center">\n                                        <![endif]-->\n                                        <table class="imgtable" style="MARGIN: 0px auto" cellspacing="0"\n                                               cellpadding="0" align="center" border="0">\n                                            <tr>\n                                                <td style="PADDING-BOTTOM: 0px; PADDING-TOP: 0px; PADDING-LEFT: 0px; PADDING-RIGHT: 0px"\n                                                    align="center">\n                                                </td>\n                                            </tr>\n                                        </table>\n                                        <!--[if gte mso 12]>\n                                            </td></tr></table>\n                                        <![endif]-->\n                                    </th>\n                                </tr>\n                            </table>\n                        </td>\n                    </tr>\n                    \n                    <tr>\n\n                        \n\n                        <td class="contenttd" style="BORDER-RIGHT: medium none; BORDER-BOTTOM: medium none; PADDING-BOTTOM: 0px; PADDING-TOP: 0px; PADDING-LEFT: 0px; BORDER-LEFT: medium none; PADDING-RIGHT: 0px; BACKGROUND-COLOR: #fff;">\n                            <table style="WIDTH: 100%" cellspacing="0" cellpadding="0"\n                                   align="left">\n                                <tr class="hiddentds">\n                                    <td style="FONT-SIZE: 0px; HEIGHT: 0px; WIDTH: 600px; LINE-HEIGHT: 0; mso-line-height-rule: exactly"></td>\n                                </tr>\n                                <tr style="HEIGHT: 20px">\n                                    <th class="contenttd" style="BORDER-TOP: medium none; BORDER-RIGHT: medium none; VERTICAL-ALIGN: middle; BORDER-BOTTOM: medium none; FONT-WEIGHT: normal; PADDING-BOTTOM: 20px; TEXT-ALIGN: left; PADDING-TOP: 20px; PADDING-LEFT: 20px; BORDER-LEFT: medium none; PADDING-RIGHT: 20px; BACKGROUND-COLOR: #fff;">\n                                        <p style="FONT-SIZE: 22px; MARGIN-BOTTOM: 1em; FONT-FAMILY: arial, helvetica, sans-serif; MARGIN-TOP: 0px; COLOR: #333330; LINE-HEIGHT: 33px; BACKGROUND-COLOR: #fff; mso-line-height-rule: exactly"\n                                           align="center">\n                                            Merhaba {:FirstName} {:LastName},<br />\n\n                                        </p>\n                                        <p style="FONT-SIZE: 16px; MARGIN-BOTTOM: 1em; FONT-FAMILY: arial, helvetica, sans-serif; MARGIN-TOP: 0px; COLOR: #575757; LINE-HEIGHT: 24px; BACKGROUND-COLOR: transparent; mso-line-height-rule: exactly"\n                                           align="center">Aşşağıda ki linke tıklayarak e-posta adresinizi etkinleştirebilirsiniz.</p>\n\n                                        <p style="FONT-SIZE: 22px; MARGIN-BOTTOM: 1em; FONT-FAMILY: arial, helvetica, sans-serif; MARGIN-TOP: 0px; COLOR: #333330; LINE-HEIGHT: 33px; BACKGROUND-COLOR: #fff; mso-line-height-rule: exactly"\n                                           align="center">\n                                            <a style="color:#1c62e; text-decoration:underline; font-size:20px;" href="{:Url}">E-Posta mı etkinleştir</a><br />\n                                        </p>\n\n                                        <p style="FONT-SIZE: 12px;MARGIN-BOTTOM: 1em; FONT-FAMILY: arial, helvetica, sans-serif; MARGIN-TOP: 0px; COLOR: #333330; LINE-HEIGHT: 14px; BACKGROUND-COLOR: #fff; mso-line-height-rule: exactly"\n                                           align="center">\n                                            Ofisim.com\n                                        </p>\n                                    </th>\n                                </tr>\n                            </table>\n                        </td>\n                    </tr>\n                    <tr>\n                    <tr style="HEIGHT: 20px;">\n                        <th class="contenttd"\n                            style="BORDER-TOP: medium none; BORDER-RIGHT: medium none; VERTICAL-ALIGN: top; BORDER-BOTTOM: medium none; FONT-WEIGHT: normal; PADDING-BOTTOM: 20px; TEXT-ALIGN: left; PADDING-TOP: 20px; PADDING-LEFT: 15px; BORDER-LEFT: medium none; PADDING-RIGHT: 15px; BACKGROUND-COLOR: transparent">\n                            <div style="PADDING-BOTTOM: 10px; TEXT-ALIGN: center; PADDING-TOP: 10px; PADDING-LEFT: 10px; PADDING-RIGHT: 10px">\n                                <table class="imgtable" style="DISPLAY: inline-block"\n                                       cellspacing="0" cellpadding="0" border="0">\n                                    <tr>\n                                        <td style="PADDING-RIGHT: 5px">\n                                            <a href="https://www.facebook.com/ofisimcrm" target="_blank">\n                                                <img title="Facebook"\n                                                     style="BORDER-TOP: medium none; BORDER-RIGHT: medium none; BORDER-BOTTOM: medium none; BORDER-LEFT: medium none; DISPLAY: block"\n                                                     alt="Facebook" src="http://www.ofisim.com/mail/KobiMail_files/fb.png" width="34"\n                                                     height="34" />\n                                            </a>\n                                        </td>\n                                        <td style="PADDING-RIGHT: 5px">\n                                            <a href="https://twitter.com/ofisim_com" target="_blank">\n                                                <img title="Twitter"\n                                                     style="BORDER-TOP: medium none; BORDER-RIGHT: medium none; BORDER-BOTTOM: medium none; BORDER-LEFT: medium none; DISPLAY: block"\n                                                     alt="Twitter" src="http://www.ofisim.com/mail/KobiMail_files/tw.png" width="34"\n                                                     height="34" />\n                                            </a>\n                                        </td>\n                                        <td style="PADDING-RIGHT: 5px">\n                                            <a href="https://www.linkedin.com/company/ofisim.com"\n                                               target="_blank">\n                                                <img title="Linkedin"\n                                                     style="BORDER-TOP: medium none; BORDER-RIGHT: medium none; BORDER-BOTTOM: medium none; BORDER-LEFT: medium none; DISPLAY: block"\n                                                     alt="Linkedin" src="http://www.ofisim.com/mail/KobiMail_files/in.png" width="34"\n                                                     height="34" />\n                                            </a>\n                                        </td>\n                                    </tr>\n                                </table>\n                            </div>\n                            <p style="FONT-SIZE: 14px; MARGIN-BOTTOM: 1em; FONT-FAMILY: arial, helvetica, sans-serif; MARGIN-TOP: 0px; COLOR: #575757; LINE-HEIGHT: 21px; BACKGROUND-COLOR: transparent; mso-line-height-rule: exactly"\n                               align="left">&nbsp;</p>\n                        </th>\n                    </tr>\n                </table>\n            </td>\n        </tr>\n        <tr>\n            <td class="contenttd"\n                style="BORDER-TOP: medium none; BORDER-RIGHT: medium none; BORDER-BOTTOM: medium none; PADDING-BOTTOM: 10px; PADDING-TOP: 10px; PADDING-LEFT: 0px; BORDER-LEFT: medium none; PADDING-RIGHT: 0px; BACKGROUND-COLOR: transparent">\n                <table style="WIDTH: 100%" cellspacing="0" cellpadding="0"\n                       align="left">\n                    <tr class="hiddentds">\n                        <td style="FONT-SIZE: 0px; HEIGHT: 0px; WIDTH: 600px; LINE-HEIGHT: 0; mso-line-height-rule: exactly"></td>\n                    </tr>\n                    <tr style="HEIGHT: 10px">\n                        <th class="contenttd"\n                            style="BORDER-TOP: medium none; BORDER-RIGHT: medium none; VERTICAL-ALIGN: top; BORDER-BOTTOM: medium none; FONT-WEIGHT: normal; PADDING-BOTTOM: 0px; TEXT-ALIGN: left; PADDING-TOP: 0px; PADDING-LEFT: 0px; BORDER-LEFT: medium none; PADDING-RIGHT: 0px; BACKGROUND-COLOR: transparent">\n                        </th>\n                    </tr>\n                </table>\n            </td>\n        </tr>\n        <tr>\n            <td class="contenttd"\n                style="BORDER-TOP: medium none; BORDER-RIGHT: medium none; BORDER-BOTTOM: medium none; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 0px; BORDER-LEFT: medium none; PADDING-RIGHT: 0px; BACKGROUND-COLOR: transparent">\n                <table style="WIDTH: 100%" cellspacing="0" cellpadding="0"\n                       align="left">\n                    <tr class="hiddentds">\n                        <td style="FONT-SIZE: 0px; HEIGHT: 0px; WIDTH: 600px; LINE-HEIGHT: 0; mso-line-height-rule: exactly"></td>\n                    </tr>\n                    <tr style="HEIGHT: 10px">\n                        <th class="contenttd"\n                            style="BORDER-TOP: medium none; BORDER-RIGHT: medium none; VERTICAL-ALIGN: top; BORDER-BOTTOM: medium none; FONT-WEIGHT: normal; PADDING-BOTTOM: 1px; TEXT-ALIGN: left; PADDING-TOP: 1px; PADDING-LEFT: 15px; BORDER-LEFT: medium none; PADDING-RIGHT: 15px; BACKGROUND-COLOR: transparent">\n                        </th>\n                    </tr>\n                </table>\n            </td>\n        </tr>\n        <tr>\n            <td style="FONT-SIZE: 0px; HEIGHT: 8px; LINE-HEIGHT: 0">&nbsp;</td>\n        </tr>\n    </table>\n \n    <!-- Created with MailStyler 2.0.0.330 -->\n</body>\n</html>\n	tr	1	email_confirm	t	{"MailSenderName": "Gaboras", "MailSenderEmail": "app@gaboras.com.tr"}
2	1	\N	2018-10-03 14:55:24	\N	f	100	Şifre Sıfırlama Talebi	Şifre Sıfırlama Talebi	<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml"\n\t  xmlns:v="urn:schemas-microsoft-com:vml"\n\t  xmlns:o="urn:schemas-microsoft-com:office:office">\n<head>\n\t<title>Ofisim CRM'e Hoşgeldiniz!</title>\n\t<meta http-equiv="Content-Type"\n\t\t  content="text/html; charset=utf-8" />\n\t<style type="text/css">\n\t\tbody, .maintable {\n\t\t\theight: 100% !important;\n\t\t\twidth: 100% !important;\n\t\t\tmargin: 0;\n\t\t\tpadding: 0;\n\t\t}\n\n\t\timg, a img {\n\t\t\tborder: 0;\n\t\t\toutline: none;\n\t\t\ttext-decoration: none;\n\t\t}\n\n\t\t.imagefix {\n\t\t\tdisplay: block;\n\t\t}\n\n\t\tp {\n\t\t\tmargin-top: 0;\n\t\t\tmargin-right: 0;\n\t\t\tmargin-left: 0;\n\t\t\tpadding: 0;\n\t\t}\n\n\t\t.ReadMsgBody {\n\t\t\twidth: 100%;\n\t\t}\n\n\t\t.ExternalClass {\n\t\t\twidth: 100%;\n\t\t}\n\n\t\t\t.ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div {\n\t\t\t\tline-height: 100%;\n\t\t\t}\n\n\t\timg {\n\t\t\t-ms-interpolation-mode: bicubic;\n\t\t}\n\n\t\tbody, table, td, p, a, li, blockquote {\n\t\t\t-ms-text-size-adjust: 100%;\n\t\t\t-webkit-text-size-adjust: 100%;\n\t\t}\n\t</style>\n\t<style type="text/css">\n\t\t@media only screen and (max-width: 600px) {\n\t\t\t.rtable {\n\t\t\t\twidth: 100% !important;\n\t\t\t\ttable-layout: fixed;\n\t\t\t}\n\n\t\t\t\t.rtable tr {\n\t\t\t\t\theight: auto !important;\n\t\t\t\t\tdisplay: block;\n\t\t\t\t}\n\n\t\t\t.contenttd {\n\t\t\t\tmax-width: 100% !important;\n\t\t\t\tdisplay: block;\n\t\t\t}\n\n\t\t\t\t.contenttd:after {\n\t\t\t\t\tcontent: "";\n\t\t\t\t\tdisplay: table;\n\t\t\t\t\tclear: both;\n\t\t\t\t}\n\n\t\t\t.hiddentds {\n\t\t\t\tdisplay: none;\n\t\t\t}\n\n\t\t\t.imgtable, .imgtable table {\n\t\t\t\tmax-width: 100% !important;\n\t\t\t\theight: auto;\n\t\t\t\tfloat: none;\n\t\t\t\tmargin: 0 auto;\n\t\t\t}\n\n\t\t\t\t.imgtable.btnset td {\n\t\t\t\t\tdisplay: inline-block;\n\t\t\t\t}\n\n\t\t\t\t.imgtable img {\n\t\t\t\t\twidth: 100%;\n\t\t\t\t\theight: auto;\n\t\t\t\t\tdisplay: block;\n\t\t\t\t}\n\n\t\t\ttable {\n\t\t\t\tfloat: none;\n\t\t\t\ttable-layout: fixed;\n\t\t\t}\n\t\t}\n\t</style>\n\t<!--[if gte mso 9]>\n\t<xml>\n\t  <o:OfficeDocumentSettings>\n\t\t<o:AllowPNG/>\n\t\t<o:PixelsPerInch>96</o:PixelsPerInch>\n\t  </o:OfficeDocumentSettings>\n\t</xml>\n\t<![endif]-->\n</head>\n<body style="overflow: auto; padding:0; margin:0; font-size: 12px; font-family: arial, helvetica, sans-serif; cursor:auto; background-color:#f4f4f4">\n\t<table cellspacing="0" cellpadding="0" width="100%"\n\t\t   bgcolor="#f4f4f4">\n\t\t<tr>\n\t\t\t<td style="FONT-SIZE: 0px; HEIGHT: 20px; LINE-HEIGHT: 0"></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td valign="top">\n\t\t\t\t<table class="rtable" style="WIDTH: 600px; MARGIN: 0px auto"\n\t\t\t\t\t   cellspacing="0" cellpadding="0" width="600" align="center"\n\t\t\t\t\t   border="0">\n\t\t\t\t\t<tr>\n\t\t\t\t\t\t<td class="contenttd"\n\t\t\t\t\t\t\tstyle="BORDER-RIGHT: medium none; BORDER-BOTTOM: medium none; PADDING-BOTTOM: 0px; PADDING-TOP: 0px; PADDING-LEFT: 0px; BORDER-LEFT: medium none; PADDING-RIGHT: 0px; BACKGROUND-COLOR: transparent">\n\t\t\t\t\t\t\t<table style="WIDTH: 100%" cellspacing="0" cellpadding="0"\n\t\t\t\t\t\t\t\t   align="left">\n\t\t\t\t\t\t\t\t<tr class="hiddentds">\n\t\t\t\t\t\t\t\t\t<td style="FONT-SIZE: 0px; HEIGHT: 0px; WIDTH: 367px; LINE-HEIGHT: 0; mso-line-height-rule: exactly"></td>\n\t\t\t\t\t\t\t\t\t<td style="FONT-SIZE: 0px; HEIGHT: 0px; WIDTH: 233px; LINE-HEIGHT: 0; mso-line-height-rule: exactly"></td>\n\t\t\t\t\t\t\t\t</tr>\n\t\t\t\t\t\t\t\t<tr style="HEIGHT: 10px">\n\t\t\t\t\t\t\t\t\t<th class="contenttd" style="BORDER-TOP: medium none; BORDER-RIGHT: medium none; VERTICAL-ALIGN: middle; BORDER-BOTTOM: medium none; FONT-WEIGHT: normal; PADDING-BOTTOM: 20px; TEXT-ALIGN:center !important; PADDING-TOP: 20px; PADDING-LEFT: 0px; BORDER-LEFT: medium none; PADDING-RIGHT: 15px; BACKGROUND-COLOR: transparent; text-aling:center;">\n\t\t\t\t\t\t\t\t\t\t<table class="imgtable" cellspacing="0" cellpadding="0"\n\t\t\t\t\t\t\t\t\t\t\t   align=" center" border="0">\n\t\t\t\t\t\t\t\t\t\t\t<tr>\n\t\t\t\t\t\t\t\t\t\t\t\t<td style="PADDING-BOTTOM: 2px; PADDING-TOP: 2px; PADDING-LEFT: 2px; PADDING-RIGHT: 2px; text-aling:center;" align="center">\n\t\t\t\t\t\t\t\t\t\t\t\t\t<table cellspacing="0" cellpadding="0" border="0">\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t<tr>\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<td style="BORDER-TOP: medium none; BORDER-RIGHT: medium none;  BORDER-BOTTOM: medium none; BORDER-LEFT: medium none; BACKGROUND-COLOR: transparent; text-align:center;">\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<a href="{{APP_URL}}" target="_blank"><img style="BORDER-TOP: medium none; BORDER-RIGHT: medium none; BORDER-BOTTOM: medium none; BORDER-LEFT: medium none; DISPLAY: block" alt="" src="{{URL}}" width="200" hspace="0" vspace="0" border="0" /></a>\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t</td>\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t</tr>\n\t\t\t\t\t\t\t\t\t\t\t\t\t</table>\n\t\t\t\t\t\t\t\t\t\t\t\t</td>\n\t\t\t\t\t\t\t\t\t\t\t</tr>\n\t\t\t\t\t\t\t\t\t\t</table>\n\t\t\t\t\t\t\t\t\t</th>\n\t\t\t\t\t\t\t\t\t<th class="contenttd" style="BORDER-TOP: medium none; BORDER-RIGHT: medium none; VERTICAL-ALIGN: middle; BORDER-BOTTOM: medium none; FONT-WEIGHT: normal; PADDING-BOTTOM: 20px; TEXT-ALIGN: center; PADDING-TOP: 20px; PADDING-LEFT: 15px; BORDER-LEFT: medium none; PADDING-RIGHT: 0px; BACKGROUND-COLOR: transparent">\n\t\t\t\t\t\t\t\t\t</th>\n\t\t\t\t\t\t\t\t</tr>\n\t\t\t\t\t\t\t</table>\n\t\t\t\t\t\t</td>\n\t\t\t\t\t</tr>\n\t\t\t\t\t<tr>\n\t\t\t\t\t\t<td class="contenttd" style="BORDER-TOP: #fff 5px solid; BORDER-RIGHT: medium none; BORDER-BOTTOM: medium none; PADDING-BOTTOM: 0px; PADDING-TOP: 0px; PADDING-LEFT: 0px; BORDER-LEFT: medium none; PADDING-RIGHT: 0px; BACKGROUND-COLOR: #fff;">\n\t\t\t\t\t\t\t<table style="WIDTH: 100%" cellspacing="0" cellpadding="0" align="center">\n\t\t\t\t\t\t\t\t<tr class="hiddentds">\n\t\t\t\t\t\t\t\t\t<td style="FONT-SIZE: 0px; HEIGHT: 0px; WIDTH: 600px; LINE-HEIGHT: 0; mso-line-height-rule: exactly"></td>\n\t\t\t\t\t\t\t\t</tr>\n\t\t\t\t\t\t\t\t<tr style="HEIGHT: 10px">\n\t\t\t\t\t\t\t\t\t<th class="contenttd" style="BORDER-TOP: medium none; BORDER-RIGHT: medium none; VERTICAL-ALIGN: top; BORDER-BOTTOM: medium none; FONT-WEIGHT: normal; PADDING-BOTTOM: 0px; TEXT-ALIGN: left; PADDING-TOP: 0px; PADDING-LEFT: 0px; BORDER-LEFT: medium none; PADDING-RIGHT: 0px; BACKGROUND-COLOR: transparent">\n\t\t\t\t\t\t\t\t\t\t<!--[if gte mso 12]>\n\t\t\t\t\t\t\t<table cellspacing="0" cellpadding="0" border="0" width="100%"><tr><td align="center">\n\t\t\t\t\t\t<![endif]-->\n\t\t\t\t\t\t\t\t\t\t<table class="imgtable" style="MARGIN: 0px auto" cellspacing="0"\n\t\t\t\t\t\t\t\t\t\t\t   cellpadding="0" align="center" border="0">\n\t\t\t\t\t\t\t\t\t\t\t<tr>\n\t\t\t\t\t\t\t\t\t\t\t\t<td style="PADDING-BOTTOM: 0px; PADDING-TOP: 0px; PADDING-LEFT: 0px; PADDING-RIGHT: 0px"\n\t\t\t\t\t\t\t\t\t\t\t\t\talign="center"></td>\n\t\t\t\t\t\t\t\t\t\t\t</tr>\n\t\t\t\t\t\t\t\t\t\t</table>\n\t\t\t\t\t\t\t\t\t\t<!--[if gte mso 12]>\n\t\t\t\t\t\t\t</td></tr></table>\n\t\t\t\t\t\t<![endif]-->\n\t\t\t\t\t\t\t\t\t</th>\n\t\t\t\t\t\t\t\t</tr>\n\t\t\t\t\t\t\t</table>\n\t\t\t\t\t\t</td>\n\t\t\t\t\t</tr>\n\n\t\t\t\t\t<tr>\n\n\n\n\t\t\t\t\t\t<td class="contenttd" style="BORDER-RIGHT: medium none; BORDER-BOTTOM: medium none; PADDING-BOTTOM: 0px; PADDING-TOP: 0px; PADDING-LEFT: 0px; BORDER-LEFT: medium none; PADDING-RIGHT: 0px; BACKGROUND-COLOR: #fff;">\n\t\t\t\t\t\t\t<table style="WIDTH: 100%" cellspacing="0" cellpadding="0"\n\t\t\t\t\t\t\t\t   align="left">\n\t\t\t\t\t\t\t\t<tr class="hiddentds">\n\t\t\t\t\t\t\t\t\t<td style="FONT-SIZE: 0px; HEIGHT: 0px; WIDTH: 600px; LINE-HEIGHT: 0; mso-line-height-rule: exactly"></td>\n\t\t\t\t\t\t\t\t</tr>\n\t\t\t\t\t\t\t\t<tr style="HEIGHT: 20px">\n\t\t\t\t\t\t\t\t\t<th class="contenttd" style="BORDER-TOP: medium none; BORDER-RIGHT: medium none; VERTICAL-ALIGN: middle; BORDER-BOTTOM: medium none; FONT-WEIGHT: normal; PADDING-BOTTOM: 20px; TEXT-ALIGN: left; PADDING-TOP: 20px; PADDING-LEFT: 20px; BORDER-LEFT: medium none; PADDING-RIGHT: 20px; BACKGROUND-COLOR: #fff;">\n\t\t\t\t\t\t\t\t\t\t<p style="FONT-SIZE: 22px; MARGIN-BOTTOM: 1em; FONT-FAMILY: arial, helvetica, sans-serif; MARGIN-TOP: 0px; COLOR: #333330; LINE-HEIGHT: 33px; BACKGROUND-COLOR: #fff; mso-line-height-rule: exactly"\n\t\t\t\t\t\t\t\t\t\t   align="center">\n\t\t\t\t\t\t\t\t\t\t\t{Greetings}<br />\n\n\t\t\t\t\t\t\t\t\t\t</p>\n\t\t\t\t\t\t\t\t\t\t<p style="FONT-SIZE: 16px; MARGIN-BOTTOM: 1em; FONT-FAMILY: arial, helvetica, sans-serif; MARGIN-TOP: 0px; COLOR: #575757; LINE-HEIGHT: 24px; BACKGROUND-COLOR: transparent; mso-line-height-rule: exactly"\n\t\t\t\t\t\t\t\t\t\t   align="center">{ResetRequest}</p>\n\n\t\t\t\t\t\t\t\t\t\t<p style="FONT-SIZE: 22px; MARGIN-BOTTOM: 1em; FONT-FAMILY: arial, helvetica, sans-serif; MARGIN-TOP: 0px; COLOR: #333330; LINE-HEIGHT: 33px; BACKGROUND-COLOR: #fff; mso-line-height-rule: exactly"\n\t\t\t\t\t\t\t\t\t\t   align="center">\n\t\t\t\t\t\t\t\t\t\t\t<a style="color:#2560f6; text-decoration:underline; font-size:20px;" href='{:EmailResetUrl}'>{:EmailResetUrl}</a><br />\n\t\t\t\t\t\t\t\t\t\t</p>\n\t\t\t\t\t\t\t\t\t</th>\n\t\t\t\t\t\t\t\t</tr>\n\t\t\t\t\t\t\t</table>\n\t\t\t\t\t\t</td>\n\t\t\t\t\t</tr>\n\t\t\t\t\t{{F}}<tr style="HEIGHT: 20px;display:{{SOCIAL_ICONS}};">\n\t\t\t\t\t\t<table class="es-content" cellspacing="0" cellpadding="0" align="center" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;table-layout:fixed !important;width:100%;">\n\t\t\t\t\t\t\t<tr style="border-collapse:collapse;">\n\t\t\t\t\t\t\t\t<td align="center" style="padding:0;Margin:0;">\n\t\t\t\t\t\t\t\t\t<table class="es-content-body" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;background-color:transparent;" width="600" cellspacing="0" cellpadding="0" align="center" bgcolor="rgba(0, 0, 0, 0)">\n\t\t\t\t\t\t\t\t\t\t<tr style="border-collapse:collapse;">\n\t\t\t\t\t\t\t\t\t\t\t<td align="left" style="Margin:0;padding-top:10px;padding-left:10px;padding-right:10px;padding-bottom:30px;">\n\t\t\t\t\t\t\t\t\t\t\t\t<table width="100%" cellspacing="0" cellpadding="0" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;display:{{SOCIAL_ICONS}};">\n\t\t\t\t\t\t\t\t\t\t\t\t\t<tr style="border-collapse:collapse;">\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t<td width="580" valign="top" align="center" style="padding:0;Margin:0;">\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<table width="100%" cellspacing="0" cellpadding="0" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;">\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<tr style="border-collapse:collapse;">\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<td align="center" class="es-infoblock" style="padding:10px;Margin:0;line-height:120%;font-size:12px;color:#CCCCCC;"><p style="Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-size:12px;font-family:arial, 'helvetica neue', helvetica, sans-serif;line-height:150%;color:#333333;">{{FOOTER}}</p> <p style="Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-size:12px;font-family:arial, 'helvetica neue', helvetica, sans-serif;line-height:150%;color:#333333;">+90 212 963 0060 &amp; +90 850 532 2800 (Hafta içi: 09.00 - 18.00)</p></td>\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t</tr>\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<tr style="border-collapse:collapse;">\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<td align="center" class="es-m-txt-c" style="padding:0;Margin:0;">\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<table cellpadding="0" cellspacing="0" class="es-table-not-adapt es-social" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;">\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<tr style="border-collapse:collapse;">\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<td align="center" valign="top" style="padding:0;Margin:0;padding-right:5px;"><a target="_blank" href="https://www.linkedin.com/company/ofisim.com/" style="-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:arial, 'helvetica neue', helvetica, sans-serif;font-size:14px;text-decoration:underline;color:#2CB543;"> <img src="https://ofisim.com/mail/signature/linkedin.png" alt="Li" title="Linkedin" width="32" style="display:block;border:0;outline:none;text-decoration:none;-ms-interpolation-mode:bicubic;" /> </a></td>\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<td align="center" valign="top" style="padding:0;Margin:0;padding-right:5px;"><a target="_blank" href="https://twitter.com/ofisimcom/" style="-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:arial, 'helvetica neue', helvetica, sans-serif;font-size:14px;text-decoration:underline;color:#2CB543;"> <img src="https://ofisim.com/mail/signature/twitter.png" alt="Tw" title="Twitter" width="32" style="display:block;border:0;outline:none;text-decoration:none;-ms-interpolation-mode:bicubic;" /> </a></td>\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<td align="center" valign="top" style="padding:0;Margin:0;padding-right:5px;"><a target="_blank" href="https://www.facebook.com/ofisimcom/" style="-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:arial, 'helvetica neue', helvetica, sans-serif;font-size:14px;text-decoration:underline;color:#2CB543;"> <img src="https://ofisim.com/mail/signature/facebook.png" alt="Fb" title="Facebook" width="32" style="display:block;border:0;outline:none;text-decoration:none;-ms-interpolation-mode:bicubic;" /> </a></td>\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<td align="center" valign="top" style="padding:0;Margin:0;padding-right:5px;"><a target="_blank" href="https://www.instagram.com/ofisimcom/" style="-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:arial, 'helvetica neue', helvetica, sans-serif;font-size:14px;text-decoration:underline;color:#2CB543;"> <img src="https://ofisim.com/mail/signature/instagram.png" alt="in" title="instagram" width="32" style="display:block;border:0;outline:none;text-decoration:none;-ms-interpolation-mode:bicubic;" /> </a></td>\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<td align="center" valign="top" style="padding:0;Margin:0;"><a target="_blank" href="https://www.youtube.com/channel/UClGV9dPtU1XC2VTn2Kb414A" style="-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:arial, 'helvetica neue', helvetica, sans-serif;font-size:14px;text-decoration:underline;color:#2CB543;"> <img src="https://ofisim.com/mail/signature/youtube.png" alt="Yt" title="Youtube" width="32" style="display:block;border:0;outline:none;text-decoration:none;-ms-interpolation-mode:bicubic;" /> </a></td>\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t</tr>\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t</table>\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t</td>\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t</tr>\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t</table>\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t</td>\n\t\t\t\t\t\t\t\t\t\t\t\t\t</tr>\n\t\t\t\t\t\t\t\t\t\t\t\t</table>\n\t\t\t\t\t\t\t\t\t\t\t</td>\n\t\t\t\t\t\t\t\t\t\t</tr>\n\t\t\t\t\t\t\t\t\t</table>\n\t\t\t\t\t\t\t\t</td>\n\t\t\t\t\t\t\t</tr>\n\t\t\t\t\t\t</table>\n\t\t\t\t\t</tr>{{/F}}\n\t\t\t\t</table>\n\t\t\t</td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td class="contenttd"\n\t\t\t\tstyle="BORDER-TOP: medium none; BORDER-RIGHT: medium none; BORDER-BOTTOM: medium none; PADDING-BOTTOM: 10px; PADDING-TOP: 10px; PADDING-LEFT: 0px; BORDER-LEFT: medium none; PADDING-RIGHT: 0px; BACKGROUND-COLOR: transparent">\n\t\t\t\t<table style="WIDTH: 100%" cellspacing="0" cellpadding="0"\n\t\t\t\t\t   align="left">\n\t\t\t\t\t<tr class="hiddentds">\n\t\t\t\t\t\t<td style="FONT-SIZE: 0px; HEIGHT: 0px; WIDTH: 600px; LINE-HEIGHT: 0; mso-line-height-rule: exactly"></td>\n\t\t\t\t\t</tr>\n\t\t\t\t\t<tr style="HEIGHT: 10px">\n\t\t\t\t\t\t<th class="contenttd"\n\t\t\t\t\t\t\tstyle="BORDER-TOP: medium none; BORDER-RIGHT: medium none; VERTICAL-ALIGN: top; BORDER-BOTTOM: medium none; FONT-WEIGHT: normal; PADDING-BOTTOM: 0px; TEXT-ALIGN: left; PADDING-TOP: 0px; PADDING-LEFT: 0px; BORDER-LEFT: medium none; PADDING-RIGHT: 0px; BACKGROUND-COLOR: transparent">\n\t\t\t\t\t\t</th>\n\t\t\t\t\t</tr>\n\t\t\t\t</table>\n\t\t\t</td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td class="contenttd"\n\t\t\t\tstyle="BORDER-TOP: medium none; BORDER-RIGHT: medium none; BORDER-BOTTOM: medium none; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 0px; BORDER-LEFT: medium none; PADDING-RIGHT: 0px; BACKGROUND-COLOR: transparent">\n\t\t\t\t<table style="WIDTH: 100%" cellspacing="0" cellpadding="0"\n\t\t\t\t\t   align="left">\n\t\t\t\t\t<tr class="hiddentds">\n\t\t\t\t\t\t<td style="FONT-SIZE: 0px; HEIGHT: 0px; WIDTH: 600px; LINE-HEIGHT: 0; mso-line-height-rule: exactly"></td>\n\t\t\t\t\t</tr>\n\t\t\t\t\t<tr style="HEIGHT: 10px">\n\t\t\t\t\t\t<th class="contenttd"\n\t\t\t\t\t\t\tstyle="BORDER-TOP: medium none; BORDER-RIGHT: medium none; VERTICAL-ALIGN: top; BORDER-BOTTOM: medium none; FONT-WEIGHT: normal; PADDING-BOTTOM: 1px; TEXT-ALIGN: left; PADDING-TOP: 1px; PADDING-LEFT: 15px; BORDER-LEFT: medium none; PADDING-RIGHT: 15px; BACKGROUND-COLOR: transparent">\n\t\t\t\t\t\t</th>\n\t\t\t\t\t</tr>\n\t\t\t\t</table>\n\t\t\t</td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td style="FONT-SIZE: 0px; HEIGHT: 8px; LINE-HEIGHT: 0">&nbsp;</td>\n\t\t</tr>\n\t</table>\n\n\t<!-- Created with MailStyler 2.0.0.330 -->\n</body>\n</html>\n\n\n\n\n\n\n\n\n\n\n	tr	1	password_reset	t	{"MailSenderName": "Gaboras", "MailSenderEmail": "app@gaboras.com.tr"}
3	1	\N	2018-10-03 14:55:24	\N	f	100	Password Reset Request	Password Reset Request	<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml"\n\t  xmlns:v="urn:schemas-microsoft-com:vml"\n\t  xmlns:o="urn:schemas-microsoft-com:office:office">\n<head>\n\t<title>Ofisim CRM'e Hoşgeldiniz!</title>\n\t<meta http-equiv="Content-Type"\n\t\t  content="text/html; charset=utf-8" />\n\t<style type="text/css">\n\t\tbody, .maintable {\n\t\t\theight: 100% !important;\n\t\t\twidth: 100% !important;\n\t\t\tmargin: 0;\n\t\t\tpadding: 0;\n\t\t}\n\n\t\timg, a img {\n\t\t\tborder: 0;\n\t\t\toutline: none;\n\t\t\ttext-decoration: none;\n\t\t}\n\n\t\t.imagefix {\n\t\t\tdisplay: block;\n\t\t}\n\n\t\tp {\n\t\t\tmargin-top: 0;\n\t\t\tmargin-right: 0;\n\t\t\tmargin-left: 0;\n\t\t\tpadding: 0;\n\t\t}\n\n\t\t.ReadMsgBody {\n\t\t\twidth: 100%;\n\t\t}\n\n\t\t.ExternalClass {\n\t\t\twidth: 100%;\n\t\t}\n\n\t\t\t.ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div {\n\t\t\t\tline-height: 100%;\n\t\t\t}\n\n\t\timg {\n\t\t\t-ms-interpolation-mode: bicubic;\n\t\t}\n\n\t\tbody, table, td, p, a, li, blockquote {\n\t\t\t-ms-text-size-adjust: 100%;\n\t\t\t-webkit-text-size-adjust: 100%;\n\t\t}\n\t</style>\n\t<style type="text/css">\n\t\t@media only screen and (max-width: 600px) {\n\t\t\t.rtable {\n\t\t\t\twidth: 100% !important;\n\t\t\t\ttable-layout: fixed;\n\t\t\t}\n\n\t\t\t\t.rtable tr {\n\t\t\t\t\theight: auto !important;\n\t\t\t\t\tdisplay: block;\n\t\t\t\t}\n\n\t\t\t.contenttd {\n\t\t\t\tmax-width: 100% !important;\n\t\t\t\tdisplay: block;\n\t\t\t}\n\n\t\t\t\t.contenttd:after {\n\t\t\t\t\tcontent: "";\n\t\t\t\t\tdisplay: table;\n\t\t\t\t\tclear: both;\n\t\t\t\t}\n\n\t\t\t.hiddentds {\n\t\t\t\tdisplay: none;\n\t\t\t}\n\n\t\t\t.imgtable, .imgtable table {\n\t\t\t\tmax-width: 100% !important;\n\t\t\t\theight: auto;\n\t\t\t\tfloat: none;\n\t\t\t\tmargin: 0 auto;\n\t\t\t}\n\n\t\t\t\t.imgtable.btnset td {\n\t\t\t\t\tdisplay: inline-block;\n\t\t\t\t}\n\n\t\t\t\t.imgtable img {\n\t\t\t\t\twidth: 100%;\n\t\t\t\t\theight: auto;\n\t\t\t\t\tdisplay: block;\n\t\t\t\t}\n\n\t\t\ttable {\n\t\t\t\tfloat: none;\n\t\t\t\ttable-layout: fixed;\n\t\t\t}\n\t\t}\n\t</style>\n\t<!--[if gte mso 9]>\n\t<xml>\n\t  <o:OfficeDocumentSettings>\n\t\t<o:AllowPNG/>\n\t\t<o:PixelsPerInch>96</o:PixelsPerInch>\n\t  </o:OfficeDocumentSettings>\n\t</xml>\n\t<![endif]-->\n</head>\n<body style="overflow: auto; padding:0; margin:0; font-size: 12px; font-family: arial, helvetica, sans-serif; cursor:auto; background-color:#f4f4f4">\n\t<table cellspacing="0" cellpadding="0" width="100%"\n\t\t   bgcolor="#f4f4f4">\n\t\t<tr>\n\t\t\t<td style="FONT-SIZE: 0px; HEIGHT: 20px; LINE-HEIGHT: 0"></td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td valign="top">\n\t\t\t\t<table class="rtable" style="WIDTH: 600px; MARGIN: 0px auto"\n\t\t\t\t\t   cellspacing="0" cellpadding="0" width="600" align="center"\n\t\t\t\t\t   border="0">\n\t\t\t\t\t<tr>\n\t\t\t\t\t\t<td class="contenttd"\n\t\t\t\t\t\t\tstyle="BORDER-RIGHT: medium none; BORDER-BOTTOM: medium none; PADDING-BOTTOM: 0px; PADDING-TOP: 0px; PADDING-LEFT: 0px; BORDER-LEFT: medium none; PADDING-RIGHT: 0px; BACKGROUND-COLOR: transparent">\n\t\t\t\t\t\t\t<table style="WIDTH: 100%" cellspacing="0" cellpadding="0"\n\t\t\t\t\t\t\t\t   align="left">\n\t\t\t\t\t\t\t\t<tr class="hiddentds">\n\t\t\t\t\t\t\t\t\t<td style="FONT-SIZE: 0px; HEIGHT: 0px; WIDTH: 367px; LINE-HEIGHT: 0; mso-line-height-rule: exactly"></td>\n\t\t\t\t\t\t\t\t\t<td style="FONT-SIZE: 0px; HEIGHT: 0px; WIDTH: 233px; LINE-HEIGHT: 0; mso-line-height-rule: exactly"></td>\n\t\t\t\t\t\t\t\t</tr>\n\t\t\t\t\t\t\t\t<tr style="HEIGHT: 10px">\n\t\t\t\t\t\t\t\t\t<th class="contenttd" style="BORDER-TOP: medium none; BORDER-RIGHT: medium none; VERTICAL-ALIGN: middle; BORDER-BOTTOM: medium none; FONT-WEIGHT: normal; PADDING-BOTTOM: 20px; TEXT-ALIGN:center !important; PADDING-TOP: 20px; PADDING-LEFT: 0px; BORDER-LEFT: medium none; PADDING-RIGHT: 15px; BACKGROUND-COLOR: transparent; text-aling:center;">\n\t\t\t\t\t\t\t\t\t\t<table class="imgtable" cellspacing="0" cellpadding="0"\n\t\t\t\t\t\t\t\t\t\t\t   align=" center" border="0">\n\t\t\t\t\t\t\t\t\t\t\t<tr>\n\t\t\t\t\t\t\t\t\t\t\t\t<td style="PADDING-BOTTOM: 2px; PADDING-TOP: 2px; PADDING-LEFT: 2px; PADDING-RIGHT: 2px; text-aling:center;" align="center">\n\t\t\t\t\t\t\t\t\t\t\t\t\t<table cellspacing="0" cellpadding="0" border="0">\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t<tr>\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<td style="BORDER-TOP: medium none; BORDER-RIGHT: medium none;  BORDER-BOTTOM: medium none; BORDER-LEFT: medium none; BACKGROUND-COLOR: transparent; text-align:center;">\t\t\t\t\t\t\t\t\t\t\t\t\t\t\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<a href="{{APP_URL}}" target="_blank"><img style="BORDER-TOP: medium none; BORDER-RIGHT: medium none; BORDER-BOTTOM: medium none; BORDER-LEFT: medium none; DISPLAY: block" alt="" src="{{URL}}" width="200" hspace="0" vspace="0" border="0" /></a>\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t</td>\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t</tr>\n\t\t\t\t\t\t\t\t\t\t\t\t\t</table>\n\t\t\t\t\t\t\t\t\t\t\t\t</td>\n\t\t\t\t\t\t\t\t\t\t\t</tr>\n\t\t\t\t\t\t\t\t\t\t</table>\n\t\t\t\t\t\t\t\t\t</th>\n\t\t\t\t\t\t\t\t\t<th class="contenttd" style="BORDER-TOP: medium none; BORDER-RIGHT: medium none; VERTICAL-ALIGN: middle; BORDER-BOTTOM: medium none; FONT-WEIGHT: normal; PADDING-BOTTOM: 20px; TEXT-ALIGN: center; PADDING-TOP: 20px; PADDING-LEFT: 15px; BORDER-LEFT: medium none; PADDING-RIGHT: 0px; BACKGROUND-COLOR: transparent">\n\t\t\t\t\t\t\t\t\t</th>\n\t\t\t\t\t\t\t\t</tr>\n\t\t\t\t\t\t\t</table>\n\t\t\t\t\t\t</td>\n\t\t\t\t\t</tr>\n\t\t\t\t\t<tr>\n\t\t\t\t\t\t<td class="contenttd" style="BORDER-TOP: #fff 5px solid; BORDER-RIGHT: medium none; BORDER-BOTTOM: medium none; PADDING-BOTTOM: 0px; PADDING-TOP: 0px; PADDING-LEFT: 0px; BORDER-LEFT: medium none; PADDING-RIGHT: 0px; BACKGROUND-COLOR: #fff;">\n\t\t\t\t\t\t\t<table style="WIDTH: 100%" cellspacing="0" cellpadding="0" align="center">\n\t\t\t\t\t\t\t\t<tr class="hiddentds">\n\t\t\t\t\t\t\t\t\t<td style="FONT-SIZE: 0px; HEIGHT: 0px; WIDTH: 600px; LINE-HEIGHT: 0; mso-line-height-rule: exactly"></td>\n\t\t\t\t\t\t\t\t</tr>\n\t\t\t\t\t\t\t\t<tr style="HEIGHT: 10px">\n\t\t\t\t\t\t\t\t\t<th class="contenttd" style="BORDER-TOP: medium none; BORDER-RIGHT: medium none; VERTICAL-ALIGN: top; BORDER-BOTTOM: medium none; FONT-WEIGHT: normal; PADDING-BOTTOM: 0px; TEXT-ALIGN: left; PADDING-TOP: 0px; PADDING-LEFT: 0px; BORDER-LEFT: medium none; PADDING-RIGHT: 0px; BACKGROUND-COLOR: transparent">\n\t\t\t\t\t\t\t\t\t\t<!--[if gte mso 12]>\n\t\t\t\t\t\t\t<table cellspacing="0" cellpadding="0" border="0" width="100%"><tr><td align="center">\n\t\t\t\t\t\t<![endif]-->\n\t\t\t\t\t\t\t\t\t\t<table class="imgtable" style="MARGIN: 0px auto" cellspacing="0"\n\t\t\t\t\t\t\t\t\t\t\t   cellpadding="0" align="center" border="0">\n\t\t\t\t\t\t\t\t\t\t\t<tr>\n\t\t\t\t\t\t\t\t\t\t\t\t<td style="PADDING-BOTTOM: 0px; PADDING-TOP: 0px; PADDING-LEFT: 0px; PADDING-RIGHT: 0px"\n\t\t\t\t\t\t\t\t\t\t\t\t\talign="center"></td>\n\t\t\t\t\t\t\t\t\t\t\t</tr>\n\t\t\t\t\t\t\t\t\t\t</table>\n\t\t\t\t\t\t\t\t\t\t<!--[if gte mso 12]>\n\t\t\t\t\t\t\t</td></tr></table>\n\t\t\t\t\t\t<![endif]-->\n\t\t\t\t\t\t\t\t\t</th>\n\t\t\t\t\t\t\t\t</tr>\n\t\t\t\t\t\t\t</table>\n\t\t\t\t\t\t</td>\n\t\t\t\t\t</tr>\n\n\t\t\t\t\t<tr>\n\n\n\n\t\t\t\t\t\t<td class="contenttd" style="BORDER-RIGHT: medium none; BORDER-BOTTOM: medium none; PADDING-BOTTOM: 0px; PADDING-TOP: 0px; PADDING-LEFT: 0px; BORDER-LEFT: medium none; PADDING-RIGHT: 0px; BACKGROUND-COLOR: #fff;">\n\t\t\t\t\t\t\t<table style="WIDTH: 100%" cellspacing="0" cellpadding="0"\n\t\t\t\t\t\t\t\t   align="left">\n\t\t\t\t\t\t\t\t<tr class="hiddentds">\n\t\t\t\t\t\t\t\t\t<td style="FONT-SIZE: 0px; HEIGHT: 0px; WIDTH: 600px; LINE-HEIGHT: 0; mso-line-height-rule: exactly"></td>\n\t\t\t\t\t\t\t\t</tr>\n\t\t\t\t\t\t\t\t<tr style="HEIGHT: 20px">\n\t\t\t\t\t\t\t\t\t<th class="contenttd" style="BORDER-TOP: medium none; BORDER-RIGHT: medium none; VERTICAL-ALIGN: middle; BORDER-BOTTOM: medium none; FONT-WEIGHT: normal; PADDING-BOTTOM: 20px; TEXT-ALIGN: left; PADDING-TOP: 20px; PADDING-LEFT: 20px; BORDER-LEFT: medium none; PADDING-RIGHT: 20px; BACKGROUND-COLOR: #fff;">\n\t\t\t\t\t\t\t\t\t\t<!-- <p style="FONT-SIZE: 22px; MARGIN-BOTTOM: 1em; FONT-FAMILY: arial, helvetica, sans-serif; MARGIN-TOP: 0px; COLOR: #333330; LINE-HEIGHT: 33px; BACKGROUND-COLOR: #fff; mso-line-height-rule: exactly" -->\n\t\t\t\t\t\t\t\t\t\t   <!-- align="center"> -->\n\t\t\t\t\t\t\t\t\t\t\t<!-- {Greetings}<br /> -->\n\n\t\t\t\t\t\t\t\t\t\t<!-- </p> -->\n\t\t\t\t\t\t\t\t\t\t <p style="FONT-SIZE: 16px; MARGIN-BOTTOM: 1em; FONT-FAMILY: arial, helvetica, sans-serif; MARGIN-TOP: 0px; COLOR: #575757; LINE-HEIGHT: 24px; BACKGROUND-COLOR: transparent; mso-line-height-rule: exactly" \n\t\t\t\t\t\t\t\t\t\t   align="center"> Merhaba {:FullName},<br /></p> \n\n\t\t\t\t\t\t\t\t\t\t<p style="FONT-SIZE: 22px; MARGIN-BOTTOM: 1em; FONT-FAMILY: arial, helvetica, sans-serif; MARGIN-TOP: 0px; COLOR: #333330; LINE-HEIGHT: 33px; BACKGROUND-COLOR: #fff; mso-line-height-rule: exactly"\n\t\t\t\t\t\t\t\t\t\t   align="center">\n\t\t\t\t\t\t\t\t\t\t    <a style="color:#2560f6; text-decoration:underline; font-size:20px;" href='{:PasswordResetUrl}'>Şifremi Sıfırla</a><br />\n\t\t\t\t\t\t\t\t\t\t\t<!-- <a style="color:#2560f6; text-decoration:underline; font-size:20px;" href='{:EmailResetUrl}'>{:EmailResetUrl}</a><br /> -->\n\t\t\t\t\t\t\t\t\t\t</p>\n\t\t\t\t\t\t\t\t\t</th>\n\t\t\t\t\t\t\t\t</tr>\n\t\t\t\t\t\t\t</table>\n\t\t\t\t\t\t</td>\n\t\t\t\t\t</tr>\n\t\t\t\t\t{{F}}<tr style="HEIGHT: 20px;display:{{SOCIAL_ICONS}};">\n\t\t\t\t\t\t<table class="es-content" cellspacing="0" cellpadding="0" align="center" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;table-layout:fixed !important;width:100%;">\n\t\t\t\t\t\t\t<tr style="border-collapse:collapse;">\n\t\t\t\t\t\t\t\t<td align="center" style="padding:0;Margin:0;">\n\t\t\t\t\t\t\t\t\t<table class="es-content-body" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;background-color:transparent;" width="600" cellspacing="0" cellpadding="0" align="center" bgcolor="rgba(0, 0, 0, 0)">\n\t\t\t\t\t\t\t\t\t\t<tr style="border-collapse:collapse;">\n\t\t\t\t\t\t\t\t\t\t\t<td align="left" style="Margin:0;padding-top:10px;padding-left:10px;padding-right:10px;padding-bottom:30px;">\n\t\t\t\t\t\t\t\t\t\t\t\t<table width="100%" cellspacing="0" cellpadding="0" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;display:{{SOCIAL_ICONS}};">\n\t\t\t\t\t\t\t\t\t\t\t\t\t<tr style="border-collapse:collapse;">\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t<td width="580" valign="top" align="center" style="padding:0;Margin:0;">\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<table width="100%" cellspacing="0" cellpadding="0" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;">\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<tr style="border-collapse:collapse;">\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<!-- <td align="center" class="es-infoblock" style="padding:10px;Margin:0;line-height:120%;font-size:12px;color:#CCCCCC;"><p style="Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-size:12px;font-family:arial, 'helvetica neue', helvetica, sans-serif;line-height:150%;color:#333333;">{{FOOTER}}</p> <p style="Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-size:12px;font-family:arial, 'helvetica neue', helvetica, sans-serif;line-height:150%;color:#333333;">+90 212 963 0060 &amp; +90 850 532 2800 (Hafta içi: 09.00 - 18.00)</p></td> -->\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t</tr>\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<tr style="border-collapse:collapse;">\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<td align="center" class="es-m-txt-c" style="padding:0;Margin:0;">\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<table cellpadding="0" cellspacing="0" class="es-table-not-adapt es-social" style="mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;">\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<tr style="border-collapse:collapse;">\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<td align="center" valign="top" style="padding:0;Margin:0;padding-right:5px;"><a target="_blank" href="https://www.linkedin.com/company/ofisim.com/" style="-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:arial, 'helvetica neue', helvetica, sans-serif;font-size:14px;text-decoration:underline;color:#2CB543;"> <img src="https://ofisim.com/mail/signature/linkedin.png" alt="Li" title="Linkedin" width="32" style="display:block;border:0;outline:none;text-decoration:none;-ms-interpolation-mode:bicubic;" /> </a></td>\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<td align="center" valign="top" style="padding:0;Margin:0;padding-right:5px;"><a target="_blank" href="https://twitter.com/ofisimcom/" style="-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:arial, 'helvetica neue', helvetica, sans-serif;font-size:14px;text-decoration:underline;color:#2CB543;"> <img src="https://ofisim.com/mail/signature/twitter.png" alt="Tw" title="Twitter" width="32" style="display:block;border:0;outline:none;text-decoration:none;-ms-interpolation-mode:bicubic;" /> </a></td>\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<td align="center" valign="top" style="padding:0;Margin:0;padding-right:5px;"><a target="_blank" href="https://www.facebook.com/ofisimcom/" style="-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:arial, 'helvetica neue', helvetica, sans-serif;font-size:14px;text-decoration:underline;color:#2CB543;"> <img src="https://ofisim.com/mail/signature/facebook.png" alt="Fb" title="Facebook" width="32" style="display:block;border:0;outline:none;text-decoration:none;-ms-interpolation-mode:bicubic;" /> </a></td>\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<td align="center" valign="top" style="padding:0;Margin:0;padding-right:5px;"><a target="_blank" href="https://www.instagram.com/ofisimcom/" style="-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:arial, 'helvetica neue', helvetica, sans-serif;font-size:14px;text-decoration:underline;color:#2CB543;"> <img src="https://ofisim.com/mail/signature/instagram.png" alt="in" title="instagram" width="32" style="display:block;border:0;outline:none;text-decoration:none;-ms-interpolation-mode:bicubic;" /> </a></td>\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<td align="center" valign="top" style="padding:0;Margin:0;"><a target="_blank" href="https://www.youtube.com/channel/UClGV9dPtU1XC2VTn2Kb414A" style="-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:arial, 'helvetica neue', helvetica, sans-serif;font-size:14px;text-decoration:underline;color:#2CB543;"> <img src="https://ofisim.com/mail/signature/youtube.png" alt="Yt" title="Youtube" width="32" style="display:block;border:0;outline:none;text-decoration:none;-ms-interpolation-mode:bicubic;" /> </a></td>\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t</tr>\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t</table>\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t</td>\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t</tr>\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t</table>\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t</td>\n\t\t\t\t\t\t\t\t\t\t\t\t\t</tr>\n\t\t\t\t\t\t\t\t\t\t\t\t</table>\n\t\t\t\t\t\t\t\t\t\t\t</td>\n\t\t\t\t\t\t\t\t\t\t</tr>\n\t\t\t\t\t\t\t\t\t</table>\n\t\t\t\t\t\t\t\t</td>\n\t\t\t\t\t\t\t</tr>\n\t\t\t\t\t\t</table>\n\t\t\t\t\t</tr>{{/F}}\n\t\t\t\t</table>\n\t\t\t</td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td class="contenttd"\n\t\t\t\tstyle="BORDER-TOP: medium none; BORDER-RIGHT: medium none; BORDER-BOTTOM: medium none; PADDING-BOTTOM: 10px; PADDING-TOP: 10px; PADDING-LEFT: 0px; BORDER-LEFT: medium none; PADDING-RIGHT: 0px; BACKGROUND-COLOR: transparent">\n\t\t\t\t<table style="WIDTH: 100%" cellspacing="0" cellpadding="0"\n\t\t\t\t\t   align="left">\n\t\t\t\t\t<tr class="hiddentds">\n\t\t\t\t\t\t<td style="FONT-SIZE: 0px; HEIGHT: 0px; WIDTH: 600px; LINE-HEIGHT: 0; mso-line-height-rule: exactly"></td>\n\t\t\t\t\t</tr>\n\t\t\t\t\t<tr style="HEIGHT: 10px">\n\t\t\t\t\t\t<th class="contenttd"\n\t\t\t\t\t\t\tstyle="BORDER-TOP: medium none; BORDER-RIGHT: medium none; VERTICAL-ALIGN: top; BORDER-BOTTOM: medium none; FONT-WEIGHT: normal; PADDING-BOTTOM: 0px; TEXT-ALIGN: left; PADDING-TOP: 0px; PADDING-LEFT: 0px; BORDER-LEFT: medium none; PADDING-RIGHT: 0px; BACKGROUND-COLOR: transparent">\n\t\t\t\t\t\t</th>\n\t\t\t\t\t</tr>\n\t\t\t\t</table>\n\t\t\t</td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td class="contenttd"\n\t\t\t\tstyle="BORDER-TOP: medium none; BORDER-RIGHT: medium none; BORDER-BOTTOM: medium none; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 0px; BORDER-LEFT: medium none; PADDING-RIGHT: 0px; BACKGROUND-COLOR: transparent">\n\t\t\t\t<table style="WIDTH: 100%" cellspacing="0" cellpadding="0"\n\t\t\t\t\t   align="left">\n\t\t\t\t\t<tr class="hiddentds">\n\t\t\t\t\t\t<td style="FONT-SIZE: 0px; HEIGHT: 0px; WIDTH: 600px; LINE-HEIGHT: 0; mso-line-height-rule: exactly"></td>\n\t\t\t\t\t</tr>\n\t\t\t\t\t<tr style="HEIGHT: 10px">\n\t\t\t\t\t\t<th class="contenttd"\n\t\t\t\t\t\t\tstyle="BORDER-TOP: medium none; BORDER-RIGHT: medium none; VERTICAL-ALIGN: top; BORDER-BOTTOM: medium none; FONT-WEIGHT: normal; PADDING-BOTTOM: 1px; TEXT-ALIGN: left; PADDING-TOP: 1px; PADDING-LEFT: 15px; BORDER-LEFT: medium none; PADDING-RIGHT: 15px; BACKGROUND-COLOR: transparent">\n\t\t\t\t\t\t</th>\n\t\t\t\t\t</tr>\n\t\t\t\t</table>\n\t\t\t</td>\n\t\t</tr>\n\t\t<tr>\n\t\t\t<td style="FONT-SIZE: 0px; HEIGHT: 8px; LINE-HEIGHT: 0">&nbsp;</td>\n\t\t</tr>\n\t</table>\n\n\t<!-- Created with MailStyler 2.0.0.330 -->\n</body>\n</html>\n\n\n\n\n\n\n\n\n\n\n	en	1	password_reset	t	{"MailSenderName": "Gaboras", "MailSenderEmail": "app@gaboras.com.tr"}
4	1	\N	2018-10-01 11:41:02.829818	\N	f	100	Account Activation	Account Activation	<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml"\n      xmlns:v="urn:schemas-microsoft-com:vml"\n      xmlns:o="urn:schemas-microsoft-com:office:office">\n<head>\n    <title>Ofisim CRM'e Hoşgeldiniz!</title>\n    <meta http-equiv="Content-Type"\n          content="text/html; charset=utf-8" />\n    <style type="text/css">\n        body, .maintable {\n            height: 100% !important;\n            width: 100% !important;\n            margin: 0;\n            padding: 0;\n        }\n\n        img, a img {\n            border: 0;\n            outline: none;\n            text-decoration: none;\n        }\n\n        .imagefix {\n            display: block;\n        }\n\n        p {\n            margin-top: 0;\n            margin-right: 0;\n            margin-left: 0;\n            padding: 0;\n        }\n\n        .ReadMsgBody {\n            width: 100%;\n        }\n\n        .ExternalClass {\n            width: 100%;\n        }\n\n            .ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div {\n                line-height: 100%;\n            }\n\n        img {\n            -ms-interpolation-mode: bicubic;\n        }\n\n        body, table, td, p, a, li, blockquote {\n            -ms-text-size-adjust: 100%;\n            -webkit-text-size-adjust: 100%;\n        }\n    </style>\n    <style type="text/css">\n        @media only screen and (max-width: 600px) {\n            .rtable {\n                width: 100% !important;\n                table-layout: fixed;\n            }\n\n                .rtable tr {\n                    height: auto !important;\n                    display: block;\n                }\n\n            .contenttd {\n                max-width: 100% !important;\n                display: block;\n            }\n\n                .contenttd:after {\n                    content: "";\n                    display: table;\n                    clear: both;\n                }\n\n            .hiddentds {\n                display: none;\n            }\n\n            .imgtable, .imgtable table {\n                max-width: 100% !important;\n                height: auto;\n                float: none;\n                margin: 0 auto;\n            }\n\n                .imgtable.btnset td {\n                    display: inline-block;\n                }\n\n                .imgtable img {\n                    width: 100%;\n                    height: auto;\n                    display: block;\n                }\n\n            table {\n                float: none;\n                table-layout: fixed;\n            }\n        }\n    </style>\n    <!--[if gte mso 9]> \n    <xml>\n      <o:OfficeDocumentSettings>\n        <o:AllowPNG/>\n        <o:PixelsPerInch>96</o:PixelsPerInch>\n      </o:OfficeDocumentSettings>\n    </xml>\n    <![endif]-->\n</head>\n<body style="overflow: auto; padding:0; margin:0; font-size: 12px; font-family: arial, helvetica, sans-serif; cursor:auto; background-color:#f4f4f4">\n    <table cellspacing="0" cellpadding="0" width="100%"\n           bgcolor="#f4f4f4">\n        <tr>\n            <td style="FONT-SIZE: 0px; HEIGHT: 20px; LINE-HEIGHT: 0"></td>\n        </tr>\n        <tr>\n            <td valign="top">\n                <table class="rtable" style="WIDTH: 600px; MARGIN: 0px auto"\n                       cellspacing="0" cellpadding="0" width="600" align="center"\n                       border="0">\n                    <tr>\n                        <td class="contenttd"\n                            style="BORDER-TOP: medium none; BORDER-RIGHT: medium none; BORDER-BOTTOM: medium none; PADDING-BOTTOM: 0px; PADDING-TOP: 0px; PADDING-LEFT: 0px; BORDER-LEFT: medium none; PADDING-RIGHT: 0px; BACKGROUND-COLOR: transparent">\n                            <table style="WIDTH: 100%" cellspacing="0" cellpadding="0"\n                                   align="left">\n                                <tr class="hiddentds">\n                                    <td style="FONT-SIZE: 0px; HEIGHT: 0px; WIDTH: 367px; LINE-HEIGHT: 0; mso-line-height-rule: exactly"></td>\n                                    <td style="FONT-SIZE: 0px; HEIGHT: 0px; WIDTH: 233px; LINE-HEIGHT: 0; mso-line-height-rule: exactly"></td>\n                                </tr>\n                                <tr style="HEIGHT: 10px">\n                                    <th class="contenttd" style="BORDER-TOP: medium none; BORDER-RIGHT: medium none; VERTICAL-ALIGN: middle; BORDER-BOTTOM: medium none; FONT-WEIGHT: normal; PADDING-BOTTOM: 20px; TEXT-ALIGN:center !important; PADDING-TOP: 20px; PADDING-LEFT: 0px; BORDER-LEFT: medium none; PADDING-RIGHT: 15px; BACKGROUND-COLOR: transparent; text-aling:center;">\n                                        <table class="imgtable" cellspacing="0" cellpadding="0"\n                                               align=" center" border="0">\n                                            <tr>\n                                                <td style="PADDING-BOTTOM: 2px; PADDING-TOP: 2px; PADDING-LEFT: 2px; PADDING-RIGHT: 2px; text-aling:center;" align="center">\n                                                    <table cellspacing="0" cellpadding="0" border="0">\n                                                        <tr>\n                                                            <td style="BORDER-TOP: medium none; BORDER-RIGHT: medium none;  BORDER-BOTTOM: medium none; BORDER-LEFT: medium none; BACKGROUND-COLOR: transparent; text-align:center;">\n                                                                <a href="http://www.ofisim.com/crm/" target="_blank"><img style="BORDER-TOP: medium none; BORDER-RIGHT: medium none; BORDER-BOTTOM: medium none; BORDER-LEFT: medium none; DISPLAY: block" alt="" src="https://ofisimcom.azureedge.net/web/crmLogo.png?v=1" width="200" hspace="0" vspace="0" border="0" /></a>\n                                                            </td>\n                                                        </tr>\n                                                    </table>\n                                                </td>\n                                            </tr>\n                                        </table>\n                                    </th>\n                                    <th class="contenttd" style="BORDER-TOP: medium none; BORDER-RIGHT: medium none; VERTICAL-ALIGN: middle; BORDER-BOTTOM: medium none; FONT-WEIGHT: normal; PADDING-BOTTOM: 20px; TEXT-ALIGN: center; PADDING-TOP: 20px; PADDING-LEFT: 15px; BORDER-LEFT: medium none; PADDING-RIGHT: 0px; BACKGROUND-COLOR: transparent">\n                                    </th>\n                                </tr>\n                            </table>\n                        </td>\n                    </tr>\n                    <tr>\n                        <td class="contenttd" style="BORDER-TOP: #fff 5px solid; BORDER-RIGHT: medium none; BORDER-BOTTOM: medium none; PADDING-BOTTOM: 0px; PADDING-TOP: 0px; PADDING-LEFT: 0px; BORDER-LEFT: medium none; PADDING-RIGHT: 0px; BACKGROUND-COLOR: #fff;">\n                            <table style="WIDTH: 100%" cellspacing="0" cellpadding="0" align="center">\n                                <tr class="hiddentds">\n                                    <td style="FONT-SIZE: 0px; HEIGHT: 0px; WIDTH: 600px; LINE-HEIGHT: 0; mso-line-height-rule: exactly"></td>\n                                </tr>\n                                <tr style="HEIGHT: 10px">\n                                    <th class="contenttd" style="BORDER-TOP: medium none; BORDER-RIGHT: medium none; VERTICAL-ALIGN: top; BORDER-BOTTOM: medium none; FONT-WEIGHT: normal; PADDING-BOTTOM: 0px; TEXT-ALIGN: left; PADDING-TOP: 0px; PADDING-LEFT: 0px; BORDER-LEFT: medium none; PADDING-RIGHT: 0px; BACKGROUND-COLOR: transparent">\n                                        <!--[if gte mso 12]>\n                                            <table cellspacing="0" cellpadding="0" border="0" width="100%"><tr><td align="center">\n                                        <![endif]-->\n                                        <table class="imgtable" style="MARGIN: 0px auto" cellspacing="0"\n                                               cellpadding="0" align="center" border="0">\n                                            <tr>\n                                                <td style="PADDING-BOTTOM: 0px; PADDING-TOP: 0px; PADDING-LEFT: 0px; PADDING-RIGHT: 0px"\n                                                    align="center">\n                                                </td>\n                                            </tr>\n                                        </table>\n                                        <!--[if gte mso 12]>\n                                            </td></tr></table>\n                                        <![endif]-->\n                                    </th>\n                                </tr>\n                            </table>\n                        </td>\n                    </tr>\n                    \n                    <tr>\n\n                        \n\n                        <td class="contenttd" style="BORDER-RIGHT: medium none; BORDER-BOTTOM: medium none; PADDING-BOTTOM: 0px; PADDING-TOP: 0px; PADDING-LEFT: 0px; BORDER-LEFT: medium none; PADDING-RIGHT: 0px; BACKGROUND-COLOR: #fff;">\n                            <table style="WIDTH: 100%" cellspacing="0" cellpadding="0"\n                                   align="left">\n                                <tr class="hiddentds">\n                                    <td style="FONT-SIZE: 0px; HEIGHT: 0px; WIDTH: 600px; LINE-HEIGHT: 0; mso-line-height-rule: exactly"></td>\n                                </tr>\n                                <tr style="HEIGHT: 20px">\n                                    <th class="contenttd" style="BORDER-TOP: medium none; BORDER-RIGHT: medium none; VERTICAL-ALIGN: middle; BORDER-BOTTOM: medium none; FONT-WEIGHT: normal; PADDING-BOTTOM: 20px; TEXT-ALIGN: left; PADDING-TOP: 20px; PADDING-LEFT: 20px; BORDER-LEFT: medium none; PADDING-RIGHT: 20px; BACKGROUND-COLOR: #fff;">\n                                        <p style="FONT-SIZE: 22px; MARGIN-BOTTOM: 1em; FONT-FAMILY: arial, helvetica, sans-serif; MARGIN-TOP: 0px; COLOR: #333330; LINE-HEIGHT: 33px; BACKGROUND-COLOR: #fff; mso-line-height-rule: exactly"\n                                           align="center">\n                                            Merhaba {:FirstName} {:LastName},<br />\n\n                                        </p>\n                                        <p style="FONT-SIZE: 16px; MARGIN-BOTTOM: 1em; FONT-FAMILY: arial, helvetica, sans-serif; MARGIN-TOP: 0px; COLOR: #575757; LINE-HEIGHT: 24px; BACKGROUND-COLOR: transparent; mso-line-height-rule: exactly"\n                                           align="center">Aşşağıda ki linke tıklayarak e-posta adresinizi etkinleştirebilirsiniz.</p>\n\n                                        <p style="FONT-SIZE: 22px; MARGIN-BOTTOM: 1em; FONT-FAMILY: arial, helvetica, sans-serif; MARGIN-TOP: 0px; COLOR: #333330; LINE-HEIGHT: 33px; BACKGROUND-COLOR: #fff; mso-line-height-rule: exactly"\n                                           align="center">\n                                            <a style="color:#1c62e; text-decoration:underline; font-size:20px;" href="{:Url}">E-Posta mı etkinleştir</a><br />\n                                        </p>\n\n                                        <p style="FONT-SIZE: 12px;MARGIN-BOTTOM: 1em; FONT-FAMILY: arial, helvetica, sans-serif; MARGIN-TOP: 0px; COLOR: #333330; LINE-HEIGHT: 14px; BACKGROUND-COLOR: #fff; mso-line-height-rule: exactly"\n                                           align="center">\n                                            Ofisim.com\n                                        </p>\n                                    </th>\n                                </tr>\n                            </table>\n                        </td>\n                    </tr>\n                    <tr>\n                    <tr style="HEIGHT: 20px;">\n                        <th class="contenttd"\n                            style="BORDER-TOP: medium none; BORDER-RIGHT: medium none; VERTICAL-ALIGN: top; BORDER-BOTTOM: medium none; FONT-WEIGHT: normal; PADDING-BOTTOM: 20px; TEXT-ALIGN: left; PADDING-TOP: 20px; PADDING-LEFT: 15px; BORDER-LEFT: medium none; PADDING-RIGHT: 15px; BACKGROUND-COLOR: transparent">\n                            <div style="PADDING-BOTTOM: 10px; TEXT-ALIGN: center; PADDING-TOP: 10px; PADDING-LEFT: 10px; PADDING-RIGHT: 10px">\n                                <table class="imgtable" style="DISPLAY: inline-block"\n                                       cellspacing="0" cellpadding="0" border="0">\n                                    <tr>\n                                        <td style="PADDING-RIGHT: 5px">\n                                            <a href="https://www.facebook.com/ofisimcrm" target="_blank">\n                                                <img title="Facebook"\n                                                     style="BORDER-TOP: medium none; BORDER-RIGHT: medium none; BORDER-BOTTOM: medium none; BORDER-LEFT: medium none; DISPLAY: block"\n                                                     alt="Facebook" src="http://www.ofisim.com/mail/KobiMail_files/fb.png" width="34"\n                                                     height="34" />\n                                            </a>\n                                        </td>\n                                        <td style="PADDING-RIGHT: 5px">\n                                            <a href="https://twitter.com/ofisim_com" target="_blank">\n                                                <img title="Twitter"\n                                                     style="BORDER-TOP: medium none; BORDER-RIGHT: medium none; BORDER-BOTTOM: medium none; BORDER-LEFT: medium none; DISPLAY: block"\n                                                     alt="Twitter" src="http://www.ofisim.com/mail/KobiMail_files/tw.png" width="34"\n                                                     height="34" />\n                                            </a>\n                                        </td>\n                                        <td style="PADDING-RIGHT: 5px">\n                                            <a href="https://www.linkedin.com/company/ofisim.com"\n                                               target="_blank">\n                                                <img title="Linkedin"\n                                                     style="BORDER-TOP: medium none; BORDER-RIGHT: medium none; BORDER-BOTTOM: medium none; BORDER-LEFT: medium none; DISPLAY: block"\n                                                     alt="Linkedin" src="http://www.ofisim.com/mail/KobiMail_files/in.png" width="34"\n                                                     height="34" />\n                                            </a>\n                                        </td>\n                                    </tr>\n                                </table>\n                            </div>\n                            <p style="FONT-SIZE: 14px; MARGIN-BOTTOM: 1em; FONT-FAMILY: arial, helvetica, sans-serif; MARGIN-TOP: 0px; COLOR: #575757; LINE-HEIGHT: 21px; BACKGROUND-COLOR: transparent; mso-line-height-rule: exactly"\n                               align="left">&nbsp;</p>\n                        </th>\n                    </tr>\n                </table>\n            </td>\n        </tr>\n        <tr>\n            <td class="contenttd"\n                style="BORDER-TOP: medium none; BORDER-RIGHT: medium none; BORDER-BOTTOM: medium none; PADDING-BOTTOM: 10px; PADDING-TOP: 10px; PADDING-LEFT: 0px; BORDER-LEFT: medium none; PADDING-RIGHT: 0px; BACKGROUND-COLOR: transparent">\n                <table style="WIDTH: 100%" cellspacing="0" cellpadding="0"\n                       align="left">\n                    <tr class="hiddentds">\n                        <td style="FONT-SIZE: 0px; HEIGHT: 0px; WIDTH: 600px; LINE-HEIGHT: 0; mso-line-height-rule: exactly"></td>\n                    </tr>\n                    <tr style="HEIGHT: 10px">\n                        <th class="contenttd"\n                            style="BORDER-TOP: medium none; BORDER-RIGHT: medium none; VERTICAL-ALIGN: top; BORDER-BOTTOM: medium none; FONT-WEIGHT: normal; PADDING-BOTTOM: 0px; TEXT-ALIGN: left; PADDING-TOP: 0px; PADDING-LEFT: 0px; BORDER-LEFT: medium none; PADDING-RIGHT: 0px; BACKGROUND-COLOR: transparent">\n                        </th>\n                    </tr>\n                </table>\n            </td>\n        </tr>\n        <tr>\n            <td class="contenttd"\n                style="BORDER-TOP: medium none; BORDER-RIGHT: medium none; BORDER-BOTTOM: medium none; PADDING-BOTTOM: 1px; PADDING-TOP: 1px; PADDING-LEFT: 0px; BORDER-LEFT: medium none; PADDING-RIGHT: 0px; BACKGROUND-COLOR: transparent">\n                <table style="WIDTH: 100%" cellspacing="0" cellpadding="0"\n                       align="left">\n                    <tr class="hiddentds">\n                        <td style="FONT-SIZE: 0px; HEIGHT: 0px; WIDTH: 600px; LINE-HEIGHT: 0; mso-line-height-rule: exactly"></td>\n                    </tr>\n                    <tr style="HEIGHT: 10px">\n                        <th class="contenttd"\n                            style="BORDER-TOP: medium none; BORDER-RIGHT: medium none; VERTICAL-ALIGN: top; BORDER-BOTTOM: medium none; FONT-WEIGHT: normal; PADDING-BOTTOM: 1px; TEXT-ALIGN: left; PADDING-TOP: 1px; PADDING-LEFT: 15px; BORDER-LEFT: medium none; PADDING-RIGHT: 15px; BACKGROUND-COLOR: transparent">\n                        </th>\n                    </tr>\n                </table>\n            </td>\n        </tr>\n        <tr>\n            <td style="FONT-SIZE: 0px; HEIGHT: 8px; LINE-HEIGHT: 0">&nbsp;</td>\n        </tr>\n    </table>\n \n    <!-- Created with MailStyler 2.0.0.330 -->\n</body>\n</html>\n	en	1	email_confirm	t	{"MailSenderName": "Gaboras", "MailSenderEmail": "app@gaboras.com.tr"}
\.


--
-- Name: app_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.app_templates_id_seq', 24, true);


--
-- Data for Name: apps; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.apps (id, created_by, updated_by, created_at, updated_at, deleted, name, label, description, logo, use_tenant_settings, app_draft_id, secret) FROM stdin;
100	1	\N	2019-01-07 17:27:11.541459	\N	f	sample	Sample	Sample	\N	f	0	zVH3WU1oq2XxYmlUIFfcmZjNnRZVetndGmNKE1qBUEF86A7FNz6oTBxM0cy2/sA6tO0T0QEem44HtoL85uLz5A==
\.


--
-- Name: apps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.apps_id_seq', 9, true);


--
-- Data for Name: exchange_rates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.exchange_rates (id, usd, eur, date, year, month, day) FROM stdin;
\.


--
-- Name: exchange_rates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.exchange_rates_id_seq', 9, false);


--
-- Data for Name: tenant_licenses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tenant_licenses (tenant_id, user_license_count, module_license_count, analytics_license_count, sip_license_count, is_paid_customer, is_deactivated, is_suspended, deactivated_at, suspended_at) FROM stdin;
1	9999	9999	9999	9999	t	f	f	\N	\N
\.


--
-- Data for Name: tenant_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tenant_settings (tenant_id, currency, culture, time_zone, language, logo, mail_sender_name, mail_sender_email, custom_domain, custom_title, custom_description, custom_favicon, custom_color, custom_image, has_sample_data) FROM stdin;
1	\N	en-US	\N	en	\N	\N	\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- Data for Name: tenants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tenants (id, created_by, updated_by, created_at, updated_at, deleted, app_id, guid_id, title, owner_id, use_user_settings) FROM stdin;
1	1	\N	2019-01-07 18:45:44.071752	\N	f	100	00000000-0000-0000-0000-000000000000	Master Tenant	1	t
\.


--
-- Name: tenants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tenants_id_seq', 1, true);


--
-- Data for Name: user_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_settings (user_id, phone, culture, currency, time_zone, language) FROM stdin;
1	\N	en-US	en	\N	en
\.


--
-- Data for Name: user_tenants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_tenants (user_id, tenant_id) FROM stdin;
1	1
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, first_name, last_name, created_at, updated_at, is_integration_user, profile_picture, integration_user_client_id) FROM stdin;
1	app@primeapps.io	Master	User	2019-01-07 17:25:26.688474	\N	f	\N	\N
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 10, true);


--
-- Data for Name: warehouses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.warehouses (id, created_by, updated_by, created_at, updated_at, deleted, tenant_id, database_name, database_user, powerbi_workspace_id, completed) FROM stdin;
\.


--
-- Name: warehouses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.warehouses_id_seq', 9, false);


--
-- Name: _migration_history PK__migration_history; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._migration_history
    ADD CONSTRAINT "PK__migration_history" PRIMARY KEY (migration_id);


--
-- Name: app_settings PK_app_settings; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_settings
    ADD CONSTRAINT "PK_app_settings" PRIMARY KEY (app_id);


--
-- Name: app_templates PK_app_templates; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_templates
    ADD CONSTRAINT "PK_app_templates" PRIMARY KEY (id);


--
-- Name: apps PK_apps; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.apps
    ADD CONSTRAINT "PK_apps" PRIMARY KEY (id);


--
-- Name: exchange_rates PK_exchange_rates; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exchange_rates
    ADD CONSTRAINT "PK_exchange_rates" PRIMARY KEY (id);


--
-- Name: tenant_licenses PK_tenant_licenses; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenant_licenses
    ADD CONSTRAINT "PK_tenant_licenses" PRIMARY KEY (tenant_id);


--
-- Name: tenant_settings PK_tenant_settings; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenant_settings
    ADD CONSTRAINT "PK_tenant_settings" PRIMARY KEY (tenant_id);


--
-- Name: tenants PK_tenants; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT "PK_tenants" PRIMARY KEY (id);


--
-- Name: user_settings PK_user_settings; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_settings
    ADD CONSTRAINT "PK_user_settings" PRIMARY KEY (user_id);


--
-- Name: user_tenants PK_user_tenants; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_tenants
    ADD CONSTRAINT "PK_user_tenants" PRIMARY KEY (user_id, tenant_id);


--
-- Name: users PK_users; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "PK_users" PRIMARY KEY (id);


--
-- Name: warehouses PK_warehouses; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.warehouses
    ADD CONSTRAINT "PK_warehouses" PRIMARY KEY (id);


--
-- Name: IX_app_templates_active; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_app_templates_active" ON public.app_templates USING btree (active);


--
-- Name: IX_app_templates_app_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_app_templates_app_id" ON public.app_templates USING btree (app_id);


--
-- Name: IX_app_templates_created_by; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_app_templates_created_by" ON public.app_templates USING btree (created_by);


--
-- Name: IX_app_templates_language; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_app_templates_language" ON public.app_templates USING btree (language);


--
-- Name: IX_app_templates_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_app_templates_name" ON public.app_templates USING btree (name);


--
-- Name: IX_app_templates_system_code; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_app_templates_system_code" ON public.app_templates USING btree (system_code);


--
-- Name: IX_app_templates_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_app_templates_type" ON public.app_templates USING btree (type);


--
-- Name: IX_app_templates_updated_by; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_app_templates_updated_by" ON public.app_templates USING btree (updated_by);


--
-- Name: IX_apps_app_draft_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_apps_app_draft_id" ON public.apps USING btree (app_draft_id);


--
-- Name: IX_apps_created_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_apps_created_at" ON public.apps USING btree (created_at);


--
-- Name: IX_apps_created_by; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_apps_created_by" ON public.apps USING btree (created_by);


--
-- Name: IX_apps_deleted; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_apps_deleted" ON public.apps USING btree (deleted);


--
-- Name: IX_apps_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IX_apps_name" ON public.apps USING btree (name);


--
-- Name: IX_apps_updated_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_apps_updated_at" ON public.apps USING btree (updated_at);


--
-- Name: IX_apps_updated_by; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_apps_updated_by" ON public.apps USING btree (updated_by);


--
-- Name: IX_exchange_rates_date; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_exchange_rates_date" ON public.exchange_rates USING btree (date);


--
-- Name: IX_exchange_rates_day; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_exchange_rates_day" ON public.exchange_rates USING btree (day);


--
-- Name: IX_exchange_rates_month; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_exchange_rates_month" ON public.exchange_rates USING btree (month);


--
-- Name: IX_exchange_rates_year; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_exchange_rates_year" ON public.exchange_rates USING btree (year);


--
-- Name: IX_tenant_licenses_deactivated_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_tenant_licenses_deactivated_at" ON public.tenant_licenses USING btree (deactivated_at);


--
-- Name: IX_tenant_licenses_is_deactivated; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_tenant_licenses_is_deactivated" ON public.tenant_licenses USING btree (is_deactivated);


--
-- Name: IX_tenant_licenses_is_paid_customer; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_tenant_licenses_is_paid_customer" ON public.tenant_licenses USING btree (is_paid_customer);


--
-- Name: IX_tenant_licenses_is_suspended; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_tenant_licenses_is_suspended" ON public.tenant_licenses USING btree (is_suspended);


--
-- Name: IX_tenant_licenses_suspended_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_tenant_licenses_suspended_at" ON public.tenant_licenses USING btree (suspended_at);


--
-- Name: IX_tenant_settings_custom_domain; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_tenant_settings_custom_domain" ON public.tenant_settings USING btree (custom_domain);


--
-- Name: IX_tenants_app_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_tenants_app_id" ON public.tenants USING btree (app_id);


--
-- Name: IX_tenants_created_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_tenants_created_at" ON public.tenants USING btree (created_at);


--
-- Name: IX_tenants_created_by; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_tenants_created_by" ON public.tenants USING btree (created_by);


--
-- Name: IX_tenants_deleted; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_tenants_deleted" ON public.tenants USING btree (deleted);


--
-- Name: IX_tenants_guid_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_tenants_guid_id" ON public.tenants USING btree (guid_id);


--
-- Name: IX_tenants_owner_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_tenants_owner_id" ON public.tenants USING btree (owner_id);


--
-- Name: IX_tenants_updated_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_tenants_updated_at" ON public.tenants USING btree (updated_at);


--
-- Name: IX_tenants_updated_by; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_tenants_updated_by" ON public.tenants USING btree (updated_by);


--
-- Name: IX_user_settings_culture; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_user_settings_culture" ON public.user_settings USING btree (culture);


--
-- Name: IX_user_settings_currency; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_user_settings_currency" ON public.user_settings USING btree (currency);


--
-- Name: IX_user_settings_language; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_user_settings_language" ON public.user_settings USING btree (language);


--
-- Name: IX_user_settings_phone; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_user_settings_phone" ON public.user_settings USING btree (phone);


--
-- Name: IX_user_settings_time_zone; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_user_settings_time_zone" ON public.user_settings USING btree (time_zone);


--
-- Name: IX_user_tenants_tenant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_user_tenants_tenant_id" ON public.user_tenants USING btree (tenant_id);


--
-- Name: IX_user_tenants_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_user_tenants_user_id" ON public.user_tenants USING btree (user_id);


--
-- Name: IX_users_created_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_users_created_at" ON public.users USING btree (created_at);


--
-- Name: IX_users_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_users_email" ON public.users USING btree (email);


--
-- Name: IX_users_first_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_users_first_name" ON public.users USING btree (first_name);


--
-- Name: IX_users_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_users_id" ON public.users USING btree (id);


--
-- Name: IX_users_last_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_users_last_name" ON public.users USING btree (last_name);


--
-- Name: IX_users_updated_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_users_updated_at" ON public.users USING btree (updated_at);


--
-- Name: IX_warehouses_completed; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_warehouses_completed" ON public.warehouses USING btree (completed);


--
-- Name: IX_warehouses_created_by; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_warehouses_created_by" ON public.warehouses USING btree (created_by);


--
-- Name: IX_warehouses_database_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_warehouses_database_name" ON public.warehouses USING btree (database_name);


--
-- Name: IX_warehouses_tenant_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_warehouses_tenant_id" ON public.warehouses USING btree (tenant_id);


--
-- Name: IX_warehouses_updated_by; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_warehouses_updated_by" ON public.warehouses USING btree (updated_by);


--
-- Name: app_settings FK_app_settings_apps_app_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_settings
    ADD CONSTRAINT "FK_app_settings_apps_app_id" FOREIGN KEY (app_id) REFERENCES public.apps(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: app_templates FK_app_templates_apps_app_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_templates
    ADD CONSTRAINT "FK_app_templates_apps_app_id" FOREIGN KEY (app_id) REFERENCES public.apps(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: app_templates FK_app_templates_users_created_by; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_templates
    ADD CONSTRAINT "FK_app_templates_users_created_by" FOREIGN KEY (created_by) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: app_templates FK_app_templates_users_updated_by; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_templates
    ADD CONSTRAINT "FK_app_templates_users_updated_by" FOREIGN KEY (updated_by) REFERENCES public.users(id) ON DELETE RESTRICT;


--
-- Name: apps FK_apps_users_created_by; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.apps
    ADD CONSTRAINT "FK_apps_users_created_by" FOREIGN KEY (created_by) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: apps FK_apps_users_updated_by; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.apps
    ADD CONSTRAINT "FK_apps_users_updated_by" FOREIGN KEY (updated_by) REFERENCES public.users(id) ON DELETE RESTRICT;


--
-- Name: tenant_licenses FK_tenant_licenses_tenants_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenant_licenses
    ADD CONSTRAINT "FK_tenant_licenses_tenants_tenant_id" FOREIGN KEY (tenant_id) REFERENCES public.tenants(id) ON DELETE CASCADE;


--
-- Name: tenant_settings FK_tenant_settings_tenants_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenant_settings
    ADD CONSTRAINT "FK_tenant_settings_tenants_tenant_id" FOREIGN KEY (tenant_id) REFERENCES public.tenants(id) ON DELETE CASCADE;


--
-- Name: tenants FK_tenants_apps_app_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT "FK_tenants_apps_app_id" FOREIGN KEY (app_id) REFERENCES public.apps(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: tenants FK_tenants_users_created_by; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT "FK_tenants_users_created_by" FOREIGN KEY (created_by) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: tenants FK_tenants_users_owner_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT "FK_tenants_users_owner_id" FOREIGN KEY (owner_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: tenants FK_tenants_users_updated_by; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT "FK_tenants_users_updated_by" FOREIGN KEY (updated_by) REFERENCES public.users(id) ON DELETE RESTRICT;


--
-- Name: user_settings FK_user_settings_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_settings
    ADD CONSTRAINT "FK_user_settings_users_user_id" FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: user_tenants FK_user_tenants_tenants_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_tenants
    ADD CONSTRAINT "FK_user_tenants_tenants_tenant_id" FOREIGN KEY (tenant_id) REFERENCES public.tenants(id) ON DELETE CASCADE;


--
-- Name: user_tenants FK_user_tenants_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_tenants
    ADD CONSTRAINT "FK_user_tenants_users_user_id" FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: warehouses FK_warehouses_tenants_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.warehouses
    ADD CONSTRAINT "FK_warehouses_tenants_tenant_id" FOREIGN KEY (tenant_id) REFERENCES public.tenants(id) ON DELETE CASCADE;


--
-- Name: warehouses FK_warehouses_users_created_by; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.warehouses
    ADD CONSTRAINT "FK_warehouses_users_created_by" FOREIGN KEY (created_by) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: warehouses FK_warehouses_users_updated_by; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.warehouses
    ADD CONSTRAINT "FK_warehouses_users_updated_by" FOREIGN KEY (updated_by) REFERENCES public.users(id) ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

