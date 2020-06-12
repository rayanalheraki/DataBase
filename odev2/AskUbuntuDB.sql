--
-- PostgreSQL database dump
--

-- Dumped from database version 12.0
-- Dumped by pg_dump version 12rc1

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
-- Name: AnaSema; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA "AnaSema";


ALTER SCHEMA "AnaSema" OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: BadgeTipi; Type: TABLE; Schema: AnaSema; Owner: postgres
--

CREATE TABLE "AnaSema"."BadgeTipi" (
    "badgeTipiID" integer NOT NULL,
    "tipAdi" character varying NOT NULL
);


ALTER TABLE "AnaSema"."BadgeTipi" OWNER TO postgres;

--
-- Name: Badges; Type: TABLE; Schema: AnaSema; Owner: postgres
--

CREATE TABLE "AnaSema"."Badges" (
    "badgeID" integer NOT NULL,
    "badgeAdi" character varying NOT NULL,
    "badgeTipiID" integer NOT NULL
);


ALTER TABLE "AnaSema"."Badges" OWNER TO postgres;

--
-- Name: BadgesKullanci; Type: TABLE; Schema: AnaSema; Owner: postgres
--

CREATE TABLE "AnaSema"."BadgesKullanci" (
    "badgeID" integer NOT NULL,
    "KullaniciID" integer NOT NULL
);


ALTER TABLE "AnaSema"."BadgesKullanci" OWNER TO postgres;

--
-- Name: Cevap; Type: TABLE; Schema: AnaSema; Owner: postgres
--

CREATE TABLE "AnaSema"."Cevap" (
    "cevapID" integer NOT NULL,
    "cevabMetni" character varying NOT NULL,
    "CevabTarihi" date NOT NULL,
    "CevapOySunucu" integer DEFAULT 0,
    "cpDuzenlemeTarihi" date,
    "KullaniciID" integer NOT NULL,
    "SoruID" integer NOT NULL
);


ALTER TABLE "AnaSema"."Cevap" OWNER TO postgres;

--
-- Name: Favori; Type: TABLE; Schema: AnaSema; Owner: postgres
--

CREATE TABLE "AnaSema"."Favori" (
    "favoriID" integer NOT NULL,
    "SoruID" integer,
    "KullaniciID" integer
);


ALTER TABLE "AnaSema"."Favori" OWNER TO postgres;

--
-- Name: Inbox; Type: TABLE; Schema: AnaSema; Owner: postgres
--

CREATE TABLE "AnaSema"."Inbox" (
    "bildirimID" integer NOT NULL,
    "bildirimTarihi" date NOT NULL,
    "bildirimMetni" character varying NOT NULL,
    "soruID" integer,
    "bildirimTipiID" integer NOT NULL,
    "KullainciID" integer
);


ALTER TABLE "AnaSema"."Inbox" OWNER TO postgres;

--
-- Name: Kullanici; Type: TABLE; Schema: AnaSema; Owner: postgres
--

CREATE TABLE "AnaSema"."Kullanici" (
    "KullaniciID" integer NOT NULL,
    "kullaniciAdi" character varying(50) NOT NULL,
    "adSoyad" character varying NOT NULL,
    "dogumTarihi" date NOT NULL,
    "olusturmaTarihi" date NOT NULL
);


ALTER TABLE "AnaSema"."Kullanici" OWNER TO postgres;

--
-- Name: Oyler; Type: TABLE; Schema: AnaSema; Owner: postgres
--

CREATE TABLE "AnaSema"."Oyler" (
    "oyID" integer NOT NULL,
    "oyTarihi" date NOT NULL,
    "KullaniciID" integer NOT NULL,
    "oyTuruID" integer
);


ALTER TABLE "AnaSema"."Oyler" OWNER TO postgres;

--
-- Name: Oyler_oyID_seq; Type: SEQUENCE; Schema: AnaSema; Owner: postgres
--

CREATE SEQUENCE "AnaSema"."Oyler_oyID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "AnaSema"."Oyler_oyID_seq" OWNER TO postgres;

--
-- Name: Oyler_oyID_seq; Type: SEQUENCE OWNED BY; Schema: AnaSema; Owner: postgres
--

