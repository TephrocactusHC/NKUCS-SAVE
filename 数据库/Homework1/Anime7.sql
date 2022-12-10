/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2012                    */
/* Created on:     2019/3/28 17:37:06                           */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Anime') and o.name = 'FK_ANIME_PRODUCE_PRODUCER')
alter table Anime
   drop constraint FK_ANIME_PRODUCE_PRODUCER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('AnimeResource') and o.name = 'FK_ANIMERES_RESOURCE_ANIME')
alter table AnimeResource
   drop constraint FK_ANIMERES_RESOURCE_ANIME
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Broadcast') and o.name = 'FK_BROADCAS_BROADCAST_ANIME')
alter table Broadcast
   drop constraint FK_BROADCAS_BROADCAST_ANIME
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Broadcast') and o.name = 'FK_BROADCAS_BROADCAST_LOCATION')
alter table Broadcast
   drop constraint FK_BROADCAS_BROADCAST_LOCATION
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Broadcast') and o.name = 'FK_BROADCAS_BROADCAST_ISSUER')
alter table Broadcast
   drop constraint FK_BROADCAS_BROADCAST_ISSUER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CaptionGroup') and o.name = 'FK_CAPTIONG_CAPTION_CAPTIONT')
alter table CaptionGroup
   drop constraint FK_CAPTIONG_CAPTION_CAPTIONT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CaptionTV') and o.name = 'FK_CAPTIONT_IS_TV_ANIMERES')
alter table CaptionTV
   drop constraint FK_CAPTIONT_IS_TV_ANIMERES
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('OriginalDisk') and o.name = 'FK_ORIGINAL_IS_ORIGIN_ANIMERES')
alter table OriginalDisk
   drop constraint FK_ORIGINAL_IS_ORIGIN_ANIMERES
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('OriginalDisk') and o.name = 'FK_ORIGINAL_ORIGINALD_SUPPRESS')
alter table OriginalDisk
   drop constraint FK_ORIGINAL_ORIGINALD_SUPPRESS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SuppressBD') and o.name = 'FK_SUPPRESS_IS_BD_ANIMERES')
alter table SuppressBD
   drop constraint FK_SUPPRESS_IS_BD_ANIMERES
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SuppressBD') and o.name = 'FK_SUPPRESS_ORIGINALD_ORIGINAL')
alter table SuppressBD
   drop constraint FK_SUPPRESS_ORIGINALD_ORIGINAL
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SuppressBD') and o.name = 'FK_SUPPRESS_SUPPRESS_SUPPRESS')
alter table SuppressBD
   drop constraint FK_SUPPRESS_SUPPRESS_SUPPRESS
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Anime')
            and   name  = 'Produce_FK'
            and   indid > 0
            and   indid < 255)
   drop index Anime.Produce_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Anime')
            and   type = 'U')
   drop table Anime
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('AnimeResource')
            and   name  = 'Resource_FK'
            and   indid > 0
            and   indid < 255)
   drop index AnimeResource.Resource_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('AnimeResource')
            and   type = 'U')
   drop table AnimeResource
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Broadcast')
            and   name  = 'Broadcast3_FK'
            and   indid > 0
            and   indid < 255)
   drop index Broadcast.Broadcast3_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Broadcast')
            and   name  = 'Broadcast2_FK'
            and   indid > 0
            and   indid < 255)
   drop index Broadcast.Broadcast2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Broadcast')
            and   name  = 'Broadcast_FK'
            and   indid > 0
            and   indid < 255)
   drop index Broadcast.Broadcast_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Broadcast')
            and   type = 'U')
   drop table Broadcast
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('CaptionGroup')
            and   name  = 'Caption_FK'
            and   indid > 0
            and   indid < 255)
   drop index CaptionGroup.Caption_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CaptionGroup')
            and   type = 'U')
   drop table CaptionGroup
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CaptionTV')
            and   type = 'U')
   drop table CaptionTV
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Issuer')
            and   type = 'U')
   drop table Issuer
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Location')
            and   type = 'U')
   drop table Location
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('OriginalDisk')
            and   name  = 'OriginalDiskSource2_FK'
            and   indid > 0
            and   indid < 255)
   drop index OriginalDisk.OriginalDiskSource2_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('OriginalDisk')
            and   type = 'U')
   drop table OriginalDisk
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Producer')
            and   type = 'U')
   drop table Producer
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SuppressBD')
            and   name  = 'OriginalDiskSource_FK'
            and   indid > 0
            and   indid < 255)
   drop index SuppressBD.OriginalDiskSource_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SuppressBD')
            and   name  = 'Suppress_FK'
            and   indid > 0
            and   indid < 255)
   drop index SuppressBD.Suppress_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SuppressBD')
            and   type = 'U')
   drop table SuppressBD
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SuppressGroup')
            and   type = 'U')
   drop table SuppressGroup
