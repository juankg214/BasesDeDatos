/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     03/11/2017 11:39:01 a.m.                     */
/*==============================================================*/


alter table CIUDAD
   drop constraint FK_CIUDAD_UBICACION_DEPARTAM;

alter table DELEGADO
   drop constraint FK_DELEGADO_DELEGADO__EJECUTOR;

alter table DELEGADO
   drop constraint FK_DELEGADO_DELEGADO__ENTIDAD_;

alter table DELEGADO
   drop constraint FK_DELEGADO_LUGAR_DE__CIUDAD;

alter table EJECUTOR
   drop constraint FK_EJECUTOR_REPRESENT_REPRESEN;

alter table EJECUTOR
   drop constraint FK_EJECUTOR_UBICACION_CIUDAD;

alter table ENTIDAD_TERRITORIAL_PROPONENTE
   drop constraint FK_ENTIDAD__ENTIDAD_T_EJECUTOR;

alter table ENTIDAD_TERRITORIAL_PROPONENTE
   drop constraint FK_ENTIDAD__ORDEN_TER_CIUDAD;

alter table ENTIDAD_TERRITORIAL_PROPONENTE
   drop constraint FK_ENTIDAD__ORDEN_TER_DEPARTAM;

alter table ENTIDAD_TERRITORIAL_PROPONENTE
   drop constraint FK_ENTIDAD__REPRESENT_REPRESEN;

alter table PRODUCTO
   drop constraint FK_PRODUCTO_PROYECTO__PROYECTO;

alter table PRODUCTO__ENTIDAD_BENEFICIADA
   drop constraint FK_PRODUCTO_PRODUCTO__PRODUCTO;

alter table PRODUCTO__ENTIDAD_BENEFICIADA
   drop constraint FK_PRODUCTO_PRODUCTO__ENTIDADE;

alter table PROYECTO
   drop constraint FK_PROYECTO_EJECUTOR__EJECUTOR;

alter table PROYECTO
   drop constraint FK_PROYECTO_PROYECTO__DELEGADO;

alter table PROYECTO
   drop constraint FK_PROYECTO_PROYECTO__DELEG;

alter table PROYECTO
   drop constraint FK_PROYECTO_PROYECTO__ENTIDAD_;

alter table PROYECTO__ENTIDAD_BENEFICIADA
   drop constraint FK_PROYECTO_PROYECTO__ENTIDADE;

alter table PROYECTO__ENTIDAD_BENEFICIADA
   drop constraint FK_PROYECTO_PROYECTO__PROYECTO;

alter table REPRESENTANTE_LEGAL
   drop constraint FK_REPRESEN_LUGAR_DE__CIUDAD;

alter table REPRESENTANTE_LEGAL
   drop constraint FK_REPRESEN_REPRESENT_ENTIDAD_;

alter table REPRESENTANTE_LEGAL
   drop constraint FK_REPRESEN_REPRESENT_EJECUTOR;

drop index UBICACION_CIUDAD_FK;

drop table CIUDAD cascade constraints;

drop index LUGAR_DE_RESIDENCIA2_FK;

drop index DELEGADO_ENTIDAD_TERR_FK;

drop index DELEGADO_EJECUTOR_FK;

drop table DELEGADO cascade constraints;

drop table DEPARTAMENTO cascade constraints;

drop index UBICACION_EJECUTOR_FK;

drop table EJECUTOR cascade constraints;

drop table ENTIDADES_BENEFICIADAS cascade constraints;

drop index ORDEN_TERRITORIAL__DEP__FK;

drop index ORDEN_TERRIRORIAL__CIUDAD__FK;

drop index ENTIDAD_TERRITORIAL___EJEC_FK;

drop table ENTIDAD_TERRITORIAL_PROPONENTE cascade constraints;

drop index PROYECTO___PRODUCTOS_FK;

drop table PRODUCTO cascade constraints;

drop index PRODUCTO__ENTIDAD_BENE2_FK;

drop index PRODUCTO__ENTIDAD_BENE_FK;

drop table PRODUCTO__ENTIDAD_BENEFICIADA cascade constraints;

drop index EJECUTOR___PROYECTO_FK;

drop index PROYECTO_ENTIDAD_TERR_FK;

