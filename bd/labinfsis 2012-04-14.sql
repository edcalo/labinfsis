-- SQL Manager Lite for PostgreSQL 5.1.0.3
-- ---------------------------------------
-- Host      : localhost
-- Database  : labinfsis
-- Version   : PostgreSQL 9.0.1, compiled by Visual C++ build 1500, 32-bit



SET check_function_bodies = false;
--
-- Structure for table asignaciones (OID = 25374) : 
--
SET search_path = public, pg_catalog;
CREATE TABLE public.asignaciones (
    equipo_id integer NOT NULL,
    id serial NOT NULL,
    laboratorio_id integer NOT NULL,
    fecha_asignacion timestamp(0) without time zone DEFAULT now() NOT NULL,
    fecha_retiro date
) WITHOUT OIDS;
--
-- Structure for table cambios (OID = 25380) : 
--
CREATE TABLE public.cambios (
    componente_id integer NOT NULL,
    id serial NOT NULL,
    fecha date NOT NULL,
    descripcion text NOT NULL
) WITHOUT OIDS;
--
-- Structure for table caracteristicas (OID = 25389) : 
--
CREATE TABLE public.caracteristicas (
    id serial NOT NULL,
    nombre_caracteristica varchar(100) NOT NULL,
    descripcion_caracteristica varchar(255)
) WITHOUT OIDS;
--
-- Structure for table componentes (OID = 25395) : 
--
CREATE TABLE public.componentes (
    id serial NOT NULL,
    modelo_id integer NOT NULL,
    fabricante_id integer NOT NULL,
    equipo_id integer,
    pieza_id integer,
    estado_id integer NOT NULL,
    numero_de_serie varchar(50) NOT NULL
) WITHOUT OIDS;
--
-- Structure for table cuentas (OID = 25401) : 
--
CREATE TABLE public.cuentas (
    id serial NOT NULL,
    rol_id integer NOT NULL,
    persona_id integer NOT NULL,
    usuario integer NOT NULL,
    contrasenia char(40) NOT NULL,
    fecha_registro date DEFAULT now() NOT NULL,
    fecha_caducidad date
) WITHOUT OIDS;
--
-- Structure for table cursos (OID = 25407) : 
--
CREATE TABLE public.cursos (
    id serial NOT NULL,
    tipo_id integer NOT NULL,
    nombre_curso varchar(100) NOT NULL,
    instructor varchar(250) NOT NULL,
    descripcion_curso varchar(255)
) WITHOUT OIDS;
--
-- Structure for table equipos (OID = 25416) : 
--
CREATE TABLE public.equipos (
    id serial NOT NULL,
    estado_id integer NOT NULL,
    nia varchar(50) DEFAULT ''::character varying,
    codigo char(32) NOT NULL,
    nombre_equipo varchar(10) NOT NULL,
    descripcion_equipo varchar(255)
) WITHOUT OIDS;
--
-- Structure for table estados (OID = 25423) : 
--
CREATE TABLE public.estados (
    id serial NOT NULL,
    nombre_estado varchar(250) NOT NULL,
    descripcion_estado varchar(255)
) WITHOUT OIDS;
--
-- Structure for table fabricantes (OID = 25432) : 
--
CREATE TABLE public.fabricantes (
    id serial NOT NULL,
    nombre_fabricante varchar(100) NOT NULL,
    descripcion_fabricante varchar(255)
) WITHOUT OIDS;
--
-- Structure for table laboratorios (OID = 25438) : 
--
CREATE TABLE public.laboratorios (
    id serial NOT NULL,
    nombre_laboratorio varchar(50) NOT NULL,
    numero_de_equipos integer NOT NULL,
    descripcion_laboratorio varchar(255)
) WITHOUT OIDS;
--
-- Structure for table modelos (OID = 25444) : 
--
CREATE TABLE public.modelos (
    id serial NOT NULL,
    nombre_modelo varchar(100) NOT NULL,
    descripcion_marca varchar(100)
) WITHOUT OIDS;
--
-- Structure for table personas (OID = 25450) : 
--
CREATE TABLE public.personas (
    id serial NOT NULL,
    ci char(10) NOT NULL,
    nombres varchar(50) NOT NULL,
    apellido_paterno varchar(50) NOT NULL,
    apellido_materno varchar(50),
    email varchar(100)
) WITHOUT OIDS;
--
-- Structure for table piezas (OID = 25456) : 
--
CREATE TABLE public.piezas (
    id serial NOT NULL,
    nombre_pieza varchar(50) NOT NULL,
    pieza_interna boolean NOT NULL,
    descripcion_pieza varchar(255) NOT NULL
) WITHOUT OIDS;
--
-- Structure for table propiedades (OID = 25462) : 
--
CREATE TABLE public.propiedades (
    id serial NOT NULL,
    componente_id integer NOT NULL,
    caracteristica_id integer NOT NULL,
    valor varchar(100) NOT NULL
) WITHOUT OIDS;
--
-- Structure for table roles (OID = 25468) : 
--
CREATE TABLE public.roles (
    id serial NOT NULL,
    nombre_rol varchar(50) NOT NULL,
    descripcion_rol varchar(255)
) WITHOUT OIDS;
--
-- Structure for table tipos (OID = 25474) : 
--
CREATE TABLE public.tipos (
    id serial NOT NULL,
    nombre_tipo varchar(100) NOT NULL,
    descripcion_tipo varchar(255)
) WITHOUT OIDS;
--
-- Structure for table movimientos (OID = 25480) : 
--
CREATE TABLE public.movimientos (
    id serial NOT NULL,
    equipo_id integer NOT NULL,
    asignacion_id integer NOT NULL,
    fecha_movimiento timestamp(0) without time zone DEFAULT now() NOT NULL,
    observaciones_del_movimiento varchar(255)
) WITHOUT OIDS;
--
-- Structure for table registros (OID = 25487) : 
--
CREATE TABLE public.registros (
    id serial NOT NULL,
    cuenta_id integer NOT NULL,
    persona_id integer NOT NULL,
    equipo_id integer NOT NULL,
    curso_id integer,
    fecha_registro_inicio timestamp(0) without time zone DEFAULT now() NOT NULL,
    fecha_registro_fin timestamp(0) without time zone,
    observaciones_registro varchar(255) DEFAULT ''::character varying NOT NULL
) WITHOUT OIDS;
--
-- Structure for table reviciones (OID = 25495) : 
--
CREATE TABLE public.reviciones (
    id serial NOT NULL,
    equipo_id integer NOT NULL,
    componente_id integer NOT NULL,
    cuenta_id integer NOT NULL,
    marca boolean DEFAULT false NOT NULL,
    fecha_revision date NOT NULL,
    observaciones varchar(255) NOT NULL
) WITHOUT OIDS;
--
-- Data for table public.cuentas (OID = 25401) (LIMIT 0,1)
--
INSERT INTO cuentas (id, rol_id, persona_id, usuario, contrasenia, fecha_registro, fecha_caducidad)
VALUES (3, 1, 1, 200401694, '123456222', '2012-04-14', NULL);