go

/*==============================================================*/
/* Table: Anime                                                 */
/*==============================================================*/
create table Anime (
   StartDate            datetime             null,
   EndDate              datetime             null,
   Anime_Name           varchar(1)           not null,
   Producer_Name        varchar(1)           null,
   constraint PK_ANIME primary key nonclustered (Anime_Name)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('Anime') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'Anime' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Anime', 
   'user', @CurrentUser, 'table', 'Anime'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Anime')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'StartDate')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Anime', 'column', 'StartDate'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'StartDate',
   'user', @CurrentUser, 'table', 'Anime', 'column', 'StartDate'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Anime')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'EndDate')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Anime', 'column', 'EndDate'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'EndDate',
   'user', @CurrentUser, 'table', 'Anime', 'column', 'EndDate'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Anime')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Anime_Name')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Anime', 'column', 'Anime_Name'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Anime_Name',
   'user', @CurrentUser, 'table', 'Anime', 'column', 'Anime_Name'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Anime')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Producer_Name')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Anime', 'column', 'Producer_Name'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Producer_Name',
   'user', @CurrentUser, 'table', 'Anime', 'column', 'Producer_Name'
go

/*==============================================================*/
/* Index: Produce_FK                                            */
/*==============================================================*/
create index Produce_FK on Anime (
Producer_Name ASC
)
go

/*==============================================================*/
/* Table: AnimeResource                                         */
/*==============================================================*/
create table AnimeResource (
   AnimeResource_Name   varchar(1)           not null,
   Anime_Name           varchar(1)           null,
   Anime_Space          int                  null,
   constraint PK_ANIMERESOURCE primary key nonclustered (AnimeResource_Name)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('AnimeResource') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'AnimeResource' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'AnimeResource', 
   'user', @CurrentUser, 'table', 'AnimeResource'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('AnimeResource')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'AnimeResource_Name')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'AnimeResource', 'column', 'AnimeResource_Name'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'AnimeResource_Name',
   'user', @CurrentUser, 'table', 'AnimeResource', 'column', 'AnimeResource_Name'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('AnimeResource')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Anime_Name')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'AnimeResource', 'column', 'Anime_Name'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Anime_Name',
   'user', @CurrentUser, 'table', 'AnimeResource', 'column', 'Anime_Name'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('AnimeResource')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Anime_Space')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'AnimeResource', 'column', 'Anime_Space'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Anime_Space',
   'user', @CurrentUser, 'table', 'AnimeResource', 'column', 'Anime_Space'
go

/*==============================================================*/
/* Index: Resource_FK                                           */
/*==============================================================*/
create index Resource_FK on AnimeResource (
Anime_Name ASC
)
go