drop table PROYECTO cascade constraints;

drop index PROYECTO__ENTIDAD_BENE_2_FK;

drop table PROYECTO__ENTIDAD_BENEFICIADA cascade constraints;

drop index LUGAR_DE_RESIDENCIA_FK;

drop index REPRESENTANTE_LEGAL___EJEC_FK;

drop index REPRESENTANTE_LEGAL3_FK;

drop table REPRESENTANTE_LEGAL cascade constraints;

/*==============================================================*/
/* Table: CIUDAD                                                */
/*==============================================================*/
create table CIUDAD 
(
   ID_CIUDAD            INTEGER              not null,
   ID_DEP               INTEGER              not null,
   NOMBRE_CIUDAD        VARCHAR2(100)        not null,
   constraint PK_CIUDAD primary key (ID_CIUDAD)
);

/*==============================================================*/
/* Index: UBICACION_CIUDAD_FK                                   */
/*==============================================================*/
create index UBICACION_CIUDAD_FK on CIUDAD (
   ID_DEP ASC
);

/*==============================================================*/
/* Table: DELEGADO                                              */
/*==============================================================*/
create table DELEGADO 
(
   ID_CIUDAD            INTEGER              not null,
   NIT_EJEC             INTEGER              not null,
   NIT_ENT              INTEGER              not null,
   CEDULA_PERS          INTEGER              not null,
   NOMBRE_PERS          VARCHAR2(100),
   CARGO_DELEG          VARCHAR2(30)         not null,
   TELEFONO_DELEG       INTEGER              not null,
   CORREO_DELEG         VARCHAR2(30)         not null,
   CELULAR_DELEG        INTEGER,
   FAX_DELEG            INTEGER,
   constraint AK_IDENTIFIER_1_DELEGADO unique (CEDULA_PERS)
);

/*==============================================================*/
/* Index: DELEGADO_EJECUTOR_FK                                  */
/*==============================================================*/
create index DELEGADO_EJECUTOR_FK on DELEGADO (
   NIT_EJEC ASC
);

/*==============================================================*/
/* Index: DELEGADO_ENTIDAD_TERR_FK                              */
/*==============================================================*/
create index DELEGADO_ENTIDAD_TERR_FK on DELEGADO (
   NIT_ENT ASC
);

/*==============================================================*/
/* Index: LUGAR_DE_RESIDENCIA2_FK                               */
/*==============================================================*/
create index LUGAR_DE_RESIDENCIA2_FK on DELEGADO (
   ID_CIUDAD ASC
);

/*==============================================================*/
/* Table: DEPARTAMENTO                                          */
/*==============================================================*/
create table DEPARTAMENTO 
(
   ID_DEP               INTEGER              not null,
   NOMBRE_DEP           VARCHAR2(50)         not null,
   constraint PK_DEPARTAMENTO primary key (ID_DEP)
);

/*==============================================================*/
/* Table: EJECUTOR                                              */
/*==============================================================*/
create table EJECUTOR 
(
   NIT_EJEC             INTEGER              not null,
   ID_CIUDAD            INTEGER              not null,
   CEDULA_PERS          INTEGER              not null,
   NOMBRE_EJC           VARCHAR2(100)        not null,
   DIRECCION_EJC        VARCHAR2(50)         not null,
   TELEFONO_EJC         INTEGER              not null,
   EMAIL_EJC            VARCHAR2(50)         not null,
   ACTIVIDAD_COMERCIAL  VARCHAR2(30)         not null,
   BIENES_SERVICIOS     VARCHAR2(30)         not null,
   CARACTER__EMPRESA    VARCHAR2(30)         not null,
   FECHA_CONSTRUCCION   DATE                 not null,
   PAGINA_WEB_EJC       VARCHAR2(50),
   FAX_EJC              INTEGER,
   FECHA_RENOVACION_MATRICULA VARCHAR2(30),
   MATRICULA_MERCANTIL  INTEGER,
   constraint PK_EJECUTOR primary key (NIT_EJEC)
);

/*==============================================================*/
/* Index: UBICACION_EJECUTOR_FK                                 */
/*==============================================================*/
create index UBICACION_EJECUTOR_FK on EJECUTOR (
   ID_CIUDAD ASC
);

