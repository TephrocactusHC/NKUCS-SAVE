/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2019/3/21 14:02:31                           */
/*==============================================================*/


drop table if exists Anime;

drop table if exists AnimeResource;

drop table if exists Broadcast;

drop table if exists CaptionGroup;

drop table if exists CaptionTV;

drop table if exists Issuer;

drop table if exists Location;

drop table if exists OriginalDisk;

drop table if exists Producer;

drop table if exists SuppressBD;

drop table if exists SuppressGroup;

/*==============================================================*/
/* Table: Anime                                                 */
/*==============================================================*/
create table Anime
(
   StartDate            datetime,
   EndDate              datetime,
   Anime_Name           varchar(1) not null,
   Producer_Name        varchar(1),
   primary key (Anime_Name)
);

alter table Anime comment 'Anime';

/*==============================================================*/
/* Table: AnimeResource                                         */
/*==============================================================*/
create table AnimeResource
(
   ResourceType         varchar(1) not null,
   Anime_Name           varchar(1),
   primary key (ResourceType)
);

alter table AnimeResource comment 'AnimeResource';

/*==============================================================*/
/* Table: Broadcast                                             */
/*==============================================================*/
create table Broadcast
(
   Anime_Name           varchar(1) not null,
   Age                  numeric(8,0) not null,
   Issuer_Name          varchar(1) not null,
   primary key (Anime_Name, Age, Issuer_Name)
);

alter table Broadcast comment 'Broadcast';

/*==============================================================*/
/* Table: CaptionGroup                                          */
/*==============================================================*/
create table CaptionGroup
(
   CaptionGroup_Name    varchar(1) not null,
   CaptionGroup_Principle varchar(1),
   CaptionGroup_Date    datetime,
   primary key (CaptionGroup_Name)
);

alter table CaptionGroup comment 'CaptionGroup';

/*==============================================================*/
/* Table: CaptionTV                                             */
/*==============================================================*/
create table CaptionTV
(
   TV_Resolution        bigint,
   TV_Name              varchar(1) not null,
   ResourceType         varchar(1),
   CaptionGroup_Name    varchar(1),
   primary key (TV_Name)
);

alter table CaptionTV comment 'CaptionTV';

/*==============================================================*/
/* Table: Issuer                                                */
/*==============================================================*/
create table Issuer
(
   Issuer_Name          varchar(1) not null,
   Issuer_Address       varchar(1),
   primary key (Issuer_Name)
);

alter table Issuer comment 'Issuer';

/*==============================================================*/
/* Table: Location                                              */
/*==============================================================*/
create table Location
(
   Age                  numeric(8,0) not null,
   primary key (Age)
);

alter table Location comment 'Location';

/*==============================================================*/
/* Table: OriginalDisk                                          */
/*==============================================================*/
create table OriginalDisk
(
   Original_Price       bigint,
   Original_SellPosition varchar(1),
   Original_SellDate    datetime,
   Original_OrderNum    bigint not null,
   ResourceType         varchar(1),
   primary key (Original_OrderNum)
);

alter table OriginalDisk comment 'OriginalDisk';

/*==============================================================*/
/* Table: Producer                                              */
/*==============================================================*/
create table Producer
(
   Producer_Address     varchar(1),
   Producer_Name        varchar(1) not null,
   primary key (Producer_Name)
);

alter table Producer comment 'Producer';

/*==============================================================*/
/* Table: SuppressBD                                            */
/*==============================================================*/
create table SuppressBD
(
   BD_resolution        bigint,
   BD_Track             varchar(1),
   BD_Name              varchar(1) not null,
   Original_OrderNum    bigint,
   ResourceType         varchar(1),
   SuppressGroup_Name   varchar(1),
   primary key (BD_Name)
);

alter table SuppressBD comment 'SuppressBD';

/*==============================================================*/
/* Table: SuppressGroup                                         */
/*==============================================================*/
create table SuppressGroup
(
   SuppressGroup_Name   varchar(1) not null,
   SuppressGourp_Date   datetime,
   SuppressGroup_Principle varchar(1),
   primary key (SuppressGroup_Name)
);

alter table SuppressGroup comment 'SuppressGroup';

alter table Anime add constraint FK_Produce foreign key (Producer_Name)
      references Producer (Producer_Name);

alter table AnimeResource add constraint FK_Resource foreign key (Anime_Name)
      references Anime (Anime_Name);

alter table Broadcast add constraint FK_Broadcast foreign key (Anime_Name)
      references Anime (Anime_Name);

alter table Broadcast add constraint FK_Broadcast2 foreign key (Age)
      references Location (Age);

alter table Broadcast add constraint FK_Broadcast3 foreign key (Issuer_Name)
      references Issuer (Issuer_Name);

alter table CaptionTV add constraint FK_Caption foreign key (CaptionGroup_Name)
      references CaptionGroup (CaptionGroup_Name);

alter table CaptionTV add constraint FK_Is_TV foreign key (ResourceType)
      references AnimeResource (ResourceType);

alter table OriginalDisk add constraint FK_Is_OriginalDisk foreign key (ResourceType)
      references AnimeResource (ResourceType);

alter table SuppressBD add constraint FK_Is_BD foreign key (ResourceType)
      references AnimeResource (ResourceType);

alter table SuppressBD add constraint FK_OriginalDiskSource foreign key (Original_OrderNum)
      references OriginalDisk (Original_OrderNum);

alter table SuppressBD add constraint FK_Suppress foreign key (SuppressGroup_Name)
      references SuppressGroup (SuppressGroup_Name);

