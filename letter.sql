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

insert into commodity (c_info, c_imgpath, c_sort, c_price, c_storage) values ('µÂÔË¸ß¸ÆÈ«Ö¬³ÉÈËÅ£ÄÌ·Û£¬À´×Ô°Ä´óÀûÑÇÌìÈ»ÄÁ³¡¡£','image/homepage/food/food1.jpg',1,100,100);
insert into commodity (c_info, c_imgpath, c_sort, c_price, c_storage) values ('ÈðÊ¿Á«ÈíÐÄ½ø¿ÚÇÉ¿ËÁ¦£¬¾«Ñ¡5ÖÖ¿ÚÎ¶¿ÅÊýËæ»ú Âú×ãÄãµÄÎ¶ÀÙ¡£','image/homepage/food/food2.jpg',1,50,100);
insert into commodity (c_info, c_imgpath, c_sort, c_price, c_storage) values ('ËÕ²´¶ûµç·¹ìÒ£¬4L ³¬´ó¿ÉÊÓ´°','image/homepage/equip/equip1.jpg',2,300,100);
insert into commodity (c_info, c_imgpath, c_sort, c_price, c_storage) values ('ÃÀµÄÏ´ºæÒ»Ìå»ú£¬M-smartÖÇÄÜ¼Ò¾ÓÏµÍ³£¬WIFI¿ØÖÆ£»','image/homepage/equip/equip2.jpg',2,3000,100);
insert into commodity (c_info, c_imgpath, c_sort, c_price, c_storage) values ('³þÇÇ´« £¬Õý°æ°üÓÊ ÌØ¹¤»Êåú³þÇÇ´« È«Èý²á äìÏæ¶¬¶ùµÄÊé¡£','image/homepage/book/book1.jpg',3,50,100);
insert into commodity (c_info, c_imgpath, c_sort, c_price, c_storage) values ('ºìÂ¥ÃÎ£¬¡¶ºìÂ¥ÃÎ¡·£¬ÖÐ¹ú¹Å´úËÄ´óÃûÖøÖ®Ê×£¬ÕÂ»ØÌå³¤ÆªÐ¡Ëµ¡£','image/homepage/book/book2.jpg',3,60,100);
insert into commodity (c_info, c_imgpath, c_sort, c_price, c_storage) values('Èý¹úÑÝÒå£¬ÔÄ¶Á¹ÅµäÃûÖø Æ·Î¶¾­µäÎÄ»¯','image/homepage/book/book3.jpg',3,45,100);
insert into commodity (c_info, c_imgpath, c_sort, c_price, c_storage) values('ÎÒ²»ÂÒ·¢Æ¢Æø£¬0-3ËêÇ××Ó¹²¶ÁÔç½ÌÆôÃÉÈÏÖªÍ¼Êé¼®','image/homepage/book/book4.jpg',3,45,100);
insert into commodity (c_info, c_imgpath, c_sort, c_price, c_storage) values ('ÈýÐÇ±Ê¼Ç±¾£¬ÐÇê×7Ïµ 2020¿î 16G´óÄÚ´æ 1.29kg³¬Çá±¡ Õ­±ß¿ò','image/homepage/equip/equip3.jpg',2,3000,100);
insert into commodity (c_info, c_imgpath, c_sort, c_price, c_storage) values('ÃÉÅ£ÌØÂØËÕ£¬ÌØÂØËÕÓÐ»ú´¿Å£ÄÌ3.8gµ°°×ÖÊº¬Á¿Éý¼¶ 250ml*24 ÃÎ»Ã¸ÇÀñºÐ×°','image/homepage/food/food3.jpg',1,150,100);
insert into commodity (c_info, c_imgpath, c_sort, c_price, c_storage) values('Â¥À¼ÃÛÓïÂ¥À¼ÃÛÓïºìÔæ£¬Ñ¡Ò»µÈÎåÐÇºÍÌïºìÔæ500g*2´ü ½ÚÈÕËÍÀñ','image/homepage/food/food4.jpg',1,45,100);
