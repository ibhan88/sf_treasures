--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: artists; Type: TABLE; Schema: public; Owner: vagrant; Tablespace: 
--

CREATE TABLE artists (
    artist_id integer NOT NULL,
    artist_name character varying(200) NOT NULL
);


ALTER TABLE public.artists OWNER TO vagrant;

--
-- Name: artists_artist_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE artists_artist_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.artists_artist_id_seq OWNER TO vagrant;

--
-- Name: artists_artist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE artists_artist_id_seq OWNED BY artists.artist_id;


--
-- Name: arts; Type: TABLE; Schema: public; Owner: vagrant; Tablespace: 
--

CREATE TABLE arts (
    art_id integer NOT NULL,
    title character varying(200),
    artist_id integer,
    latitude double precision,
    longitude double precision,
    clue text,
    question text,
    answer character varying(140)
);


ALTER TABLE public.arts OWNER TO vagrant;

--
-- Name: arts_art_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE arts_art_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.arts_art_id_seq OWNER TO vagrant;

--
-- Name: arts_art_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE arts_art_id_seq OWNED BY arts.art_id;


--
-- Name: leaders; Type: TABLE; Schema: public; Owner: vagrant; Tablespace: 
--

CREATE TABLE leaders (
    leader_id integer NOT NULL,
    team_name character varying(140) NOT NULL,
    total_minutes integer NOT NULL
);


ALTER TABLE public.leaders OWNER TO vagrant;

--
-- Name: leaders_leader_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE leaders_leader_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.leaders_leader_id_seq OWNER TO vagrant;

--
-- Name: leaders_leader_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE leaders_leader_id_seq OWNED BY leaders.leader_id;


--
-- Name: parks; Type: TABLE; Schema: public; Owner: vagrant; Tablespace: 
--

CREATE TABLE parks (
    park_id integer NOT NULL,
    parkname character varying(64) NOT NULL,
    type_id integer,
    lat double precision NOT NULL,
    lon double precision NOT NULL,
    clue text NOT NULL,
    question text NOT NULL,
    answer character varying(140) NOT NULL
);


ALTER TABLE public.parks OWNER TO vagrant;

--
-- Name: parks_park_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE parks_park_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.parks_park_id_seq OWNER TO vagrant;

--
-- Name: parks_park_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE parks_park_id_seq OWNED BY parks.park_id;


--
-- Name: parktypes; Type: TABLE; Schema: public; Owner: vagrant; Tablespace: 
--

CREATE TABLE parktypes (
    type_id integer NOT NULL,
    title character varying(128)
);


ALTER TABLE public.parktypes OWNER TO vagrant;

--
-- Name: parktypes_type_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE parktypes_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.parktypes_type_id_seq OWNER TO vagrant;

--
-- Name: parktypes_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE parktypes_type_id_seq OWNED BY parktypes.type_id;


--
-- Name: artist_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY artists ALTER COLUMN artist_id SET DEFAULT nextval('artists_artist_id_seq'::regclass);


--
-- Name: art_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY arts ALTER COLUMN art_id SET DEFAULT nextval('arts_art_id_seq'::regclass);


--
-- Name: leader_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY leaders ALTER COLUMN leader_id SET DEFAULT nextval('leaders_leader_id_seq'::regclass);


--
-- Name: park_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY parks ALTER COLUMN park_id SET DEFAULT nextval('parks_park_id_seq'::regclass);


--
-- Name: type_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY parktypes ALTER COLUMN type_id SET DEFAULT nextval('parktypes_type_id_seq'::regclass);


