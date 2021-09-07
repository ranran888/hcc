#设置客户端连接服务器端的编码
set names utf8;
--# 丢弃数据库，如果存在
drop database if exists hcc;
-- #创建数据库，设置存储的编码
create database hcc charset=utf8;
-- #进入数据库
use hcc;


-- #创建用户表user
create table user(
  lid int primary key auto_increment,
  lname varchar(32),
  lpwd varchar(32),
  lphone varchar(16)
);
INSERT INTO user values(null,'xiaoxiao','123456','15362359568');


/**首页轮播**/
create table carousel(
  cid int primary key auto_increment,
  -- title varchar(64),
  img varchar(128)
  --  href varchar(128)
);

insert into carousel values
('1','http://127.0.0.1:6060/img/banner/banner1.jpg'),
(null,'http://127.0.0.1:6060/img/banner/banner2.jpg'),
(null,'http://127.0.0.1:6060/img/banner/banner3.jpg'),
(null,'http://127.0.0.1:6060/img/banner/banner4.jpg');


/**导航分类**/
create table nav_family(
  nid int not null,
  nclass int,  #导航分类  10：女装 20：男装 30：汉元素  40：童装 50：内衣 60：配饰  70：美妆  80：文玩 90：文创
  nimg varchar(128),
  title varchar(20)
);
insert into nav_family values
(1,10,'http://127.0.0.1:6060/img/nav/nav1.jpg','女装'),
(2,20,'http://127.0.0.1:6060/img/nav/nav2.jpg','男装'),
(3,30,'http://127.0.0.1:6060/img/nav/nav3.jpg','汉元素'),
(4,40,'http://127.0.0.1:6060/img/nav/nav4.jpg','童装'),
(5,50,'http://127.0.0.1:6060/img/nav/nav5.jpg','内衣'),
(6,60,'http://127.0.0.1:6060/img/nav/nav6.jpg','配饰'),
(7,70,'http://127.0.0.1:6060/img/nav/nav7.jpg','美妆'),
(8,80,'http://127.0.0.1:6060/img/nav/nav8.jpg','文玩'),
(9,90,'http://127.0.0.1:6060/img/nav/nav9.jpg','文创'),
(10,'','http://127.0.0.1:6060/img/nav/nav10.png','全部');


/**导航详细分类**/
create table nav_family_family(
  fid int,
  nav_class int,  #导航分类
  familyclass int,#导航详细分类
  fimg varchar(128),#图片路径
  ftitle varchar(50)#分类名称
);
insert into nav_family_family values
(1,10,11,'http://127.0.0.1:6060/img/nav/nav1/title1.jpg','立领套装'),
(2,10,12,'http://127.0.0.1:6060/img/nav/nav1/title2.jpg','交领套装'),
(3,10,13,'http://127.0.0.1:6060/img/nav/nav1/title3.jpg','袒领套装'),
(4,10,14,'http://127.0.0.1:6060/img/nav/nav1/title4.jpg','对襟套装'),
(5,10,15,'http://127.0.0.1:6060/img/nav/nav1/title5.jpg','齐胸套装'),
(6,10,16,'http://127.0.0.1:6060/img/nav/nav1/title6.jpg','褙子套装'),
(7,10,17,'http://127.0.0.1:6060/img/nav/nav1/title7.jpg','唐被子'),
(8,10,18,'http://127.0.0.1:6060/img/nav/nav1/title8.jpg','柯子群'),
(9,10,19,'http://127.0.0.1:6060/img/nav/nav1/title9.jpg','袄裙'),


(10,20,21,'http://127.0.0.1:6060/img/nav/nav2/title1.jpg','衣裳'),
(11,20,22,'http://127.0.0.1:6060/img/nav/nav2/title2.jpg','贴里'),
(12,20,23,'http://127.0.0.1:6060/img/nav/nav2/title3.jpg','塔护'),
(13,20,24,'http://127.0.0.1:6060/img/nav/nav2/title4.jpg','道袍'),
(14,20,25,'http://127.0.0.1:6060/img/nav/nav2/title5.jpg','晋襦'),
(15,20,26,'http://127.0.0.1:6060/img/nav/nav2/title6.jpg','直身'),


(16,30,31,'http://127.0.0.1:6060/img/nav/nav3/title1.jpg','套装'),
(17,30,32,'http://127.0.0.1:6060/img/nav/nav3/title2.jpg','连衣裙'),
(18,30,33,'http://127.0.0.1:6060/img/nav/nav3/title3.jpg','上衣'),
(19,30,34,'http://127.0.0.1:6060/img/nav/nav3/title4.jpg','下裙'),
(20,30,35,'http://127.0.0.1:6060/img/nav/nav3/title5.jpg','裤'),



(21,40,41,'http://127.0.0.1:6060/img/nav/nav4/title1.jpg','女装'),
(22,40,42,'http://127.0.0.1:6060/img/nav/nav4/title2.jpg','男装'),
(23,40,43,'http://127.0.0.1:6060/img/nav/nav4/title3.jpg','汉元素'),
(24,40,44,'http://127.0.0.1:6060/img/nav/nav4/title4.jpg','褥'),
(25,40,45,'http://127.0.0.1:6060/img/nav/nav4/title5.jpg','裙/裤'),



(26,50,51,'http://127.0.0.1:6060/img/nav/nav5/title1.jpg','抹胸'),
(27,50,52,'http://127.0.0.1:6060/img/nav/nav5/title2.jpg','中衣'),
(28,50,53,'http://127.0.0.1:6060/img/nav/nav5/title3.jpg','主腰'),
(29,50,54,'http://127.0.0.1:6060/img/nav/nav5/title4.jpg','义领'),
(30,50,55,'http://127.0.0.1:6060/img/nav/nav5/title5.jpg','云袜'),


(31,60,61,'http://127.0.0.1:6060/img/nav/nav6/title1.jpg','缠花'),
(32,60,62,'http://127.0.0.1:6060/img/nav/nav6/title2.jpg','绒花'),
(33,60,63,'http://127.0.0.1:6060/img/nav/nav6/title3.jpg','斗篷'),
(34,60,64,'http://127.0.0.1:6060/img/nav/nav6/title4.jpg','鞋'),
(35,60,65,'http://127.0.0.1:6060/img/nav/nav6/title5.jpg','云肩'),
(36,60,66,'http://127.0.0.1:6060/img/nav/nav6/title6.jpg','披肩'),
(37,60,67,'http://127.0.0.1:6060/img/nav/nav6/title7.jpg','扶额'),
(38,60,68,'http://127.0.0.1:6060/img/nav/nav6/title8.jpg','帽子'),
(39,60,69,'http://127.0.0.1:6060/img/nav/nav6/title9.jpg','假发'),