/*==============================================================*/
/* Table: Broadcast                                             */
/*==============================================================*/
create table Broadcast (
   Anime_Name           varchar(1)           not null,
   Age                  numeric              not null,
   Issuer_Name          varchar(1)           not null,
   constraint PK_BROADCAST primary key (Anime_Name, Age, Issuer_Name)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('Broadcast') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'Broadcast' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Broadcast', 
   'user', @CurrentUser, 'table', 'Broadcast'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Broadcast')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Anime_Name')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Broadcast', 'column', 'Anime_Name'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Anime_Name',
   'user', @CurrentUser, 'table', 'Broadcast', 'column', 'Anime_Name'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Broadcast')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Age')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Broadcast', 'column', 'Age'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Age',
   'user', @CurrentUser, 'table', 'Broadcast', 'column', 'Age'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Broadcast')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Issuer_Name')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Broadcast', 'column', 'Issuer_Name'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Issuer_Name',
   'user', @CurrentUser, 'table', 'Broadcast', 'column', 'Issuer_Name'
go

/*==============================================================*/
/* Index: Broadcast_FK                                          */
/*==============================================================*/
create index Broadcast_FK on Broadcast (
Anime_Name ASC
)
go

/*==============================================================*/
/* Index: Broadcast2_FK                                         */
/*==============================================================*/
create index Broadcast2_FK on Broadcast (
Age ASC
)
go

/*==============================================================*/
/* Index: Broadcast3_FK                                         */
/*==============================================================*/
create index Broadcast3_FK on Broadcast (
Issuer_Name ASC
)
go

/*==============================================================*/
/* Table: CaptionGroup                                          */
/*==============================================================*/
create table CaptionGroup (
   CaptionGroup_Name    varchar(1)           not null,
   AnimeResource_Name   varchar(1)           null,
   CaptionGroup_Principle varchar(1)           null,
   CaptionGroup_Date    datetime             null,
   constraint PK_CAPTIONGROUP primary key nonclustered (CaptionGroup_Name)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('CaptionGroup') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'CaptionGroup' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'CaptionGroup', 
   'user', @CurrentUser, 'table', 'CaptionGroup'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('CaptionGroup')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CaptionGroup_Name')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'CaptionGroup', 'column', 'CaptionGroup_Name'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'CaptionGroup_Name',
   'user', @CurrentUser, 'table', 'CaptionGroup', 'column', 'CaptionGroup_Name'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('CaptionGroup')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'AnimeResource_Name')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'CaptionGroup', 'column', 'AnimeResource_Name'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'AnimeResource_Name',
   'user', @CurrentUser, 'table', 'CaptionGroup', 'column', 'AnimeResource_Name'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('CaptionGroup')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CaptionGroup_Principle')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'CaptionGroup', 'column', 'CaptionGroup_Principle'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'CaptionGroup_Principle',
   'user', @CurrentUser, 'table', 'CaptionGroup', 'column', 'CaptionGroup_Principle'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('CaptionGroup')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'CaptionGroup_Date')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'CaptionGroup', 'column', 'CaptionGroup_Date'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'CaptionGroup_Date',
   'user', @CurrentUser, 'table', 'CaptionGroup', 'column', 'CaptionGroup_Date'
go

/*==============================================================*/
/* Index: Caption_FK                                            */
/*==============================================================*/
create index Caption_FK on CaptionGroup (
AnimeResource_Name ASC
)
go

/*==============================================================*/
/* Table: CaptionTV                                             */
/*==============================================================*/
create table CaptionTV (
   AnimeResource_Name   varchar(1)           not null,
   Anime_Name           varchar(1)           null,
   Anime_Space          int                  null,
   TV_Resolution        bigint               null,
   constraint PK_CAPTIONTV primary key (AnimeResource_Name)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('CaptionTV') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'CaptionTV' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'CaptionTV', 
   'user', @CurrentUser, 'table', 'CaptionTV'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('CaptionTV')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'AnimeResource_Name')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'CaptionTV', 'column', 'AnimeResource_Name'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'AnimeResource_Name',
   'user', @CurrentUser, 'table', 'CaptionTV', 'column', 'AnimeResource_Name'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('CaptionTV')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Anime_Name')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'CaptionTV', 'column', 'Anime_Name'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Anime_Name',
   'user', @CurrentUser, 'table', 'CaptionTV', 'column', 'Anime_Name'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('CaptionTV')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Anime_Space')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'CaptionTV', 'column', 'Anime_Space'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Anime_Space',
   'user', @CurrentUser, 'table', 'CaptionTV', 'column', 'Anime_Space'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('CaptionTV')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'TV_Resolution')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'CaptionTV', 'column', 'TV_Resolution'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'TV_Resolution',
   'user', @CurrentUser, 'table', 'CaptionTV', 'column', 'TV_Resolution'