ALTER SEQUENCE "AnaSema"."Oyler_oyID_seq" OWNED BY "AnaSema"."Oyler"."oyID";


--
-- Name: Resim; Type: TABLE; Schema: AnaSema; Owner: postgres
--

CREATE TABLE "AnaSema"."Resim" (
    "resimID" integer NOT NULL,
    konum character varying NOT NULL,
    "KullaniciID" integer NOT NULL
);


ALTER TABLE "AnaSema"."Resim" OWNER TO postgres;

--
-- Name: Soru; Type: TABLE; Schema: AnaSema; Owner: postgres
--

CREATE TABLE "AnaSema"."Soru" (
    "SoruID" integer NOT NULL,
    baslik character varying(150),
    metni character varying NOT NULL,
    "soruTarihi" date NOT NULL,
    "CevapSayisi" integer DEFAULT 0,
    "soruOysunucu" integer DEFAULT 0,
    "viewsSayaci" integer DEFAULT 0,
    "duznlemeTarihi" date,
    "KullaniciID" integer NOT NULL
);


ALTER TABLE "AnaSema"."Soru" OWNER TO postgres;

--
-- Name: SoruTag; Type: TABLE; Schema: AnaSema; Owner: postgres
--

CREATE TABLE "AnaSema"."SoruTag" (
    "tagID" integer NOT NULL,
    "SoruID" integer NOT NULL
);


ALTER TABLE "AnaSema"."SoruTag" OWNER TO postgres;

--
-- Name: Tag; Type: TABLE; Schema: AnaSema; Owner: postgres
--

CREATE TABLE "AnaSema"."Tag" (
    "tagID" integer NOT NULL,
    "tagAdi" character varying NOT NULL,
    "tagTarihi" date NOT NULL,
    "soruSayisi" integer DEFAULT 0
);


ALTER TABLE "AnaSema"."Tag" OWNER TO postgres;

--
-- Name: bildirimTipi; Type: TABLE; Schema: AnaSema; Owner: postgres
--

CREATE TABLE "AnaSema"."bildirimTipi" (
    "bildirimTipiID" integer NOT NULL,
    "tipAdi" character varying NOT NULL
);


ALTER TABLE "AnaSema"."bildirimTipi" OWNER TO postgres;

--
-- Name: cevapOY; Type: TABLE; Schema: AnaSema; Owner: postgres
--

CREATE TABLE "AnaSema"."cevapOY" (
    "oyID" integer NOT NULL,
    "cevapID" integer
);


ALTER TABLE "AnaSema"."cevapOY" OWNER TO postgres;

--
-- Name: iletisimBIlgileri; Type: TABLE; Schema: AnaSema; Owner: postgres
--

CREATE TABLE "AnaSema"."iletisimBIlgileri" (
    "ID" integer NOT NULL,
    "Email" character varying NOT NULL,
    "Ulke" character varying NOT NULL,
    "Adres" character varying,
    "telNo" character varying NOT NULL,
    "githubLinki" character varying,
    "twitterLinki" character varying,
    "WebsiteLinki" character varying,
    "KullaniciID" integer NOT NULL,
    "olusturmaTarihi" date NOT NULL
);


ALTER TABLE "AnaSema"."iletisimBIlgileri" OWNER TO postgres;

--
-- Name: oyTuru; Type: TABLE; Schema: AnaSema; Owner: postgres
--

CREATE TABLE "AnaSema"."oyTuru" (
    "oyTuruID" integer NOT NULL,
    "Turu" character varying
);


ALTER TABLE "AnaSema"."oyTuru" OWNER TO postgres;

--
-- Name: soruOY; Type: TABLE; Schema: AnaSema; Owner: postgres
--

CREATE TABLE "AnaSema"."soruOY" (
    "oyID" integer NOT NULL,
    "SoruID" integer
);


ALTER TABLE "AnaSema"."soruOY" OWNER TO postgres;

--
-- Name: Oyler oyID; Type: DEFAULT; Schema: AnaSema; Owner: postgres
--

ALTER TABLE ONLY "AnaSema"."Oyler" ALTER COLUMN "oyID" SET DEFAULT nextval('"AnaSema"."Oyler_oyID_seq"'::regclass);