/*==============================================================*/
/* Table: ENTIDADES_BENEFICIADAS                                */
/*==============================================================*/
create table ENTIDADES_BENEFICIADAS 
(
   ID__ENTIDADES_BENEFICIADAS VARCHAR2(30)         not null,
   TIPO_DE__ENTIDADES_BENEFICIADA VARCHAR2(30)         not null,
   constraint PK_ENTIDADES_BENEFICIADAS primary key (ID__ENTIDADES_BENEFICIADAS)
);

/*==============================================================*/
/* Table: ENTIDAD_TERRITORIAL_PROPONENTE                        */
/*==============================================================*/
create table ENTIDAD_TERRITORIAL_PROPONENTE 
(
   NIT_ENT              INTEGER              not null,
   NIT_EJEC             INTEGER,
   ID_CIUDAD            INTEGER              not null,
   ID_DEP               INTEGER              not null,
   CEDULA_PERS          INTEGER              not null,
   NOMBRE_ENT           VARCHAR2(100)        not null,
   DIRECCION_ENT        VARCHAR2(50)         not null,
   TELEFONO_ENT         INTEGER              not null,
   EMAIL_ENT            VARCHAR2(50)         not null,
   PAGINA_WEB_ENT       VARCHAR2(50),
   FAX_ENT              INTEGER,
   constraint PK_ENTIDAD_TERRITORIAL_PROPONE primary key (NIT_ENT)
);

/*==============================================================*/
/* Index: ENTIDAD_TERRITORIAL___EJEC_FK                         */
/*==============================================================*/
create index ENTIDAD_TERRITORIAL___EJEC_FK on ENTIDAD_TERRITORIAL_PROPONENTE (
   NIT_EJEC ASC
);

/*==============================================================*/
/* Index: ORDEN_TERRIRORIAL__CIUDAD__FK                         */
/*==============================================================*/
create index ORDEN_TERRIRORIAL__CIUDAD__FK on ENTIDAD_TERRITORIAL_PROPONENTE (
   ID_CIUDAD ASC
);

/*==============================================================*/
/* Index: ORDEN_TERRITORIAL__DEP__FK                            */
/*==============================================================*/
create index ORDEN_TERRITORIAL__DEP__FK on ENTIDAD_TERRITORIAL_PROPONENTE (
   ID_DEP ASC
);

/*==============================================================*/
/* Table: PRODUCTO                                              */
/*==============================================================*/
create table PRODUCTO 
(
   ID_PRODUCTO          INTEGER              not null,
   ID_PROYECTO          INTEGER              not null,
   NOMBRE_PROD          VARCHAR2(30)         not null,
   LICENCIA_PROD        VARCHAR2(30)         not null,
   TIPO_DE_SOFTWARE     VARCHAR2(30)         not null,
   constraint PK_PRODUCTO primary key (ID_PRODUCTO)
);

/*==============================================================*/
/* Index: PROYECTO___PRODUCTOS_FK                               */
/*==============================================================*/
create index PROYECTO___PRODUCTOS_FK on PRODUCTO (
   ID_PROYECTO ASC
);

/*==============================================================*/
/* Table: PRODUCTO__ENTIDAD_BENEFICIADA                         */
/*==============================================================*/
create table PRODUCTO__ENTIDAD_BENEFICIADA 
(
   ID_PRODUCTO          INTEGER              not null,
   ID__ENTIDADES_BENEFICIADAS VARCHAR2(30)         not null,
   constraint PK_PRODUCTO__ENTIDAD_BENEFICIA primary key (ID_PRODUCTO, ID__ENTIDADES_BENEFICIADAS)
);

/*==============================================================*/
/* Index: PRODUCTO__ENTIDAD_BENE_FK                             */
/*==============================================================*/
create index PRODUCTO__ENTIDAD_BENE_FK on PRODUCTO__ENTIDAD_BENEFICIADA (
   ID_PRODUCTO ASC
);

/*==============================================================*/
/* Index: PRODUCTO__ENTIDAD_BENE2_FK                            */
/*==============================================================*/
create index PRODUCTO__ENTIDAD_BENE2_FK on PRODUCTO__ENTIDAD_BENEFICIADA (
   ID__ENTIDADES_BENEFICIADAS ASC
);