--
-- Data for table public.cursos (OID = 25407) (LIMIT 0,1)
--
INSERT INTO cursos (id, tipo_id, nombre_curso, instructor, descripcion_curso)
VALUES (1, 1, 'Practica', 'el alumno', 'cuando un estudiante usa el laboratorio para hacer una practica de alguna de sus materias');

--
-- Data for table public.equipos (OID = 25416) (LIMIT 0,1)
--
INSERT INTO equipos (id, estado_id, nia, codigo, nombre_equipo, descripcion_equipo)
VALUES (1, 1, '44771', '', 'andromeda1', 'equipo para los aux');

--
-- Data for table public.estados (OID = 25423) (LIMIT 0,1)
--
INSERT INTO estados (id, nombre_estado, descripcion_estado)
VALUES (1, 'Activo', '');

--
-- Data for table public.personas (OID = 25450) (LIMIT 0,1)
--
INSERT INTO personas (id, ci, nombres, apellido_paterno, apellido_materno, email)
VALUES (1, '6449288', 'Jorge Rubens', 'Lipa', 'Challapa', 'jorge.lipa@gmail.com');

--
-- Data for table public.roles (OID = 25468) (LIMIT 0,3)
--
INSERT INTO roles (id, nombre_rol, descripcion_rol)
VALUES (1, 'Administrador', '');

INSERT INTO roles (id, nombre_rol, descripcion_rol)
VALUES (2, 'Auxiliar Titular', '');

INSERT INTO roles (id, nombre_rol, descripcion_rol)
VALUES (3, 'Auxiliar Adhonorem', '');

--
-- Data for table public.tipos (OID = 25474) (LIMIT 0,1)
--
INSERT INTO tipos (id, nombre_tipo, descripcion_tipo)
VALUES (1, 'Curricular', 'Es un curso perteneciente a una de las materias curriculares de las carreras de informatica sistemas');

