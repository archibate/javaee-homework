-- vim: ft=mysql

create database letterdb;
use letterdb;

create table t_user
( u_no int not null auto_increment
, u_name varchar(64) not null
, u_passwd char(32) not null
, u_sex enum('M', 'F') not null
, u_email char(32) not null
, u_tel char(16) not null
, u_ctime datetime null default current_timestamp
, primary key (u_no)
, unique (u_name)
, unique (u_tel)
, unique (u_email)
);

create table commodity
( c_no int not null auto_increment
, c_info varchar(200) not null
, c_imgpath varchar(50) not null
, c_sort int not null
, c_price decimal(9, 2) not null
, c_storage int not null
, primary key (c_no)
);

insert into commodity (c_info, c_imgpath, c_sort, c_price, c_storage) values ('德运高钙全脂成人牛奶粉，来自澳大利亚天然牧场。','image/homepage/food/food1.jpg',1,100,100);
insert into commodity (c_info, c_imgpath, c_sort, c_price, c_storage) values ('瑞士莲软心进口巧克力，精选5种口味颗数随机 满足你的味蕾。','image/homepage/food/food2.jpg',1,50,100);
insert into commodity (c_info, c_imgpath, c_sort, c_price, c_storage) values ('苏泊尔电饭煲，4L 超大可视窗','image/homepage/equip/equip1.jpg',2,300,100);
insert into commodity (c_info, c_imgpath, c_sort, c_price, c_storage) values ('美的洗烘一体机，M-smart智能家居系统，WIFI控制；','image/homepage/equip/equip2.jpg',2,3000,100);
insert into commodity (c_info, c_imgpath, c_sort, c_price, c_storage) values ('楚乔传 ，正版包邮 特工皇妃楚乔传 全三册 潇湘冬儿的书。','image/homepage/book/book1.jpg',3,50,100);
insert into commodity (c_info, c_imgpath, c_sort, c_price, c_storage) values ('红楼梦，《红楼梦》，中国古代四大名著之首，章回体长篇小说。','image/homepage/book/book2.jpg',3,60,100);
insert into commodity (c_info, c_imgpath, c_sort, c_price, c_storage) values('三国演义，阅读古典名著 品味经典文化','image/homepage/book/book3.jpg',3,45,100);
insert into commodity (c_info, c_imgpath, c_sort, c_price, c_storage) values('我不乱发脾气，0-3岁亲子共读早教启蒙认知图书籍','image/homepage/book/book4.jpg',3,45,100);
insert into commodity (c_info, c_imgpath, c_sort, c_price, c_storage) values ('三星笔记本，星曜7系 2020款 16G大内存 1.29kg超轻薄 窄边框','image/homepage/equip/equip3.jpg',2,3000,100);
insert into commodity (c_info, c_imgpath, c_sort, c_price, c_storage) values('蒙牛特仑苏，特仑苏有机纯牛奶3.8g蛋白质含量升级 250ml*24 梦幻盖礼盒装','image/homepage/food/food3.jpg',1,150,100);
insert into commodity (c_info, c_imgpath, c_sort, c_price, c_storage) values('楼兰蜜语楼兰蜜语红枣，选一等五星和田红枣500g*2袋 节日送礼','image/homepage/food/food4.jpg',1,45,100);
