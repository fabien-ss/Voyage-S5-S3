--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1 (Debian 16.1-1.pgdg120+1)
-- Dumped by pg_dump version 16.1 (Debian 16.1-1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: activite; Type: TABLE; Schema: public; Owner: your_username
--

CREATE TABLE public.activite (
    idactivite integer NOT NULL,
    nom character varying(250),
    prix_unitaire double precision
);


ALTER TABLE public.activite OWNER TO your_username;

--
-- Name: activite_idactivite_seq; Type: SEQUENCE; Schema: public; Owner: your_username
--

CREATE SEQUENCE public.activite_idactivite_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.activite_idactivite_seq OWNER TO your_username;

--
-- Name: activite_idactivite_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: your_username
--

ALTER SEQUENCE public.activite_idactivite_seq OWNED BY public.activite.idactivite;


--
-- Name: assocbouqact; Type: TABLE; Schema: public; Owner: your_username
--

CREATE TABLE public.assocbouqact (
    idactivite integer,
    idbouquet integer
);


ALTER TABLE public.assocbouqact OWNER TO your_username;

--
-- Name: bouquet; Type: TABLE; Schema: public; Owner: your_username
--

CREATE TABLE public.bouquet (
    idbouquet integer NOT NULL,
    nom character varying(250)
);


ALTER TABLE public.bouquet OWNER TO your_username;

--
-- Name: bouquet_idbouquet_seq; Type: SEQUENCE; Schema: public; Owner: your_username
--

CREATE SEQUENCE public.bouquet_idbouquet_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bouquet_idbouquet_seq OWNER TO your_username;

--
-- Name: bouquet_idbouquet_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: your_username
--

ALTER SEQUENCE public.bouquet_idbouquet_seq OWNED BY public.bouquet.idbouquet;


--
-- Name: entree_stock; Type: TABLE; Schema: public; Owner: your_username
--

CREATE TABLE public.entree_stock (
    idactivite integer,
    quantite integer NOT NULL,
    dateentree date
);


ALTER TABLE public.entree_stock OWNER TO your_username;

--
-- Name: historique; Type: TABLE; Schema: public; Owner: your_username
--

CREATE TABLE public.historique (
    idhistorique integer NOT NULL,
    idactivite integer,
    date_historique date DEFAULT now(),
    prix numeric
);


ALTER TABLE public.historique OWNER TO your_username;

--
-- Name: historique_idhistorique_seq; Type: SEQUENCE; Schema: public; Owner: your_username
--

CREATE SEQUENCE public.historique_idhistorique_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.historique_idhistorique_seq OWNER TO your_username;

--
-- Name: historique_idhistorique_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: your_username
--

ALTER SEQUENCE public.historique_idhistorique_seq OWNED BY public.historique.idhistorique;


--
-- Name: horairemaindoeuvre; Type: TABLE; Schema: public; Owner: your_username
--

CREATE TABLE public.horairemaindoeuvre (
    idmaindoeuvre integer,
    heure numeric NOT NULL,
    idvoyage character varying(30)
);


ALTER TABLE public.horairemaindoeuvre OWNER TO your_username;

--
-- Name: maindoeuvre; Type: TABLE; Schema: public; Owner: your_username
--

CREATE TABLE public.maindoeuvre (
    idmaindoeuvre integer NOT NULL,
    label character varying(100)
);


ALTER TABLE public.maindoeuvre OWNER TO your_username;

--
-- Name: maindoeuvre_idmaindoeuvre_seq; Type: SEQUENCE; Schema: public; Owner: your_username
--

CREATE SEQUENCE public.maindoeuvre_idmaindoeuvre_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.maindoeuvre_idmaindoeuvre_seq OWNER TO your_username;

--
-- Name: maindoeuvre_idmaindoeuvre_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: your_username
--

ALTER SEQUENCE public.maindoeuvre_idmaindoeuvre_seq OWNED BY public.maindoeuvre.idmaindoeuvre;


--
-- Name: margebeneficiaire; Type: TABLE; Schema: public; Owner: your_username
--

CREATE TABLE public.margebeneficiaire (
    idvoyage character varying(20),
    pourcentage numeric NOT NULL,
    datemarge date DEFAULT now()
);


ALTER TABLE public.margebeneficiaire OWNER TO your_username;

--
-- Name: nombre_activite_voyage; Type: TABLE; Schema: public; Owner: your_username
--

CREATE TABLE public.nombre_activite_voyage (
    idvoyage character varying(30),
    idactivite integer,
    nombre integer
);


ALTER TABLE public.nombre_activite_voyage OWNER TO your_username;

--
-- Name: prixmaindoeuvre; Type: TABLE; Schema: public; Owner: your_username
--

CREATE TABLE public.prixmaindoeuvre (
    idprix integer NOT NULL,
    idmaindoeuvre integer,
    prix numeric NOT NULL,
    dateprix date NOT NULL
);


ALTER TABLE public.prixmaindoeuvre OWNER TO your_username;

--
-- Name: prixmaindoeuvre_idprix_seq; Type: SEQUENCE; Schema: public; Owner: your_username
--

CREATE SEQUENCE public.prixmaindoeuvre_idprix_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.prixmaindoeuvre_idprix_seq OWNER TO your_username;

--
-- Name: prixmaindoeuvre_idprix_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: your_username
--

ALTER SEQUENCE public.prixmaindoeuvre_idprix_seq OWNED BY public.prixmaindoeuvre.idprix;


--
-- Name: seq_typevoyage; Type: SEQUENCE; Schema: public; Owner: your_username
--

CREATE SEQUENCE public.seq_typevoyage
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.seq_typevoyage OWNER TO your_username;

--
-- Name: seq_voyage; Type: SEQUENCE; Schema: public; Owner: your_username
--

CREATE SEQUENCE public.seq_voyage
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.seq_voyage OWNER TO your_username;

--
-- Name: sortie_stock; Type: TABLE; Schema: public; Owner: your_username
--

CREATE TABLE public.sortie_stock (
    idactivite integer,
    quantite integer NOT NULL,
    datesortie date
);


ALTER TABLE public.sortie_stock OWNER TO your_username;

--
-- Name: typevoyage; Type: TABLE; Schema: public; Owner: your_username
--

CREATE TABLE public.typevoyage (
    idtypevoyage character varying(30) NOT NULL,
    nom character varying(250),
    nombre integer
);


ALTER TABLE public.typevoyage OWNER TO your_username;

--
-- Name: voyage; Type: TABLE; Schema: public; Owner: your_username
--

CREATE TABLE public.voyage (
    idvoyage character varying(30) DEFAULT nextval('public.seq_voyage'::regclass) NOT NULL,
    nom character varying(250),
    idbouquet integer,
    idtypevoyage character varying(30)
);


ALTER TABLE public.voyage OWNER TO your_username;

--
-- Name: v_activite_pan; Type: VIEW; Schema: public; Owner: your_username
--

CREATE VIEW public.v_activite_pan AS
 SELECT voyage.idvoyage,
    voyage.nom AS nom_voyage,
    activite.nom AS nom_activite,
    activite.idactivite,
    activite.prix_unitaire,
    nombre_activite_voyage.nombre,
    (activite.prix_unitaire * (nombre_activite_voyage.nombre)::double precision) AS prix
   FROM public.voyage,
    public.activite,
    public.nombre_activite_voyage
  WHERE ((activite.idactivite = nombre_activite_voyage.idactivite) AND ((voyage.idvoyage)::text = (nombre_activite_voyage.idvoyage)::text));


ALTER VIEW public.v_activite_pan OWNER TO your_username;

--
-- Name: v_bouquetactivite; Type: VIEW; Schema: public; Owner: your_username
--

CREATE VIEW public.v_bouquetactivite AS
 SELECT assocbouqact.idactivite,
    assocbouqact.idbouquet,
    bouquet.nom AS nombouquet,
    activite.nom AS nomactivite
   FROM public.bouquet,
    public.activite,
    public.assocbouqact
  WHERE ((assocbouqact.idactivite = activite.idactivite) AND (assocbouqact.idbouquet = bouquet.idbouquet));


ALTER VIEW public.v_bouquetactivite OWNER TO your_username;

--
-- Name: v_maindoeuvre; Type: VIEW; Schema: public; Owner: your_username
--

CREATE VIEW public.v_maindoeuvre AS
 SELECT idmaindoeuvre,
    max(dateprix) AS dateprix
   FROM public.prixmaindoeuvre
  GROUP BY idmaindoeuvre;


ALTER VIEW public.v_maindoeuvre OWNER TO your_username;

--
-- Name: v_prixmaindoeuvreactuel; Type: VIEW; Schema: public; Owner: your_username
--

CREATE VIEW public.v_prixmaindoeuvreactuel AS
 SELECT v_maindoeuvre.idmaindoeuvre,
    v_maindoeuvre.dateprix,
    prixmaindoeuvre.prix
   FROM public.v_maindoeuvre,
    public.prixmaindoeuvre
  WHERE ((v_maindoeuvre.dateprix = prixmaindoeuvre.dateprix) AND (v_maindoeuvre.idmaindoeuvre = prixmaindoeuvre.idmaindoeuvre));


ALTER VIEW public.v_prixmaindoeuvreactuel OWNER TO your_username;

--
-- Name: v_coutmaindoeuvre; Type: VIEW; Schema: public; Owner: your_username
--

CREATE VIEW public.v_coutmaindoeuvre AS
 SELECT v_prixmaindoeuvreactuel.idmaindoeuvre,
    v_prixmaindoeuvreactuel.dateprix,
    v_prixmaindoeuvreactuel.prix,
    horairemaindoeuvre.heure,
    horairemaindoeuvre.idvoyage,
    (v_prixmaindoeuvreactuel.prix * horairemaindoeuvre.heure) AS prixtotal
   FROM public.v_prixmaindoeuvreactuel,
    public.horairemaindoeuvre
  WHERE (v_prixmaindoeuvreactuel.idmaindoeuvre = horairemaindoeuvre.idmaindoeuvre);


ALTER VIEW public.v_coutmaindoeuvre OWNER TO your_username;

--
-- Name: v_coutmaindoeuvrevoyage; Type: VIEW; Schema: public; Owner: your_username
--

CREATE VIEW public.v_coutmaindoeuvrevoyage AS
 SELECT idvoyage,
    sum(prixtotal) AS prix
   FROM public.v_coutmaindoeuvre
  GROUP BY idvoyage;


ALTER VIEW public.v_coutmaindoeuvrevoyage OWNER TO your_username;

--
-- Name: v_stock_entree; Type: VIEW; Schema: public; Owner: your_username
--

CREATE VIEW public.v_stock_entree AS
 SELECT idactivite,
    sum(quantite) AS quantite,
    dateentree
   FROM public.entree_stock
  GROUP BY idactivite, dateentree;


ALTER VIEW public.v_stock_entree OWNER TO your_username;

--
-- Name: v_stock_sortie; Type: VIEW; Schema: public; Owner: your_username
--

CREATE VIEW public.v_stock_sortie AS
 SELECT idactivite,
    sum(quantite) AS quantite,
    datesortie
   FROM public.sortie_stock
  GROUP BY idactivite, datesortie;


ALTER VIEW public.v_stock_sortie OWNER TO your_username;

--
-- Name: v_etat_stock; Type: VIEW; Schema: public; Owner: your_username
--

CREATE VIEW public.v_etat_stock AS
 SELECT v_stock_entree.idactivite,
    COALESCE((v_stock_entree.quantite - v_stock_sortie.quantite), v_stock_entree.quantite) AS quantite,
    activite.nom
   FROM ((public.v_stock_entree
     LEFT JOIN public.v_stock_sortie ON ((v_stock_entree.idactivite = v_stock_sortie.idactivite)))
     JOIN public.activite ON ((activite.idactivite = v_stock_entree.idactivite)));


ALTER VIEW public.v_etat_stock OWNER TO your_username;

--
-- Name: v_prix_voyage; Type: VIEW; Schema: public; Owner: your_username
--

CREATE VIEW public.v_prix_voyage AS
 SELECT sum(prix) AS prix,
    idvoyage,
    nom_voyage
   FROM public.v_activite_pan
  GROUP BY idvoyage, nom_voyage;


ALTER VIEW public.v_prix_voyage OWNER TO your_username;

--
-- Name: v_total_marge_produit; Type: VIEW; Schema: public; Owner: your_username
--

CREATE VIEW public.v_total_marge_produit AS
 SELECT ((- (v.prix + (COALESCE(vcmdv.prix, (0)::numeric))::double precision)) + (COALESCE(mb.pourcentage, (0)::numeric))::double precision) AS prix,
    v.idvoyage,
    vg.nom
   FROM (((public.v_prix_voyage v
     LEFT JOIN public.v_coutmaindoeuvrevoyage vcmdv ON (((v.idvoyage)::text = (vcmdv.idvoyage)::text)))
     JOIN public.voyage vg ON (((vg.idvoyage)::text = (v.idvoyage)::text)))
     LEFT JOIN public.margebeneficiaire mb ON (((vg.idvoyage)::text = (mb.idvoyage)::text)));


ALTER VIEW public.v_total_marge_produit OWNER TO your_username;

--
-- Name: v_final; Type: VIEW; Schema: public; Owner: your_username
--

CREATE VIEW public.v_final AS
 SELECT (v_total_marge_produit.prix * (typevoyage.nombre)::double precision) AS prix,
    v_total_marge_produit.idvoyage,
    (((typevoyage.nom)::text || '-'::text) || (v_total_marge_produit.nom)::text) AS nom
   FROM (public.v_total_marge_produit
     CROSS JOIN public.typevoyage);


ALTER VIEW public.v_final OWNER TO your_username;

--
-- Name: v_final_etat_stock; Type: VIEW; Schema: public; Owner: your_username
--

CREATE VIEW public.v_final_etat_stock AS
 SELECT activite.idactivite,
    COALESCE(v_etat_stock.quantite, (0)::bigint) AS "coalesce",
    activite.nom
   FROM (public.activite
     LEFT JOIN public.v_etat_stock ON ((v_etat_stock.idactivite = activite.idactivite)));


ALTER VIEW public.v_final_etat_stock OWNER TO your_username;

--
-- Name: v_prixmaindoeuvretotalavectaille; Type: VIEW; Schema: public; Owner: your_username
--

CREATE VIEW public.v_prixmaindoeuvretotalavectaille AS
 SELECT v_coutmaindoeuvrevoyage.idvoyage,
    ((typevoyage.nombre)::numeric * v_coutmaindoeuvrevoyage.prix) AS prix,
    typevoyage.nom
   FROM public.v_coutmaindoeuvrevoyage,
    public.typevoyage,
    public.voyage
  WHERE (((typevoyage.idtypevoyage)::text = (voyage.idtypevoyage)::text) AND ((v_coutmaindoeuvrevoyage.idvoyage)::text = (voyage.idvoyage)::text));


ALTER VIEW public.v_prixmaindoeuvretotalavectaille OWNER TO your_username;

--
-- Name: v_prix_voyage1; Type: VIEW; Schema: public; Owner: your_username
--

CREATE VIEW public.v_prix_voyage1 AS
 SELECT v_prix_voyage.idvoyage,
    (v_prix_voyage.prix + (v_prixmaindoeuvretotalavectaille.prix)::double precision) AS prix,
    v_prix_voyage.nom_voyage,
    v_prixmaindoeuvretotalavectaille.nom
   FROM public.v_prix_voyage,
    public.v_prixmaindoeuvretotalavectaille
  WHERE ((v_prix_voyage.idvoyage)::text = (v_prixmaindoeuvretotalavectaille.idvoyage)::text);


ALTER VIEW public.v_prix_voyage1 OWNER TO your_username;

--
-- Name: v_total_prix; Type: VIEW; Schema: public; Owner: your_username
--

CREATE VIEW public.v_total_prix AS
 SELECT (v.prix + (COALESCE(vcmdv.prix, (0)::numeric))::double precision) AS "?column?",
    v.idvoyage,
    vg.nom
   FROM ((public.v_prix_voyage v
     LEFT JOIN public.v_coutmaindoeuvrevoyage vcmdv ON (((v.idvoyage)::text = (vcmdv.idvoyage)::text)))
     JOIN public.voyage vg ON (((vg.idvoyage)::text = (v.idvoyage)::text)));


ALTER VIEW public.v_total_prix OWNER TO your_username;

--
-- Name: activite idactivite; Type: DEFAULT; Schema: public; Owner: your_username
--

ALTER TABLE ONLY public.activite ALTER COLUMN idactivite SET DEFAULT nextval('public.activite_idactivite_seq'::regclass);


--
-- Name: bouquet idbouquet; Type: DEFAULT; Schema: public; Owner: your_username
--

ALTER TABLE ONLY public.bouquet ALTER COLUMN idbouquet SET DEFAULT nextval('public.bouquet_idbouquet_seq'::regclass);


--
-- Name: historique idhistorique; Type: DEFAULT; Schema: public; Owner: your_username
--

ALTER TABLE ONLY public.historique ALTER COLUMN idhistorique SET DEFAULT nextval('public.historique_idhistorique_seq'::regclass);


--
-- Name: maindoeuvre idmaindoeuvre; Type: DEFAULT; Schema: public; Owner: your_username
--

ALTER TABLE ONLY public.maindoeuvre ALTER COLUMN idmaindoeuvre SET DEFAULT nextval('public.maindoeuvre_idmaindoeuvre_seq'::regclass);


--
-- Name: prixmaindoeuvre idprix; Type: DEFAULT; Schema: public; Owner: your_username
--

ALTER TABLE ONLY public.prixmaindoeuvre ALTER COLUMN idprix SET DEFAULT nextval('public.prixmaindoeuvre_idprix_seq'::regclass);


--
-- Data for Name: activite; Type: TABLE DATA; Schema: public; Owner: your_username
--

COPY public.activite (idactivite, nom, prix_unitaire) FROM stdin;
8	Camping	20
9	Randonnee	40
12	Coco	10000
13	EEE	313
14	Test	12312
10	J	1
15	Test 2	521
11	Coco	87
17	Barbecue	3244
18	Test	8
7	Surf	500
19	Yy	500
16	777	11100
20	Mijery tanana	1500
\.


--
-- Data for Name: assocbouqact; Type: TABLE DATA; Schema: public; Owner: your_username
--

COPY public.assocbouqact (idactivite, idbouquet) FROM stdin;
7	10
10	11
8	10
9	10
15	11
16	11
7	12
9	13
8	13
17	14
9	14
15	13
8	16
12	16
20	17
\.


--
-- Data for Name: bouquet; Type: TABLE DATA; Schema: public; Owner: your_username
--

COPY public.bouquet (idbouquet, nom) FROM stdin;
10	Premium
11	Fabien
12	TestException
13	TEST2
14	Decouverte
15	Vaovao
16	8787878
17	Mijery tanana bouquet
\.


--
-- Data for Name: entree_stock; Type: TABLE DATA; Schema: public; Owner: your_username
--

COPY public.entree_stock (idactivite, quantite, dateentree) FROM stdin;
7	50	\N
7	10	\N
8	45	\N
7	54	\N
17	23	\N
10	20	\N
10	3	\N
10	1	\N
17	50	\N
18	50	\N
10	131	\N
11	424	\N
12	42	\N
15	141	\N
13	123	\N
16	100	\N
14	20	\N
9	56	\N
8	1	\N
16	4	\N
16	4	\N
\.


--
-- Data for Name: historique; Type: TABLE DATA; Schema: public; Owner: your_username
--

COPY public.historique (idhistorique, idactivite, date_historique, prix) FROM stdin;
1	14	2024-01-09	12312.0
2	10	2024-01-09	1.0
3	15	2024-01-09	521.0
4	16	2024-01-09	7.0
5	11	2024-01-09	87.0
6	7	2024-01-13	500.0
7	16	2024-01-16	11100.0
\.


--
-- Data for Name: horairemaindoeuvre; Type: TABLE DATA; Schema: public; Owner: your_username
--

COPY public.horairemaindoeuvre (idmaindoeuvre, heure, idvoyage) FROM stdin;
1	5	V000024
2	1.0	V000024
3	4.0	V000046
\.


--
-- Data for Name: maindoeuvre; Type: TABLE DATA; Schema: public; Owner: your_username
--

COPY public.maindoeuvre (idmaindoeuvre, label) FROM stdin;
1	Asa 1
2	ASA2
3	Guide
\.


--
-- Data for Name: margebeneficiaire; Type: TABLE DATA; Schema: public; Owner: your_username
--

COPY public.margebeneficiaire (idvoyage, pourcentage, datemarge) FROM stdin;
V000023	10.0	2024-01-16
V000024	50.0	2024-01-16
V000046	20000.0	2024-01-16
\.


--
-- Data for Name: nombre_activite_voyage; Type: TABLE DATA; Schema: public; Owner: your_username
--

COPY public.nombre_activite_voyage (idvoyage, idactivite, nombre) FROM stdin;
V000023	10	4
V000023	10	4
V000023	10	4
V000024	10	4
V000024	10	7
V000024	10	5
V000031	7	2
V000031	8	4
V000031	9	6
V000032	10	1
V000032	15	1
V000033	10	1
V000033	15	1
V000034	10	2
V000034	15	1
V000035	7	2
V000036	8	4
V000036	9	4
V000037	7	1
V000037	8	1
V000037	9	1
V000038	17	25
V000041	10	4
V000041	15	5
V000041	16	6
V000042	8	2
V000042	9	4
V000042	7	4
V000043	10	4
V000043	15	2
V000043	16	6
V000045	8	12
V000045	9	4
V000045	7	5
V000046	20	1
\.


--
-- Data for Name: prixmaindoeuvre; Type: TABLE DATA; Schema: public; Owner: your_username
--

COPY public.prixmaindoeuvre (idprix, idmaindoeuvre, prix, dateprix) FROM stdin;
5	1	5.0	2024-01-16
2	2	2.0	2024-01-16
3	3	1000.0	2024-01-16
\.


--
-- Data for Name: sortie_stock; Type: TABLE DATA; Schema: public; Owner: your_username
--

COPY public.sortie_stock (idactivite, quantite, datesortie) FROM stdin;
8	4	\N
9	4	\N
8	8	\N
9	8	\N
8	4	\N
9	4	\N
8	4	\N
9	4	\N
7	2	\N
7	2	\N
7	4	\N
10	8	\N
10	8	\N
10	8	\N
7	10	\N
10	4	\N
15	5	\N
16	6	\N
8	10	\N
9	20	\N
7	20	\N
10	8	\N
15	4	\N
16	12	\N
\.


--
-- Data for Name: typevoyage; Type: TABLE DATA; Schema: public; Owner: your_username
--

COPY public.typevoyage (idtypevoyage, nom, nombre) FROM stdin;
2	Court	1
1	Long	2
\.


--
-- Data for Name: voyage; Type: TABLE DATA; Schema: public; Owner: your_username
--

COPY public.voyage (idvoyage, nom, idbouquet, idtypevoyage) FROM stdin;
V000023	G	10	1
V000024	mm	10	1
V000031	Karaib	10	1
V000032	y	11	1
V000033	Rat	11	1
V000034	dfg	11	1
V000035	ExceptionTest	12	1
V000036	Test ultime	13	1
V000037	477	10	1
V000038	Voyage Tamatave 2024	14	1
V000041	TESTESEt	11	1
V000042	fsdkhfkusd	10	1
V000043	testencore	11	1
V000045	44	10	1
V000046	Mijery tanana 2024	17	2
\.


--
-- Name: activite_idactivite_seq; Type: SEQUENCE SET; Schema: public; Owner: your_username
--

SELECT pg_catalog.setval('public.activite_idactivite_seq', 20, true);


--
-- Name: bouquet_idbouquet_seq; Type: SEQUENCE SET; Schema: public; Owner: your_username
--

SELECT pg_catalog.setval('public.bouquet_idbouquet_seq', 17, true);


--
-- Name: historique_idhistorique_seq; Type: SEQUENCE SET; Schema: public; Owner: your_username
--

SELECT pg_catalog.setval('public.historique_idhistorique_seq', 7, true);


--
-- Name: maindoeuvre_idmaindoeuvre_seq; Type: SEQUENCE SET; Schema: public; Owner: your_username
--

SELECT pg_catalog.setval('public.maindoeuvre_idmaindoeuvre_seq', 3, true);


--
-- Name: prixmaindoeuvre_idprix_seq; Type: SEQUENCE SET; Schema: public; Owner: your_username
--

SELECT pg_catalog.setval('public.prixmaindoeuvre_idprix_seq', 3, true);


--
-- Name: seq_typevoyage; Type: SEQUENCE SET; Schema: public; Owner: your_username
--

SELECT pg_catalog.setval('public.seq_typevoyage', 1, false);


--
-- Name: seq_voyage; Type: SEQUENCE SET; Schema: public; Owner: your_username
--

SELECT pg_catalog.setval('public.seq_voyage', 46, true);


--
-- Name: activite activite_pkey; Type: CONSTRAINT; Schema: public; Owner: your_username
--

ALTER TABLE ONLY public.activite
    ADD CONSTRAINT activite_pkey PRIMARY KEY (idactivite);


--
-- Name: bouquet bouquet_pkey; Type: CONSTRAINT; Schema: public; Owner: your_username
--

ALTER TABLE ONLY public.bouquet
    ADD CONSTRAINT bouquet_pkey PRIMARY KEY (idbouquet);


--
-- Name: historique historique_pkey; Type: CONSTRAINT; Schema: public; Owner: your_username
--

ALTER TABLE ONLY public.historique
    ADD CONSTRAINT historique_pkey PRIMARY KEY (idhistorique);


--
-- Name: maindoeuvre maindoeuvre_pkey; Type: CONSTRAINT; Schema: public; Owner: your_username
--

ALTER TABLE ONLY public.maindoeuvre
    ADD CONSTRAINT maindoeuvre_pkey PRIMARY KEY (idmaindoeuvre);


--
-- Name: prixmaindoeuvre prixmaindoeuvre_pkey; Type: CONSTRAINT; Schema: public; Owner: your_username
--

ALTER TABLE ONLY public.prixmaindoeuvre
    ADD CONSTRAINT prixmaindoeuvre_pkey PRIMARY KEY (idprix);


--
-- Name: typevoyage typevoyage_pkey; Type: CONSTRAINT; Schema: public; Owner: your_username
--

ALTER TABLE ONLY public.typevoyage
    ADD CONSTRAINT typevoyage_pkey PRIMARY KEY (idtypevoyage);


--
-- Name: assocbouqact unique_act_idbouquet; Type: CONSTRAINT; Schema: public; Owner: your_username
--

ALTER TABLE ONLY public.assocbouqact
    ADD CONSTRAINT unique_act_idbouquet UNIQUE (idactivite, idbouquet);


--
-- Name: bouquet unique_bouquet; Type: CONSTRAINT; Schema: public; Owner: your_username
--

ALTER TABLE ONLY public.bouquet
    ADD CONSTRAINT unique_bouquet UNIQUE (nom);


--
-- Name: voyage unique_voyage; Type: CONSTRAINT; Schema: public; Owner: your_username
--

ALTER TABLE ONLY public.voyage
    ADD CONSTRAINT unique_voyage UNIQUE (nom);


--
-- Name: voyage voyage_pkey; Type: CONSTRAINT; Schema: public; Owner: your_username
--

ALTER TABLE ONLY public.voyage
    ADD CONSTRAINT voyage_pkey PRIMARY KEY (idvoyage);


--
-- Name: assocbouqact assocbouqact_idactivite_fkey; Type: FK CONSTRAINT; Schema: public; Owner: your_username
--

ALTER TABLE ONLY public.assocbouqact
    ADD CONSTRAINT assocbouqact_idactivite_fkey FOREIGN KEY (idactivite) REFERENCES public.activite(idactivite);


--
-- Name: assocbouqact assocbouqact_idbouquet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: your_username
--

ALTER TABLE ONLY public.assocbouqact
    ADD CONSTRAINT assocbouqact_idbouquet_fkey FOREIGN KEY (idbouquet) REFERENCES public.bouquet(idbouquet);


--
-- Name: entree_stock entree_stock_idactivite_fkey; Type: FK CONSTRAINT; Schema: public; Owner: your_username
--

ALTER TABLE ONLY public.entree_stock
    ADD CONSTRAINT entree_stock_idactivite_fkey FOREIGN KEY (idactivite) REFERENCES public.activite(idactivite);


--
-- Name: historique historique_idactivite_fkey; Type: FK CONSTRAINT; Schema: public; Owner: your_username
--

ALTER TABLE ONLY public.historique
    ADD CONSTRAINT historique_idactivite_fkey FOREIGN KEY (idactivite) REFERENCES public.activite(idactivite);


--
-- Name: horairemaindoeuvre horairemaindoeuvre_idmaindoeuvre_fkey; Type: FK CONSTRAINT; Schema: public; Owner: your_username
--

ALTER TABLE ONLY public.horairemaindoeuvre
    ADD CONSTRAINT horairemaindoeuvre_idmaindoeuvre_fkey FOREIGN KEY (idmaindoeuvre) REFERENCES public.maindoeuvre(idmaindoeuvre);


--
-- Name: horairemaindoeuvre horairemaindoeuvre_idvoyage_fkey; Type: FK CONSTRAINT; Schema: public; Owner: your_username
--

ALTER TABLE ONLY public.horairemaindoeuvre
    ADD CONSTRAINT horairemaindoeuvre_idvoyage_fkey FOREIGN KEY (idvoyage) REFERENCES public.voyage(idvoyage);


--
-- Name: margebeneficiaire margebeneficiaire_idvoyage_fkey; Type: FK CONSTRAINT; Schema: public; Owner: your_username
--

ALTER TABLE ONLY public.margebeneficiaire
    ADD CONSTRAINT margebeneficiaire_idvoyage_fkey FOREIGN KEY (idvoyage) REFERENCES public.voyage(idvoyage);


--
-- Name: nombre_activite_voyage nombre_activite_voyage_idactivite_fkey; Type: FK CONSTRAINT; Schema: public; Owner: your_username
--

ALTER TABLE ONLY public.nombre_activite_voyage
    ADD CONSTRAINT nombre_activite_voyage_idactivite_fkey FOREIGN KEY (idactivite) REFERENCES public.activite(idactivite);


--
-- Name: nombre_activite_voyage nombre_activite_voyage_idvoyage_fkey; Type: FK CONSTRAINT; Schema: public; Owner: your_username
--

ALTER TABLE ONLY public.nombre_activite_voyage
    ADD CONSTRAINT nombre_activite_voyage_idvoyage_fkey FOREIGN KEY (idvoyage) REFERENCES public.voyage(idvoyage);


--
-- Name: prixmaindoeuvre prixmaindoeuvre_idmaindoeuvre_fkey; Type: FK CONSTRAINT; Schema: public; Owner: your_username
--

ALTER TABLE ONLY public.prixmaindoeuvre
    ADD CONSTRAINT prixmaindoeuvre_idmaindoeuvre_fkey FOREIGN KEY (idmaindoeuvre) REFERENCES public.maindoeuvre(idmaindoeuvre);


--
-- Name: sortie_stock sortie_stock_idactivite_fkey; Type: FK CONSTRAINT; Schema: public; Owner: your_username
--

ALTER TABLE ONLY public.sortie_stock
    ADD CONSTRAINT sortie_stock_idactivite_fkey FOREIGN KEY (idactivite) REFERENCES public.activite(idactivite);


--
-- Name: voyage voyage_idbouquet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: your_username
--

ALTER TABLE ONLY public.voyage
    ADD CONSTRAINT voyage_idbouquet_fkey FOREIGN KEY (idbouquet) REFERENCES public.bouquet(idbouquet);


--
-- Name: voyage voyage_idtypevoyage_fkey; Type: FK CONSTRAINT; Schema: public; Owner: your_username
--

ALTER TABLE ONLY public.voyage
    ADD CONSTRAINT voyage_idtypevoyage_fkey FOREIGN KEY (idtypevoyage) REFERENCES public.typevoyage(idtypevoyage);


--
-- PostgreSQL database dump complete
--