--
-- Data for table public.registros (OID = 25487) (LIMIT 0,4)
--
INSERT INTO registros (id, cuenta_id, persona_id, equipo_id, curso_id, fecha_registro_inicio, fecha_registro_fin, observaciones_registro)
VALUES (1, 3, 1, 1, 1, '2012-04-14 16:42:00', '2012-04-14 16:42:00', '');

INSERT INTO registros (id, cuenta_id, persona_id, equipo_id, curso_id, fecha_registro_inicio, fecha_registro_fin, observaciones_registro)
VALUES (2, 3, 1, 1, 1, '2012-04-14 10:19:24', NULL, '');

INSERT INTO registros (id, cuenta_id, persona_id, equipo_id, curso_id, fecha_registro_inicio, fecha_registro_fin, observaciones_registro)
VALUES (3, 3, 1, 1, 1, '2012-04-14 10:19:34', NULL, '');

INSERT INTO registros (id, cuenta_id, persona_id, equipo_id, curso_id, fecha_registro_inicio, fecha_registro_fin, observaciones_registro)
VALUES (4, 3, 1, 1, 1, '2012-04-14 10:20:07', NULL, '');

--
-- Definition for index equipo_asignado (OID = 25500) : 
--
CREATE INDEX equipo_asignado ON asignaciones USING btree (equipo_id);
--
-- Definition for index viejo_componente (OID = 25501) : 
--
CREATE INDEX viejo_componente ON cambios USING btree (componente_id);
--
-- Definition for index equipo_fk (OID = 25502) : 
--
CREATE INDEX equipo_fk ON componentes USING btree (equipo_id);
--
-- Definition for index piezas_fk (OID = 25503) : 
--
CREATE INDEX piezas_fk ON componentes USING btree (pieza_id);
--
-- Definition for index estado_fk (OID = 25504) : 
--
CREATE INDEX estado_fk ON componentes USING btree (estado_id);
--
-- Definition for index modelo_fk (OID = 25505) : 
--
CREATE INDEX modelo_fk ON componentes USING btree (modelo_id);
--
-- Definition for index fabrica_fk (OID = 25506) : 
--
CREATE INDEX fabrica_fk ON componentes USING btree (fabricante_id);
--
-- Definition for index persona_fk (OID = 25507) : 
--
CREATE INDEX persona_fk ON cuentas USING btree (persona_id);
--
-- Definition for index rol_fk (OID = 25508) : 
--
CREATE INDEX rol_fk ON cuentas USING btree (rol_id);
--
-- Definition for index tipo_fk (OID = 25509) : 
--
CREATE INDEX tipo_fk ON cursos USING btree (tipo_id);
--
-- Definition for index esta_en_estado_fk (OID = 25510) : 
--
CREATE INDEX esta_en_estado_fk ON equipos USING btree (estado_id);
--
-- Definition for index fabricantes_pk (OID = 25511) : 
--
CREATE UNIQUE INDEX fabricantes_pk ON fabricantes USING btree (id);
--
-- Definition for index modelo_pk (OID = 25512) : 
--
CREATE UNIQUE INDEX modelo_pk ON modelos USING btree (id);
--
-- Definition for index titne_propiedad_fk (OID = 25513) : 
--
CREATE INDEX titne_propiedad_fk ON propiedades USING btree (componente_id);
--
-- Definition for index de_una_propiedad_fk (OID = 25514) : 
--
CREATE INDEX de_una_propiedad_fk ON propiedades USING btree (caracteristica_id);
--
-- Definition for index es_registrado_fk (OID = 25515) : 
--
CREATE INDEX es_registrado_fk ON registros USING btree (persona_id);
--
-- Definition for index es_registrado_por_fk (OID = 25516) : 
--
CREATE INDEX es_registrado_por_fk ON registros USING btree (cuenta_id);
--
-- Definition for index es_usado_fk (OID = 25517) : 
--
CREATE INDEX es_usado_fk ON registros USING btree (equipo_id);
--
-- Definition for index para_un_curso_fk (OID = 25518) : 
--
CREATE INDEX para_un_curso_fk ON registros USING btree (curso_id);
--
-- Definition for index de_un_equipo_fk (OID = 25519) : 
--
CREATE INDEX de_un_equipo_fk ON reviciones USING btree (equipo_id);
--
-- Definition for index lo_revizo_fk (OID = 25520) : 
--
CREATE INDEX lo_revizo_fk ON reviciones USING btree (cuenta_id);
--
-- Definition for index sus_componentes_fk (OID = 25521) : 
--
CREATE INDEX sus_componentes_fk ON reviciones USING btree (componente_id);
--
-- Definition for index laboratorio_asignado (OID = 25522) : 
--
CREATE INDEX laboratorio_asignado ON asignaciones USING btree (laboratorio_id);
--
-- Definition for index pk_asignaciones (OID = 25523) : 
--
ALTER TABLE ONLY asignaciones
    ADD CONSTRAINT pk_asignaciones
    PRIMARY KEY (id);
