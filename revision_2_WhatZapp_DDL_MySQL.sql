/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de création :  08.05.2020 09:13:31                      */
/*==============================================================*/


drop table if exists TBLASSOCIATIONS;

drop table if exists TBLGROUPES;

drop table if exists TBLMESSAGES;

drop table if exists TBLRECEPTIONS;

drop table if exists TBLRELATIONS;

drop table if exists TBLUTILISATEURS;

/*==============================================================*/
/* Table : TBLASSOCIATIONS                                      */
/*==============================================================*/
create table TBLASSOCIATIONS
(
   IDUTILISATEUR        int not null,
   IDGROUPE             int not null,
   primary key (IDUTILISATEUR, IDGROUPE)
);

/*==============================================================*/
/* Table : TBLGROUPES                                           */
/*==============================================================*/
create table TBLGROUPES
(
   IDGROUPE             int not null,
   NOMGROUPE             char(25) not null,
   IMAGEGROUPE          longblob,
   primary key (IDGROUPE)
);

/*==============================================================*/
/* Table : TBLMESSAGES                                          */
/*==============================================================*/
create table TBLMESSAGES
(
   IDMESSAGE            int not null,
   IDGROUPE             int,
   IDUTILISATEURENVOI   int not null,
   TEXTEMESSAGE         varchar(400),
   PHOTOMESSAGE         longblob,
   DATEENVOIMESSAGE     date not null,
   primary key (IDMESSAGE)
);

/*==============================================================*/
/* Table : TBLRECEPTIONS                                        */
/*==============================================================*/
create table TBLRECEPTIONS
(
   IDUTILISATEUR        int not null,
   IDMESSAGE            int not null,
   DATERECEPTIONMESSAGE date not null,
   DATELECTUREMESSAGE   date,
   primary key (IDUTILISATEUR, IDMESSAGE)
);

/*==============================================================*/
/* Table : TBLRELATIONS                                         */
/*==============================================================*/
create table TBLRELATIONS
(
   IDUTILISATEURRELATIONPERE int not null,
   IDUTILISATEURRELATIONFILS int not null,
   primary key (IDUTILISATEURRELATIONPERE, IDUTILISATEURRELATIONFILS)
);

/*==============================================================*/
/* Table : TBLUTILISATEURS                                      */
/*==============================================================*/
create table TBLUTILISATEURS
(
   IDUTILISATEUR        int not null,
   NOMUTILISATEUR       char(50) not null,
   TELUTILISATEUR       char(20) not null,
   IMAGEUTILISATEUR     longblob,
   DATENAISSANCEUTILISATEUR date not null,
   primary key (IDUTILISATEUR)
);

alter table TBLASSOCIATIONS add constraint FK_TBLASSOCIATIONS foreign key (IDUTILISATEUR)
      references TBLUTILISATEURS (IDUTILISATEUR) on delete restrict on update restrict;

alter table TBLASSOCIATIONS add constraint FK_TBLASSOCIATIONS2 foreign key (IDGROUPE)
      references TBLGROUPES (IDGROUPE) on delete restrict on update restrict;

alter table TBLMESSAGES add constraint FK_TBLENVOIS foreign key (IDUTILISATEURENVOI)
      references TBLUTILISATEURS (IDUTILISATEUR) on delete restrict on update restrict;

alter table TBLMESSAGES add constraint FK_TBLPROVENANCES foreign key (IDGROUPE)
      references TBLGROUPES (IDGROUPE) on delete restrict on update restrict;

alter table TBLRECEPTIONS add constraint FK_TBLRECEPTIONS foreign key (IDUTILISATEUR)
      references TBLUTILISATEURS (IDUTILISATEUR) on delete restrict on update restrict;

alter table TBLRECEPTIONS add constraint FK_TBLRECEPTIONS2 foreign key (IDMESSAGE)
      references TBLMESSAGES (IDMESSAGE) on delete restrict on update restrict;

alter table TBLRELATIONS add constraint FK_TBLRELATIONS foreign key (IDUTILISATEURRELATIONPERE)
      references TBLUTILISATEURS (IDUTILISATEUR) on delete restrict on update restrict;

alter table TBLRELATIONS add constraint FK_TBLRELATIONS2 foreign key (IDUTILISATEURRELATIONFILS)
      references TBLUTILISATEURS (IDUTILISATEUR) on delete restrict on update restrict;