(40,70,71,'http://127.0.0.1:6060/img/nav/nav7/title1.jpg','彩妆'),
(41,70,72,'http://127.0.0.1:6060/img/nav/nav7/title2.jpg','唇妆'),
(42,70,73,'http://127.0.0.1:6060/img/nav/nav7/title3.jpg','眼妆'),
(43,70,74,'http://127.0.0.1:6060/img/nav/nav7/title4.jpg','底妆'),
(44,70,75,'http://127.0.0.1:6060/img/nav/nav7/title5.jpg','护肤'),
(45,70,76,'http://127.0.0.1:6060/img/nav/nav7/title6.jpg','腮红'),
(46,70,77,'http://127.0.0.1:6060/img/nav/nav7/title7.jpg','高光'),
(47,70,78,'http://127.0.0.1:6060/img/nav/nav7/title8.jpg','美甲'),
(48,70,79,'http://127.0.0.1:6060/img/nav/nav7/title9.jpg','香水'),


(49,80,81,'http://127.0.0.1:6060/img/nav/nav8/title1.jpg','扇子'),
(50,80,82,'http://127.0.0.1:6060/img/nav/nav8/title2.jpg','包'),
(51,80,83,'http://127.0.0.1:6060/img/nav/nav8/title3.jpg','伞'),
(52,80,84,'http://127.0.0.1:6060/img/nav/nav8/title4.jpg','手语'),
(53,80,85,'http://127.0.0.1:6060/img/nav/nav8/title5.jpg','香事'),
(54,80,86,'http://127.0.0.1:6060/img/nav/nav8/title6.jpg','弓箭'),
(55,80,87,'http://127.0.0.1:6060/img/nav/nav8/title7.jpg','文房'),
(56,80,88,'http://127.0.0.1:6060/img/nav/nav8/title8.jpg','篆刻'),
(57,80,89,'http://127.0.0.1:6060/img/nav/nav8/title9.jpg','茶道'),



(58,90,91,'http://127.0.0.1:6060/img/nav/nav9/title1.jpg','灯'),
(59,90,92,'http://127.0.0.1:6060/img/nav/nav9/title2.jpg','围脖'),
(60,90,93,'http://127.0.0.1:6060/img/nav/nav9/title3.jpg','布料'),
(61,90,94,'http://127.0.0.1:6060/img/nav/nav9/title4.jpg','子母'),
(62,90,95,'http://127.0.0.1:6060/img/nav/nav9/title5.jpg','抱枕'),
(63,90,96,'http://127.0.0.1:6060/img/nav/nav9/title6.jpg','食品'),
(64,90,97,'http://127.0.0.1:6060/img/nav/nav9/title7.jpg','娃衣'),
(65,90,98,'http://127.0.0.1:6060/img/nav/nav9/title8.jpg','纸巾'),
(66,90,99,'http://127.0.0.1:6060/img/nav/nav9/title9.jpg','舞蹈');


/*商品品牌表*/
create table brind (
  bid varchar(10),  #品牌编号  a:池夏 b:黎落阁 c:裳云兮 d:斜塘衣庄 e:一念情长  f:五五年元
  bimg varchar(128),
  btitle varchar(50)  #品牌名称
);
insert into brind values
('a','http://127.0.0.1:6060/img/brind/brind1jpg.','池夏'),
('b','http://127.0.0.1:6060/img/brind/brind2jpg.','黎落阁'),
('c','http://127.0.0.1:6060/img/brind/brind3jpg.','裳云兮'),
('d','http://127.0.0.1:6060/img/brind/brind4jpg.','斜塘衣庄'),
('e','http://127.0.0.1:6060/img/brind/brind5jpg.','一念情长'),
('f','http://127.0.0.1:6060/img/brind/brind6jpg.','五五年元');