/*==============================================================*/
/* Table: PROYECTO                                              */
/*==============================================================*/
create table PROYECTO 
(
   ID_PROYECTO          INTEGER              not null,
   NIT_ENT              INTEGER              not null,
   NIT_EJEC             INTEGER              not null,
   CEDULA_PERS          INTEGER              not null,
   DEL_CEDULA_PERS      INTEGER              not null,
   NOMBRE_PROYECTO      VARCHAR2(30)         not null,
   TIPO_PROYECTO        VARCHAR2(30)         not null,
   OBJETIVO_PROYECTO    VARCHAR2(30)         not null,
   DURACION_PROYECTO    DATE,
   DESCRIPCION_PROYECTO VARCHAR2(1000),
   constraint PK_PROYECTO primary key (ID_PROYECTO)
);

/*==============================================================*/
/* Index: PROYECTO_ENTIDAD_TERR_FK                              */
/*==============================================================*/
create index PROYECTO_ENTIDAD_TERR_FK on PROYECTO (
   NIT_ENT ASC
);

/*==============================================================*/
/* Index: EJECUTOR___PROYECTO_FK                                */
/*==============================================================*/
create index EJECUTOR___PROYECTO_FK on PROYECTO (
   NIT_EJEC ASC
);

/*==============================================================*/
/* Table: PROYECTO__ENTIDAD_BENEFICIADA                         */
/*==============================================================*/
create table PROYECTO__ENTIDAD_BENEFICIADA 
(
   ID__ENTIDADES_BENEFICIADAS VARCHAR2(30)         not null,
   ID_PROYECTO          INTEGER              not null,
   constraint PK_PROYECTO__ENTIDAD_BENEFICIA primary key (ID__ENTIDADES_BENEFICIADAS, ID_PROYECTO)
);

/*==============================================================*/
/* Index: PROYECTO__ENTIDAD_BENE_2_FK                           */
/*==============================================================*/
create index PROYECTO__ENTIDAD_BENE_2_FK on PROYECTO__ENTIDAD_BENEFICIADA (
   ID_PROYECTO ASC
);

/*==============================================================*/
/* Table: REPRESENTANTE_LEGAL                                   */
/*==============================================================*/
create table REPRESENTANTE_LEGAL 
(
   ID_CIUDAD            INTEGER              not null,
   NIT_ENT              INTEGER,
   NIT_EJEC             INTEGER,
   CEDULA_PERS          INTEGER              not null,
   NOMBRE_PERS          VARCHAR2(100),
   NUMERO_ACTA_POSESION INTEGER              not null,
   FECHA_ACTA_POSESEION DATE                 not null,
   constraint AK_IDENTIFIER_1_REPRESEN unique (CEDULA_PERS)
);

/*==============================================================*/
/* Index: REPRESENTANTE_LEGAL3_FK                               */
/*==============================================================*/
create index REPRESENTANTE_LEGAL3_FK on REPRESENTANTE_LEGAL (
   NIT_ENT ASC
);

/*==============================================================*/
/* Index: REPRESENTANTE_LEGAL___EJEC_FK                         */
/*==============================================================*/
create index REPRESENTANTE_LEGAL___EJEC_FK on REPRESENTANTE_LEGAL (
   NIT_EJEC ASC
);

/*==============================================================*/
/* Index: LUGAR_DE_RESIDENCIA_FK                                */
/*==============================================================*/
create index LUGAR_DE_RESIDENCIA_FK on REPRESENTANTE_LEGAL (
   ID_CIUDAD ASC
);

alter table CIUDAD
   add constraint FK_CIUDAD_UBICACION_DEPARTAM foreign key (ID_DEP)
      references DEPARTAMENTO (ID_DEP);

alter table DELEGADO
   add constraint FK_DELEGADO_DELEGADO__EJECUTOR foreign key (NIT_EJEC)
      references EJECUTOR (NIT_EJEC);

alter table DELEGADO
   add constraint FK_DELEGADO_DELEGADO__ENTIDAD_ foreign key (NIT_ENT)
      references ENTIDAD_TERRITORIAL_PROPONENTE (NIT_ENT);

alter table DELEGADO
   add constraint FK_DELEGADO_LUGAR_DE__CIUDAD foreign key (ID_CIUDAD)
      references CIUDAD (ID_CIUDAD);