--
-- Data for Name: BadgeTipi; Type: TABLE DATA; Schema: AnaSema; Owner: postgres
--

INSERT INTO "AnaSema"."BadgeTipi" VALUES (3, 'BRONZE');
INSERT INTO "AnaSema"."BadgeTipi" VALUES (2, 'SILVER');
INSERT INTO "AnaSema"."BadgeTipi" VALUES (1, 'GOLD');


--
-- Data for Name: Badges; Type: TABLE DATA; Schema: AnaSema; Owner: postgres
--

INSERT INTO "AnaSema"."Badges" VALUES (1, 'Socratic', 1);
INSERT INTO "AnaSema"."Badges" VALUES (2, 'Altruist', 3);
INSERT INTO "AnaSema"."Badges" VALUES (3, 'Inquisitive', 2);
INSERT INTO "AnaSema"."Badges" VALUES (4, 'Illuminator', 1);
INSERT INTO "AnaSema"."Badges" VALUES (5, 'Promoter', 3);
INSERT INTO "AnaSema"."Badges" VALUES (6, 'Notable Question', 2);


--
-- Data for Name: BadgesKullanci; Type: TABLE DATA; Schema: AnaSema; Owner: postgres
--

INSERT INTO "AnaSema"."BadgesKullanci" VALUES (1, 1);
INSERT INTO "AnaSema"."BadgesKullanci" VALUES (2, 1);
INSERT INTO "AnaSema"."BadgesKullanci" VALUES (2, 3);
INSERT INTO "AnaSema"."BadgesKullanci" VALUES (2, 2);
INSERT INTO "AnaSema"."BadgesKullanci" VALUES (1, 3);
INSERT INTO "AnaSema"."BadgesKullanci" VALUES (4, 1);
INSERT INTO "AnaSema"."BadgesKullanci" VALUES (5, 3);
INSERT INTO "AnaSema"."BadgesKullanci" VALUES (5, 2);


--
-- Data for Name: Cevap; Type: TABLE DATA; Schema: AnaSema; Owner: postgres
--

