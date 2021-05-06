const menu = [{
    "name": "首页",
    "icon": "&#xe68e;",
    "url": "index",
    "hidden": false,
    "list": []
}, {
    "name": "业务申请",
    "icon": "&#xe653;",
    "url": "",
    "hidden": false,
    "list": [{
        "name": "借款申请",
        "url": "borrow",
    }, {
        "name": "请假申请",
        "url": "leave"
    }, {
        "name": "调薪申请",
        "url": "change"
    },{
        "name": "离职申请",
        "url": "quit"
    }]
}, {
    "name": "个人中心",
    "icon": "&#xe612;",
    "url": "",
    "hidden": false,
    "list": [{
        "name": "我的信息",
        "url": "my_message"
    }, {
        "name": "我的申请",
        "url": "my_apply"
    }]
},{
    "name": "退出登录",
    "icon": "&#xe65c;",
    "url": "/snaker_web/logout",
    "list": []
}, {
    "name": "开发者官网",
    "icon": "&#xe65f;",
    "url": "http://www.qadmin.net/",
    "target": "_blank",
    "list": []
}, {
    "name": "开发文档",
    "icon": "&#xe655;",
    "url": "http://docs.qadmin.net/",
    "target": "_blank",
    "list": []
}];

const config = {
    name: "人事中心",
    menu: menu,
};

// module.exports.name = "Qadmin";
// module.exports.menu = menu;