alter table EJECUTOR
   add constraint FK_EJECUTOR_REPRESENT_REPRESEN foreign key (NIT_EJEC)
      references REPRESENTANTE_LEGAL (CEDULA_PERS);

alter table EJECUTOR
   add constraint FK_EJECUTOR_UBICACION_CIUDAD foreign key (ID_CIUDAD)
      references CIUDAD (ID_CIUDAD);

alter table ENTIDAD_TERRITORIAL_PROPONENTE
   add constraint FK_ENTIDAD__ENTIDAD_T_EJECUTOR foreign key (NIT_EJEC)
      references EJECUTOR (NIT_EJEC);

alter table ENTIDAD_TERRITORIAL_PROPONENTE
   add constraint FK_ENTIDAD__ORDEN_TER_CIUDAD foreign key (ID_CIUDAD)
      references CIUDAD (ID_CIUDAD);

alter table ENTIDAD_TERRITORIAL_PROPONENTE
   add constraint FK_ENTIDAD__ORDEN_TER_DEPARTAM foreign key (ID_DEP)
      references DEPARTAMENTO (ID_DEP);

alter table ENTIDAD_TERRITORIAL_PROPONENTE
   add constraint FK_ENTIDAD__REPRESENT_REPRESEN foreign key (NIT_ENT)
      references REPRESENTANTE_LEGAL (CEDULA_PERS);

alter table PRODUCTO
   add constraint FK_PRODUCTO_PROYECTO__PROYECTO foreign key (ID_PROYECTO)
      references PROYECTO (ID_PROYECTO);

alter table PRODUCTO__ENTIDAD_BENEFICIADA
   add constraint FK_PRODUCTO_PRODUCTO__PRODUCTO foreign key (ID_PRODUCTO)
      references PRODUCTO (ID_PRODUCTO);

alter table PRODUCTO__ENTIDAD_BENEFICIADA
   add constraint FK_PRODUCTO_PRODUCTO__ENTIDADE foreign key (ID__ENTIDADES_BENEFICIADAS)
      references ENTIDADES_BENEFICIADAS (ID__ENTIDADES_BENEFICIADAS);

alter table PROYECTO
   add constraint FK_PROYECTO_EJECUTOR__EJECUTOR foreign key (NIT_EJEC)
      references EJECUTOR (NIT_EJEC);

alter table PROYECTO
   add constraint FK_PROYECTO_PROYECTO__DELEGADO foreign key (ID_PROYECTO)
      references DELEGADO (CEDULA_PERS);

alter table PROYECTO
   add constraint FK_PROYECTO_PROYECTO__DELEG foreign key (ID_PROYECTO)
      references DELEGADO (CEDULA_PERS);

alter table PROYECTO
   add constraint FK_PROYECTO_PROYECTO__ENTIDAD_ foreign key (NIT_ENT)
      references ENTIDAD_TERRITORIAL_PROPONENTE (NIT_ENT);

alter table PROYECTO__ENTIDAD_BENEFICIADA
   add constraint FK_PROYECTO_PROYECTO__ENTIDADE foreign key (ID__ENTIDADES_BENEFICIADAS)
      references ENTIDADES_BENEFICIADAS (ID__ENTIDADES_BENEFICIADAS);

alter table PROYECTO__ENTIDAD_BENEFICIADA
   add constraint FK_PROYECTO_PROYECTO__PROYECTO foreign key (ID_PROYECTO)
      references PROYECTO (ID_PROYECTO);

alter table REPRESENTANTE_LEGAL
   add constraint FK_REPRESEN_LUGAR_DE__CIUDAD foreign key (ID_CIUDAD)
      references CIUDAD (ID_CIUDAD);

alter table REPRESENTANTE_LEGAL
   add constraint FK_REPRESEN_REPRESENT_ENTIDAD_ foreign key (NIT_ENT)
      references ENTIDAD_TERRITORIAL_PROPONENTE (NIT_ENT);

alter table REPRESENTANTE_LEGAL
   add constraint FK_REPRESEN_REPRESENT_EJECUTOR foreign key (NIT_EJEC)
      references EJECUTOR (NIT_EJEC);