INSERT INTO "AnaSema"."Cevap" VALUES (1, 'Gnome Shell, which is used by Ubuntu, has the feature that launched applications are opened in the background. While this may be desirable in some workflows, many users will consider this an annoyance. A gnome Shell extension, appropriately named "No Annoyance", changes this behavior, and makes sure a launched application is immediately raised.

Install the extension with the command sudo apt install gnome-shell-extension-no-annoyance, or using Synaptic Manager (not installed by default) or even using "Software". To enable the extension after installation, you can use "Gnome Tweaks" (not installed by default).', '2019-11-29', 3, NULL, 2, 4);
INSERT INTO "AnaSema"."Cevap" VALUES (2, 'Don''t do crontab manipulation.

Run scripts at both the master and the slave. On the slave, start each script with:', '2019-11-15', 1, NULL, 1, 5);
INSERT INTO "AnaSema"."Cevap" VALUES (3, 'I would prefer to have the same script running on both machines to reduce maintenance. Assuming the /etc/hosts file on the master contained the name "master" both machines could have the same script like this:', '2019-11-15', 0, '2019-11-16', 3, 5);


--
-- Data for Name: Favori; Type: TABLE DATA; Schema: AnaSema; Owner: postgres
--

INSERT INTO "AnaSema"."Favori" VALUES (1, 2, 1);
INSERT INTO "AnaSema"."Favori" VALUES (2, 1, 2);
INSERT INTO "AnaSema"."Favori" VALUES (3, 3, 1);
INSERT INTO "AnaSema"."Favori" VALUES (4, 1, 3);


--
-- Data for Name: Inbox; Type: TABLE DATA; Schema: AnaSema; Owner: postgres
--

INSERT INTO "AnaSema"."Inbox" VALUES (1, '2019-02-20', 'Welcome to Stack Overflow', NULL, 1, 1);
INSERT INTO "AnaSema"."Inbox" VALUES (2, '2019-11-15', 'You have a comment in your question', 1, 2, 3);
INSERT INTO "AnaSema"."Inbox" VALUES (3, '2019-10-14', 'You have a comment in your question', 5, 2, 2);


--
-- Data for Name: Kullanici; Type: TABLE DATA; Schema: AnaSema; Owner: postgres
--

INSERT INTO "AnaSema"."Kullanici" VALUES (1, 'Ahmet20', 'Ahmet Deniz', '1995-01-01', '2019-02-20');
INSERT INTO "AnaSema"."Kullanici" VALUES (2, 'Ali18', 'Ali Mustafa', '2000-01-01', '2015-03-25');
INSERT INTO "AnaSema"."Kullanici" VALUES (3, 'sametHL', 'Samet Halil', '1990-04-25', '2018-10-14');
INSERT INTO "AnaSema"."Kullanici" VALUES (4, 'sami1999', 'Sami', '1999-09-06', '2016-03-25');
INSERT INTO "AnaSema"."Kullanici" VALUES (5, 'omer11', 'Omar Sari', '1989-08-01', '2019-12-04');


--
-- Data for Name: Oyler; Type: TABLE DATA; Schema: AnaSema; Owner: postgres
--

INSERT INTO "AnaSema"."Oyler" VALUES (1, '2016-01-01', 1, 1);
INSERT INTO "AnaSema"."Oyler" VALUES (2, '2017-01-01', 2, 1);
INSERT INTO "AnaSema"."Oyler" VALUES (3, '2018-01-01', 3, 1);
INSERT INTO "AnaSema"."Oyler" VALUES (7, '2018-09-01', 2, 1);
INSERT INTO "AnaSema"."Oyler" VALUES (4, '2018-01-01', 3, 2);
INSERT INTO "AnaSema"."Oyler" VALUES (5, '2018-01-15', 4, 2);
INSERT INTO "AnaSema"."Oyler" VALUES (6, '2015-05-06', 5, 2);


--
-- Data for Name: Resim; Type: TABLE DATA; Schema: AnaSema; Owner: postgres
--

INSERT INTO "AnaSema"."Resim" VALUES (1, 'link1', 1);
INSERT INTO "AnaSema"."Resim" VALUES (2, 'link2', 2);
INSERT INTO "AnaSema"."Resim" VALUES (3, 'link3', 3);


--
-- Data for Name: Soru; Type: TABLE DATA; Schema: AnaSema; Owner: postgres
--

INSERT INTO "AnaSema"."Soru" VALUES (1, 'Touchscreen works in “Try Ubuntu MATE” but not in installed version', 'I am running Ubuntu 18.04 on a Lenovo Yoga 12 and the touchscreen works like a charm in the install media. However, when I install Ubuntu MATE 18.04 the touchscreen doesn''t register any events.
xinput device output:
xinput list-props 14 Device ''Wacom Pen and multitouch sensor Finger touch''', '2019-11-29', 0, 0, 0, NULL, 3);
INSERT INTO "AnaSema"."Soru" VALUES (2, 'Display issues(Snow) waking from suspend Ubuntu 19.10', 'I just installed 19.10 on my Dell Latitude-E6510. I used the typical file system, not the new one. Everything seems okay except when I close the lid and open later the entire screen is filled with snow. The cursor moves and the snow changes during any activity but i cannot see anything legible. I have to power down via button to use again. I have tried the proprietary Nvidia binary driver and get the same result. Any help would be appreciated', '2019-11-22', 0, 0, 6, NULL, 2);
INSERT INTO "AnaSema"."Soru" VALUES (4, 'How to prevent an application from starting behind the application in focus?
', 'I''m doing automated testing with Sikuli and it''s important that the stuff being tested is visible on the screen. Lately, the apps/windows keep opening in the background, behind whatever is currently in focus, with the notification "[application] is ready". How do I tell Ubuntu to stop doing this?', '2019-11-27', 1, 0, 20, NULL, 1);
INSERT INTO "AnaSema"."Soru" VALUES (5, 'Check the status of server 1, if it is not available then run the scripts?
', 'I have 2 servers: 1 master with 1 slave and have a script which is running every 1 minute on the slave to check the availability of the master.

It should run always:', '2019-11-15', 2, 0, 34, NULL, 2);
INSERT INTO "AnaSema"."Soru" VALUES (3, 'How do I enable automatic updates?', 'Update Manager is constantly offering me updates (e.g. security fixes, updates from PPAs).

How can I tell my Ubuntu installation to automatically download and install updates whenever they become available?', '2010-07-02', 0, 2, 45, '2010-07-10', 3);


--
-- Data for Name: SoruTag; Type: TABLE DATA; Schema: AnaSema; Owner: postgres
--

INSERT INTO "AnaSema"."SoruTag" VALUES (1, 1);
INSERT INTO "AnaSema"."SoruTag" VALUES (2, 1);
INSERT INTO "AnaSema"."SoruTag" VALUES (3, 2);
INSERT INTO "AnaSema"."SoruTag" VALUES (2, 2);
INSERT INTO "AnaSema"."SoruTag" VALUES (1, 3);
INSERT INTO "AnaSema"."SoruTag" VALUES (1, 4);
INSERT INTO "AnaSema"."SoruTag" VALUES (2, 4);
INSERT INTO "AnaSema"."SoruTag" VALUES (2, 5);
INSERT INTO "AnaSema"."SoruTag" VALUES (3, 5);
INSERT INTO "AnaSema"."SoruTag" VALUES (3, 3);


--
-- Data for Name: Tag; Type: TABLE DATA; Schema: AnaSema; Owner: postgres
--

INSERT INTO "AnaSema"."Tag" VALUES (1, 'command-line', '2013-05-19', 2);
INSERT INTO "AnaSema"."Tag" VALUES (2, 'partitions', '2014-10-10', 1);
INSERT INTO "AnaSema"."Tag" VALUES (3, 'bash', '2015-06-09', 3);


--
-- Data for Name: bildirimTipi; Type: TABLE DATA; Schema: AnaSema; Owner: postgres
--

INSERT INTO "AnaSema"."bildirimTipi" VALUES (1, 'message');
INSERT INTO "AnaSema"."bildirimTipi" VALUES (2, 'comment');


--
-- Data for Name: cevapOY; Type: TABLE DATA; Schema: AnaSema; Owner: postgres
--

INSERT INTO "AnaSema"."cevapOY" VALUES (4, 1);
INSERT INTO "AnaSema"."cevapOY" VALUES (5, 1);
INSERT INTO "AnaSema"."cevapOY" VALUES (6, 1);
INSERT INTO "AnaSema"."cevapOY" VALUES (7, 2);


--
-- Data for Name: iletisimBIlgileri; Type: TABLE DATA; Schema: AnaSema; Owner: postgres
--

INSERT INTO "AnaSema"."iletisimBIlgileri" VALUES (3, 'email3@gmail.com', 'Almanya', 'Berlin ', '0000012', 'https://github.com/celalceken/DatabaseManagementSystems', NULL, NULL, 3, '2018-10-14');
INSERT INTO "AnaSema"."iletisimBIlgileri" VALUES (2, 'email2@gmail.com', 'Turkey', 'Ankara', '0531111', NULL, 'https://twitter.com/home', NULL, 2, '2015-03-25');
INSERT INTO "AnaSema"."iletisimBIlgileri" VALUES (1, 'email1@gmail.com', 'Fas', 'dar albayda', '0000011', NULL, NULL, 'http://www.sakarya.edu.tr/', 1, '2019-02-20');


--
-- Data for Name: oyTuru; Type: TABLE DATA; Schema: AnaSema; Owner: postgres
--

INSERT INTO "AnaSema"."oyTuru" VALUES (1, 'Soru Oyu');
INSERT INTO "AnaSema"."oyTuru" VALUES (2, 'Cevap Oyu');


--
-- Data for Name: soruOY; Type: TABLE DATA; Schema: AnaSema; Owner: postgres
--

INSERT INTO "AnaSema"."soruOY" VALUES (1, 1);
INSERT INTO "AnaSema"."soruOY" VALUES (2, 2);
INSERT INTO "AnaSema"."soruOY" VALUES (3, 3);


--
-- Name: Oyler_oyID_seq; Type: SEQUENCE SET; Schema: AnaSema; Owner: postgres
--

SELECT pg_catalog.setval('"AnaSema"."Oyler_oyID_seq"', 1, false);


--
-- Name: BadgesKullanci BadgesKullanciPK; Type: CONSTRAINT; Schema: AnaSema; Owner: postgres
--

ALTER TABLE ONLY "AnaSema"."BadgesKullanci"
    ADD CONSTRAINT "BadgesKullanciPK" PRIMARY KEY ("badgeID", "KullaniciID");


--
-- Name: SoruTag SoruTagPK; Type: CONSTRAINT; Schema: AnaSema; Owner: postgres
--

ALTER TABLE ONLY "AnaSema"."SoruTag"
    ADD CONSTRAINT "SoruTagPK" PRIMARY KEY ("tagID", "SoruID");


--
-- Name: Badges badgePK; Type: CONSTRAINT; Schema: AnaSema; Owner: postgres
--

ALTER TABLE ONLY "AnaSema"."Badges"
    ADD CONSTRAINT "badgePK" PRIMARY KEY ("badgeID");


--
-- Name: BadgeTipi badgeTipiPK; Type: CONSTRAINT; Schema: AnaSema; Owner: postgres
--

ALTER TABLE ONLY "AnaSema"."BadgeTipi"
    ADD CONSTRAINT "badgeTipiPK" PRIMARY KEY ("badgeTipiID");


--
-- Name: Inbox bildirimPK; Type: CONSTRAINT; Schema: AnaSema; Owner: postgres
--

ALTER TABLE ONLY "AnaSema"."Inbox"
    ADD CONSTRAINT "bildirimPK" PRIMARY KEY ("bildirimID");


--
-- Name: bildirimTipi bildirimTipiPK; Type: CONSTRAINT; Schema: AnaSema; Owner: postgres
--

ALTER TABLE ONLY "AnaSema"."bildirimTipi"
    ADD CONSTRAINT "bildirimTipiPK" PRIMARY KEY ("bildirimTipiID");


--
-- Name: cevapOY cevapOYPK; Type: CONSTRAINT; Schema: AnaSema; Owner: postgres
--

ALTER TABLE ONLY "AnaSema"."cevapOY"
    ADD CONSTRAINT "cevapOYPK" PRIMARY KEY ("oyID");


--
-- Name: Cevap cevapPK; Type: CONSTRAINT; Schema: AnaSema; Owner: postgres
--

ALTER TABLE ONLY "AnaSema"."Cevap"
    ADD CONSTRAINT "cevapPK" PRIMARY KEY ("cevapID");


--
-- Name: Favori favoriPK; Type: CONSTRAINT; Schema: AnaSema; Owner: postgres
--

ALTER TABLE ONLY "AnaSema"."Favori"
    ADD CONSTRAINT "favoriPK" PRIMARY KEY ("favoriID");


--
-- Name: iletisimBIlgileri iletisimBIlgileriPK; Type: CONSTRAINT; Schema: AnaSema; Owner: postgres
--

ALTER TABLE ONLY "AnaSema"."iletisimBIlgileri"
    ADD CONSTRAINT "iletisimBIlgileriPK" PRIMARY KEY ("ID");


--
-- Name: Kullanici kullaniciPK; Type: CONSTRAINT; Schema: AnaSema; Owner: postgres
--

ALTER TABLE ONLY "AnaSema"."Kullanici"
    ADD CONSTRAINT "kullaniciPK" PRIMARY KEY ("KullaniciID");


--
-- Name: Oyler oyPK; Type: CONSTRAINT; Schema: AnaSema; Owner: postgres
--

ALTER TABLE ONLY "AnaSema"."Oyler"
    ADD CONSTRAINT "oyPK" PRIMARY KEY ("oyID");


--
-- Name: oyTuru oyTuruPK; Type: CONSTRAINT; Schema: AnaSema; Owner: postgres
--

ALTER TABLE ONLY "AnaSema"."oyTuru"
    ADD CONSTRAINT "oyTuruPK" PRIMARY KEY ("oyTuruID");


--
-- Name: Resim resimPK; Type: CONSTRAINT; Schema: AnaSema; Owner: postgres
--

ALTER TABLE ONLY "AnaSema"."Resim"
    ADD CONSTRAINT "resimPK" PRIMARY KEY ("resimID");


--
-- Name: soruOY soruOYPK; Type: CONSTRAINT; Schema: AnaSema; Owner: postgres
--

ALTER TABLE ONLY "AnaSema"."soruOY"
    ADD CONSTRAINT "soruOYPK" PRIMARY KEY ("oyID");


--
-- Name: Soru soruPK; Type: CONSTRAINT; Schema: AnaSema; Owner: postgres
--

ALTER TABLE ONLY "AnaSema"."Soru"
    ADD CONSTRAINT "soruPK" PRIMARY KEY ("SoruID");


--
-- Name: Tag tagPK; Type: CONSTRAINT; Schema: AnaSema; Owner: postgres
--

ALTER TABLE ONLY "AnaSema"."Tag"
    ADD CONSTRAINT "tagPK" PRIMARY KEY ("tagID");


--
-- Name: iletisimBIlgileri unique_iletisimBIlgileri_KullaniciID; Type: CONSTRAINT; Schema: AnaSema; Owner: postgres
--

ALTER TABLE ONLY "AnaSema"."iletisimBIlgileri"
    ADD CONSTRAINT "unique_iletisimBIlgileri_KullaniciID" UNIQUE ("KullaniciID");


--
-- Name: BadgesKullanci BadgesKullanciFK1; Type: FK CONSTRAINT; Schema: AnaSema; Owner: postgres
--

ALTER TABLE ONLY "AnaSema"."BadgesKullanci"
    ADD CONSTRAINT "BadgesKullanciFK1" FOREIGN KEY ("badgeID") REFERENCES "AnaSema"."Badges"("badgeID");


--
-- Name: BadgesKullanci BadgesKullanciFK2; Type: FK CONSTRAINT; Schema: AnaSema; Owner: postgres
--

ALTER TABLE ONLY "AnaSema"."BadgesKullanci"
    ADD CONSTRAINT "BadgesKullanciFK2" FOREIGN KEY ("KullaniciID") REFERENCES "AnaSema"."Kullanici"("KullaniciID");


--
-- Name: Favori Favori2FK; Type: FK CONSTRAINT; Schema: AnaSema; Owner: postgres
--

ALTER TABLE ONLY "AnaSema"."Favori"
    ADD CONSTRAINT "Favori2FK" FOREIGN KEY ("KullaniciID") REFERENCES "AnaSema"."Kullanici"("KullaniciID");


--
-- Name: Favori FavoriFK; Type: FK CONSTRAINT; Schema: AnaSema; Owner: postgres
--

ALTER TABLE ONLY "AnaSema"."Favori"
    ADD CONSTRAINT "FavoriFK" FOREIGN KEY ("SoruID") REFERENCES "AnaSema"."Soru"("SoruID");


--
-- Name: Badges FavoriFK; Type: FK CONSTRAINT; Schema: AnaSema; Owner: postgres
--

ALTER TABLE ONLY "AnaSema"."Badges"
    ADD CONSTRAINT "FavoriFK" FOREIGN KEY ("badgeTipiID") REFERENCES "AnaSema"."BadgeTipi"("badgeTipiID");


--
-- Name: SoruTag SoruTagFK1; Type: FK CONSTRAINT; Schema: AnaSema; Owner: postgres
--

ALTER TABLE ONLY "AnaSema"."SoruTag"
    ADD CONSTRAINT "SoruTagFK1" FOREIGN KEY ("tagID") REFERENCES "AnaSema"."Tag"("tagID");


--
-- Name: SoruTag SoruTagFK2; Type: FK CONSTRAINT; Schema: AnaSema; Owner: postgres
--

ALTER TABLE ONLY "AnaSema"."SoruTag"
    ADD CONSTRAINT "SoruTagFK2" FOREIGN KEY ("SoruID") REFERENCES "AnaSema"."Soru"("SoruID");


--
-- Name: Inbox bildirimTipiFK; Type: FK CONSTRAINT; Schema: AnaSema; Owner: postgres
--

ALTER TABLE ONLY "AnaSema"."Inbox"
    ADD CONSTRAINT "bildirimTipiFK" FOREIGN KEY ("bildirimTipiID") REFERENCES "AnaSema"."bildirimTipi"("bildirimTipiID");


--
-- Name: iletisimBIlgileri bilgilerFK; Type: FK CONSTRAINT; Schema: AnaSema; Owner: postgres
--

ALTER TABLE ONLY "AnaSema"."iletisimBIlgileri"
    ADD CONSTRAINT "bilgilerFK" FOREIGN KEY ("KullaniciID") REFERENCES "AnaSema"."Kullanici"("KullaniciID");


--
-- Name: Cevap cevapFK; Type: FK CONSTRAINT; Schema: AnaSema; Owner: postgres
--

ALTER TABLE ONLY "AnaSema"."Cevap"
    ADD CONSTRAINT "cevapFK" FOREIGN KEY ("KullaniciID") REFERENCES "AnaSema"."Kullanici"("KullaniciID");


--
-- Name: Cevap cevapFK2; Type: FK CONSTRAINT; Schema: AnaSema; Owner: postgres
--

ALTER TABLE ONLY "AnaSema"."Cevap"
    ADD CONSTRAINT "cevapFK2" FOREIGN KEY ("SoruID") REFERENCES "AnaSema"."Soru"("SoruID");


--
-- Name: cevapOY cevapOY2FK; Type: FK CONSTRAINT; Schema: AnaSema; Owner: postgres
--

ALTER TABLE ONLY "AnaSema"."cevapOY"
    ADD CONSTRAINT "cevapOY2FK" FOREIGN KEY ("oyID") REFERENCES "AnaSema"."Oyler"("oyID") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: cevapOY cevapOYFK; Type: FK CONSTRAINT; Schema: AnaSema; Owner: postgres
--

ALTER TABLE ONLY "AnaSema"."cevapOY"
    ADD CONSTRAINT "cevapOYFK" FOREIGN KEY ("cevapID") REFERENCES "AnaSema"."Cevap"("cevapID");


--
-- Name: Inbox lnk_Kullanici_Inbox; Type: FK CONSTRAINT; Schema: AnaSema; Owner: postgres
--

ALTER TABLE ONLY "AnaSema"."Inbox"
    ADD CONSTRAINT "lnk_Kullanici_Inbox" FOREIGN KEY ("KullainciID") REFERENCES "AnaSema"."Kullanici"("KullaniciID") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Oyler lnk_oyTuru_Oyler; Type: FK CONSTRAINT; Schema: AnaSema; Owner: postgres
--

ALTER TABLE ONLY "AnaSema"."Oyler"
    ADD CONSTRAINT "lnk_oyTuru_Oyler" FOREIGN KEY ("oyTuruID") REFERENCES "AnaSema"."oyTuru"("oyTuruID") MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Oyler oyFK; Type: FK CONSTRAINT; Schema: AnaSema; Owner: postgres
--

ALTER TABLE ONLY "AnaSema"."Oyler"
    ADD CONSTRAINT "oyFK" FOREIGN KEY ("KullaniciID") REFERENCES "AnaSema"."Kullanici"("KullaniciID");


--
-- Name: Resim resimFK; Type: FK CONSTRAINT; Schema: AnaSema; Owner: postgres
--

ALTER TABLE ONLY "AnaSema"."Resim"
    ADD CONSTRAINT "resimFK" FOREIGN KEY ("KullaniciID") REFERENCES "AnaSema"."Kullanici"("KullaniciID");


--
-- Name: Soru soruFK; Type: FK CONSTRAINT; Schema: AnaSema; Owner: postgres
--

ALTER TABLE ONLY "AnaSema"."Soru"
    ADD CONSTRAINT "soruFK" FOREIGN KEY ("KullaniciID") REFERENCES "AnaSema"."Kullanici"("KullaniciID");


--
-- Name: soruOY soruOY2FK; Type: FK CONSTRAINT; Schema: AnaSema; Owner: postgres
--

ALTER TABLE ONLY "AnaSema"."soruOY"
    ADD CONSTRAINT "soruOY2FK" FOREIGN KEY ("oyID") REFERENCES "AnaSema"."Oyler"("oyID") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: soruOY soruOYFK; Type: FK CONSTRAINT; Schema: AnaSema; Owner: postgres
--

ALTER TABLE ONLY "AnaSema"."soruOY"
    ADD CONSTRAINT "soruOYFK" FOREIGN KEY ("SoruID") REFERENCES "AnaSema"."Soru"("SoruID");


--
-- PostgreSQL database dump complete
--