/**商品详情**/
create table  details (
  iid int not null,
  product_id int not null,#商品id
  iimg varchar(128),
  iprice decimal(10,2),  #当前售价
  oldprice decimal(10,2),  #原来的售价
  iintroduc varchar(100), #商品简介
  iprice_range varchar(50), #售价范围
  oprice_range varchar(50), #原来的售价范围
  ipostage varchar(20),  #邮费
  istock int,            #库存
  iseeding int,         #种草人数
  dclass int,           #10-90导航类别   100:闪购  200：拼团  300：初秋
  d_familyclass int,     #导航详细分类
  d_brind  varchar(20)  #品牌表中的品牌id
);
insert into details values
(1,1001,"http://127.0.0.1:6060/img/one/iflashbuy1.jpg",99.50,199.50,'安庚｜闻素染晋制交领汉服日常男女同款宋裤扎染亚麻春秋套装新品','￥99.50-188.00','￥199.00-376.00','包邮',10,20,100,'','a'),
(2,1002,"http://127.0.0.1:6060/img/one/iflashbuy2.jpg",99.50,199.50,'安庚｜汉服日常女明制交领短衫早秋款新品天丝提花暗纹现货','￥99.50','￥199.00','包邮',9,120,100,'','a'),
(3,1003,"http://127.0.0.1:6060/img/one/iflashbuy3.jpg",23.40,28.80,'季九月念秋 如梦山野 原创汉服女宋制褙子三件套夏季薄款防晒','￥23.04-117.44','￥28.80-146.80','包邮',3,140,100,'','a'),
(4,1004,"http://127.0.0.1:6060/img/one/iflashbuy4.jpg",23.40,26.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥23.40-114.32','￥26.00-127.02','包邮',8,369,100,'','a'),
(5,1005,"http://127.0.0.1:6060/img/one/iflashbuy5.jpg",99.50,199.50,'安庚｜闻素染晋制交领汉服日常男女同款宋裤扎染亚麻春秋套装新品','￥99.50-188.00','￥199.00-376.00','包邮',10,20,100,'','a'),
(6,1006,"http://127.0.0.1:6060/img/one/iflashbuy6.jpg",99.50,199.50,'安庚｜汉服日常女明制交领短衫早秋款新品天丝提花暗纹现货','￥99.50','￥199.00','包邮',9,120,100,'','a'),
(7,1007,"http://127.0.0.1:6060/img/one/iflashbuy7.jpg",23.40,28.80,'季九月念秋 如梦山野 原创汉服女宋制褙子三件套夏季薄款防晒','￥23.04-117.44','￥￥28.80-146.80','包邮',3,140,100,'','a'),
(8,1008,"http://127.0.0.1:6060/img/one/iflashbuy8.jpg",23.40,26.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥23.40-114.32','￥26.00-127.02','包邮',8,369,100,'','a'),
(9,1009,"http://127.0.0.1:6060/img/one/iflashbuy9.jpg",23.40,28.80,'季九月念秋 如梦山野 原创汉服女宋制褙子三件套夏季薄款防晒','￥23.04-117.44','￥￥28.80-146.80','包邮',3,140,100,'','a'),
(10,1010,"http://127.0.0.1:6060/img/one/iflashbuy10.jpg",23.40,26.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥23.40-114.32','￥26.00-127.02','包邮',8,369,100,'','a'),


-- 拼团
(11,1011,"http://127.0.0.1:6060/img/two/group1.jpg",43.00,48.80,'季九月念秋 如梦山野 原创汉服女宋制褙子三件套夏季薄款防晒','￥43.04-117.44','￥48.80-146.80','包邮',1035,291,200,'','b'),
(12,1012,"http://127.0.0.1:6060/img/two/group2.jpg",48.60,56.00,'馨汉沐夕汉服女原创红芙蕖重工刺绣对襟齐腰齐胸襦裙大袖衫夏季','￥43.40-114.32','￥56.00-127.02','包邮',5390,369,200,'','b'),
(13,1013,"http://127.0.0.1:6060/img/two/group3.jpg",35.00,48.80,'初遇原创正品汉服女旧梦传统中国风刺绣对襟齐腰襦裙夏裙大袖衫薄','￥33.04-117.44','￥48.80-146.80','包邮',1771,1400,200,'','b'),
(14,1014,"http://127.0.0.1:6060/img/two/group4.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,200,'','b'),



-- 初秋
(15,1015,"http://127.0.0.1:6060/img/three/autumn1.jpg",43.00,48.80,'季九月念秋 如梦山野 原创汉服女宋制褙子三件套夏季薄款防晒','￥43.04-117.44','￥48.80-146.80','包邮',1035,291,300,'','c'),
(16,1016,"http://127.0.0.1:6060/img/three/autumn2.jpg",48.60,56.00,'馨汉沐夕汉服女原创红芙蕖重工刺绣对襟齐腰齐胸襦裙大袖衫夏季','￥43.40-114.32','￥56.00-127.02','包邮',5390,369,300,'','c'),
(17,1017,"http://127.0.0.1:6060/img/three/autumn3.jpg",35.00,48.80,'初遇原创正品汉服女旧梦传统中国风刺绣对襟齐腰襦裙夏裙大袖衫薄','￥33.04-117.44','￥48.80-146.80','包邮',1771,1400,300,'','c'),
(18,1018,"http://127.0.0.1:6060/img/three/autumn4.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,300,'','c'),
(19,1019,"http://127.0.0.1:6060/img/three/autumn5.jpg",43.00,48.80,'季九月念秋 如梦山野 原创汉服女宋制褙子三件套夏季薄款防晒','￥43.04-117.44','￥48.80-146.80','包邮',1035,291,300,'','c'),
(20,1020,"http://127.0.0.1:6060/img/three/autumn6.jpg",48.60,56.00,'馨汉沐夕汉服女原创红芙蕖重工刺绣对襟齐腰齐胸襦裙大袖衫夏季','￥43.40-114.32','￥56.00-127.02','包邮',5390,369,300,'','c'),
(21,1021,"http://127.0.0.1:6060/img/three/autumn7.jpg",35.00,48.80,'初遇原创正品汉服女旧梦传统中国风刺绣对襟齐腰襦裙夏裙大袖衫薄','￥33.04-117.44','￥48.80-146.80','包邮',1771,1400,300,'','c'),
(22,1022,"http://127.0.0.1:6060/img/three/autumn8.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,300,'','c'),


-- nav1 图片
(23,1023,"http://127.0.0.1:6060/img/nav/nav1/main1.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,11,'c'),
(24,1024,"http://127.0.0.1:6060/img/nav/nav1/main2.jpg",59.00,66.00,'季九月念秋 如梦山野 原创汉服女宋制褙子三件套夏季薄款防晒','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,12,'a'),
(25,1025,"http://127.0.0.1:6060/img/nav/nav1/main3.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,13,'c'),
(26,1026,"http://127.0.0.1:6060/img/nav/nav1/main4.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,14,'b'),
(27,1027,"http://127.0.0.1:6060/img/nav/nav1/main5.jpg",59.00,66.00,'遇原创正品汉服女旧梦传统中国风刺绣对襟齐腰襦裙夏裙大袖衫薄','￥59.40-114.32','￥66.00-127.02','包邮',8,369,15,11,'d'),
(28,1028,"http://127.0.0.1:6060/img/nav/nav1/main6.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,16,'d'),
(29,1029,"http://127.0.0.1:6060/img/nav/nav1/main7.jpg",59.00,66.00,'遇原创正品汉服女旧梦传统中国风刺绣对襟齐腰襦裙夏裙大袖衫薄','￥59.40-114.32','￥66.00-127.02','包邮',8,369,17,11,'c'),
(30,1030,"http://127.0.0.1:6060/img/nav/nav1/main8.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,18,'e'),
(31,1031,"http://127.0.0.1:6060/img/nav/nav1/main9.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,19,'f'),
(32,1032,"http://127.0.0.1:6060/img/nav/nav1/main10.jpg",59.00,66.00,'馨汉沐夕汉服女原创红芙蕖重工刺绣对襟齐腰齐胸襦裙大袖衫夏季','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,11,'c'),
(33,1033,"http://127.0.0.1:6060/img/nav/nav1/main1.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,12,'c'),
(34,1034,"http://127.0.0.1:6060/img/nav/nav1/main2.jpg",59.00,66.00,'季九月念秋 如梦山野 原创汉服女宋制褙子三件套夏季薄款防晒','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,13,'a'),
(35,1035,"http://127.0.0.1:6060/img/nav/nav1/main3.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,16,'c'),
(36,1036,"http://127.0.0.1:6060/img/nav/nav1/main4.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,14,'b'),
(37,1037,"http://127.0.0.1:6060/img/nav/nav1/main5.jpg",59.00,66.00,'遇原创正品汉服女旧梦传统中国风刺绣对襟齐腰襦裙夏裙大袖衫薄','￥59.40-114.32','￥66.00-127.02','包邮',8,369,13,11,'d'),
(38,1038,"http://127.0.0.1:6060/img/nav/nav1/main6.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,12,'d'),
(39,1039,"http://127.0.0.1:6060/img/nav/nav1/main7.jpg",59.00,66.00,'遇原创正品汉服女旧梦传统中国风刺绣对襟齐腰襦裙夏裙大袖衫薄','￥59.40-114.32','￥66.00-127.02','包邮',8,369,17,11,'c'),
(40,1040,"http://127.0.0.1:6060/img/nav/nav1/main8.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,18,'e'),
(41,1041,"http://127.0.0.1:6060/img/nav/nav1/main9.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,19,'f'),
(42,1042,"http://127.0.0.1:6060/img/nav/nav1/main10.jpg",59.00,66.00,'馨汉沐夕汉服女原创红芙蕖重工刺绣对襟齐腰齐胸襦裙大袖衫夏季','￥59.40-114.32','￥66.00-127.02','包邮',8,369,18,11,'c'),
(43,1043,"http://127.0.0.1:6060/img/nav/nav1/main1.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,16,'c'),
(44,1044,"http://127.0.0.1:6060/img/nav/nav1/main2.jpg",59.00,66.00,'季九月念秋 如梦山野 原创汉服女宋制褙子三件套夏季薄款防晒','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,14,'a'),
(45,1045,"http://127.0.0.1:6060/img/nav/nav1/main3.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,13,'c'),
(46,1046,"http://127.0.0.1:6060/img/nav/nav1/main4.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,14,'b'),
(47,1047,"http://127.0.0.1:6060/img/nav/nav1/main5.jpg",59.00,66.00,'遇原创正品汉服女旧梦传统中国风刺绣对襟齐腰襦裙夏裙大袖衫薄','￥59.40-114.32','￥66.00-127.02','包邮',8,369,18,11,'d'),
(48,1048,"http://127.0.0.1:6060/img/nav/nav1/main6.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,19,'d'),
(49,1049,"http://127.0.0.1:6060/img/nav/nav1/main7.jpg",59.00,66.00,'遇原创正品汉服女旧梦传统中国风刺绣对襟齐腰襦裙夏裙大袖衫薄','￥59.40-114.32','￥66.00-127.02','包邮',8,369,17,11,'c'),
(50,1050,"http://127.0.0.1:6060/img/nav/nav1/main8.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,11,'e'),
(51,1051,"http://127.0.0.1:6060/img/nav/nav1/main9.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,17,'f'),
(52,1052,"http://127.0.0.1:6060/img/nav/nav1/main10.jpg",59.00,66.00,'馨汉沐夕汉服女原创红芙蕖重工刺绣对襟齐腰齐胸襦裙大袖衫夏季','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,15,'c'),
(53,1053,"http://127.0.0.1:6060/img/nav/nav1/main1.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,11,'c'),
(54,1054,"http://127.0.0.1:6060/img/nav/nav1/main2.jpg",59.00,66.00,'季九月念秋 如梦山野 原创汉服女宋制褙子三件套夏季薄款防晒','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,19,'a'),
(55,1055,"http://127.0.0.1:6060/img/nav/nav1/main3.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,16,'c'),
(56,1056,"http://127.0.0.1:6060/img/nav/nav1/main4.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,14,'b'),
(57,1057,"http://127.0.0.1:6060/img/nav/nav1/main5.jpg",59.00,66.00,'遇原创正品汉服女旧梦传统中国风刺绣对襟齐腰襦裙夏裙大袖衫薄','￥59.40-114.32','￥66.00-127.02','包邮',8,369,15,11,'d'),
(58,1058,"http://127.0.0.1:6060/img/nav/nav1/main6.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,16,'d'),
(59,1059,"http://127.0.0.1:6060/img/nav/nav1/main7.jpg",59.00,66.00,'遇原创正品汉服女旧梦传统中国风刺绣对襟齐腰襦裙夏裙大袖衫薄','￥59.40-114.32','￥66.00-127.02','包邮',8,369,17,12,'c'),
(60,1060,"http://127.0.0.1:6060/img/nav/nav1/main8.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,13,'e'),
(61,1061,"http://127.0.0.1:6060/img/nav/nav1/main9.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,14,'f'),
(62,1062,"http://127.0.0.1:6060/img/nav/nav1/main10.jpg",59.00,66.00,'馨汉沐夕汉服女原创红芙蕖重工刺绣对襟齐腰齐胸襦裙大袖衫夏季','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,16,'c'),


-- nav2
(63,1063,"http://127.0.0.1:6060/img/nav/nav2/main1.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,20,21,'c'),
(64,1064,"http://127.0.0.1:6060/img/nav/nav2/main2.jpg",59.00,66.00,'季九月念秋 如梦山野 原创汉服女宋制褙子三件套夏季薄款防晒','￥59.40-114.32','￥66.00-127.02','包邮',8,369,20,22,'a'),
(65,1065,"http://127.0.0.1:6060/img/nav/nav2/main3.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,20,23,'c'),
(66,1066,"http://127.0.0.1:6060/img/nav/nav2/main4.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,20,24,'b'),
(67,1067,"http://127.0.0.1:6060/img/nav/nav2/main5.jpg",59.00,66.00,'遇原创正品汉服女旧梦传统中国风刺绣对襟齐腰襦裙夏裙大袖衫薄','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,11,'d'),
(68,1068,"http://127.0.0.1:6060/img/nav/nav2/main6.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,20,25,'d'),
(69,1069,"http://127.0.0.1:6060/img/nav/nav2/main7.jpg",59.00,66.00,'遇原创正品汉服女旧梦传统中国风刺绣对襟齐腰襦裙夏裙大袖衫薄','￥59.40-114.32','￥66.00-127.02','包邮',8,369,30,31,'c'),
(70,1070,"http://127.0.0.1:6060/img/nav/nav2/main8.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,30,33,'e'),
(71,1071,"http://127.0.0.1:6060/img/nav/nav2/main9.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,30,32,'f'),
(72,1072,"http://127.0.0.1:6060/img/nav/nav2/main10.jpg",59.00,66.00,'馨汉沐夕汉服女原创红芙蕖重工刺绣对襟齐腰齐胸襦裙大袖衫夏季','￥59.40-114.32','￥66.00-127.02','包邮',8,369,30,31,'c'),
(73,1073,"http://127.0.0.1:6060/img/nav/nav2/main1.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,30,32,'c'),
(74,1074,"http://127.0.0.1:6060/img/nav/nav2/main2.jpg",59.00,66.00,'季九月念秋 如梦山野 原创汉服女宋制褙子三件套夏季薄款防晒','￥59.40-114.32','￥66.00-127.02','包邮',8,369,30,33,'a'),
(75,1075,"http://127.0.0.1:6060/img/nav/nav2/main3.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,30,35,'c'),
(76,1076,"http://127.0.0.1:6060/img/nav/nav2/main4.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,30,34,'b'),
(77,1077,"http://127.0.0.1:6060/img/nav/nav2/main5.jpg",59.00,66.00,'遇原创正品汉服女旧梦传统中国风刺绣对襟齐腰襦裙夏裙大袖衫薄','￥59.40-114.32','￥66.00-127.02','包邮',8,369,13,11,'d'),
(78,1078,"http://127.0.0.1:6060/img/nav/nav2/main6.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,12,'d'),
(79,1079,"http://127.0.0.1:6060/img/nav/nav2/main7.jpg",59.00,66.00,'遇原创正品汉服女旧梦传统中国风刺绣对襟齐腰襦裙夏裙大袖衫薄','￥59.40-114.32','￥66.00-127.02','包邮',8,369,17,11,'c'),
(90,1090,"http://127.0.0.1:6060/img/nav/nav2/main8.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,18,'e'),
(91,1091,"http://127.0.0.1:6060/img/nav/nav2/main9.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,19,'f'),
(92,1092,"http://127.0.0.1:6060/img/nav/nav2/main10.jpg",59.00,66.00,'馨汉沐夕汉服女原创红芙蕖重工刺绣对襟齐腰齐胸襦裙大袖衫夏季','￥59.40-114.32','￥66.00-127.02','包邮',8,369,18,11,'c'),
(93,1093,"http://127.0.0.1:6060/img/nav/nav2/main1.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,16,'c'),
(94,1094,"http://127.0.0.1:6060/img/nav/nav2/main2.jpg",59.00,66.00,'季九月念秋 如梦山野 原创汉服女宋制褙子三件套夏季薄款防晒','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,14,'a'),
(95,1095,"http://127.0.0.1:6060/img/nav/nav2/main3.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,13,'c'),
(96,1096,"http://127.0.0.1:6060/img/nav/nav2/main4.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,14,'b'),
(97,1097,"http://127.0.0.1:6060/img/nav/nav2/main5.jpg",59.00,66.00,'遇原创正品汉服女旧梦传统中国风刺绣对襟齐腰襦裙夏裙大袖衫薄','￥59.40-114.32','￥66.00-127.02','包邮',8,369,18,11,'d'),
(98,1098,"http://127.0.0.1:6060/img/nav/nav2/main6.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,19,'d'),
(99,1099,"http://127.0.0.1:6060/img/nav/nav2/main7.jpg",59.00,66.00,'遇原创正品汉服女旧梦传统中国风刺绣对襟齐腰襦裙夏裙大袖衫薄','￥59.40-114.32','￥66.00-127.02','包邮',8,369,17,11,'c'),
(90,1090,"http://127.0.0.1:6060/img/nav/nav2/main8.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,11,'e'),
(91,1091,"http://127.0.0.1:6060/img/nav/nav2/main9.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,17,'f'),
(92,1092,"http://127.0.0.1:6060/img/nav/nav2/main10.jpg",59.00,66.00,'馨汉沐夕汉服女原创红芙蕖重工刺绣对襟齐腰齐胸襦裙大袖衫夏季','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,15,'c'),
(93,1093,"http://127.0.0.1:6060/img/nav/nav2/main1.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,11,'c'),
(94,1094,"http://127.0.0.1:6060/img/nav/nav2/main2.jpg",59.00,66.00,'季九月念秋 如梦山野 原创汉服女宋制褙子三件套夏季薄款防晒','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,19,'a'),
(95,1095,"http://127.0.0.1:6060/img/nav/nav2/main3.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,16,'c'),
(96,1096,"http://127.0.0.1:6060/img/nav/nav2/main4.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,14,'b'),
(97,1097,"http://127.0.0.1:6060/img/nav/nav2/main5.jpg",59.00,66.00,'遇原创正品汉服女旧梦传统中国风刺绣对襟齐腰襦裙夏裙大袖衫薄','￥59.40-114.32','￥66.00-127.02','包邮',8,369,15,11,'d'),
(98,1098,"http://127.0.0.1:6060/img/nav/nav2/main6.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,16,'d'),
(99,1099,"http://127.0.0.1:6060/img/nav/nav2/main7.jpg",59.00,66.00,'遇原创正品汉服女旧梦传统中国风刺绣对襟齐腰襦裙夏裙大袖衫薄','￥59.40-114.32','￥66.00-127.02','包邮',8,369,17,12,'c'),
(100,1000,"http://127.0.0.1:6060/img/nav/nav2/main8.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,13,'e'),
(101,1101,"http://127.0.0.1:6060/img/nav/nav2/main9.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,14,'f'),
(102,1102,"http://127.0.0.1:6060/img/nav/nav2/main10.jpg",59.00,66.00,'馨汉沐夕汉服女原创红芙蕖重工刺绣对襟齐腰齐胸襦裙大袖衫夏季','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,16,'c'),


-- nav3
(103,1103,"http://127.0.0.1:6060/img/nav/nav2/main1.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,11,'c'),
(104,1104,"http://127.0.0.1:6060/img/nav/nav2/main2.jpg",59.00,66.00,'季九月念秋 如梦山野 原创汉服女宋制褙子三件套夏季薄款防晒','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,12,'a'),
(105,1105,"http://127.0.0.1:6060/img/nav/nav2/main3.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,13,'c'),
(106,1106,"http://127.0.0.1:6060/img/nav/nav2/main4.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,14,'b'),
(107,1107,"http://127.0.0.1:6060/img/nav/nav2/main5.jpg",59.00,66.00,'遇原创正品汉服女旧梦传统中国风刺绣对襟齐腰襦裙夏裙大袖衫薄','￥59.40-114.32','￥66.00-127.02','包邮',8,369,15,11,'d'),
(108,1108,"http://127.0.0.1:6060/img/nav/nav2/main6.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,16,'d'),
(109,1109,"http://127.0.0.1:6060/img/nav/nav2/main7.jpg",59.00,66.00,'遇原创正品汉服女旧梦传统中国风刺绣对襟齐腰襦裙夏裙大袖衫薄','￥59.40-114.32','￥66.00-127.02','包邮',8,369,17,11,'c'),
(110,1110,"http://127.0.0.1:6060/img/nav/nav2/main8.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,18,'e'),
(111,1111,"http://127.0.0.1:6060/img/nav/nav2/main9.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,19,'f'),
(112,1112,"http://127.0.0.1:6060/img/nav/nav2/main10.jpg",59.00,66.00,'馨汉沐夕汉服女原创红芙蕖重工刺绣对襟齐腰齐胸襦裙大袖衫夏季','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,11,'c'),
(113,1113,"http://127.0.0.1:6060/img/nav/nav2/main1.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,12,'c'),
(114,1114,"http://127.0.0.1:6060/img/nav/nav2/main2.jpg",59.00,66.00,'季九月念秋 如梦山野 原创汉服女宋制褙子三件套夏季薄款防晒','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,13,'a'),
(115,1115,"http://127.0.0.1:6060/img/nav/nav2/main3.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,16,'c'),
(116,1116,"http://127.0.0.1:6060/img/nav/nav2/main4.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,14,'b'),
(117,1117,"http://127.0.0.1:6060/img/nav/nav2/main5.jpg",59.00,66.00,'遇原创正品汉服女旧梦传统中国风刺绣对襟齐腰襦裙夏裙大袖衫薄','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,11,'d'),
(118,1118,"http://127.0.0.1:6060/img/nav/nav2/main6.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,12,'d'),
(119,1119,"http://127.0.0.1:6060/img/nav/nav2/main7.jpg",59.00,66.00,'遇原创正品汉服女旧梦传统中国风刺绣对襟齐腰襦裙夏裙大袖衫薄','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,11,'c'),
(120,1120,"http://127.0.0.1:6060/img/nav/nav2/main8.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,18,'e'),
(121,1121,"http://127.0.0.1:6060/img/nav/nav2/main9.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,19,'f'),
(122,1122,"http://127.0.0.1:6060/img/nav/nav2/main10.jpg",59.00,66.00,'馨汉沐夕汉服女原创红芙蕖重工刺绣对襟齐腰齐胸襦裙大袖衫夏季','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,11,'c'),
(123,1123,"http://127.0.0.1:6060/img/nav/nav2/main1.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,16,'c'),
(124,1124,"http://127.0.0.1:6060/img/nav/nav2/main2.jpg",59.00,66.00,'季九月念秋 如梦山野 原创汉服女宋制褙子三件套夏季薄款防晒','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,14,'a'),
(125,1125,"http://127.0.0.1:6060/img/nav/nav2/main3.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,13,'c'),
(126,1126,"http://127.0.0.1:6060/img/nav/nav2/main4.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,14,'b'),
(127,1127,"http://127.0.0.1:6060/img/nav/nav2/main5.jpg",59.00,66.00,'遇原创正品汉服女旧梦传统中国风刺绣对襟齐腰襦裙夏裙大袖衫薄','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,11,'d'),
(128,1128,"http://127.0.0.1:6060/img/nav/nav2/main6.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,20,21,'d'),
(129,1129,"http://127.0.0.1:6060/img/nav/nav2/main7.jpg",59.00,66.00,'遇原创正品汉服女旧梦传统中国风刺绣对襟齐腰襦裙夏裙大袖衫薄','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,12,'c'),
(130,1130,"http://127.0.0.1:6060/img/nav/nav2/main8.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,11,'e'),
(131,1131,"http://127.0.0.1:6060/img/nav/nav2/main9.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,17,'f'),
(132,1132,"http://127.0.0.1:6060/img/nav/nav2/main10.jpg",59.00,66.00,'馨汉沐夕汉服女原创红芙蕖重工刺绣对襟齐腰齐胸襦裙大袖衫夏季','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,15,'c'),
(133,1133,"http://127.0.0.1:6060/img/nav/nav2/main1.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,11,'c'),
(134,1134,"http://127.0.0.1:6060/img/nav/nav2/main2.jpg",59.00,66.00,'季九月念秋 如梦山野 原创汉服女宋制褙子三件套夏季薄款防晒','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,19,'a'),
(135,1135,"http://127.0.0.1:6060/img/nav/nav2/main3.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,16,'c'),
(136,1136,"http://127.0.0.1:6060/img/nav/nav2/main4.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,14,'b'),
(137,1137,"http://127.0.0.1:6060/img/nav/nav2/main5.jpg",59.00,66.00,'遇原创正品汉服女旧梦传统中国风刺绣对襟齐腰襦裙夏裙大袖衫薄','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,11,'d'),
(138,1138,"http://127.0.0.1:6060/img/nav/nav2/main6.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,16,'d'),
(139,1139,"http://127.0.0.1:6060/img/nav/nav2/main7.jpg",59.00,66.00,'遇原创正品汉服女旧梦传统中国风刺绣对襟齐腰襦裙夏裙大袖衫薄','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,12,'c'),
(140,1140,"http://127.0.0.1:6060/img/nav/nav2/main8.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,13,'e'),
(141,1141,"http://127.0.0.1:6060/img/nav/nav2/main9.jpg",59.00,66.00,'种花家原创汉服女满庭芳重工宋制绣花褙子半臂衫百迭裙现货','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,14,'f'),
(142,1142,"http://127.0.0.1:6060/img/nav/nav2/main10.jpg",59.00,66.00,'馨汉沐夕汉服女原创红芙蕖重工刺绣对襟齐腰齐胸襦裙大袖衫夏季','￥59.40-114.32','￥66.00-127.02','包邮',8,369,10,16,'c');



/**商品款式表(颜色尺寸)**/
create table pattern(
  pid int not null,
  pproduct_id int,        #商品id
  ssize varchar(2),       #小尺寸
  msize varchar(2),       #中尺寸
  bsize varchar(2),       #大尺寸
  styo  varchar(50),      #样式
  styt  varchar(50),      #样式
  styh  varchar(50)       #样式 
);
insert into pattern values
(1,1001,'X','M','L','扎染蓝（上襦内衫+垮裤）','扎染蓝 （上襦内衫+垮裤 预售）','扎染蓝  （上襦内衫）'),
(2,1002,'X','M','L','翠绿色（不含裙子） 竹青','天蓝色（不含裙子） 霁青','扎染蓝  （上襦内衫）'),
(3,1003,'X','M','L','米黄色上杉','青色上杉','米白色吊带'),
(4,1004,'X','M','L','红色半臂衫现货','米白色半臂衫现货','绿色内褙子现货'),
(5,1005,'X','M','L','扎染蓝（上襦内衫+垮裤）','扎染蓝 （上襦内衫+垮裤 预售）','扎染蓝  （上襦内衫）'),
(6,1006,'X','M','L','翠绿色（不含裙子） 竹青','天蓝色（不含裙子） 霁青','扎染蓝  （上襦内衫）'),
(7,1007,'X','M','L','米黄色上杉','青色上杉','米白色吊带'),
(8,1008,'X','M','L','红色半臂衫现货','米白色半臂衫现货','绿色内褙子现货'),
(9,1009,'X','M','L','米黄色上杉','青色上杉','米白色吊带'),
(10,1010,'X','M','L','红色半臂衫现货','米白色半臂衫现货','绿色内褙子现货'),

-- 拼团
(11,1011,'X','M','L','淡黄色下裙','藕色比甲','绿色比甲'),
(12,1012,'X','M','L','大袖衫','对襟+吊带+下摆','齐胸上襦'),
(13,1013,'X','M','L','米黄色上杉','青色上杉','米白色吊带'),
(14,1014,'X','M','L','吊带','米摆裙子','大全套'),


-- 初秋
(15,1015,'X','M','L','淡黄色下裙','藕色比甲','绿色比甲'),
(16,1016,'X','M','L','大袖衫','对襟+吊带+下摆','齐胸上襦'),
(17,1017,'X','M','L','米黄色上杉','青色上杉','米白色吊带'),
(18,1018,'X','M','L','吊带','米摆裙子','大全套'),
(19,1019,'X','M','L','淡黄色下裙','藕色比甲','绿色比甲'),
(20,1020,'X','M','L','大袖衫','对襟+吊带+下摆','齐胸上襦'),
(21,1021,'X','M','L','米黄色上杉','青色上杉','米白色吊带'),
(22,1022,'X','M','L','吊带','米摆裙子','大全套'),


-- nav1 图片
(23,1023,'X','M','L','淡黄色下裙','藕色比甲','绿色比甲'),
(24,1024,'X','M','L','淡黄色下裙','藕色比甲','绿色比甲'),
(25,1025,'X','M','L','淡黄色下裙','藕色比甲','绿色比甲'),
(26,1026,'X','M','L','淡黄色下裙','藕色比甲','绿色比甲'),
(27,1027,'X','M','L','淡黄色下裙','藕色比甲','绿色比甲'),
(28,1028,'X','M','L','淡黄色下裙','藕色比甲','绿色比甲'),
(29,1029,'X','M','L','淡黄色下裙','藕色比甲','绿色比甲'),
(30,1030,'X','M','L','淡黄色下裙','藕色比甲','绿色比甲'),
(31,1031,'X','M','L','淡黄色下裙','藕色比甲','绿色比甲'),
(32,1032,'X','M','L','淡黄色下裙','藕色比甲','绿色比甲'),
(33,1033,'X','M','L','淡黄色下裙','藕色比甲','绿色比甲'),
(34,1034,'X','M','L','淡黄色下裙','藕色比甲','绿色比甲'),
(35,1035,'X','M','L','淡黄色下裙','藕色比甲','绿色比甲'),
(36,1036,'X','M','L','淡黄色下裙','藕色比甲','绿色比甲'),
(37,1037,'X','M','L','淡黄色下裙','藕色比甲','绿色比甲'),
(38,1038,'X','M','L','淡黄色下裙','藕色比甲','绿色比甲'),
(39,1039,'X','M','L','淡黄色下裙','藕色比甲','绿色比甲'),
(40,1040,'X','M','L','淡黄色下裙','藕色比甲','绿色比甲'),
(41,1041,'X','M','L','淡黄色下裙','藕色比甲','绿色比甲'),
(42,1042,'X','M','L','淡黄色下裙','藕色比甲','绿色比甲'),
(43,1043,'X','M','L','淡黄色下裙','藕色比甲','绿色比甲'),
(44,1044,'X','M','L','淡黄色下裙','藕色比甲','绿色比甲'),
(45,1045,'X','M','L','淡黄色下裙','藕色比甲','绿色比甲'),
(46,1046,'X','M','L','淡黄色下裙','藕色比甲','绿色比甲'),
(47,1047,'X','M','L','淡黄色下裙','藕色比甲','绿色比甲'),
(48,1048,'X','M','L','淡黄色下裙','藕色比甲','绿色比甲'),
(49,1049,'X','M','L','淡黄色下裙','藕色比甲','绿色比甲'),
(50,1050,'X','M','L','淡黄色下裙','藕色比甲','绿色比甲'),
(51,1051,'X','M','L','淡黄色下裙','藕色比甲','绿色比甲'),
(52,1052,'X','M','L','淡黄色下裙','藕色比甲','绿色比甲'),
(53,1053,'X','M','L','淡黄色下裙','藕色比甲','绿色比甲'),
(54,1054,'X','M','L','淡黄色下裙','藕色比甲','绿色比甲'),
(55,1055,'X','M','L','淡黄色下裙','藕色比甲','绿色比甲'),
(56,1056,'X','M','L','淡黄色下裙','藕色比甲','绿色比甲'),
(57,1057,'X','M','L','淡黄色下裙','藕色比甲','绿色比甲'),
(58,1058,'X','M','L','淡黄色下裙','藕色比甲','绿色比甲'),
(59,1059,'X','M','L','淡黄色下裙','藕色比甲','绿色比甲'),
(60,1060,'X','M','L','淡黄色下裙','藕色比甲','绿色比甲'),
(61,1061,'X','M','L','淡黄色下裙','藕色比甲','绿色比甲'),
(62,1062,'X','M','L','淡黄色下裙','藕色比甲','绿色比甲'),


-- nav2
(63,1063,'X','M','L','翠绿色（不含裙子） 竹青','天蓝色（不含裙子） 霁青','扎染蓝  （上襦内衫）'),
(64,1064,'X','M','L','翠绿色（不含裙子） 竹青','天蓝色（不含裙子） 霁青','扎染蓝  （上襦内衫）'),
(65,1065,'X','M','L','翠绿色（不含裙子） 竹青','天蓝色（不含裙子） 霁青','扎染蓝  （上襦内衫）'),
(66,1066,'X','M','L','翠绿色（不含裙子） 竹青','天蓝色（不含裙子） 霁青','扎染蓝  （上襦内衫）'),
(67,1067,'X','M','L','翠绿色（不含裙子） 竹青','天蓝色（不含裙子） 霁青','扎染蓝  （上襦内衫）'),
(68,1068,'X','M','L','翠绿色（不含裙子） 竹青','天蓝色（不含裙子） 霁青','扎染蓝  （上襦内衫）'),
(69,1069,'X','M','L','翠绿色（不含裙子） 竹青','天蓝色（不含裙子） 霁青','扎染蓝  （上襦内衫）'),
(70,1070,'X','M','L','翠绿色（不含裙子） 竹青','天蓝色（不含裙子） 霁青','扎染蓝  （上襦内衫）'),
(71,1071,'X','M','L','翠绿色（不含裙子） 竹青','天蓝色（不含裙子） 霁青','扎染蓝  （上襦内衫）'),
(72,1072,'X','M','L','翠绿色（不含裙子） 竹青','天蓝色（不含裙子） 霁青','扎染蓝  （上襦内衫）'),
(73,1073,'X','M','L','翠绿色（不含裙子） 竹青','天蓝色（不含裙子） 霁青','扎染蓝  （上襦内衫）'),
(74,1074,'X','M','L','翠绿色（不含裙子） 竹青','天蓝色（不含裙子） 霁青','扎染蓝  （上襦内衫）'),
(75,1075,'X','M','L','翠绿色（不含裙子） 竹青','天蓝色（不含裙子） 霁青','扎染蓝  （上襦内衫）'),
(76,1076,'X','M','L','翠绿色（不含裙子） 竹青','天蓝色（不含裙子） 霁青','扎染蓝  （上襦内衫）'),
(77,1077,'X','M','L','翠绿色（不含裙子） 竹青','天蓝色（不含裙子） 霁青','扎染蓝  （上襦内衫）'),
(78,1078,'X','M','L','翠绿色（不含裙子） 竹青','天蓝色（不含裙子） 霁青','扎染蓝  （上襦内衫）'),
(79,1079,'X','M','L','翠绿色（不含裙子） 竹青','天蓝色（不含裙子） 霁青','扎染蓝  （上襦内衫）'),
(90,1090,'X','M','L','翠绿色（不含裙子） 竹青','天蓝色（不含裙子） 霁青','扎染蓝  （上襦内衫）'),
(91,1091,'X','M','L','翠绿色（不含裙子） 竹青','天蓝色（不含裙子） 霁青','扎染蓝  （上襦内衫）'),
(92,1092,'X','M','L','翠绿色（不含裙子） 竹青','天蓝色（不含裙子） 霁青','扎染蓝  （上襦内衫）'),
(93,1093,'X','M','L','翠绿色（不含裙子） 竹青','天蓝色（不含裙子） 霁青','扎染蓝  （上襦内衫）'),
(94,1094,'X','M','L','翠绿色（不含裙子） 竹青','天蓝色（不含裙子） 霁青','扎染蓝  （上襦内衫）'),
(95,1095,'X','M','L','翠绿色（不含裙子） 竹青','天蓝色（不含裙子） 霁青','扎染蓝  （上襦内衫）'),
(96,1096,'X','M','L','翠绿色（不含裙子） 竹青','天蓝色（不含裙子） 霁青','扎染蓝  （上襦内衫）'),
(97,1097,'X','M','L','翠绿色（不含裙子） 竹青','天蓝色（不含裙子） 霁青','扎染蓝  （上襦内衫）'),
(98,1098,'X','M','L','翠绿色（不含裙子） 竹青','天蓝色（不含裙子） 霁青','扎染蓝  （上襦内衫）'),
(99,1099,'X','M','L','翠绿色（不含裙子） 竹青','天蓝色（不含裙子） 霁青','扎染蓝  （上襦内衫）'),
(90,1090,'X','M','L','翠绿色（不含裙子） 竹青','天蓝色（不含裙子） 霁青','扎染蓝  （上襦内衫）'),
(91,1091,'X','M','L','翠绿色（不含裙子） 竹青','天蓝色（不含裙子） 霁青','扎染蓝  （上襦内衫）'),
(92,1092,'X','M','L','翠绿色（不含裙子） 竹青','天蓝色（不含裙子） 霁青','扎染蓝  （上襦内衫）'),
(93,1093,'X','M','L','翠绿色（不含裙子） 竹青','天蓝色（不含裙子） 霁青','扎染蓝  （上襦内衫）'),
(94,1094,'X','M','L','翠绿色（不含裙子） 竹青','天蓝色（不含裙子） 霁青','扎染蓝  （上襦内衫）'),
(95,1095,'X','M','L','翠绿色（不含裙子） 竹青','天蓝色（不含裙子） 霁青','扎染蓝  （上襦内衫）'),
(96,1096,'X','M','L','翠绿色（不含裙子） 竹青','天蓝色（不含裙子） 霁青','扎染蓝  （上襦内衫）'),
(97,1097,'X','M','L','翠绿色（不含裙子） 竹青','天蓝色（不含裙子） 霁青','扎染蓝  （上襦内衫）'),
(98,1098,'X','M','L','翠绿色（不含裙子） 竹青','天蓝色（不含裙子） 霁青','扎染蓝  （上襦内衫）'),
(99,1099,'X','M','L','翠绿色（不含裙子） 竹青','天蓝色（不含裙子） 霁青','扎染蓝  （上襦内衫）'),
(100,100,'X','M','L','翠绿色（不含裙子） 竹青','天蓝色（不含裙子） 霁青','扎染蓝  （上襦内衫）'),
(101,1101,'X','M','L','翠绿色（不含裙子） 竹青','天蓝色（不含裙子） 霁青','扎染蓝  （上襦内衫）'),
(102,1102,'X','M','L','翠绿色（不含裙子） 竹青','天蓝色（不含裙子） 霁青','扎染蓝  （上襦内衫）'),

-- nav3
(103,1103,'X','M','L','红色半臂衫现货','米白色半臂衫现货','绿色内褙子现货'),
(104,1104,'X','M','L','红色半臂衫现货','米白色半臂衫现货','绿色内褙子现货'),
(105,1105,'X','M','L','红色半臂衫现货','米白色半臂衫现货','绿色内褙子现货'),
(107,1107,'X','M','L','红色半臂衫现货','米白色半臂衫现货','绿色内褙子现货'),
(108,1108,'X','M','L','红色半臂衫现货','米白色半臂衫现货','绿色内褙子现货'),
(109,1109,'X','M','L','红色半臂衫现货','米白色半臂衫现货','绿色内褙子现货'),
(110,1110,'X','M','L','红色半臂衫现货','米白色半臂衫现货','绿色内褙子现货'),
(111,1111,'X','M','L','红色半臂衫现货','米白色半臂衫现货','绿色内褙子现货'),
(112,1112,'X','M','L','红色半臂衫现货','米白色半臂衫现货','绿色内褙子现货'),
(113,1113,'X','M','L','红色半臂衫现货','米白色半臂衫现货','绿色内褙子现货'),
(114,1114,'X','M','L','红色半臂衫现货','米白色半臂衫现货','绿色内褙子现货'),
(115,1115,'X','M','L','红色半臂衫现货','米白色半臂衫现货','绿色内褙子现货'),
(116,1116,'X','M','L','红色半臂衫现货','米白色半臂衫现货','绿色内褙子现货'),
(117,1117,'X','M','L','红色半臂衫现货','米白色半臂衫现货','绿色内褙子现货'),
(118,1118,'X','M','L','红色半臂衫现货','米白色半臂衫现货','绿色内褙子现货'),
(119,1119,'X','M','L','红色半臂衫现货','米白色半臂衫现货','绿色内褙子现货'),
(120,1120,'X','M','L','红色半臂衫现货','米白色半臂衫现货','绿色内褙子现货'),
(121,1121,'X','M','L','红色半臂衫现货','米白色半臂衫现货','绿色内褙子现货'),
(122,1122,'X','M','L','红色半臂衫现货','米白色半臂衫现货','绿色内褙子现货'),
(123,1123,'X','M','L','红色半臂衫现货','米白色半臂衫现货','绿色内褙子现货'),
(124,1124,'X','M','L','红色半臂衫现货','米白色半臂衫现货','绿色内褙子现货'),
(125,1125,'X','M','L','红色半臂衫现货','米白色半臂衫现货','绿色内褙子现货'),
(126,1126,'X','M','L','红色半臂衫现货','米白色半臂衫现货','绿色内褙子现货'),
(127,1127,'X','M','L','红色半臂衫现货','米白色半臂衫现货','绿色内褙子现货'),
(128,1128,'X','M','L','红色半臂衫现货','米白色半臂衫现货','绿色内褙子现货'),
(129,1129,'X','M','L','红色半臂衫现货','米白色半臂衫现货','绿色内褙子现货'),
(130,1130,'X','M','L','红色半臂衫现货','米白色半臂衫现货','绿色内褙子现货'),
(131,1131,'X','M','L','红色半臂衫现货','米白色半臂衫现货','绿色内褙子现货'),
(132,1132,'X','M','L','红色半臂衫现货','米白色半臂衫现货','绿色内褙子现货'),
(133,1133,'X','M','L','红色半臂衫现货','米白色半臂衫现货','绿色内褙子现货'),
(134,1134,'X','M','L','红色半臂衫现货','米白色半臂衫现货','绿色内褙子现货'),
(135,1135,'X','M','L','红色半臂衫现货','米白色半臂衫现货','绿色内褙子现货'),
(136,1136,'X','M','L','红色半臂衫现货','米白色半臂衫现货','绿色内褙子现货'),
(137,1137,'X','M','L','红色半臂衫现货','米白色半臂衫现货','绿色内褙子现货'),
(138,1138,'X','M','L','红色半臂衫现货','米白色半臂衫现货','绿色内褙子现货'),
(139,1139,'X','M','L','红色半臂衫现货','米白色半臂衫现货','绿色内褙子现货'),
(140,1140,'X','M','L','红色半臂衫现货','米白色半臂衫现货','绿色内褙子现货'),
(141,1141,'X','M','L','红色半臂衫现货','米白色半臂衫现货','绿色内褙子现货'),
(142,1142,'X','M','L','红色半臂衫现货','米白色半臂衫现货','绿色内褙子现货');

/*商品订单*/
create table orderr(
  id int primary key auto_increment,    #订单id   
  user_id varchar(20), #用户名id    
  product_id int,  #商品id        
  style varchar(20),#样式        
  size  varchar(20), #尺码      
  goodsprice decimal(10,2), #商品价格
  cost       decimal(10,2), #商品单价
  goodsSum   int,           #商品购买数量 
  pimg    varchar(128),     #商品图片 
  iintroduc varchar(128),    #商品介绍 
  ischeck  bool              #商品是否选中             
);