--
-- Data for Name: artists; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY artists (artist_id, artist_name) FROM stdin;
1	Goggin, Brian
2	Hall, Diane Andrews
3	Piazzoni, Gottardo Fidele Ponziano
4	Reid, Robert
5	Smith, Owen
6	Tilden, Douglas
7	Blackstone, Amy
8	Bufano, Beniamino
9	Chamberlain, Ann and Lubell, Bernie
10	Donahue, Scott
11	Greber, Henri Leon
12	Hoff, Terry
13	Putnam, Arthur
14	Dine, Jim
15	Kennedy, Deborah
16	Quagliata, Narcissus
17	Scheuer, Suzanne
18	Stutz, Michael
19	Acconci, Saitowitz and Soloman
20	deSoto, Lewis
21	Acconci, Vito
22	Adams, Gloria Cozzo
23	Oropallo, Deborah
24	Adams, Mark
25	Aitken, Robert Ingersoll
26	Albro, Maxine
27	Alicia/Montoya, Juana/Emmanuel
28	Anargyros, Spero
29	Barr, Aileen
30	Anderson, Lois
31	Anonymous
32	Arcega, Michael
33	Arnautoff, Victor
34	Arnautoff, Victor Mikhail
35	Arneson, Robert
36	Arnold, David
37	Asawa, Ruth
38	Aycock, Alice
39	Barnes, Carroll
40	Barr, Roger
41	Barth, Anders
42	Bates, Diana Pompelly
43	Beasley, Bruce
44	Beauchemin, Micheline
45	Bechtle, Robert
46	Beery, Jonathan
47	Beldner, Ray
48	Berlandina, Jane
49	Berlant, Tony
50	Bertrand, Raymond
51	Biaggi, Suzanne
52	Blake, Nayland W.
53	Bongers, Jaap (Jacob)
54	Bonner, Jonathan
55	Bowler, Patti
56	Brothers, Beliz
57	Boyce, Roger
58	Boynton, Raymond
59	Brangwyn, Frank
60	Brown, Arthur Page
61	Brown, Joan
62	Bullock, George
63	Buster, Kendall
64	Butterfield, Deborah
65	Carey, Michael
66	Carnwath, Squeak
67	Carpenter, James
68	Carter, Dudley C.
69	Catalusci, Robert
70	Cervantes, Morales and Poethig
71	Chagoya, Enrique
72	Chamberlain, Ann
73	Chamberlain, Ann and Hamilton, Ann
74	Chamberlain, Ann and Ho0d, Walter
75	Champagne, Lee Roy
76	Cheng, Carl
77	Chesse, Ralph A.
78	Choi, Man Lin
79	Chomenko, Mary
80	Collins, Goto, Reiko
81	Concha, Jerry
82	Connor, Gerome
83	Conrads, Carl H.
84	Corliss, Troy
85	Coullaut-Valera, Frederico
86	Cravath, Dorothy and Forbes, Helen
87	Cravath, Ruth Wakefield
88	Cronin, Don
89	Crumpler, Dewey
90	Crutcher, Colette and Barr, Aileen
91	Crutcher/Roller
92	Cummings, M. Earl
93	Cuneo, Rinaldo
94	Cunningham, Ben F.
95	Daub, Firmin, Hendrickson Sculpture Group
96	Davis, Michael and Schwartzenberg, Susan
97	Davis, Ron
98	Dean, Mallette (Harold)
99	Defeo, Jay
100	DeForest, Roy
101	Demetrios, Aristedes
102	Demetrios, Aristides
103	Joesam.
104	DeStaebler, Stephen
105	Deutsch, Richard
106	Di Colbertaldo, Vittorio
107	Di Suvero, Mark
108	Diebenkorn, Richard
109	Dill, Laddie John
110	Dixon, Maynard
111	Dixon, Willard
112	Donahue, Marcia
113	Dore, Paul Gustave
114	Downie, Romana Anzi
115	Dvortcsak, Michael
116	Dwyer, Gary
117	Echelman, Janet
118	Edstrom, David
119	Elliott, Lillian
120	Erckenbrack, Mary E.
121	Eversley, Frederick
122	Fernandez, Rudy
123	Fine and McCarren
124	Finneran, Bean
125	Fischer, R. M.
126	Fleming, Alan
127	Fletcher, Harrell and Rubin, John
128	Lands, Christine Marie
129	Francis, Sam
130	Newman, Ruby
131	French, Daniel Chester
132	Frey, Viola
133	Fuller (Mcchesney), Mary
134	Fuller, Mary
135	Garcia, Rupert
136	Garten, Cliff
137	Garza, Carmen Lomas
138	Geefs, Guillaume
139	Genn, Nancy
140	Gilliam, Sam
141	Gillman, Steve
142	Gillman, Steve and Keefer, Katherine
143	Glatt, Linnea
144	Goggin, Brian and Keehn, Dorka
145	Goldberg, Jim and Rubin, Jon
146	Gonzales, George
147	Gonzalez, Arthur
148	Gordin, Sidney
149	Gordon, David and Shum, Hilda
150	Grafly, Charles
151	Graham, Cecelia
152	Alavi, Seyed
153	Graham, Gary W.
154	Grieve, Mark and Spector, Ilana
155	Grossoni, Orazio
156	Hall, Parker
157	Halprin, Lawrence
158	Hamlin, Edith
159	Happersberger, Frank
160	Haring, Keith
161	Harris, George
162	Hasson, Bruce
163	Heavenston, Martha
164	Hedrick, Wally
165	Heffernon, Gerald
166	Hesthal, William
167	Koloski, Vince
168	Hiramoto, Judy
169	Hoefer, Wade
170	Holland, Tom
171	Hollis, Douglas
172	Houdon, Jean Antoine
173	Howard, John Langley
174	Howard, Mildred
175	Howard, Robert B.
176	Hsu, Joyce
177	Huang, Arlan
178	Hudson, Robert
179	Hung, Su-Chen
180	Hunter and Ghidini
181	Huntington, Clara
182	Igarashi, Takenobu
183	Ilyin, Peter
184	Jauchen, Hans
185	Johanson, Patricia
186	MacDonald, Robert
187	Johnson, Amana
188	Jurs, Shelley
189	Kadish, Ruben
190	Kahn, Ned
191	Rodriguez, Isis
192	Kang, Ik-Joong
193	Katano, Marc
194	Marini, Marino
195	Kelly, Lee
196	Kim, Cheonae
197	Kirkland, Larry
198	Kitundu, Walter
199	Klotz, Werner
200	Kogure, Kimiko
201	Kopecek, Vera
202	Kozloff, Joyce
203	Kricken, John and Rolph
204	Kunishima, Seiji
205	Labaudt, Lucien
206	Lane, Christopher
207	Langdon, Gordon
208	Leong, James
209	Mark/Charlie Evans/Brown
210	Leong, Lampo
211	Lerner, Leslie
212	Lieb, Reddy and Raynsford, Linda
213	Lin, Maya
214	Liu, Hung
215	Living Lenses (Po Shu Wang & Loui
216	Loarca, Carlos
217	Ludwig, Helen
218	Mandel and Sultan
219	Mangrum, Joe
220	Manwaring, Michael
221	Margrill, Anita and Nagasawa, Nobuho
222	Marie-Rose, Henri
223	Marsh, Thomas
224	Martin, Fran
225	Martin, Vance
226	Martinez, Julian
227	McDonnell, Mark
228	McQuarrie, J.
229	METAL
230	Montoya, Emmanuel C.
231	Moore, Henry
232	Mora, Joseph Jacinto
233	Moxom, Jack
234	Moya Del Pino, Jose
235	Mullican, Lee
236	Murrill, Gwyn
237	Murrill, Gwynn
238	Neri, Manuel
239	Noguchi, Isamu
240	Novak, Stephen
241	Rojas, Clare
242	O'banion, Nance
243	O'Day, Ruth
244	Olaguibel, Juan
245	Oldfield, Otis
246	Olmsted, Frederick Law
247	Olmsted, Frederick Law Jr.
248	Olmsted, Jr., Frederick Law
249	Overhoff, Jacques
250	Ozan, Pepe
251	Paitigan, Haig
252	Paley, Albert
253	Parhad, Fred
254	Patigian, Haig
255	Patlan, Eduardo and Pineda, Ray
256	Paunov, Zlatko
257	Perry, Charles O.
258	Perry, R. Hinton
259	Pijoan, Irene
260	Po Shu Wang
261	Poethig, Johanna
262	Polk, James
263	Pomodoro, Arnaldo
264	Porter, Bruce
265	Potts, Don
266	Powell, Eric
267	Precitia Eyes muralists
268	Preston, Anne
269	Roberts, Kent
270	Puccienlli, Raymond
271	Puccinelli, Raimondo(Raymond)
272	Qizhan, Zhu
273	Quilici, Gladys Nevada
274	Ramirez, Robert
275	Rebar Group
276	Reed, Michael John
277	Richards, Peter and Schwartzenberg, Susan
278	Reinerston, Lisa
279	Reinertson, Lisa
280	Rodin, Auguste
281	Reitschel, Ernst
282	Renfrow, Gregg
283	Richards, Peter
284	Rickey, George Warren
285	rigo 99
286	Riley, Cheryl
287	Rios, Michael
288	Rivera, Diego
289	Rivera, Gustavo
290	Ross, Charles
291	Runyon, Hal Bayard
292	Saltos, Elizabeth
293	Sarantitis, Joshua
294	Sato, Norie
295	Saulls, Vicki
296	Saulls, Vicki Ann
297	Saulls, Vicky
298	Saunders, Raymond
299	Schmid, Rupert
300	Schnier, Jacques
301	Schweigardt, Frederick W.
302	Scuri, Vicki
303	Segal, George
304	Selinger, Paul
305	Sells, Raymond
306	Serlin, Merle Axelrad
307	Zoell, Bob
308	Shaw, Richard
309	Shields-Clarke, Thomas
310	Shively, Evan
311	Shuler, Dustin
312	Shum, Hilda
313	Shunkai, Bundo
314	Slusky, Joseph
315	Smith, Anthony
316	Smith, Hassel
317	Snyder, Dan
318	Sonnier, Keith
319	Sowers, Charles
320	Sproat, Christopher Townsend
321	Stackpole, Ralph
322	Stellon, Anthony
323	Stern, Jan Peter
324	Story, William Wetmore
325	Tamayo, Rufino
326	Tchakalian, Sam
327	Telcocci, Gina
328	Templeton, Mark
329	Terada, Edward Takeo
330	Thiebaud, Wayne
331	Wagner, Catherine
332	Torlakson, James
333	True, Laurel
334	Uehara, Kinji
335	Vaea
336	Vaillancourt, Armand
337	VanDenberge
338	VanDenberge, Peter
339	Vidar, Frede
340	Villamor, Manuel
341	Villegas, Victor Hugo Barranechea
342	Volz, Herman
343	VonMeyer, Michael
344	Voulkos, Peter
345	Walburg, Gerald
346	Walter, Edgar
347	Washington, Horace
348	Wehrle, John
349	Wessels, Glenn
350	Wight, Clifford
351	Wiley, William
352	Wong, Al
353	Wonner, Paul
354	Wowhaus
355	Yung, Rene
356	Zajac, Jack
357	Zakheim, Bernard Baruch
358	Zed, Dana
\.


--
-- Name: artists_artist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('artists_artist_id_seq', 358, true);


--
-- Data for Name: arts; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY arts (art_id, title, artist_id, latitude, longitude, clue, question, answer) FROM stdin;
1	Switch	1	37.7410238000000007	-122.422831099999996	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
2	Bird and Poem	2	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
3	The Land	3	37.7715030000000027	-122.467646000000002	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
4	Oriental Art	4	37.8028346999999982	-122.448387600000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
5	Building the Iron Horse	5	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
6	Ball Thrower	6	37.7700644999999966	-122.482587800000005	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
7	Untitled	7	37.7633760000000009	-122.420433000000003	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
8	Bear and Cubs	8	37.7665964999999986	-122.423304299999998	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
9	Untitled	9	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
10	To This Place	10	37.7701866999999964	-122.451010999999994	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
11	Dancing Sprites	11	37.7920330000000035	-122.412216299999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
12	Untitled	12	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
13	The Winning of the West	13	37.7741055999999986	-122.420473400000006	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
14	Mouse	8	37.7665964999999986	-122.423304299999998	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
15	Venus with Rope	14	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
16	Untitled [tapestries]	2	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
17	Solar Sight	15	37.7336840999999978	-122.4479623	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
18	Untitled	16	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
19	Newsgathering	17	37.8023686000000012	-122.405819399999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
20	Cardboard Kore	18	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
21	Promenade Ribbon	19	37.808530300000001	-122.412059099999993	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
22	Woven	20	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
23	Two Wings for Wall and Person	21	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
24	Light Beams for the Sky of Transfer Cooridor	21	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
628	Calypso	314	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
25	Cityscape #33	22	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
26	Love + Marriage	23	37.7793132999999983	-122.418409400000002	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
27	Garden Outside the Gate (The Garden Tapestries)	24	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
28	Garden in San Andreas Valley (The Garden Tapestries)	24	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
29	Pond in Golden Gate Park (The Garden Tapestries)	24	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
30	The Dewey Monument (Admiral George Dewey, 1837-1917)	25	37.7880555999999999	-122.407499999999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
31	Spandrels on Spreckles Temple of Music	25	37.7703537000000011	-122.466671099999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
32	William McKinley	25	37.7716649999999987	-122.454556999999994	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
33		5	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
34	Hall McAllister (1829-1888)	25	37.7793132999999983	-122.418409400000002	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
35	California	26	37.8023686000000012	-122.405819399999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
36	Sanctuario	27	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
37	George Moscone	28	37.7793132999999983	-122.418409400000002	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
38	Secret Garden	29	37.7419070999999988	-122.465034799999998	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
39	Outdoor Wall Mosaic	30	37.7474162000000035	-122.439049900000001	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
40	Ludwig Van Beethoven (1770-1827)	31	37.7703537000000011	-122.466671099999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
41	Kanrin Maru Monument	31	37.7069424000000026	-122.452562400000005	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
42	Lotta's Fountain	31	37.7876663999999991	-122.403424799999996	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
43	Fountain of the Tortoises	31	37.7920330000000035	-122.412216299999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
44	Untitled (Stone Lantern)	31	37.7701721999999975	-122.470155700000007	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
45	Amazarasti-no Hotoke (the Buddha that sits throughout the sunny and rainy weathe	31	37.7701721999999975	-122.470155700000007	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
46	Benjamin Franklin (1706-1790)	31	37.800342299999997	-122.410151299999995	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
47	Mission Post	32	37.7649169000000029	-122.421886000000001	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
48	The Life of George Washington	33	37.7774299000000013	-122.491083000000003	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
49	Edison (1847-1931) Washington (1732-1799) and Shakespeare (1564-1616)	34	37.7774299000000013	-122.491083000000003	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
50	City Life	34	37.8023686000000012	-122.405819399999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
51	Yin Yang	35	37.7948985000000022	-122.394593799999996	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
52	Untitled	36	37.7323427999999979	-122.405973900000006	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
53	Redding School, Self-Portrait	37	37.7839329999999975	-122.412594999999996	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
54	Origami Fountains	37	37.7853921000000028	-122.431269099999994	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
55	Hagiwara Family Plaque	37	37.7701721999999975	-122.470155700000007	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
56	Cyclone Fragment	38	37.7788639999999987	-122.415783000000005	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
57	Functional and Fantasy Stair	38	37.7788639999999987	-122.415783000000005	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
58	Transverse and Column	39	37.7229197999999997	-122.444850000000002	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
59	Secret Garden	29	37.7419070999999988	-122.465034799999998	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
60	Secret Garden	29	37.7419070999999988	-122.465034799999998	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
61	Secret Garden	29	37.7419070999999988	-122.465034799999998	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
62	Skygate	40	37.809078999999997	-122.411934000000002	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
63	Phoenix	41	37.7792703000000003	-122.501872399999996	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
64	First Person Plural	41	37.7837738999999999	-122.412943499999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
65	Reflection	42	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
66	The Hesperides	43	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
67	                                                      	44	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
68	San Francisco Nova	45	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
69	Leatherback Sea Turtle	46	37.8013600000000025	-122.433025000000001	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
70	The Pink Short-spined Starfish	46	37.8013600000000025	-122.433025000000001	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
71	Playland Revisited	47	3737	-122.510036999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
72	Home Life	48	37.8023686000000012	-122.405819399999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
73	Dancing on the Brink of the World	49	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
74	Meat Industry	50	37.8023686000000012	-122.405819399999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
75	Patterns of Time and Place [stone sculpture]	51	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
76	Earth, Fire, and Water	7	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
77		5	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
78	Constellation	52	37.7788639999999987	-122.415783000000005	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
79	Untitled #2	53	37.7798185999999987	-122.464214999999996	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
80	Untitled #1	53	37.7798185999999987	-122.464214999999996	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
81	Fire	53	37.753119599999998	-122.441043800000003	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
82	Bloom	54	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
83	Dragon Relief	55	37.7967082999999988	-122.415492700000001	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
84	Untitled [light boxes and glass panels]	56	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
85	Untitled	57	37.7582009999999997	-122.412998999999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
86	Animal Force and Machine Force	58	37.8023686000000012	-122.405819399999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
87	Water: The Net	59	37.7796489999999991	-122.420552000000001	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
88	Fire: Industrial Fire	59	37.7796489999999991	-122.420552000000001	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
89	Fire: Primitive Fire	59	37.7796489999999991	-122.420552000000001	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
90	Air: The Windmill	59	37.7796489999999991	-122.420552000000001	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
91	Earth: The Fruit Pickers	59	37.7796489999999991	-122.420552000000001	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
92	Earth: Dancing the Grapes	59	37.7796489999999991	-122.420552000000001	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
93	Water: The Fountain	59	37.7796489999999991	-122.420552000000001	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
94	Air: The Hunters	59	37.7796489999999991	-122.420552000000001	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
95	Untitled [light boxes and glass panels]	56	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
96	Untitled [light boxes and glass panels]	56	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
97	Untitled [light boxes and glass panels]	56	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
98	Untitled [light boxes and glass panels]	56	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
99	Untitled [light boxes and glass panels]	56	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
100	Untitled [light boxes and glass panels]	56	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
101	Untitled [light boxes and glass panels]	56	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
102	Untitled [light boxes and glass panels]	56	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
103	Untitled [light boxes and glass panels]	56	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
104	Untitled [light boxes and glass panels]	56	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
302	Eat	1	37.7456473000000017	-122.419885100000002	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
105	Untitled [light boxes and glass panels]	56	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
106	Water	9	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
107	Untitled [light boxes and glass panels]	56	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
108	Untitled [light boxes and glass panels]	56	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
109	Portals of the Past	60	37.7705253999999968	-122.481839100000002	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
110	The Dancing Musicians	61	37.778027299999998	-122.421525000000003	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
111	The Journey #2	61	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
112	Sun Yat-Sen	8	37.7921253000000021	-122.405136400000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
113	Rabbit	8	37.7665964999999986	-122.423304299999998	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
114	Small Fish--Big Fish	8	37.7665964999999986	-122.423304299999998	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
115	St. Francis of the Guns	8	37.7277893999999989	-122.451724999999996	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
116	Torso	8	37.764054299999998	-122.431904700000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
117	Peace	8	37.714628900000001	-122.480290600000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
118	Frog	8	37.8063760000000002	-122.423905000000005	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
119	Two Sea Lions	8	37.7665964999999986	-122.423304299999998	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
120	Horse and Rider (St. Francis on Horseback)	8	3778015	-122.377801500000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
121	Head of St.Francis	8	37.7238941999999966	-122.479274399999994	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
122	Seal	8	37.8063760000000002	-122.423905000000005	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
123		5	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
124	Madonna	8	37.7557795000000027	-122.404443099999995	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
125	Butterfly	8	37.7665964999999986	-122.423304299999998	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
126	Cat and Mouse	8	37.7665964999999986	-122.423304299999998	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
127	Penguins	8	3737	-122.398336999999998	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
128	William Shakespeare	62	37.768878100000002	-122.467179900000005	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
129	Fire	9	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
130	Topograph	63	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
131	Pohina	64	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
132	Woman with Birds	65	37.7516877999999991	-122.464946299999994	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
133	Fly, Flight, Fugit	66	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
134	Sculptural Light Reflectors	67	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
135	Goddess of the Forest	68	37.7277893999999989	-122.451724999999996	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
136	Untitled	69	37.7566770000000034	-122.393207000000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
137	Roots and Branches	70	37.7458728000000008	-122.452209999999994	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
138	Authors of Latin American Roots	71	37.7243764999999982	-122.459639600000003	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
139	Love Letters	71	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
140	Untitled Photographic Images	72	37.7557795000000027	-122.404443099999995	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
141	Untitled	73	37.7788639999999987	-122.415783000000005	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
142	Abraham Lincoln Brigade National Monument	74	37.7948985000000022	-122.394593799999996	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
143	Earth	9	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
144	Untitled	9	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
145	Water	9	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
146	Earth, Air, Fire, Water	9	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
147	Air	9	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
148	Fire	9	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
149	Earth	9	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
150	Air	9	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
151	The Grail	75	37.7998069000000001	-122.436041099999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
152	Heliostats	76	3768	-122.403767999999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
153	Children at Play	77	37.8023686000000012	-122.405819399999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
154	Movement: The First 100 Years	78	37.7956640000000021	-122.391683299999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
155	Ocean Beach Fossil	79	37.7491109999999992	-122.507951599999998	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
156	Aqua Pura	80	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
157	Roof Mural	81	37.7557795000000027	-122.404443099999995	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
158	Robert Emmet (1778-1803)	82	37.7703537000000011	-122.466671099999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
159	General Henry W. Halleck (1815-1872)	83	37.7690399999999968	-122.483519299999998	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
160	Noe Valley Natives	84	37.7424243999999973	-122.427869099999995	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
161	Statue of King Carlos III	85	37.6986166000000011	-122.483517500000005	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
162	Noah's Ark	86	37.7336172999999988	-122.504921100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
163	Mayor Alioto	87	37.7793132999999983	-122.418409400000002	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
164	Saint Francis	87	37.7138806000000031	-122.387657799999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
165	Angelo J. Rossi (1878-1948)	87	37.7793132999999983	-122.418409400000002	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
166		5	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
167	Bust of Michael M. O'Shaugnessy	88	37.7793132999999983	-122.418409400000002	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
168	Untitled	89	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
169	16th Avenue Tiled Steps Project	90	37841	-122.473784100000003	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
170	Art Panel	91	37.7213121999999998	-122.479904300000001	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
171	Art Panels	91	37.7142193999999975	-122.465946799999998	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
172	Art Panel	91	37.7213121999999998	-122.479904300000001	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
173	Carl G. Larsen	92	37.7411865999999989	-122.475482799999995	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
174		5	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
175	Rideout Fountain	92	37.7703537000000011	-122.466671099999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
176	Doughboy	92	37.7715966000000023	-122.473304999999996	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
177	Pool of Enchantment	92	37.7703537000000011	-122.466671099999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
178	Bear and Lion	92	37.7734008999999986	-122.465880499999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
179	Robert Burns (1759-1796)	92	37.7690399999999968	-122.483519299999998	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
180	Dennis T. Sullivan (1852-1906) Plaque	92	37.7898162999999983	-122.411603299999996	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
181	Sun Dial	92	37.7703537000000011	-122.466671099999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
182	Man Drinking Water	92	37.8008791000000031	-122.410953899999996	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
183	John McLaren (1846-1943)	92	37.7690399999999968	-122.483519299999998	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
184	Bay Area Hills	93	37.8023686000000012	-122.405819399999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
185	Outdoor Life	94	37.8023686000000012	-122.405819399999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
186	Harvey Milk Commemorative Bust	95	37.7793132999999983	-122.418409400000002	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
187	Homage to the Amateur; The American Dream, A Tribute to Harvey Milk; Bio/Obscura	96	37.7694086999999996	-122.434752200000005	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
188	Twin Wave	97	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
189	1929-1941: Patient Care During the Great Depression	20	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
190	Wide Wave	97	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
191	Stockbroker and Scientist-Inventor	98	37.8023686000000012	-122.405819399999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
192	Loop Series 4: Masquerade in Black	99	37.7716729999999998	-122.467484999999996	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
193	Homage to Zane Grey	100	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
194	Red Gothic	101	37.7798185999999987	-122.464214999999996	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
195	Sentinels	102	37.7277893999999989	-122.451724999999996	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
196	1994: Staff and Residentes Celebrate the Rededication of the Bell Tower	20	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
197	1974-1977: Gerald Simon Theater Entertains the Community	20	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
198	On The Air	20	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
199	1949-1958: Community Activities at Laguna Honda	20	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
200	1999: Proposition A for the Laguna Honda Project Gets 73% Voter Approval	20	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
201	1947-1954: University of California . . .	20	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
202	1990-2000: Volunteers Contribute to Life at Laguna Honda	20	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
203	Shining Paths,San Francisco Sister Cities	20	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
204	Jury Assembly Room	20	37.780382000000003	-122.41883	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
205	1929-1941: Patient Care During the Great Depression	20	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
206	1909: President Theodore Roosevelt Visits the Relief Home at Laguna Honda	20	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
207	1908: The Construction of Clarendon Hall	20	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
208	1926: Mayor James Rolf, Jr. Dedicates the Laguna Honda Main Hospital Building	20	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
209	1947-1954: University of California, San Francisco . . .	20	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
210	Wade in Water	103	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
211	1949-1958: Community Activities at Laguna Honda	20	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
212	1865-1906: The Foundation of the Almshouse and Relief Home at Laguna Honda	20	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
213	1934-1954-1982: Glen Wessel's Murals are Created, Lost and Rediscovered	20	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
214	1908: The Construction of Clarendon Hall	20	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
215	1954-1997: Virginia Leishman, Nursing Director	20	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
216	Fireplace and Hood	104	37.7277893999999989	-122.451724999999996	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
217	Man with Flame	104	37.7843370000000007	-122.399407400000001	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
218	Propeller	105	37.7416748999999996	-122.506951599999994	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
219	Christopher Columbus	106	37.8024089999999973	-122.405869999999993	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
220	Sea Change	107	37.7766510000000011	-122.417974999999998	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
221	Untitled	108	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
222	Untitled	108	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
223	Untitled	108	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
224	Untitled	108	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
225	Untitled	109	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
226	Landscape	110	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
227	Above Bolinas	111	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
228	Death Valley II	111	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
229	Five Carved Stones	112	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
230	Kate, Allan, Javier, Ting, Sloanie	10	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
231	Untitled [Richmond Library]	10	37.7818699999999978	-122.467742999999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
232	La poeme de la vigne	113	37.7703537000000011	-122.466671099999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
233	Bust of George Moscone	114	37.7788639999999987	-122.415783000000005	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
234	Sublimens	115	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
235	Seven Dancing Stones and Seven Dancing Stars Stories	116	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
236	Untitled [T-2 interior]	117	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
237	Florence Nightingale (1820-1910)	118	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
238	Untitled	119	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
239	Ceramic Mural on Athletics	120	37.7842191000000014	-122.434810299999995	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
240	Untitled	121	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
241	Mission Triptych #3	122	37.7582009999999997	-122.412998999999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
242	Mission Triptych #2	122	37.7582009999999997	-122.412998999999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
243	Split Mound	123	37.7336172999999988	-122.504921100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
244	Untitled	124	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
245	Union Square Colomnade	125	37.7880555999999999	-122.407499999999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
246	Kezar Stadium Gates	126	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
247	Photos of People from the Neighborhood Enlarged and Attached to the Building, an	127	37.7984338999999991	-122.409468200000006	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
248	Photos of People from the Neighborhood Enlarged and Attached to the Building, an	127	37.7984338999999991	-122.409468200000006	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
249	Photos of People from the Neighborhood Enlarged and Attached to the Building, an	127	37.7984338999999991	-122.409468200000006	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
250	Before the Revolution	128	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
251	Photos of People from the Neighborhood Enlarged and Attached to the Building, an	127	37.7984338999999991	-122.409468200000006	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
252	"Stenciled Fortunes" within "Photos of People from the Neighborhood enlarged and	127	37.7984338999999991	-122.409468200000006	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
253	Photos of People from the Neighborhood Enlarged and Attached to the Building, an	127	37.7984338999999991	-122.409468200000006	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
254	Photos of People from the Neighborhood Enlarged and Attached to the Building, an	127	37.7984338999999991	-122.409468200000006	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
255	Photos of People from the Neighborhood Enlarged and Attached to the Building, an	127	37.7984338999999991	-122.409468200000006	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
256	Photos of People from the Neighborhood Enlarged and Attached to the Building, an	127	37.7984338999999991	-122.409468200000006	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
257	Photos of People From the Neighborhood Enlarged and Attached to the Building, an	127	37.7984338999999991	-122.409468200000006	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
258	Photos of People From the Neighborhood Enlarged and Attached to the Building, an	127	37.7984338999999991	-122.409468200000006	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
259	Photos of People from the Neighborhood Enlarged and Attached to the Building, an	127	37.7984338999999991	-122.409468200000006	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
260	Photos of People from the Neighborhood Enlarged and Attached to the Building, an	127	37.7984338999999991	-122.409468200000006	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
261	Photos of People from the Neighborhood Enlarged and Attached to the Building, an	127	37.7984338999999991	-122.409468200000006	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
262	Untitled	129	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
263	Children's Mural	130	37.7557795000000027	-122.404443099999995	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
264	Thomas Starr King (1824-1864)	131	37.7703537000000011	-122.466671099999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
265	World Civilization	132	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
266	Exterior/Interior (Studio View)	132	37.8012620000000013	-122.433020999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
267	Lion	133	37.7947174999999973	-122.404868800000003	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
268	Serpent	133	37.7947174999999973	-122.404868800000003	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
269	Untitled	133	37.7947174999999973	-122.404868800000003	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
270	Dragon	133	37.7947174999999973	-122.404868800000003	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
271	Lion	133	37.7947174999999973	-122.404868800000003	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
272	Benches	133	37.7947174999999973	-122.404868800000003	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
273	Untitled	12	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
274	Monkey	133	37.7947174999999973	-122.404868800000003	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
275	Rabbit	133	37.7947174999999973	-122.404868800000003	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
276	Serpent Wall	133	37.7947174999999973	-122.404868800000003	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
277	Ram	133	37.7947174999999973	-122.404868800000003	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
278	Tiger, Ram, Serpent, Monkey, Rabbit, Dragon	133	37.7947174999999973	-122.404868800000003	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
279	Earth, Air, Sea	134	37.7355640999999977	-122.506124600000007	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
280	Dos Liones	134	37.7557795000000027	-122.404443099999995	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
281	Bird Technology	135	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
282	Laguna Line (The Possibility of the Everyday)	136	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
283	The History of Northern California Water	137	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
284	The History of Northern California Water	137	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
285	The History of Northern California Water	137	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
286	The History of Northern California Water	137	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
287	The History of Northern California Water	137	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
288	The History of Northern California Water	137	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
289	The History of Northern California Water	137	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
290	Baile!	137	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
291	The History of Northern California Water	137	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
292	Leonitus (Roman Gladiator)	138	37.7703537000000011	-122.466671099999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
293	Evora 16	139	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
294	Tholos Across	140	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
295	Bay Bench	141	37.7869955999999974	-122.388030599999993	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
296	Bay Bench	141	37.7869955999999974	-122.388030599999993	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
297	Bay Bench	141	37.7869955999999974	-122.388030599999993	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
298	The Swimmers	142	37.7126429999999999	-122.415717000000001	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
299	Re-connection/Re-cognition	143	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
300	Bed	1	37.7440438	-122.4209034	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
301	Grow	1	37.7456473000000017	-122.419885100000002	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
303	Feed	1	37.7456473000000017	-122.419885100000002	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
304	Ballast	1	37.7467769000000004	-122.419137800000001	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
305	Pavers	1	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
306	Road	1	3776	-122.418377599999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
307	Others	1	37.7423539999999988	-122.422000400000002	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
308	Hunt	1	37.7431399000000027	-122.421481900000003	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
309	Language of the Birds	144	37.7978884999999991	-122.406722099999996	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
310	Imagine Even More	145	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
311	Wu Xing Pavilion	146	37.7557795000000027	-122.404443099999995	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
312	Peaceable Kingdom	147	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
313	Untitled	148	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
314	Column Vistas	149	37.7557795000000027	-122.404443099999995	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
315	Pioneer Mother	150	37.7712239999999966	-122.473881700000007	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
316	The Dolphins	151	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
317	Speaking Stones	152	37.7832700000000017	-122.477976999999996	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
318	Untitled (Chalkboards)	12	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
319	Police Shield	153	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
320	Untitled 	154	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
321	Giuseppe Verdi	155	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
322	Rollers	2	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
323	Goldfinch with Zinnia 2	2	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
324	Goldfinch 5	2	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
325	Swelling Cumulus	2	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
326	Morning Light 2	2	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
327	Hermit Thrush 2	2	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
328	Collegiate Sports	156	37.8023686000000012	-122.405819399999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
329	United Nations Plaza Fountain	157	37.7799850000000035	-122.413632199999995	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
330	Untitled (Chalkboards)	12	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
331	Map for the Pacific and Orient Steamship Lines	158	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
332	Hunting in California	158	37.8023686000000012	-122.405819399999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
333	James A. Garfield (1831-1881)	159	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
334	Pioneer Monument  (James Lick Monument)	159	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
335	The Land	3	37.7715030000000027	-122.467646000000002	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
336	Untitled (Three Dancing Figures)	160	37.8012620000000013	-122.433020999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
337	Banking and the Law	161	37.8023686000000012	-122.405819399999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
338	Ark (or Ark San Francisco)	162	37.7842914000000007	-122.412216299999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
339	Trolleys	162	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
340	a) Dancing in the Sea of Milk (woman); and b) African King with Animal Power (ma	163	3737	-122.415637000000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
341	A World View	163	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
342	17th December, 1903	164	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
343	Rabbinoid on Cell Phone	165	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
344	Railroad and Shipping	166	37.8023686000000012	-122.405819399999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
345	Untitled	166	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
346	A Library Book	167	37.7752089999999967	-122.393080999999995	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
347	Animal Hopscotch	168	37.7582009999999997	-122.412998999999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
348	The Peasant's Parade	169	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
349	Untitled	12	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
350	Untitled	12	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
351	Untitled (Chalkboards)	12	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
352	Untitled	12	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
353	Untitled	12	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
354	Untitled (Chalkboards)	12	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
355	Untitled (Chalkboards)	12	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
356	Untitled (Chalkboards)	12	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
357	It's Always Time for Flowers	12	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
358	Untitled (Chalkboard)	12	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
359	It's Always Time for Flowers	12	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
360	Morengo	170	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
361	Ceramic Frit Windows and Mechanical Screens	171	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
421	Hope Flight	103	37.7631512000000029	-122.421996100000001	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
362	George Washington	172	37.7774299000000013	-122.491083000000003	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
363	California Industrial Scenes	173	37.8023686000000012	-122.405819399999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
364	Salt Peanuts	174	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
365	Whales	175	37.7277893999999989	-122.451724999999996	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
366	Namoo House	176	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
367	Incomplete Metamorphosis	176	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
368	Untitled [glass panels]	177	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
369	Untitled	177	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
370	Untitled	177	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
371	Untitled	177	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
372	Untitled [glass panels]	177	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
373	Untitled [glass block windows]	177	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
374	Untitled [glass panels]	177	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
375	Untitled	177	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
376	Untitled [glass panels]	177	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
377	Untitled [glass panels]	177	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
378	Untitled [glass panels]	177	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
379	Untitled [glass panels]	177	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
380	Untitled [glass panels]	177	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
381	Untitled [glass panels]	177	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
382	Untitled [glass panels]	177	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
383	Untitled [glass panels]	177	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
384	A Horse of Another Color	178	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
385	Welcome	179	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
386	19th Avenue Shelter at Winston Drive	180	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
387	19th Avenue Shelter at Holloway Avenue	180	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
388	St. Francis of Assisi (Feeding the Birds)	181	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
389	Landscape	182	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
390	Landscape	182	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
391	Untitled [ceramic relief]	182	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
392	Untitled [wood relief]	182	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
393	Untitled [wood relief]	182	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
394	Untitled [wood relief]	182	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
395	Horizontal Feeling	182	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
396		5	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
397	Untitled [ceramic relief]	182	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
398	Untitled [ceramic relief]	182	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
399	Sky Dancing	182	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
400	Untitled [wood relief]	182	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
401	Untitled Mural	183	37.7927779999999984	-122.404786000000001	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
402	Untitled Mural	183	37.7927779999999984	-122.404786000000001	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
403	Roald Amundsen (1872-1928)	184	37.7704353999999967	-122.510870699999998	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
404	Hope Flight	103	37.7631512000000029	-122.421996100000001	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
405	Hope Flight	103	37.7631512000000029	-122.421996100000001	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
406	Hope Flight	103	37.7631512000000029	-122.421996100000001	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
407	Hope Flight	103	37.7631512000000029	-122.421996100000001	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
408	Endangered Garden	185	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
409	Hope Flight	103	37.7631512000000029	-122.421996100000001	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
410	Folks in the 'Hood	103	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
411	Hope Flight	103	37.7631512000000029	-122.421996100000001	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
412	Hope Flight	103	37.7631512000000029	-122.421996100000001	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
413	Hope Flight	103	37.7631512000000029	-122.421996100000001	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
414	Hope Flight	103	37.7631512000000029	-122.421996100000001	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
415	Hope Flight	103	37.7631512000000029	-122.421996100000001	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
416	Hope Flight	103	37.7631512000000029	-122.421996100000001	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
417	Hope Flight	103	37.7631512000000029	-122.421996100000001	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
418	Hope Flight	103	37.7631512000000029	-122.421996100000001	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
419	Hope Flight	103	37.7631512000000029	-122.421996100000001	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
420	Hope Flight	103	37.7631512000000029	-122.421996100000001	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
422	Willie L Brown Bust	186	37.7793132999999983	-122.418409400000002	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
423	Hope Flight	103	37.7631512000000029	-122.421996100000001	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
424	Hope Flight	103	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
425	Time to Dream	187	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
426	Good Luck Piece	188	37.7798185999999987	-122.464214999999996	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
427	Untitled	189	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
428	Wind Portal	190	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
429	Untitled [Rolph Playground]	191	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
430	The Greenhouse Project	190	3772	-122.456377200000006	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
431	Gateway	192	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
432	Greeting a Totem	193	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
433	Torso	193	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
434	Bronze Horse	194	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
435	Gate F Sculpture	195	37.7129102999999972	-122.385133199999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
436	somewhere	196	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
437	Flight Patterns	197	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
438	San Francisco Bay Area Bird Encounters	198	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
439	Anemone	199	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
440	Miraloma Fieldhouse Bathrooms	200	37.7392770000000013	-122.448702999999995	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
441	Stern Grove Trocadero Clubhouse	200	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
442	Flight Thrills	201	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
443	Bay Area Victorian, Bay Area Deco, Bay Area Funk	202	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
444		5	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
445	Amundsen Historical Plaque	203	37.7704353999999967	-122.510870699999998	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
446	Stacking Stones	204	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
447	Los Ninos del Sol	191	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
448	People and Places of San Francisco	205	37.7678790000000006	-122.510283999999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
449	Advancement of Learning through the Printing Press	205	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
450	Powell Street	205	37.8023686000000012	-122.405819399999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
451	Night Passage	206	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
452		5	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
453	California Agricultural Industry	207	37.8023686000000012	-122.405819399999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
454	100 Years of Progress of Chinese in America	208	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
455	Into the Light	209	37.7788639999999987	-122.415783000000005	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
456	Tectonic Melange	210	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
457	The Smile of Reason	211	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
458	Six Degrees	212	37.7243764999999982	-122.459639600000003	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
459	What's Missing	213	37.7699161000000032	-122.466184600000005	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
460	Where the Land Meets the Sea	213	37.7690399999999968	-122.483519299999998	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
461	Take Off	214	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
462	Map No. 33	214	37.7816900999999987	-122.394087299999995	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
463	NEVERODDOREVEN	215	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
464	Angulos en Todas Direciones	216	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
465	Connecting Mural Bands	216	37.7557795000000027	-122.404443099999995	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
466	Angulos en Todas Direciones	216	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
467	Untitled	217	37.7557795000000027	-122.404443099999995	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
468	One Step at a Time	217	37.7782752999999971	-122.418534399999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
469	Waiting	218	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
470	Layla	219	37.7554415000000034	-122.418761599999996	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
471	Swing Daddy	219	37.7554415000000034	-122.418761599999996	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
472	Historic Signage Project	220	37.797676899999999	-122.394338700000006	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
473	Blueprints	221	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
474	Sailor and Mermaid	222	37.7595959000000008	-122.482220999999996	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
475	Untitled	222	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
476	Goddess of Democracy	223	37.7947174999999973	-122.404868800000003	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
477	Petanque et St-Savin IV	224	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
478	Ndebele	224	37.7250944999999973	-122.381934099999995	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
479	Untitled	225	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
480	Juan Bautista de Anza	226	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
481	Glass Rondella	227	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
482	Glass Rondella	227	37.4178457000000009	-122.206308300000003	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
483	Father William D. McKinnon ( -1902)	228	37.7690399999999968	-122.483519299999998	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
484	Untitled [Potrero Del Sol Park]	191	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
485	Untitled [mosaics]	5	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
486	International Longshoremen's & Warehousemen's Union Memorial (ILWU)	229	37.7919941999999978	-122.391655099999994	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
487	Deities of Knowledge, Culture and Literature	230	37.7788639999999987	-122.415783000000005	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
488	Standing Figure Knife Edged- Winged Figure	231	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
489	Large Four Piece Reclining Figure	231	37.7903779999999969	-122.422254800000005	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
490	Miguel Cervantes (1547-1616)	232	37.7703537000000011	-122.466671099999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
491	Sarah B. Cooper Memorial	233	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
492	Murals for Acme Beer Company	234	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
493	San Francisco Bay, North	234	37.8023686000000012	-122.405819399999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
494	The Great Transparents	235	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
495	Tiger II	236	37.7336172999999988	-122.504921100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
496	Cougar III	236	37.7336172999999988	-122.504921100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
497	Hawk V	237	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
498	Untitled Proposal	238	37.8012620000000013	-122.433020999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
499	Mujer Pagada No.4	238	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
500	Figure	239	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
501	Untitled	240	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
502	Blue Deer	241	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
503	Billboard Series: Exploded Transverse with no Nuggies	242	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
504	Guardian Serpent	243	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
505	Miguel Hidalgo Y Costilla	244	37.7596964999999969	-122.428221300000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
506	San Francisco Bay	245	37.8023686000000012	-122.405819399999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
507	Seabirds and Bay Area Map	245	37.8023686000000012	-122.405819399999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
508	Leonardo da Vinci	246	37.7277893999999989	-122.451724999999996	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
509	Edison	247	37.7277893999999989	-122.451724999999996	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
510	Power	248	37.8023686000000012	-122.405819399999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
511	Education (Theory and Science)	248	37.7277893999999989	-122.451724999999996	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
512	Untitled	249	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
513	Untitled	249	37.7321019000000035	-122.389688399999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
514	Sculpture Garden	249	37.725685900000002	-122.450847800000005	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
515	Invocation	250	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
516	Edward Robeson Taylor (1838-1923)	251	37.7793132999999983	-122.418409400000002	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
517	Courthouse Entry Doors	252	37.780382000000003	-122.41883	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
518	Ashurbanipal	253	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
519	Luisa Tetrazzini (1874-1940) Plaque	254	37.7876663999999991	-122.403424799999996	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
520	Volunteer Fireman Memorial	254	37.7324503000000036	-122.1569535	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
521	Cat	8	37.7665964999999986	-122.423304299999998	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
522	Raphael Weill (1837-1920) Plaque	254	37.7836072999999999	-122.501912300000001	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
523	James D. Phelan (1861-1930)	254	37.7793132999999983	-122.418409400000002	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
524	General John J. Pershing (1860-1948)	254	37.7703537000000011	-122.466671099999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
525	William C. Ralston (1826-1875) Monument	254	3737	-122.439113699999993	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
526	Abraham Lincoln (1809-1865)	254	37.7793132999999983	-122.418409400000002	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
527	James Rolph, Jr. (1869-1934)	254	37.7793132999999983	-122.418409400000002	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
528	Frederick Funston (1865-1917)	254	37.7793132999999983	-122.418409400000002	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
529	Raizes/Roots	255	37.7567493999999968	-122.423611199999996	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
530	Mohandas K. Gandhi	256	37.7956640000000021	-122.391683299999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
531	Bronze Icosahedron	257	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
532	Lion	258	37.7703537000000011	-122.466671099999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
533	The Land	3	37.7715030000000027	-122.467646000000002	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
534	The Sea	3	37.7715030000000027	-122.467646000000002	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
535	Night	3	37.7716729999999998	-122.467484999999996	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
536	The Mountains	3	37.7715030000000027	-122.467646000000002	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
537	The Land	3	37.7715030000000027	-122.467646000000002	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
538	The Forests	3	37.7715030000000027	-122.467646000000002	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
539	The Sea	3	37.7715030000000027	-122.467646000000002	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
540	The Sea	3	37.7715030000000027	-122.467646000000002	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
541	The Sea	3	37.7715030000000027	-122.467646000000002	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
542	The Sea	3	37.7715030000000027	-122.467646000000002	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
543	The Land	3	37.7715030000000027	-122.467646000000002	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
544	Untitled	259	37.7770166000000032	-122.405960100000001	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
545	Scaling Harmonics	260	37.7574923000000027	-122.398966999999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
546	Ghinlon/Transcope	260	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
547	Epic; Prediction; Gameboard; and H20	261	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
548	Flying Dragon-Snake-Monkey-Bird	261	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
549	Untitled	262	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
550	Cilindro Costruito	263	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
551	Robert Louis Stevenson (1850-1894) Memorial	264	37.7947174999999973	-122.404868800000003	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
552	Hallidie Building	265	37.7793132999999983	-122.418409400000002	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
553	Pylon of the Golden Gate Bridge	265	37.7793132999999983	-122.418409400000002	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
554	City Hall Dome	265	37.7793132999999983	-122.418409400000002	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
555	San Francisco Victorian, Italianate Style	265	37.7793132999999983	-122.418409400000002	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
556	Ocean Current	266	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
557	The Flower Inside Us Grows	267	37.7708409999999972	-122.420664000000002	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
558	You Were in Heaven	268	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
559	Passage	269	37.8012620000000013	-122.433020999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
560	Family Court Waiting Area	268	37.780382000000003	-122.41883	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
561	Guglielmo Marconi (1874-1937) Memorial Plaque	270	37.8029189000000017	-122.412311000000003	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
562	American Bison--Buffalo	271	37.7557795000000027	-122.404443099999995	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
563	Sphinx	13	37.7703537000000011	-122.466671099999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
564	Grapevine	272	37.7802634999999967	-122.416384199999996	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
565	Oracle	16	37.7835988	-122.404782400000002	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
566	Untitled	16	37.7975528999999995	-122.405408499999993	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
567	Frank Marini (1862-1952)	273	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
568	Urns	274	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
569	Street Life	275	37946	-122.403794599999998	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
570	Mayor George Christopher	276	37.7793132999999983	-122.418409400000002	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
571	The Golden Fruit	4	37.8028346999999982	-122.448387600000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
572	Ideals in Art	4	37.8028346999999982	-122.448387600000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
573	The Golden Grain	4	37.8028346999999982	-122.448387600000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
574	The Birth of European Art	4	37.8028346999999982	-122.448387600000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
575	The Golden Metal	4	37.8028346999999982	-122.448387600000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
576	The Golden Poppy	4	37.8028346999999982	-122.448387600000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
577	Philosopher's Walk	277	37.7176345999999967	-122.419529600000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
578	Bust of Dianne Feinstein	278	37.7793132999999983	-122.418409400000002	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
579	John F. Shelley	279	37.7793132999999983	-122.418409400000002	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
580	The Thinker	280	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
581	Goethe and Schiller	281	37.7703537000000011	-122.466671099999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
582	Untitled	282	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
583	Companion Place, a Complement to the Comfort Garden	283	37.7557795000000027	-122.404443099999995	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
584	Double L Eccentric Gyratory	284	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
585	Thinking of Balmy Alley	285	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
586	Angels of Mercy	286	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
587	On Target Podium	286	37.7299278999999999	-122.397303600000001	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
588	Indian Spoon Sconces	286	37.7298049999999989	-122.399247000000003	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
589	Maasai Warrior Shield Light Sconces	286	37.7299278999999999	-122.397303600000001	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
590	Indian Spoon Sconces	286	37.7298049999999989	-122.399247000000003	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
591	Akamba Inlay Floor	286	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
592	Granary Bobo Bench	286	37.7299278999999999	-122.397303600000001	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
593	Untitled	287	37.7557795000000027	-122.404443099999995	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
594	Marriage of the Artistic Expression of the North and South of this Continent	288	37.725685900000002	-122.450847800000005	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
595	Azul, Azul Y Hacer	289	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
596	Untitled	289	37.8012620000000013	-122.433020999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
597	The Three Shades	280	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
598	Light Lines	290	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
599	Andrew Furuseth (1854-1938)	291	37.797676899999999	-122.394338700000006	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
600	Diagonal Relief	292	37.7165812000000003	-122.400142500000001	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
601	The Child Sees: Big Snail Fish	293	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
602	Air Over Under 	294	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
603	Locus	295	37.802453100000001	-122.412216299999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
604	Nuotatori	295	37.802453100000001	-122.412216299999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
605	Welcome Hands	296	37.7598405000000028	-122.436535800000001	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
606	From the Heart Outwards	296	37.7598405000000028	-122.436535800000001	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
607	Untitled [group of animals]	297	37.7683778000000032	-122.457162299999993	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
608	Letter's Missing	298	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
609	General Ulysses Simpson Grant (1822-1885)	299	37.7703537000000011	-122.466671099999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
610	California Theater Plaque	300	37.7906481999999997	-122.404871099999994	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
611	Joseph B. Strauss (1870-1938) Memorial	301	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
612	Building the Iron Horse	5	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
613	Sheriff Star Plaza	302	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
614	The Holocaust	303	37.787739000000002	-122.505670100000003	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
615	Untitled	304	37.785650099999998	-122.442521600000006	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
616	Untitled (Planter)	305	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
617	Untitled (Planter)	305	3768	-122.403767999999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
618	Bay Area Foothills	306	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
619	Cliffs at Land's End	306	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
620	Marin Headlands	306	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
621	Untitled [frosted glass panels]	307	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
622	Martha H.	308	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
623	The Cider Press	309	37.7703537000000011	-122.466671099999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
624	Untitled	310	37.7557795000000027	-122.404443099999995	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
625	Spider Pelt	311	37.7843370000000007	-122.399407400000001	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
626	Fish Tale	312	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
627	Peace Monument	313	37.787739000000002	-122.505670100000003	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
629	Untitled	315	37.7842914000000007	-122.412216299999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
630	Metamorphosis	316	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
631	Building the Iron Horse	5	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
632	Building the Iron Horse	5	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
633		5	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
634		5	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
635		5	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
636	Untitled [Sculpture Reliefs]	5	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
637	Welcome North, Welcome South, Welcome East, Welcome West	317	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
638	Ceiling Flood	318	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
639	Butterfly Wall	319	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
640	Spine	320	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
641	James M. Seawell (1836-1917)	321	37.7793132999999983	-122.418409400000002	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
642	Industries of California	321	37.8023686000000012	-122.405819399999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
643	Edmund Godchaux (1849-1939)	321	\N	-122.138582	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
644	Contemporary Education	321	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
645	The Brotherhood of Man	322	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
646	Limits of Horizon II	323	37.7953906999999987	-122.399180299999998	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
647	Francis Scott Key (1780-1843)	324	37.7703537000000011	-122.466671099999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
648	Conquest of Space, 1983	325	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
649	Hitwood	326	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
650	here and past here	327	37.759960999999997	-122.397604599999994	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
651	85194	328	37.7791811000000024	-122.415859699999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
652	Sports	329	37.8023686000000012	-122.405819399999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
653	18th Street Downgrade	330	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
654	Mechanics Monument (Peter Donahue-1829-1885)	6	37.7907873999999993	-122.399464899999998	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
655	Swimmer's Waves	331	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
656	Native Sons Monument (Admission Day Monument)	6	37.7887757000000022	-122.402006600000007	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
657	Mechanics Monument (Peter Donahue-1829-1885)	6	37.7907873999999993	-122.399464899999998	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
658	Padre Junipero Serra (1713-1784)	6	37.7703537000000011	-122.466671099999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
659	California Volunteers, Spanish American War, 1898	6	37.7691598999999982	-122.426711900000001	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
660	Behind Ted McCann's Garage	332	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
661	Sun Spheres	333	37.7240936000000033	-122.457363400000006	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
662	The Red Horizon	334	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
663	Untitled	335	37.7323427999999979	-122.405973900000006	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
664	Untitled	335	37.7323427999999979	-122.405973900000006	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
665	The Embarcadero Fountain	336	37.7948985000000022	-122.394593799999996	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
666	Untitled	337	37.7436618999999993	-122.440450400000003	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
667	Garden of Alice	338	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
668	Jungle Scenes	338	37.7277893999999989	-122.451724999999996	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
669	Department Store	339	37.8023686000000012	-122.405819399999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
670	Untitled	340	37.7557795000000027	-122.404443099999995	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
671	Untitled	340	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
672	Simon Bolivar	341	\N	\N	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
673	Education (Organic and Inorganic Science)	342	37.7277893999999989	-122.451724999999996	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
674	The Child	343	37.7683778000000032	-122.457162299999993	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
675	Untitled	344	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
676	Stiff Loops (Loop IV)	345	37.7557795000000027	-122.404443099999995	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
677	Ignatz and Sigmund Steinhart (1840-1917)	346	37.7699161000000032	-122.466184600000005	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
678	Untitled	347	37.7842191000000014	-122.434810299999995	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
679	Untitled	347	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
680	Words Fly Away	348	37.7142193999999975	-122.465946799999998	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
681	Fire, Earth, Water, Air, The Professions	349	37.7478586000000007	-122.455665100000004	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
682	Farmer and Cowboy	350	37.8023686000000012	-122.405819399999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
683	Surveyor and Steelworker	350	37.8023686000000012	-122.405819399999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
684	Void	351	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
685	Light Clouds	352	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
686	Souvenir of San Francisco	353	37.8012620000000013	-122.433020999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
687	Sunnyside Menagerie	354	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
688	Take Root	355	37.7952220999999966	-122.409839399999996	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
689	Falling Water Santa Cruz II	356	37.6152230000000003	-122.389978999999997	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
690	Library	357	37.8023686000000012	-122.405819399999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
691	California Wildflowers	358	37.7749294999999989	-122.419415499999999	Lorem ipsum dolor sit amet, consectetur adipiscing elit.	What color is everything?	everything!
\.


--
-- Name: arts_art_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('arts_art_id_seq', 691, true);


--
-- Data for Name: leaders; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY leaders (leader_id, team_name, total_minutes) FROM stdin;
1	Balloonicorn	60
2	Ada	122
3	Hackbright	87
4	Team Go	99
5	Winners	186
6	Pythoners	202
7	Yay! Us!	258
8	Coders	152
9	WeLovePython	129
10	SFers	138
\.


--
-- Name: leaders_leader_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('leaders_leader_id_seq', 10, true);


--
-- Data for Name: parks; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY parks (park_id, parkname, type_id, lat, lon, clue, question, answer) FROM stdin;
1	10TH AVE/CLEMENT MINI PARK	10	37.7818439699999971	-122.468099080000002			
2	15TH AVENUE STEPS	10	37.7595649300000034	-122.472267830000007			
3	24TH/YORK MINI PARK	10	37.7530604199999971	-122.408575429999999			
4	29TH/DIAMOND OPEN SPACE	9	37.7436021099999977	-122.435235890000001			
5	ADAM ROGERS PARK	9	37.7310164499999985	-122.383854659999997			
6	ALAMO SQUARE	9	37.7763487499999968	-122.434673959999998			
7	ALICE CHALMERS PLAYGROUND	9	37.7098270999999983	-122.446650649999995			
8	ALICE MARBLE TENNIS COURTS	9	37.8014277600000028	-122.420343270000004			
9	ALIOTO MINI PARK	10	37.7589019600000029	-122.41821702			
10	ALLYNE PARK	9	37.7974606599999987	-122.427599920000006			
11	ALTA PLAZA	9	37.7911733299999995	-122.437669779999993			
12	ANGELO J. ROSSI PLAYGROUND	9	37.7787418599999967	-122.45745402			
13	APTOS PLAYGROUND	9	37.7285246000000001	-122.466540850000001			
14	ARGONNE PLAYGROUND	9	37.7794150000000002	-122.477699759999993			
15	Arlington Community Garden	1	37.7370432499999993	-122.426376239999996			
16	BALBOA NATURAL AREA	9	37.7759128499999974	-122.511039490000002			
17	BALBOA PARK	9	37.7249486099999984	-122.444626589999999			
18	BAY VIEW PLAYGROUND	9	37.7259390600000017	-122.393294359999999			
19	BEIDEMAN/O'FARRELL MINI PARK	10	37.782388939999997	-122.438616539999998			
20	BERKELEY WAY OPEN SPACE	9	37.7395669699999985	-122.439959029999997			
21	BERNAL HEIGHTS RECREATION CENTER	9	37.7384463599999975	-122.416156849999993			
22	BILLY GOAT HILL	9	37.7414078700000033	-122.433198719999993			
23	BROADWAY TUNNEL EAST MINI PARK	10	37.7969968199999968	-122.412901000000005			
24	BROADWAY TUNNEL WEST MINI PARK	10	37.7964357600000014	-122.417423189999994			
25	BROOKS PARK	9	37.7172739700000008	-122.46676875			
26	BROTHERHOOD/CHESTER MINI PARK	10	37.7123824900000031	-122.469903180000003			
27	BUCHANAN STREET MALL	9	37.7794953100000015	-122.428564809999997			
28	BUENA VISTA PARK	3	37.7685638999999966	-122.441379449999999			
29	BUSH/BRODERICK MINI PARK	10	37.7855781399999984	-122.442535109999994			
30	CABRILLO PLAYGROUND	9	37.7728667200000032	-122.498702140000006			
31	CAMP MATHER	8	37.8816021800000016	-119.850760050000005			
32	CANDLESTICK PARK	4	37.7132769199999984	-122.384835719999998			
33	CARL LARSEN PARK	9	37.7392978199999973	-122.475966029999995			
34	CAYUGA PLAYGROUND	9	37.7138881400000017	-122.450297190000001			
35	CAYUGA/LAMARTINE MINI PARK	10	37.7303375799999969	-122.432942639999993			
36	CHESTNUT/KEARNY OPEN SPACE	10	37.8045412499999998	-122.407090699999998			
37	CHINESE RECREATION CENTER	9	37.7942096499999991	-122.411785769999994			
38	Clipper Terrace Community Garden	1	37.7478502100000028	-122.443174350000007			
39	COLERIDGE MINI PARK	10	37.7444226599999979	-122.419666469999996			
40	COLLIS P. HUNTINGTON PARK	6	37.7921657600000032	-122.412152939999999			
41	CORONA HEIGHTS	9	37.7649767099999991	-122.438796909999994			
42	Corwin Community Garden	1	37.757230149999998	-122.439023129999995			
43	COSO/PRECITA MINI PARK	10	37.7462435400000018	-122.418120329999994			
44	COTTAGE ROW MINI PARK	10	37.7865709900000013	-122.432310200000003			
45	COW HOLLOW PLAYGROUND	9	37.797338289999999	-122.44485143			
46	CROCKER AMAZON PLAYGROUND	9	37.7140459000000021	-122.429238659999996			
47	Dearborn Community Garden	1	37.7623783299999971	-122.422743530000005			
48	DIAMOND/FARNUM OPEN SPACE	9	37.7388024099999981	-122.434310839999995			
49	DOROTHY ERSKINE PARK	9	37.7339124900000016	-122.439445359999993			
50	DOUGLASS PLAYGROUND	9	37.7472782299999992	-122.438932829999999			
51	DUBOCE PARK	9	37.7696150000000017	-122.433427839999993			
52	DUNCAN/CASTRO OPEN SPACE	9	37.7459493100000003	-122.433394089999993			
53	DUPONT COURTS	9	37.7826878699999966	-122.490833100000003			
54	EDGEHILL MOUNTAIN	9	37.7420302499999991	-122.459764719999995			
55	EUREKA VALLEY REC CENTER	9	37.7597895700000024	-122.436480689999996			
56	EVERSON/DIGBY LOTS	9	37.7380764299999996	-122.431775740000006			
57	EXCELSIOR PLAYGROUND	9	37.7203554000000025	-122.433218620000005			
58	FAIRMOUNT PLAZA	9	37.738492260000001	-122.429131470000002			
59	FATHER ALFRED E. BOEDDEKER PARK	9	37.7843951300000001	-122.412059099999993			
60	FAY PARK	9	37.8028903100000022	-122.417844299999999			
61	FILLMORE/TURK MINI PARK	10	37.7801858799999977	-122.431780380000006			
62	FRANKLIN SQUARE	9	37.7650150600000032	-122.409314800000004			
63	FULTON PLAYGROUND	9	37.7733822000000004	-122.486934050000002			
64	GARFIELD SQUARE	9	37.7502005799999978	-122.412235600000002			
65	GENE FRIEND REC CENTER	9	37.778639290000001	-122.406351909999998			
66	GENEVA AVENUE STRIP	10	37.7204608199999996	-122.445464119999997			
67	GEORGE CHRISTOPHER PLAYGROUND	9	37.7434701399999994	-122.440550369999997			
68	GILMAN PLAYGROUND	9	37.7169820200000032	-122.388090210000001			
69	GLEN PARK	3	37.7400256999999968	-122.442732250000006			
70	GOLDEN GATE HEIGHTS PARK	9	37.7499853799999983	-122.469406739999997			
71	GOLDEN GATE PARK	3	37.7690589099999983	-122.480948209999994			
72	GOLDEN GATE/STEINER MINI PARK	10	37.7795826500000018	-122.433451520000006			
73	Good Prospect Community Garden	1	37.740024990000002	-122.420977339999993			
74	GRAND VIEW OPEN SPACE	9	37.7550722699999994	-122.472351549999999			
75	GRAND VIEW PARK	9	37.7564657100000005	-122.471801279999994			
76	GRATTAN PLAYGROUND	9	37.7625931399999999	-122.451476540000002			
77	HAMILTON REC CENTER	9	37.7844148499999974	-122.436039289999997			
78	HAWK HILL	9	37.746576509999997	-122.468729409999995			
79	HAYES VALLEY PLAYGROUND	9	37.7760603400000008	-122.427367140000001			
80	HEAD/BROTHERHOOD MINI PARK	10	37.7126222200000001	-122.464229239999995			
81	HELEN WILLS PLAYGROUND	9	37.7957729900000032	-122.420661429999996			
82	HERZ PLAYGROUND	9	37.713484440000002	-122.416597319999994			
83	HILLTOP PARK	9	37.7329172800000023	-122.383474789999994			
84	HOWARD/LANGTON MINI PARK	1	37.7772373900000034	-122.40981275			
85	Hunter's Point Recreation Center	9	37.7373499999999993	-122.378339999999994			
86	HYDE/VALLEJO MINI PARK	10	37.7976356400000029	-122.419105639999998			
87	INA COOLBRITH MINI PARK	10	37.7981647300000034	-122.413383710000005			
88	INDIA BASIN SHORELINE PARK	9	37.7336634199999992	-122.373719010000002			
89	INTERIOR GREEN BELT	9	37.7585442000000029	-122.453199350000006			
90	J. P. MURPHY PLAYGROUND	9	37.7518010699999991	-122.465000110000005			
91	JACKSON PLAYGROUND	9	37.7643148000000011	-122.399607200000005			
92	JAMES ROLPH JR PLAYGROUND	9	37.7497273999999976	-122.406231239999997			
93	JAPANTOWN PEACE PLAZA	6	37.7852091099999967	-122.429750979999994			
94	JEFFERSON SQUARE	9	37.7818003399999967	-122.425657920000006			
95	JOE DIMAGGIO PLAYGROUND	9	37.8024834200000015	-122.412069110000004			
96	JOHN MCLAREN PARK	3	37.7180841999999998	-122.41907209			
97	JOOST/BADEN MINI PARK	10	37.73273279	-122.440841699999993			
98	JOSE CORONADO PLAYGROUND	9	37.7575462799999997	-122.415105890000007			
99	JOSEPH CONRAD MINI PARK	10	37.8066724399999998	-122.419062740000001			
100	JOSEPH L. ALIOTO PERFORMING ARTS PIAZZA	6	37.7794804500000012	-122.417599499999994			
101	JOSEPH LEE RECREATION CENTER	9	37.7345349100000007	-122.389411999999993			
102	JULIUS KAHN PLAYGROUND	9	37.7913130600000002	-122.453972750000005			
103	JUNIPERO SERRA PLAYGROUND	9	37.7248233700000029	-122.473851870000004			
104	JURI COMMONS	10	37.7495039100000014	-122.421992450000005			
105	JUSTIN HERMAN/EMBARCADERO PLAZA	6	37.7948797800000023	-122.394765770000006			
106	KELLOCH VELASCO MINI PARK	10	37.7085427100000032	-122.413148770000006			
107	KID POWER PARK	9	37.7641543100000021	-122.420279890000003			
108	KITE HILL	9	37.7582411400000026	-122.441661710000005			
109	KOSHLAND PARK	9	37.7732483500000029	-122.426729420000001			
110	LAFAYETTE PARK	9	37.791549830000001	-122.427671579999995			
111	LAKEVIEW/ASHTON MINI PARK	10	37.7180914500000029	-122.462572699999996			
112	LAUREL HILL PLAYGROUND	9	37.7839367799999977	-122.450939309999995			
113	LECONTE MINI PARK	10	37.7176561300000017	-122.395850699999997			
114	LESSING/SEARS MINI PARK	10	37.708604059999999	-122.455302900000007			
115	LINCOLN PARK	3	37.784238430000002	-122.49838278			
116	LITTLE HOLLYWOOD PARK	9	37.7099690900000013	-122.398208780000004			
117	LOUIS SUTTER PLAYGROUND	9	37.7224598199999974	-122.413924410000007			
118	LOWER GREAT HIGHWAY	2	37.7492806200000004	-122.508175280000003			
119	MARGARET S HAYWARD PLAYGROUND	9	37.7808468300000015	-122.425426999999999			
120	MARITIME PLAZA	6	37.7956051299999984	-122.399238890000007			
121	MCCOPPIN SQUARE	9	37.7438272300000008	-122.480079590000003			
122	MCKINLEY SQUARE	9	37.7591397599999965	-122.404690579999993			
123	MERCED HEIGHTS PLAYGROUND	9	37.717509309999997	-122.470281259999993			
124	MICHELANGELO PLAYGROUND	9	37.8010957300000001	-122.41689916			
125	MIDTOWN TERRACE PLAYGROUND	9	37.7522336700000025	-122.454532459999996			
126	MINNIE & LOVIE WARD REC CENTER	9	37.7157701599999982	-122.457570239999995			
127	MIRALOMA PLAYGROUND	9	37.7386461400000002	-122.449312649999996			
128	MISSION DOLORES PARK	9	37.7597550600000034	-122.427094049999994			
129	MISSION PLAYGROUND	9	37.7592916999999986	-122.422300640000003			
130	MISSION REC CENTER	9	37.7581365899999994	-122.412922249999994			
131	MOSCONE RECREATION CENTER	9	37.8021249000000026	-122.433135320000005			
132	MOUNTAIN LAKE PARK	9	37.7872425699999965	-122.469045399999999			
133	MULLEN/PERALTA MINI PARK	10	37.7460763799999981	-122.408807080000003			
134	MURIEL LEFF MINI PARK	10	37.7800646399999991	-122.46500795			
135	NOE VALLEY COURTS	9	37.7514032400000019	-122.438920960000004			
136	NOE/BEAVER COMMUNITY GARDEN	1	37.764917109999999	-122.433445500000005			
137	Ogden Terrace Community Garden	1	37.7358035700000016	-122.412034109999993			
138	PAGE ST. COMMUNITY GARDEN	1	37.7736233099999978	-122.428101490000003			
139	PAGE/LAGUNA MINI PARK	10	37.7734613900000014	-122.425247810000002			
140	PALACE OF FINE ARTS	6	37.8029989799999981	-122.448512719999997			
141	PALEGA RECREATION CENTER	9	37.7293420499999996	-122.409779999999998			
142	PALOU/PHELPS PARK	9	37.7355138200000013	-122.39472336			
143	Park St Community Garden	1	37.7364706400000003	-122.425776659999997			
144	PARKSIDE SQUARE	9	37.7379478100000014	-122.483905960000001			
145	PARQUE NINOS UNIDOS	9	37.754390530000002	-122.41356906			
146	PATRICIAS GREEN IN HAYES VALLEY	10	37.7762228899999997	-122.42441307			
147	PEIXOTTO PLAYGROUND	9	37.7657883799999965	-122.437905189999995			
148	PINE LAKE PARK	3	37.736308600000001	-122.485927439999998			
149	PORTOLA OPEN SPACE	10	37.7470779699999994	-122.444061559999994			
150	PORTSMOUTH SQUARE	9	37.7948349199999996	-122.405350670000004			
151	POTRERO DEL SOL PARK	9	37.7506069499999981	-122.405079709999995			
152	POTRERO HILL MINI PARK	10	37.7574464200000008	-122.396520699999996			
153	POTRERO HILL RECREATION CENTER	9	37.7561396600000023	-122.396881789999995			
154	PRECITA PARK	9	37.7470623199999977	-122.41202466			
155	PRENTISS MINI PARK	10	37.740217119999997	-122.411873679999999			
156	PRESIDIO HEIGHTS PLAYGROUND	9	37.7884707799999973	-122.449597199999999			
157	RANDOLPH/BRIGHT MINI PARK	10	37.7145121300000028	-122.463693329999998			
158	RAYMOND KIMBELL PLAYGROUND	9	37.782944030000003	-122.435126530000005			
159	RICHMOND PLAYGROUND	9	37.7851301700000022	-122.478111690000006			
160	RICHMOND RECREATION CENTER	9	37.78326998	-122.477976760000004			
161	ROCHAMBEAU PLAYGROUND	9	37.784838520000001	-122.484544080000006			
162	ROCK OUTCROPPING	9	37.7538448700000018	-122.470864789999993			
163	ROLPH NICOL PLAYGROUND	9	37.7306029100000018	-122.480419330000004			
164	ROOSEVELT/HENRY STEPS	10	37.7665595599999975	-122.437322679999994			
165	RUSSIAN HILL OPEN SPACE	9	37.8034161100000006	-122.420756990000001			
166	SAN FRANCISCO ZOO	7	37.7315891599999986	-122.503808570000004			
167	SATURN STREET STEPS	10	37.7626853000000011	-122.440556189999995			
168	SELBY/PALOU MINI PARK	10	37.7388646799999989	-122.400352929999997			
169	SEWARD MINI PARK	10	37.7576105799999979	-122.440060579999994			
170	SGT. JOHN MACAULAY PARK	10	37.7854000099999965	-122.418197430000006			
171	SHARP PARK	3	37.6243943799999983	-122.481891320000003			
172	SIGMUND STERN RECREATION GROVE	3	37.7360822400000018	-122.478297859999998			
173	SILVER TERRACE PLAYGROUND	9	37.7328591099999997	-122.403149580000004			
174	SOUTH END ROWING/DOLPHIN CLUB	4	37.8079604400000022	-122.421263760000002			
175	SOUTH PARK	9	37.7815794899999986	-122.39395227			
176	SOUTH SUNSET PLAYGROUND	9	37.7373867900000022	-122.498451739999993			
177	ST MARY'S REC CENTER	9	37.7336582800000002	-122.420642939999993			
178	ST MARY'S SQUARE	6	37.7920561700000022	-122.40511712			
179	STATES STREET PLAYGROUND	9	37.7638004399999971	-122.43785312			
180	SUE BIERMAN PARK	9	37.795925969999999	-122.396510599999999			
181	SUNNYSIDE CONSERVATORY	10	37.7319357599999989	-122.440761269999996			
182	SUNNYSIDE PLAYGROUND	9	37.7336641200000003	-122.447478700000005			
183	SUNSET PLAYGROUND	9	37.7565887499999988	-122.486846979999996			
184	TANK HILL	9	37.7599480100000022	-122.447686430000005			
185	TENDERLOIN CHILDREN'S REC CENTER	9	37.7848210300000034	-122.415402279999995			
186	TURK/HYDE MINI PARK	10	37.7827403100000012	-122.415962969999995			
187	UNION SQUARE	6	37.7879312199999973	-122.407500490000004			
188	UPPER NOE RECREATION CENTER	9	37.7424309100000031	-122.427797510000005			
189	UTAH/18TH MINI PARK	10	37.7625174499999972	-122.405997589999998			
190	VICTORIA MANALO DRAVES PARK	9	37.777009470000003	-122.405955320000004			
191	VISITACION VALLEY GREENWAY	9	37.7147663800000004	-122.406131939999995			
192	VISITACION VALLEY PLAYGROUND	9	37.71240126	-122.409085469999994			
193	WALTER HAAS PLAYGROUND	9	37.7405838399999993	-122.434369779999997			
194	WASHINGTON SQUARE	6	37.8008378099999973	-122.41002829			
195	WASHINGTON/HYDE MINI PARK	10	37.7940095499999984	-122.417400069999999			
196	WEST PORTAL PLAYGROUND	9	37.7416039200000029	-122.46524393			
197	WEST SUNSET PLAYGROUND	9	37.7489962699999992	-122.498008589999998			
198	White Crane Springs Community Garden	1	37.7575827900000007	-122.463302400000003			
199	WOH HEI YUEN PARK	9	37.7958485799999977	-122.410336490000006			
200	Wolfe Lane Community Garden	1	37.7452840099999989	-122.406603700000005			
201	YOUNGBLOOD COLEMAN PLAYGROUND	9	37.7387679200000008	-122.384502209999994			
202	GUY PLACE MINI PARK	10	37.7750329000483021	-122.419167200306049			
\.


--
-- Name: parks_park_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('parks_park_id_seq', 202, true);


--
-- Data for Name: parktypes; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY parktypes (type_id, title) FROM stdin;
1	Community Garden
2	Parkway
3	Regional Park
4	Concession
5	ParkType
6	Civic Plaza or Square
7	Zoological Garden
8	Family Camp
9	Neighborhood Park or Playground
10	Mini Park
\.


--
-- Name: parktypes_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('parktypes_type_id_seq', 10, true);


--
-- Name: artists_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant; Tablespace: 
--

ALTER TABLE ONLY artists
    ADD CONSTRAINT artists_pkey PRIMARY KEY (artist_id);


--
-- Name: arts_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant; Tablespace: 
--

ALTER TABLE ONLY arts
    ADD CONSTRAINT arts_pkey PRIMARY KEY (art_id);


--
-- Name: leaders_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant; Tablespace: 
--

ALTER TABLE ONLY leaders
    ADD CONSTRAINT leaders_pkey PRIMARY KEY (leader_id);


--
-- Name: parks_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant; Tablespace: 
--

ALTER TABLE ONLY parks
    ADD CONSTRAINT parks_pkey PRIMARY KEY (park_id);


--
-- Name: parktypes_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant; Tablespace: 
--

ALTER TABLE ONLY parktypes
    ADD CONSTRAINT parktypes_pkey PRIMARY KEY (type_id);


--
-- Name: arts_artist_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY arts
    ADD CONSTRAINT arts_artist_id_fkey FOREIGN KEY (artist_id) REFERENCES artists(artist_id);


--
-- Name: parks_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY parks
    ADD CONSTRAINT parks_type_id_fkey FOREIGN KEY (type_id) REFERENCES parktypes(type_id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

