-- Generado por Oracle SQL Developer Data Modeler 20.2.0.167.1538
--   en:        2020-10-29 12:51:48 CET
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE acto_publico (
    fecha             DATE NOT NULL,
    direccion         VARCHAR2(80) NOT NULL,
    descripcion       VARCHAR2(200) NOT NULL,
    persona_contacto  VARCHAR2(100) NOT NULL,
    numero_contacto   VARCHAR2(12) NOT NULL
);

ALTER TABLE acto_publico ADD CONSTRAINT acto_publico_pk PRIMARY KEY ( fecha );

CREATE TABLE asistencia (
    piloto_dorsal       NUMBER(10) NOT NULL,
    acto_publico_fecha  DATE NOT NULL
);

ALTER TABLE asistencia ADD CONSTRAINT asistencia_pk PRIMARY KEY ( piloto_dorsal,
                                                                  acto_publico_fecha );

CREATE TABLE carrera (
    puesto_clasificacion  NUMBER(10) NOT NULL,
    modelo_moto           VARCHAR2(50) NOT NULL,
    neumatico_delantero   VARCHAR2(50) NOT NULL,
    neumatico_trasero     VARCHAR2(50) NOT NULL,
    caidas                NUMBER(2) NOT NULL,
    tiempo                NUMBER(6, 3) NOT NULL,
    circuito_nombre       VARCHAR2(100) NOT NULL,
    piloto_dorsal         NUMBER(10) NOT NULL
);

CREATE UNIQUE INDEX carrera__idx ON
    carrera (
        circuito_nombre
    ASC );

CREATE UNIQUE INDEX carrera__idxv1 ON
    carrera (
        piloto_dorsal
    ASC );

ALTER TABLE carrera
    ADD CONSTRAINT carrera_pk PRIMARY KEY ( puesto_clasificacion,
                                            circuito_nombre,
                                            piloto_dorsal );

CREATE TABLE circuito (
    nombre               VARCHAR2(100) NOT NULL,
    fecha                DATE NOT NULL,
    pais                 VARCHAR2(50) NOT NULL,
    ciudad_cercana       VARCHAR2(50) NOT NULL,
    año_inaguracion      DATE NOT NULL,
    ancho_pista          NUMBER(6, 2) NOT NULL,
    startleft            CHAR(1) NOT NULL,
    isclockwise          CHAR(1) NOT NULL,
    tamaño_total_metros  NUMBER(6) NOT NULL,
    recta_larga_metros   NUMBER(6) NOT NULL,
    mapa                 VARCHAR2(100) NOT NULL,
    fecha_carrera        DATE NOT NULL,
    numero_vueltas       NUMBER(4) NOT NULL,
    iswet                CHAR(1)
);

ALTER TABLE circuito ADD CONSTRAINT circuito_pk PRIMARY KEY ( nombre );

ALTER TABLE circuito ADD CONSTRAINT circuito_fecha_un UNIQUE ( fecha );

CREATE TABLE entrenamiento (
    tiempo              NUMBER(6, 3) NOT NULL,
    tramo_nombre_tramo  VARCHAR2(2) NOT NULL,
    tramo_nombre        VARCHAR2(100) NOT NULL,
    piloto_dorsal       NUMBER(10) NOT NULL,
    descripcion_vuelta  CLOB NOT NULL
);

ALTER TABLE entrenamiento
    ADD CONSTRAINT entrenamiento_pk PRIMARY KEY ( tramo_nombre_tramo,
                                                  tramo_nombre,
                                                  piloto_dorsal );

CREATE TABLE equipo (
    id                            INTEGER NOT NULL,
    nombre                        VARCHAR2(40) NOT NULL,
    direccion_equipo              VARCHAR2(100) NOT NULL,
    web                           VARCHAR2(100) NOT NULL,
    descripcion                   CLOB NOT NULL,
    foto_oficial                  VARCHAR2(100) NOT NULL,
    logo                          VARCHAR2(100) NOT NULL,
    modelo_moto                   VARCHAR2(100) NOT NULL,
    miembros_equipo_pasaporte     VARCHAR2(30) NOT NULL,
    miembros_equipo_nacionalidad  VARCHAR2(30) NOT NULL
);

