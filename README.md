[![License - AGPL v3.0](https://img.shields.io/badge/License-AGPL%20v3-blue.svg)](https://opensource.org/licenses/AGPL-3.0) 
[![Awesome](https://cdn.rawgit.com/sindresorhus/awesome/d7305f38d29fed78fa85652e3a63e154dd8e8829/media/badge.svg)](https://github.com/sindresorhus/awesome)


## MoKirinAWD

`MoKirinAWD`是一套开源的攻防系统，适用于团队内部训练，团队磨合，友谊赛等小型赛事场景。

`墨麒麟AWD(Attack With Defence)`系统管理界面采用传统的`Apache+PHP+Mysql`技术实现，而靶机则采用了`Docker`虚拟化技术。

管理页面可方便快速的配置符合实际场景的`Docker`虚拟机数量，管理团队，监控服务，战况等。

团队界面则可提交flag，实时查看服务器情况，攻防情况，团队排名等等。

## MVC

在这几天写代码的过程发现很多问题，还是决定采用MVC结构，虽然会多一些学习成本，但是分模块不管是对于开发或者维护都是很好的。

```
MoKirinAWD
├── assets
├── config
│   ├── config.php
│   └── conn.php
├── framework
├── manage
│   ├── controllers
│   ├── index.php
│   ├── models
│   └── views
├── sql
│   ├── MoKirinAWD.sql
│   └── MoKirinAWD.xmind
├── user
│   ├── controllers
│   ├── index.php
│   ├── models
│   └── views
└── index.php
```

下面做几个约定：

1. 文件目录结构如上面所示，因为考虑到可以把管理系统 (manage)和用户系统 (user)分开部署，所以分两大个模块。配置文件 (conf)和数据库初始化文件 (sql)都放根目录。
2. 数据库表名用**小写**或者**小写加下划线**，如：`user`,`awd_user`
3. 模块名 (Models)用**大驼峰命名法**，即首字母**大写**，并在名称后添加**Model**，如：`UserModel.php`
4. 控制器 (Controllers)用**大驼峰命名法**，即**首字母大写**，并在名称后添加**Controller**，如：`UserController.php`
5. 方法名 (Action)用**小驼峰命名法**，即**首字母小写**，如：`index`，`indexPost`
6. 视图 (Views)部署结构为**控制其名/行为名**，如：`user/add.php`



## License

[AGPL v3.0](https://github.com/MoKirin/MoKirinAWD/blob/master/LICENSE)