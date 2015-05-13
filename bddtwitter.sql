create database Twitter;
use Twitter;
create table T_COMPTE(
Compte_Id int(9) not null auto_increment,
Compte_Login varchar(150),
Compte_Mdp varchar(200),
Compte_Date_Crea DATETIME,
Compte_Email varchar(200),
Compte_Description text,
Compte_Nb_Tweets int(6),
Compte_Nb_Followers int(6),
Compte_Nb_Following int(6),
Compte_Mention varchar(255),
Compte_Image text,
primary key(Compte_Id)
);

create table T_FOLLOWERS(
Followers_Id int(9) not null auto_increment,
Followers_Login varchar(150),
primary key(Followers_Id)
);

create table T_FOLLOWING(
Following_Id int(9) not null auto_increment,
Following_Login varchar(150),
primary key(Following_Id)
);

create table T_SUIVRE(
Compte_Id int(9) not null,
Followers_Id int(9) not null,
primary key (Compte_Id,Followers_Id),
foreign key(Compte_Id) references T_COMPTE(Compte_Id),
foreign key(Followers_Id) references T_FOLLOWERS(Followers_Id)
);

create table T_ETRE_SUIVI(
Compte_Id int(9) not null,
Following_Id int(9) not null,
primary key (Compte_Id,Following_Id),
foreign key(Compte_Id) references T_COMPTE(Compte_Id),
foreign key(Following_Id) references T_FOLLOWING(Following_Id)
);

create table T_TWEET(
Tweet_Id int(9) not null auto_increment,
Compte_Id int(9) not null,
Tweet_Date DATETIME,
Tweet_Nb_retweet int(9),
Tweet_Description text,
primary key(Tweet_Id),
foreign key(Compte_Id) references T_COMPTE(Compte_Id)
);

create table T_HASHTAG(
Hashtag_Id int(9) not null,
Hashtag_Description varchar(255),
Tweet_Id int(9) not null,
primary key(Hashtag_Id),
foreign key(Tweet_Id) references T_TWEET(Tweet_Id)
);