CREATE UNIQUE INDEX equipo__idx ON
    equipo (
        miembros_equipo_pasaporte
    ASC,
        miembros_equipo_nacionalidad
    ASC );

ALTER TABLE equipo ADD CONSTRAINT equipo_pk PRIMARY KEY ( id );

ALTER TABLE equipo ADD CONSTRAINT equipo_nombre_un UNIQUE ( nombre );

CREATE TABLE experiencia (
    piloto_dorsal   NUMBER(10) NOT NULL,
    piloto_dorsal1  NUMBER(10) NOT NULL
);

ALTER TABLE experiencia ADD CONSTRAINT experiencia_pk PRIMARY KEY ( piloto_dorsal,
                                                                    piloto_dorsal1 );

CREATE TABLE miembros_equipo (
    pasaporte         VARCHAR2(30) NOT NULL,
    nacionalidad      VARCHAR2(30) NOT NULL,
    nombre            VARCHAR2(100) NOT NULL,
    fecha_nacimiento  DATE NOT NULL,
    equipo_id1        INTEGER NOT NULL,
    equipo_id         INTEGER NOT NULL
);

CREATE UNIQUE INDEX miembros_equipo__idx ON
    miembros_equipo (
        equipo_id
    ASC );

ALTER TABLE miembros_equipo ADD CONSTRAINT miembros_equipo_pk PRIMARY KEY ( pasaporte,
                                                                            nacionalidad );

CREATE TABLE numero_curva (
    numero          NUMBER(4) NOT NULL,
    isleft          NUMBER(4) NOT NULL,
    nombre          VARCHAR2(50),
    circuito_fecha  DATE NOT NULL
);

ALTER TABLE numero_curva ADD CONSTRAINT numero_curva_pk PRIMARY KEY ( numero,
                                                                      circuito_fecha );

CREATE TABLE oficiales (
    id                 INTEGER NOT NULL,
    presupuesto        NUMBER(30) NOT NULL,
    creacion           DATE NOT NULL,
    direccion_fabrica  VARCHAR2(100) NOT NULL
);

ALTER TABLE oficiales ADD CONSTRAINT oficiales_pk PRIMARY KEY ( id );

CREATE TABLE piloto (
    dorsal         NUMBER(10) NOT NULL,
    nombre_piloto  VARCHAR2(50) NOT NULL,
    pais           VARCHAR2(30) NOT NULL,
    ciudad         VARCHAR2(30) NOT NULL,
    peso           NUMBER(5, 2) NOT NULL,
    altura         NUMBER(3, 2) NOT NULL,
    video          VARCHAR2(100) NOT NULL,
    equipo_id      INTEGER NOT NULL
);

ALTER TABLE piloto ADD CONSTRAINT piloto_pk PRIMARY KEY ( dorsal );

ALTER TABLE piloto ADD CONSTRAINT piloto_nombre_piloto_un UNIQUE ( nombre_piloto );

CREATE TABLE record_tramo (
    tiempo              NUMBER(6, 3) NOT NULL,
    fecha               DATE NOT NULL,
    tramo_nombre_tramo  VARCHAR2(2) NOT NULL,
    tramo_nombre        VARCHAR2(100) NOT NULL,
    piloto_dorsal       NUMBER(10) NOT NULL
);

CREATE UNIQUE INDEX record_tramo__idx ON
    record_tramo (
        tramo_nombre_tramo
    ASC,
        tramo_nombre
    ASC );

ALTER TABLE record_tramo
    ADD CONSTRAINT record_tramo_pk PRIMARY KEY ( tramo_nombre_tramo,
                                                 tramo_nombre,
                                                 piloto_dorsal );