go

/*==============================================================*/
/* Table: Issuer                                                */
/*==============================================================*/
create table Issuer (
   Issuer_Name          varchar(1)           not null,
   Issuer_Address       varchar(1)           null,
   constraint PK_ISSUER primary key nonclustered (Issuer_Name)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('Issuer') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'Issuer' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Issuer', 
   'user', @CurrentUser, 'table', 'Issuer'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Issuer')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Issuer_Name')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Issuer', 'column', 'Issuer_Name'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Issuer_Name',
   'user', @CurrentUser, 'table', 'Issuer', 'column', 'Issuer_Name'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Issuer')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Issuer_Address')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Issuer', 'column', 'Issuer_Address'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Issuer_Address',
   'user', @CurrentUser, 'table', 'Issuer', 'column', 'Issuer_Address'
go

/*==============================================================*/
/* Table: Location                                              */
/*==============================================================*/
create table Location (
   Age                  numeric              not null,
   constraint PK_LOCATION primary key nonclustered (Age)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('Location') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'Location' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Location', 
   'user', @CurrentUser, 'table', 'Location'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Location')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Age')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Location', 'column', 'Age'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Age',
   'user', @CurrentUser, 'table', 'Location', 'column', 'Age'
go

/*==============================================================*/
/* Table: OriginalDisk                                          */
/*==============================================================*/
create table OriginalDisk (
   AnimeResource_Name   varchar(1)           not null,
   Sup_AnimeResource_Name varchar(1)           null,
   Anime_Name           varchar(1)           null,
   Anime_Space          int                  null,
   Original_Price       bigint               null,
   Original_SellPosition varchar(1)           null,
   Original_SellDate    datetime             null,
   Original_OrderNum    bigint               null,
   constraint PK_ORIGINALDISK primary key (AnimeResource_Name)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('OriginalDisk') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'OriginalDisk' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'OriginalDisk', 
   'user', @CurrentUser, 'table', 'OriginalDisk'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('OriginalDisk')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'AnimeResource_Name')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'OriginalDisk', 'column', 'AnimeResource_Name'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'AnimeResource_Name',
   'user', @CurrentUser, 'table', 'OriginalDisk', 'column', 'AnimeResource_Name'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('OriginalDisk')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Sup_AnimeResource_Name')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'OriginalDisk', 'column', 'Sup_AnimeResource_Name'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Sup_AnimeResource_Name',
   'user', @CurrentUser, 'table', 'OriginalDisk', 'column', 'Sup_AnimeResource_Name'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('OriginalDisk')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Anime_Name')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'OriginalDisk', 'column', 'Anime_Name'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Anime_Name',
   'user', @CurrentUser, 'table', 'OriginalDisk', 'column', 'Anime_Name'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('OriginalDisk')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Anime_Space')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'OriginalDisk', 'column', 'Anime_Space'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Anime_Space',
   'user', @CurrentUser, 'table', 'OriginalDisk', 'column', 'Anime_Space'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('OriginalDisk')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Original_Price')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'OriginalDisk', 'column', 'Original_Price'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Original_Price',
   'user', @CurrentUser, 'table', 'OriginalDisk', 'column', 'Original_Price'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('OriginalDisk')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Original_SellPosition')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'OriginalDisk', 'column', 'Original_SellPosition'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Original_SellPosition',
   'user', @CurrentUser, 'table', 'OriginalDisk', 'column', 'Original_SellPosition'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('OriginalDisk')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Original_SellDate')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'OriginalDisk', 'column', 'Original_SellDate'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Original_SellDate',
   'user', @CurrentUser, 'table', 'OriginalDisk', 'column', 'Original_SellDate'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('OriginalDisk')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Original_OrderNum')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'OriginalDisk', 'column', 'Original_OrderNum'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Original_OrderNum',
   'user', @CurrentUser, 'table', 'OriginalDisk', 'column', 'Original_OrderNum'