--
-- Definition for index pk_cambios (OID = 25525) : 
--
ALTER TABLE ONLY cambios
    ADD CONSTRAINT pk_cambios
    PRIMARY KEY (id);
--
-- Definition for index pk_caracteristicas (OID = 25527) : 
--
ALTER TABLE ONLY caracteristicas
    ADD CONSTRAINT pk_caracteristicas
    PRIMARY KEY (id);
--
-- Definition for index pk_componentes (OID = 25529) : 
--
ALTER TABLE ONLY componentes
    ADD CONSTRAINT pk_componentes
    PRIMARY KEY (id);
--
-- Definition for index pk_cuentas (OID = 25531) : 
--
ALTER TABLE ONLY cuentas
    ADD CONSTRAINT pk_cuentas
    PRIMARY KEY (id);
--
-- Definition for index pk_cursos (OID = 25533) : 
--
ALTER TABLE ONLY cursos
    ADD CONSTRAINT pk_cursos
    PRIMARY KEY (id);
--
-- Definition for index pk_equipos (OID = 25535) : 
--
ALTER TABLE ONLY equipos
    ADD CONSTRAINT pk_equipos
    PRIMARY KEY (id);
--
-- Definition for index pk_estados (OID = 25537) : 
--
ALTER TABLE ONLY estados
    ADD CONSTRAINT pk_estados
    PRIMARY KEY (id);
--
-- Definition for index pk_fabricantes (OID = 25539) : 
--
ALTER TABLE ONLY fabricantes
    ADD CONSTRAINT pk_fabricantes
    PRIMARY KEY (id);
--
-- Definition for index pk_laboratorios (OID = 25541) : 
--
ALTER TABLE ONLY laboratorios
    ADD CONSTRAINT pk_laboratorios
    PRIMARY KEY (id);
--
-- Definition for index pk_modelo (OID = 25543) : 
--
ALTER TABLE ONLY modelos
    ADD CONSTRAINT pk_modelo
    PRIMARY KEY (id);
--
-- Definition for index pk_personas (OID = 25545) : 
--
ALTER TABLE ONLY personas
    ADD CONSTRAINT pk_personas
    PRIMARY KEY (id);
--
-- Definition for index pk_piezas (OID = 25547) : 
--
ALTER TABLE ONLY piezas
    ADD CONSTRAINT pk_piezas
    PRIMARY KEY (id);
--
-- Definition for index pk_propiedades (OID = 25549) : 
--
ALTER TABLE ONLY propiedades
    ADD CONSTRAINT pk_propiedades
    PRIMARY KEY (id);
--
-- Definition for index pk_roles (OID = 25551) : 
--
ALTER TABLE ONLY roles
    ADD CONSTRAINT pk_roles
    PRIMARY KEY (id);
--
-- Definition for index pk_tipos (OID = 25553) : 
--
ALTER TABLE ONLY tipos
    ADD CONSTRAINT pk_tipos
    PRIMARY KEY (id);
