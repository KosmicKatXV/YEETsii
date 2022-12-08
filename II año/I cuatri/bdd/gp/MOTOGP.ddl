-- Generado por Oracle SQL Developer Data Modeler 21.2.0.165.1515
--   en:        2021-11-03 16:51:38 CET
--   sitio:      Oracle Database 12cR2
--   tipo:      Oracle Database 12cR2



CREATE TABLESPACE ts_alumnos 
--  WARNING: Tablespace has no data files defined 
 LOGGING ONLINE
    EXTENT MANAGEMENT LOCAL AUTOALLOCATE
FLASHBACK ON;

CREATE USER ubd2359 IDENTIFIED BY ACCOUNT UNLOCK ;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE ubd2359.acto_publico (
    fecha            DATE NOT NULL,
    direccion        VARCHAR2(80 BYTE) NOT NULL,
    descripcion      VARCHAR2(200 BYTE) NOT NULL,
    persona_contacto VARCHAR2(100 BYTE) NOT NULL,
    numero_contacto  VARCHAR2(12 BYTE) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE ts_alumnos LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
NO INMEMORY;

CREATE UNIQUE INDEX ubd2359.acto_publico_pk ON
    ubd2359.acto_publico (
        fecha
    ASC )
        TABLESPACE ts_alumnos PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

ALTER TABLE ubd2359.acto_publico
    ADD CONSTRAINT acto_publico_pk PRIMARY KEY ( fecha )
        USING INDEX ubd2359.acto_publico_pk;

CREATE TABLE ubd2359.asistencia (
    piloto_dorsal      NUMBER(10) NOT NULL,
    acto_publico_fecha DATE NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE ts_alumnos LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
NO INMEMORY;

CREATE UNIQUE INDEX ubd2359.asistencia_pk ON
    ubd2359.asistencia (
        piloto_dorsal
    ASC,
        acto_publico_fecha
    ASC )
        TABLESPACE ts_alumnos PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

ALTER TABLE ubd2359.asistencia
    ADD CONSTRAINT asistencia_pk PRIMARY KEY ( piloto_dorsal,
                                               acto_publico_fecha )
        USING INDEX ubd2359.asistencia_pk;

CREATE TABLE ubd2359.carrera (
    puesto_clasificacion NUMBER(10) NOT NULL,
    modelo_moto          VARCHAR2(50 BYTE) NOT NULL,
    neumatico_delantero  VARCHAR2(50 BYTE) NOT NULL,
    neumatico_trasero    VARCHAR2(50 BYTE) NOT NULL,
    caidas               NUMBER(2) NOT NULL,
    tiempo               NUMBER(6, 3) NOT NULL,
    circuito_nombre      VARCHAR2(100 BYTE) NOT NULL,
    piloto_dorsal        NUMBER(10) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE ts_alumnos LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
NO INMEMORY;

CREATE UNIQUE INDEX ubd2359.carrera__idx ON
    ubd2359.carrera (
        circuito_nombre
    ASC )
        TABLESPACE ts_alumnos PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

CREATE UNIQUE INDEX ubd2359.carrera__idxv1 ON
    ubd2359.carrera (
        piloto_dorsal
    ASC )
        TABLESPACE ts_alumnos PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

CREATE UNIQUE INDEX ubd2359.carrera_pk ON
    ubd2359.carrera (
        puesto_clasificacion
    ASC,
        circuito_nombre
    ASC,
        piloto_dorsal
    ASC )
        TABLESPACE ts_alumnos PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

ALTER TABLE ubd2359.carrera
    ADD CONSTRAINT carrera_pk PRIMARY KEY ( puesto_clasificacion,
                                            circuito_nombre,
                                            piloto_dorsal )
        USING INDEX ubd2359.carrera_pk;

CREATE TABLE ubd2359.circuito (
    nombre              VARCHAR2(100 BYTE) NOT NULL,
    fecha               DATE NOT NULL,
    pais                VARCHAR2(50 BYTE) NOT NULL,
    ciudad_cercana      VARCHAR2(50 BYTE) NOT NULL,
    año_inaguracion     DATE NOT NULL,
    ancho_pista         NUMBER(6, 2) NOT NULL,
    startleft           CHAR(1 BYTE) NOT NULL,
    isclockwise         CHAR(1 BYTE) NOT NULL,
    tamaño_total_metros NUMBER(6) NOT NULL,
    recta_larga_metros  NUMBER(6) NOT NULL,
    mapa                VARCHAR2(100 BYTE) NOT NULL,
    fecha_carrera       DATE NOT NULL,
    numero_vueltas      NUMBER(4) NOT NULL,
    iswet               CHAR(1 BYTE)
)
PCTFREE 10 PCTUSED 40 TABLESPACE ts_alumnos LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
NO INMEMORY;

CREATE UNIQUE INDEX ubd2359.circuito_fecha_un ON
    ubd2359.circuito (
        fecha
    ASC )
        TABLESPACE ts_alumnos PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

CREATE UNIQUE INDEX ubd2359.circuito_pk ON
    ubd2359.circuito (
        nombre
    ASC )
        TABLESPACE ts_alumnos PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

ALTER TABLE ubd2359.circuito
    ADD CONSTRAINT circuito_pk PRIMARY KEY ( nombre )
        USING INDEX ubd2359.circuito_pk;

ALTER TABLE ubd2359.circuito
    ADD CONSTRAINT circuito_fecha_un UNIQUE ( fecha )
        USING INDEX ubd2359.circuito_fecha_un;

CREATE TABLE ubd2359.entrenamiento (
    tiempo             NUMBER(6, 3) NOT NULL,
    tramo_nombre_tramo VARCHAR2(2 BYTE) NOT NULL,
    tramo_nombre       VARCHAR2(100 BYTE) NOT NULL,
    piloto_dorsal      NUMBER(10) NOT NULL,
    descripcion_vuelta CLOB NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE ts_alumnos LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
NO INMEMORY
    LOB ( descripcion_vuelta ) STORE AS SECUREFILE (
        TABLESPACE ts_alumnos
        STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 BUFFER_POOL DEFAULT )
        CHUNK 8192
        RETENTION
        ENABLE STORAGE IN ROW
        NOCACHE LOGGING
    );

CREATE UNIQUE INDEX ubd2359.entrenamiento_pk ON
    ubd2359.entrenamiento (
        tramo_nombre_tramo
    ASC,
        tramo_nombre
    ASC,
        piloto_dorsal
    ASC )
        TABLESPACE ts_alumnos PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

ALTER TABLE ubd2359.entrenamiento
    ADD CONSTRAINT entrenamiento_pk PRIMARY KEY ( tramo_nombre_tramo,
                                                  tramo_nombre,
                                                  piloto_dorsal )
        USING INDEX ubd2359.entrenamiento_pk;

CREATE TABLE ubd2359.equipo (
    id                           NUMBER(*, 0) NOT NULL,
    nombre                       VARCHAR2(40 BYTE) NOT NULL,
    direccion_equipo             VARCHAR2(100 BYTE) NOT NULL,
    web                          VARCHAR2(100 BYTE) NOT NULL,
    descripcion                  CLOB NOT NULL,
    foto_oficial                 VARCHAR2(100 BYTE) NOT NULL,
    logo                         VARCHAR2(100 BYTE) NOT NULL,
    modelo_moto                  VARCHAR2(100 BYTE) NOT NULL,
    miembros_equipo_pasaporte    VARCHAR2(30 BYTE) NOT NULL,
    miembros_equipo_nacionalidad VARCHAR2(30 BYTE) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE ts_alumnos LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
NO INMEMORY
    LOB ( descripcion ) STORE AS SECUREFILE (
        TABLESPACE ts_alumnos
        STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 BUFFER_POOL DEFAULT )
        CHUNK 8192
        RETENTION
        ENABLE STORAGE IN ROW
        NOCACHE LOGGING
    );

CREATE UNIQUE INDEX ubd2359.equipo__idx ON
    ubd2359.equipo (
        miembros_equipo_pasaporte
    ASC,
        miembros_equipo_nacionalidad
    ASC )
        TABLESPACE ts_alumnos PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

CREATE UNIQUE INDEX ubd2359.equipo_nombre_un ON
    ubd2359.equipo (
        nombre
    ASC )
        TABLESPACE ts_alumnos PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

CREATE UNIQUE INDEX ubd2359.equipo_pk ON
    ubd2359.equipo (
        id
    ASC )
        TABLESPACE ts_alumnos PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

ALTER TABLE ubd2359.equipo
    ADD CONSTRAINT equipo_pk PRIMARY KEY ( id )
        USING INDEX ubd2359.equipo_pk;

ALTER TABLE ubd2359.equipo
    ADD CONSTRAINT equipo_nombre_un UNIQUE ( nombre )
        USING INDEX ubd2359.equipo_nombre_un;

CREATE TABLE ubd2359.experiencia (
    piloto_dorsal  NUMBER(10) NOT NULL,
    piloto_dorsal1 NUMBER(10) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE ts_alumnos LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
NO INMEMORY;

CREATE UNIQUE INDEX ubd2359.experiencia_pk ON
    ubd2359.experiencia (
        piloto_dorsal
    ASC,
        piloto_dorsal1
    ASC )
        TABLESPACE ts_alumnos PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

ALTER TABLE ubd2359.experiencia
    ADD CONSTRAINT experiencia_pk PRIMARY KEY ( piloto_dorsal,
                                                piloto_dorsal1 )
        USING INDEX ubd2359.experiencia_pk;

CREATE TABLE ubd2359.miembros_equipo (
    pasaporte        VARCHAR2(30 BYTE) NOT NULL,
    nacionalidad     VARCHAR2(30 BYTE) NOT NULL,
    nombre           VARCHAR2(100 BYTE) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    equipo_id1       NUMBER(*, 0) NOT NULL,
    equipo_id        NUMBER(*, 0) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE ts_alumnos LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
NO INMEMORY;

CREATE UNIQUE INDEX ubd2359.miembros_equipo__idx ON
    ubd2359.miembros_equipo (
        equipo_id
    ASC )
        TABLESPACE ts_alumnos PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

CREATE UNIQUE INDEX ubd2359.miembros_equipo_pk ON
    ubd2359.miembros_equipo (
        pasaporte
    ASC,
        nacionalidad
    ASC )
        TABLESPACE ts_alumnos PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

ALTER TABLE ubd2359.miembros_equipo
    ADD CONSTRAINT miembros_equipo_pk PRIMARY KEY ( pasaporte,
                                                    nacionalidad )
        USING INDEX ubd2359.miembros_equipo_pk;

CREATE TABLE ubd2359.numero_curva (
    numero         NUMBER(4) NOT NULL,
    isleft         NUMBER(4) NOT NULL,
    nombre         VARCHAR2(50 BYTE),
    circuito_fecha DATE NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE ts_alumnos LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
NO INMEMORY;

CREATE UNIQUE INDEX ubd2359.numero_curva_pk ON
    ubd2359.numero_curva (
        numero
    ASC,
        circuito_fecha
    ASC )
        TABLESPACE ts_alumnos PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

ALTER TABLE ubd2359.numero_curva
    ADD CONSTRAINT numero_curva_pk PRIMARY KEY ( numero,
                                                 circuito_fecha )
        USING INDEX ubd2359.numero_curva_pk;

CREATE TABLE ubd2359.oficiales (
    id                NUMBER(*, 0) NOT NULL,
    presupuesto       NUMBER(30) NOT NULL,
    creacion          DATE NOT NULL,
    direccion_fabrica VARCHAR2(100 BYTE) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE ts_alumnos LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
NO INMEMORY;

CREATE UNIQUE INDEX ubd2359.oficiales_pk ON
    ubd2359.oficiales (
        id
    ASC )
        TABLESPACE ts_alumnos PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

ALTER TABLE ubd2359.oficiales
    ADD CONSTRAINT oficiales_pk PRIMARY KEY ( id )
        USING INDEX ubd2359.oficiales_pk;

CREATE TABLE ubd2359.piloto (
    dorsal        NUMBER(10) NOT NULL,
    nombre_piloto VARCHAR2(50 BYTE) NOT NULL,
    pais          VARCHAR2(30 BYTE) NOT NULL,
    ciudad        VARCHAR2(30 BYTE) NOT NULL,
    peso          NUMBER(5, 2) NOT NULL,
    altura        NUMBER(3, 2) NOT NULL,
    video         VARCHAR2(100 BYTE) NOT NULL,
    equipo_id     NUMBER(*, 0) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE ts_alumnos LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
NO INMEMORY;

CREATE UNIQUE INDEX ubd2359.piloto_nombre_piloto_un ON
    ubd2359.piloto (
        nombre_piloto
    ASC )
        TABLESPACE ts_alumnos PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

CREATE UNIQUE INDEX ubd2359.piloto_pk ON
    ubd2359.piloto (
        dorsal
    ASC )
        TABLESPACE ts_alumnos PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

ALTER TABLE ubd2359.piloto
    ADD CONSTRAINT piloto_pk PRIMARY KEY ( dorsal )
        USING INDEX ubd2359.piloto_pk;

ALTER TABLE ubd2359.piloto
    ADD CONSTRAINT piloto_nombre_piloto_un UNIQUE ( nombre_piloto )
        USING INDEX ubd2359.piloto_nombre_piloto_un;

CREATE TABLE ubd2359.record_tramo (
    tiempo             NUMBER(6, 3) NOT NULL,
    fecha              DATE NOT NULL,
    tramo_nombre_tramo VARCHAR2(2 BYTE) NOT NULL,
    tramo_nombre       VARCHAR2(100 BYTE) NOT NULL,
    piloto_dorsal      NUMBER(10) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE ts_alumnos LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
NO INMEMORY;

CREATE UNIQUE INDEX ubd2359.record_tramo__idx ON
    ubd2359.record_tramo (
        tramo_nombre_tramo
    ASC,
        tramo_nombre
    ASC )
        TABLESPACE ts_alumnos PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

CREATE UNIQUE INDEX ubd2359.record_tramo_pk ON
    ubd2359.record_tramo (
        tramo_nombre_tramo
    ASC,
        tramo_nombre
    ASC,
        piloto_dorsal
    ASC )
        TABLESPACE ts_alumnos PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

ALTER TABLE ubd2359.record_tramo
    ADD CONSTRAINT record_tramo_pk PRIMARY KEY ( tramo_nombre_tramo,
                                                 tramo_nombre,
                                                 piloto_dorsal )
        USING INDEX ubd2359.record_tramo_pk;

CREATE TABLE ubd2359.tramo (
    nombre_tramo             VARCHAR2(2 BYTE) NOT NULL,
    longitud_metros          NUMBER(6) NOT NULL,
    desnivel                 NUMBER(4) NOT NULL,
    asfalto                  VARCHAR2(100 BYTE) NOT NULL,
    velocidad_media_anterior NUMBER(4, 1),
    velocidad_max_anterior   NUMBER(4, 1),
    circuito_nombre          VARCHAR2(100 BYTE) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE ts_alumnos LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
NO INMEMORY;

CREATE UNIQUE INDEX ubd2359.tramo_pk ON
    ubd2359.tramo (
        nombre_tramo
    ASC,
        circuito_nombre
    ASC )
        TABLESPACE ts_alumnos PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        LOGGING;

ALTER TABLE ubd2359.tramo
    ADD CONSTRAINT tramo_pk PRIMARY KEY ( nombre_tramo,
                                          circuito_nombre )
        USING INDEX ubd2359.tramo_pk;

ALTER TABLE ubd2359.asistencia
    ADD CONSTRAINT asistencia_acto_publico_fk FOREIGN KEY ( acto_publico_fecha )
        REFERENCES ubd2359.acto_publico ( fecha )
    NOT DEFERRABLE;

ALTER TABLE ubd2359.asistencia
    ADD CONSTRAINT asistencia_piloto_fk FOREIGN KEY ( piloto_dorsal )
        REFERENCES ubd2359.piloto ( dorsal )
    NOT DEFERRABLE;

ALTER TABLE ubd2359.carrera
    ADD CONSTRAINT carrera_circuito_fk FOREIGN KEY ( circuito_nombre )
        REFERENCES ubd2359.circuito ( nombre )
    NOT DEFERRABLE;

ALTER TABLE ubd2359.carrera
    ADD CONSTRAINT carrera_piloto_fk FOREIGN KEY ( piloto_dorsal )
        REFERENCES ubd2359.piloto ( dorsal )
    NOT DEFERRABLE;

ALTER TABLE ubd2359.entrenamiento
    ADD CONSTRAINT entrenamiento_piloto_fk FOREIGN KEY ( piloto_dorsal )
        REFERENCES ubd2359.piloto ( dorsal )
    NOT DEFERRABLE;

ALTER TABLE ubd2359.entrenamiento
    ADD CONSTRAINT entrenamiento_tramo_fk FOREIGN KEY ( tramo_nombre_tramo,
                                                        tramo_nombre )
        REFERENCES ubd2359.tramo ( nombre_tramo,
                                   circuito_nombre )
    NOT DEFERRABLE;

ALTER TABLE ubd2359.equipo
    ADD CONSTRAINT equipo_miembros_equipo_fk FOREIGN KEY ( miembros_equipo_pasaporte,
                                                           miembros_equipo_nacionalidad )
        REFERENCES ubd2359.miembros_equipo ( pasaporte,
                                             nacionalidad )
    NOT DEFERRABLE;

ALTER TABLE ubd2359.experiencia
    ADD CONSTRAINT experiencia_piloto_fk FOREIGN KEY ( piloto_dorsal )
        REFERENCES ubd2359.piloto ( dorsal )
    NOT DEFERRABLE;

ALTER TABLE ubd2359.experiencia
    ADD CONSTRAINT experiencia_piloto_fkv1 FOREIGN KEY ( piloto_dorsal1 )
        REFERENCES ubd2359.piloto ( dorsal )
    NOT DEFERRABLE;

ALTER TABLE ubd2359.miembros_equipo
    ADD CONSTRAINT miembros_equipo_equipo_fk FOREIGN KEY ( equipo_id )
        REFERENCES ubd2359.equipo ( id )
    NOT DEFERRABLE;

ALTER TABLE ubd2359.miembros_equipo
    ADD CONSTRAINT miembros_equipo_equipo_fkv2 FOREIGN KEY ( equipo_id1 )
        REFERENCES ubd2359.equipo ( id )
    NOT DEFERRABLE;

ALTER TABLE ubd2359.numero_curva
    ADD CONSTRAINT numero_curva_circuito_fk FOREIGN KEY ( circuito_fecha )
        REFERENCES ubd2359.circuito ( fecha )
    NOT DEFERRABLE;

ALTER TABLE ubd2359.oficiales
    ADD CONSTRAINT oficiales_equipo_fk FOREIGN KEY ( id )
        REFERENCES ubd2359.equipo ( id )
    NOT DEFERRABLE;

ALTER TABLE ubd2359.piloto
    ADD CONSTRAINT piloto_equipo_fk FOREIGN KEY ( equipo_id )
        REFERENCES ubd2359.equipo ( id )
    NOT DEFERRABLE;

ALTER TABLE ubd2359.record_tramo
    ADD CONSTRAINT record_tramo_piloto_fk FOREIGN KEY ( piloto_dorsal )
        REFERENCES ubd2359.piloto ( dorsal )
    NOT DEFERRABLE;

ALTER TABLE ubd2359.record_tramo
    ADD CONSTRAINT record_tramo_tramo_fk FOREIGN KEY ( tramo_nombre_tramo,
                                                       tramo_nombre )
        REFERENCES ubd2359.tramo ( nombre_tramo,
                                   circuito_nombre )
    NOT DEFERRABLE;

ALTER TABLE ubd2359.tramo
    ADD CONSTRAINT tramo_circuito_fk FOREIGN KEY ( circuito_nombre )
        REFERENCES ubd2359.circuito ( nombre )
    NOT DEFERRABLE;



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            13
-- CREATE INDEX                            21
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
-- CREATE TABLESPACE                        1
-- CREATE USER                              1
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
-- WARNINGS                                 1