CREATE TABLE tramo (
    nombre_tramo              VARCHAR2(2) NOT NULL,
    longitud_metros           NUMBER(6) NOT NULL,
    desnivel                  NUMBER(4) NOT NULL,
    asfalto                   VARCHAR2(100) NOT NULL,
    velocidad_media_anterior  NUMBER(4, 1),
    velocidad_max_anterior    NUMBER(4, 1),
    circuito_nombre           VARCHAR2(100) NOT NULL
);

ALTER TABLE tramo ADD CONSTRAINT tramo_pk PRIMARY KEY ( nombre_tramo,
                                                        circuito_nombre );

ALTER TABLE asistencia
    ADD CONSTRAINT asistencia_acto_publico_fk FOREIGN KEY ( acto_publico_fecha )
        REFERENCES acto_publico ( fecha );

ALTER TABLE asistencia
    ADD CONSTRAINT asistencia_piloto_fk FOREIGN KEY ( piloto_dorsal )
        REFERENCES piloto ( dorsal );

ALTER TABLE carrera
    ADD CONSTRAINT carrera_circuito_fk FOREIGN KEY ( circuito_nombre )
        REFERENCES circuito ( nombre );

ALTER TABLE carrera
    ADD CONSTRAINT carrera_piloto_fk FOREIGN KEY ( piloto_dorsal )
        REFERENCES piloto ( dorsal );

ALTER TABLE entrenamiento
    ADD CONSTRAINT entrenamiento_piloto_fk FOREIGN KEY ( piloto_dorsal )
        REFERENCES piloto ( dorsal );

ALTER TABLE entrenamiento
    ADD CONSTRAINT entrenamiento_tramo_fk FOREIGN KEY ( tramo_nombre_tramo,
                                                        tramo_nombre )
        REFERENCES tramo ( nombre_tramo,
                           circuito_nombre );

ALTER TABLE equipo
    ADD CONSTRAINT equipo_miembros_equipo_fk FOREIGN KEY ( miembros_equipo_pasaporte,
                                                           miembros_equipo_nacionalidad )
        REFERENCES miembros_equipo ( pasaporte,
                                     nacionalidad );

ALTER TABLE experiencia
    ADD CONSTRAINT experiencia_piloto_fk FOREIGN KEY ( piloto_dorsal )
        REFERENCES piloto ( dorsal );

ALTER TABLE experiencia
    ADD CONSTRAINT experiencia_piloto_fkv1 FOREIGN KEY ( piloto_dorsal1 )
        REFERENCES piloto ( dorsal );

ALTER TABLE miembros_equipo
    ADD CONSTRAINT miembros_equipo_equipo_fk FOREIGN KEY ( equipo_id )
        REFERENCES equipo ( id );

ALTER TABLE miembros_equipo
    ADD CONSTRAINT miembros_equipo_equipo_fkv2 FOREIGN KEY ( equipo_id1 )
        REFERENCES equipo ( id );

ALTER TABLE numero_curva
    ADD CONSTRAINT numero_curva_circuito_fk FOREIGN KEY ( circuito_fecha )
        REFERENCES circuito ( fecha );

ALTER TABLE oficiales
    ADD CONSTRAINT oficiales_equipo_fk FOREIGN KEY ( id )
        REFERENCES equipo ( id );

ALTER TABLE piloto
    ADD CONSTRAINT piloto_equipo_fk FOREIGN KEY ( equipo_id )
        REFERENCES equipo ( id );

ALTER TABLE record_tramo
    ADD CONSTRAINT record_tramo_piloto_fk FOREIGN KEY ( piloto_dorsal )
        REFERENCES piloto ( dorsal );

ALTER TABLE record_tramo
    ADD CONSTRAINT record_tramo_tramo_fk FOREIGN KEY ( tramo_nombre_tramo,
                                                       tramo_nombre )
        REFERENCES tramo ( nombre_tramo,
                           circuito_nombre );

ALTER TABLE tramo
    ADD CONSTRAINT tramo_circuito_fk FOREIGN KEY ( circuito_nombre )
        REFERENCES circuito ( nombre );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            13
-- CREATE INDEX                             5
-- ALTER TABLE                             33
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