--
-- Definition for index fk_cambios_registro__componen (OID = 25555) : 
--
ALTER TABLE ONLY cambios
    ADD CONSTRAINT fk_cambios_registro__componen
    FOREIGN KEY (componente_id) REFERENCES componentes(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
--
-- Definition for index fk_componen_es_de_un__modelo (OID = 25560) : 
--
ALTER TABLE ONLY componentes
    ADD CONSTRAINT fk_componen_es_de_un__modelo
    FOREIGN KEY (modelo_id) REFERENCES modelos(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
--
-- Definition for index fk_componen_fabrica_fabrican (OID = 25565) : 
--
ALTER TABLE ONLY componentes
    ADD CONSTRAINT fk_componen_fabrica_fabrican
    FOREIGN KEY (fabricante_id) REFERENCES fabricantes(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
--
-- Definition for index fk_componen_tiene_com_equipos (OID = 25570) : 
--
ALTER TABLE ONLY componentes
    ADD CONSTRAINT fk_componen_tiene_com_equipos
    FOREIGN KEY (equipo_id) REFERENCES equipos(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
--
-- Definition for index fk_componen_tiene_est_estados (OID = 25575) : 
--
ALTER TABLE ONLY componentes
    ADD CONSTRAINT fk_componen_tiene_est_estados
    FOREIGN KEY (estado_id) REFERENCES estados(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
--
-- Definition for index fk_componen_tiene_pie_piezas (OID = 25580) : 
--
ALTER TABLE ONLY componentes
    ADD CONSTRAINT fk_componen_tiene_pie_piezas
    FOREIGN KEY (pieza_id) REFERENCES piezas(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
--
-- Definition for index fk_cuentas_acceso_ad_roles (OID = 25585) : 
--
ALTER TABLE ONLY cuentas
    ADD CONSTRAINT fk_cuentas_acceso_ad_roles
    FOREIGN KEY (rol_id) REFERENCES roles(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
--
-- Definition for index fk_cuentas_acceso_pe_personas (OID = 25590) : 
--
ALTER TABLE ONLY cuentas
    ADD CONSTRAINT fk_cuentas_acceso_pe_personas
    FOREIGN KEY (persona_id) REFERENCES personas(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
--
-- Definition for index fk_cursos_el_curso__tipos (OID = 25595) : 
--
ALTER TABLE ONLY cursos
    ADD CONSTRAINT fk_cursos_el_curso__tipos
    FOREIGN KEY (tipo_id) REFERENCES tipos(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
--
-- Definition for index fk_equipos_esta_en_e_estados (OID = 25600) : 
--
ALTER TABLE ONLY equipos
    ADD CONSTRAINT fk_equipos_esta_en_e_estados
    FOREIGN KEY (estado_id) REFERENCES estados(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
--
-- Definition for index fk_propieda_de_una_pr_caracter (OID = 25605) : 
--
ALTER TABLE ONLY propiedades
    ADD CONSTRAINT fk_propieda_de_una_pr_caracter
    FOREIGN KEY (caracteristica_id) REFERENCES caracteristicas(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
--
-- Definition for index fk_propieda_titne_pro_componen (OID = 25610) : 
--
ALTER TABLE ONLY propiedades
    ADD CONSTRAINT fk_propieda_titne_pro_componen
    FOREIGN KEY (componente_id) REFERENCES componentes(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
--
-- Definition for index pk_movimientos (OID = 25615) : 
--
ALTER TABLE ONLY movimientos
    ADD CONSTRAINT pk_movimientos
    PRIMARY KEY (id);
--
-- Definition for index asignacion_fk (OID = 25617) : 
--
ALTER TABLE ONLY movimientos
    ADD CONSTRAINT asignacion_fk
    FOREIGN KEY (asignacion_id) REFERENCES asignaciones(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
--
-- Definition for index equipos_fk (OID = 25622) : 
--
ALTER TABLE ONLY movimientos
    ADD CONSTRAINT equipos_fk
    FOREIGN KEY (equipo_id) REFERENCES equipos(id);
--
-- Definition for index pk_registros (OID = 25627) : 
--
ALTER TABLE ONLY registros
    ADD CONSTRAINT pk_registros
    PRIMARY KEY (id);
--
-- Definition for index fk_registro_es_regist_cuentas (OID = 25629) : 
--
ALTER TABLE ONLY registros
    ADD CONSTRAINT fk_registro_es_regist_cuentas
    FOREIGN KEY (cuenta_id) REFERENCES cuentas(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
--
-- Definition for index fk_registro_es_regist_personas (OID = 25634) : 
--
ALTER TABLE ONLY registros
    ADD CONSTRAINT fk_registro_es_regist_personas
    FOREIGN KEY (persona_id) REFERENCES personas(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
--
-- Definition for index fk_registro_es_usado_equipos (OID = 25639) : 
--
ALTER TABLE ONLY registros
    ADD CONSTRAINT fk_registro_es_usado_equipos
    FOREIGN KEY (equipo_id) REFERENCES equipos(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
--
-- Definition for index fk_registro_para_un_c_cursos (OID = 25644) : 
--
ALTER TABLE ONLY registros
    ADD CONSTRAINT fk_registro_para_un_c_cursos
    FOREIGN KEY (curso_id) REFERENCES cursos(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
--
-- Definition for index pk_reviciones (OID = 25649) : 
--
ALTER TABLE ONLY reviciones
    ADD CONSTRAINT pk_reviciones
    PRIMARY KEY (id);
--
-- Definition for index fk_revicion_de_un_equ_equipos (OID = 25651) : 
--
ALTER TABLE ONLY reviciones
    ADD CONSTRAINT fk_revicion_de_un_equ_equipos
    FOREIGN KEY (equipo_id) REFERENCES equipos(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
--
-- Definition for index fk_revicion_lo_revizo_cuentas (OID = 25656) : 
--
ALTER TABLE ONLY reviciones
    ADD CONSTRAINT fk_revicion_lo_revizo_cuentas
    FOREIGN KEY (cuenta_id) REFERENCES cuentas(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
--
-- Definition for index fk_revicion_sus_compo_componen (OID = 25661) : 
--
ALTER TABLE ONLY reviciones
    ADD CONSTRAINT fk_revicion_sus_compo_componen
    FOREIGN KEY (componente_id) REFERENCES componentes(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
--
-- Definition for index fk_laboratorio (OID = 25666) : 
--
ALTER TABLE ONLY asignaciones
    ADD CONSTRAINT fk_laboratorio
    FOREIGN KEY (laboratorio_id) REFERENCES laboratorios(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
--
-- Definition for index fk_equipo (OID = 25671) : 
--
ALTER TABLE ONLY asignaciones
    ADD CONSTRAINT fk_equipo
    FOREIGN KEY (equipo_id) REFERENCES equipos(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
--
-- Data for sequence public.asignaciones_id_seq (OID = 25372)
--
SELECT pg_catalog.setval('asignaciones_id_seq', 3, true);
--
-- Data for sequence public.cambios_id_seq (OID = 25378)
--
SELECT pg_catalog.setval('cambios_id_seq', 1, false);
--
-- Data for sequence public.caracteristicas_id_seq (OID = 25387)
--
SELECT pg_catalog.setval('caracteristicas_id_seq', 1, false);
--
-- Data for sequence public.componentes_id_seq (OID = 25393)
--
SELECT pg_catalog.setval('componentes_id_seq', 1, false);
--
-- Data for sequence public.cuentas_id_seq (OID = 25399)
--
SELECT pg_catalog.setval('cuentas_id_seq', 3, true);
--
-- Data for sequence public.cursos_id_seq (OID = 25405)
--
SELECT pg_catalog.setval('cursos_id_seq', 1, true);
--
-- Data for sequence public.equipos_id_seq (OID = 25414)
--
SELECT pg_catalog.setval('equipos_id_seq', 1, true);
--
-- Data for sequence public.estados_id_seq (OID = 25421)
--
SELECT pg_catalog.setval('estados_id_seq', 1, true);
--
-- Data for sequence public.fabricantes_id_seq (OID = 25430)
--
SELECT pg_catalog.setval('fabricantes_id_seq', 1, false);
--
-- Data for sequence public.laboratorios_id_seq (OID = 25436)
--
SELECT pg_catalog.setval('laboratorios_id_seq', 1, false);
--
-- Data for sequence public.modelos_id_seq (OID = 25442)
--
SELECT pg_catalog.setval('modelos_id_seq', 1, false);
--
-- Data for sequence public.personas_id_seq (OID = 25448)
--
SELECT pg_catalog.setval('personas_id_seq', 1, true);
--
-- Data for sequence public.piezas_id_seq (OID = 25454)
--
SELECT pg_catalog.setval('piezas_id_seq', 1, false);
--
-- Data for sequence public.propiedades_id_seq (OID = 25460)
--
SELECT pg_catalog.setval('propiedades_id_seq', 1, false);
--
-- Data for sequence public.roles_id_seq (OID = 25466)
--
SELECT pg_catalog.setval('roles_id_seq', 3, true);
--
-- Data for sequence public.tipos_id_seq (OID = 25472)
--
SELECT pg_catalog.setval('tipos_id_seq', 1, true);
--
-- Data for sequence public.movimientos_id_seq (OID = 25478)
--
SELECT pg_catalog.setval('movimientos_id_seq', 1, false);
--
-- Data for sequence public.registros_id_seq (OID = 25485)
--
SELECT pg_catalog.setval('registros_id_seq', 4, true);
--
-- Data for sequence public.reviciones_id_seq (OID = 25493)
--
SELECT pg_catalog.setval('reviciones_id_seq', 1, false);
--
-- Comments
--
COMMENT ON SCHEMA public IS 'standard public schema';