go

/*==============================================================*/
/* Index: OriginalDiskSource2_FK                                */
/*==============================================================*/
create index OriginalDiskSource2_FK on OriginalDisk (
Sup_AnimeResource_Name ASC
)
go

/*==============================================================*/
/* Table: Producer                                              */
/*==============================================================*/
create table Producer (
   Producer_Address     varchar(1)           null,
   Producer_Name        varchar(1)           not null,
   constraint PK_PRODUCER primary key nonclustered (Producer_Name)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('Producer') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'Producer' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'Producer', 
   'user', @CurrentUser, 'table', 'Producer'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Producer')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Producer_Address')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Producer', 'column', 'Producer_Address'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Producer_Address',
   'user', @CurrentUser, 'table', 'Producer', 'column', 'Producer_Address'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('Producer')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Producer_Name')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'Producer', 'column', 'Producer_Name'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Producer_Name',
   'user', @CurrentUser, 'table', 'Producer', 'column', 'Producer_Name'
go

/*==============================================================*/
/* Table: SuppressBD                                            */
/*==============================================================*/
create table SuppressBD (
   AnimeResource_Name   varchar(1)           not null,
   SuppressGroup_Name   varchar(1)           null,
   Ori_AnimeResource_Name varchar(1)           null,
   Anime_Name           varchar(1)           null,
   Anime_Space          int                  null,
   BD_resolution        bigint               null,
   BD_Track             varchar(1)           null,
   constraint PK_SUPPRESSBD primary key (AnimeResource_Name)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('SuppressBD') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'SuppressBD' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'SuppressBD', 
   'user', @CurrentUser, 'table', 'SuppressBD'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('SuppressBD')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'AnimeResource_Name')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'SuppressBD', 'column', 'AnimeResource_Name'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'AnimeResource_Name',
   'user', @CurrentUser, 'table', 'SuppressBD', 'column', 'AnimeResource_Name'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('SuppressBD')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'SuppressGroup_Name')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'SuppressBD', 'column', 'SuppressGroup_Name'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'SuppressGroup_Name',
   'user', @CurrentUser, 'table', 'SuppressBD', 'column', 'SuppressGroup_Name'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('SuppressBD')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Ori_AnimeResource_Name')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'SuppressBD', 'column', 'Ori_AnimeResource_Name'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Ori_AnimeResource_Name',
   'user', @CurrentUser, 'table', 'SuppressBD', 'column', 'Ori_AnimeResource_Name'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('SuppressBD')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Anime_Name')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'SuppressBD', 'column', 'Anime_Name'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Anime_Name',
   'user', @CurrentUser, 'table', 'SuppressBD', 'column', 'Anime_Name'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('SuppressBD')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'Anime_Space')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'SuppressBD', 'column', 'Anime_Space'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Anime_Space',
   'user', @CurrentUser, 'table', 'SuppressBD', 'column', 'Anime_Space'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('SuppressBD')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'BD_resolution')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'SuppressBD', 'column', 'BD_resolution'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'BD_resolution',
   'user', @CurrentUser, 'table', 'SuppressBD', 'column', 'BD_resolution'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('SuppressBD')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'BD_Track')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'SuppressBD', 'column', 'BD_Track'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'BD_Track',
   'user', @CurrentUser, 'table', 'SuppressBD', 'column', 'BD_Track'
go

/*==============================================================*/
/* Index: Suppress_FK                                           */
/*==============================================================*/
create index Suppress_FK on SuppressBD (
SuppressGroup_Name ASC
)
go

/*==============================================================*/
/* Index: OriginalDiskSource_FK                                 */
/*==============================================================*/
create index OriginalDiskSource_FK on SuppressBD (
Ori_AnimeResource_Name ASC
)
go

/*==============================================================*/
/* Table: SuppressGroup                                         */
/*==============================================================*/
create table SuppressGroup (
   SuppressGroup_Name   varchar(1)           not null,
   SuppressGourp_Date   datetime             null,
   SuppressGroup_Principle varchar(1)           null,
   constraint PK_SUPPRESSGROUP primary key nonclustered (SuppressGroup_Name)
)
go

if exists (select 1 from  sys.extended_properties
           where major_id = object_id('SuppressGroup') and minor_id = 0)
begin 
   declare @CurrentUser sysname 
select @CurrentUser = user_name() 
execute sp_dropextendedproperty 'MS_Description',  
   'user', @CurrentUser, 'table', 'SuppressGroup' 
 
end 


select @CurrentUser = user_name() 
execute sp_addextendedproperty 'MS_Description',  
   'SuppressGroup', 
   'user', @CurrentUser, 'table', 'SuppressGroup'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('SuppressGroup')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'SuppressGroup_Name')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'SuppressGroup', 'column', 'SuppressGroup_Name'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'SuppressGroup_Name',
   'user', @CurrentUser, 'table', 'SuppressGroup', 'column', 'SuppressGroup_Name'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('SuppressGroup')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'SuppressGourp_Date')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'SuppressGroup', 'column', 'SuppressGourp_Date'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'SuppressGourp_Date',
   'user', @CurrentUser, 'table', 'SuppressGroup', 'column', 'SuppressGourp_Date'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('SuppressGroup')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'SuppressGroup_Principle')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'SuppressGroup', 'column', 'SuppressGroup_Principle'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'SuppressGroup_Principle',
   'user', @CurrentUser, 'table', 'SuppressGroup', 'column', 'SuppressGroup_Principle'
go

alter table Anime
   add constraint FK_ANIME_PRODUCE_PRODUCER foreign key (Producer_Name)
      references Producer (Producer_Name)
go

alter table AnimeResource
   add constraint FK_ANIMERES_RESOURCE_ANIME foreign key (Anime_Name)
      references Anime (Anime_Name)
go

alter table Broadcast
   add constraint FK_BROADCAS_BROADCAST_ANIME foreign key (Anime_Name)
      references Anime (Anime_Name)
go

alter table Broadcast
   add constraint FK_BROADCAS_BROADCAST_LOCATION foreign key (Age)
      references Location (Age)
go

alter table Broadcast
   add constraint FK_BROADCAS_BROADCAST_ISSUER foreign key (Issuer_Name)
      references Issuer (Issuer_Name)
go

alter table CaptionGroup
   add constraint FK_CAPTIONG_CAPTION_CAPTIONT foreign key (AnimeResource_Name)
      references CaptionTV (AnimeResource_Name)
go

alter table CaptionTV
   add constraint FK_CAPTIONT_IS_TV_ANIMERES foreign key (AnimeResource_Name)
      references AnimeResource (AnimeResource_Name)
go

alter table OriginalDisk
   add constraint FK_ORIGINAL_IS_ORIGIN_ANIMERES foreign key (AnimeResource_Name)
      references AnimeResource (AnimeResource_Name)
go

alter table OriginalDisk
   add constraint FK_ORIGINAL_ORIGINALD_SUPPRESS foreign key (Sup_AnimeResource_Name)
      references SuppressBD (AnimeResource_Name)
go

alter table SuppressBD
   add constraint FK_SUPPRESS_IS_BD_ANIMERES foreign key (AnimeResource_Name)
      references AnimeResource (AnimeResource_Name)
go

alter table SuppressBD
   add constraint FK_SUPPRESS_ORIGINALD_ORIGINAL foreign key (Ori_AnimeResource_Name)
      references OriginalDisk (AnimeResource_Name)
go

alter table SuppressBD
   add constraint FK_SUPPRESS_SUPPRESS_SUPPRESS foreign key (SuppressGroup_Name)
      references SuppressGroup (SuppressGroup_Name)
go

