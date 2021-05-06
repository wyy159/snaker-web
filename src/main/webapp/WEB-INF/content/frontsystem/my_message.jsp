<!DOCTYPE html>
<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>我的信息 - 人事管理平台</title>
    <meta name="keywords" content="qadmin,qadmin模板,后台模板,qadmin后台模板">
    <meta name="description" content="qadmin是一个轻量级后台模板,基于layui框架开发,简洁而不简单">
    <link rel="stylesheet" href="${ctx}/static/layui/css/layui.css">
    <link rel="stylesheet" href="${ctx}/static/admin/css/style.css">
    <script src="${ctx}/static/layui/layui.js"></script>
    <script src="${ctx}/static/js/jquery-3.3.1.min.js"></script>
    <script src="${ctx}/static/js/vue.min.js"></script>
</head>
<body class="p20">



<fieldset class="layui-elem-field layui-field-title">
    <legend>我的信息</legend>
</fieldset>


<div id="detail" >
    <div class="layui-form-item">
        <label class="layui-form-label">姓名</label>
        <div class="layui-input-block">
            <label id="fullname" class="layui-form-label">${user.fullname}</label>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">用户名</label>
        <div class="layui-input-block">
            <label id="username" class="layui-form-label">${user.username}</label>        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">邮箱</label>
        <div class="layui-input-block">
            <label id="email" class="layui-form-label">${user.email}</label>        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">性别</label>
        <div class="layui-input-block">
            <label id="sex" class="layui-form-label">${user.sex==1?'男':'女'}</label>        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">年龄</label>
        <div class="layui-input-block">
            <label id="age" class="layui-form-label">${user.age}</label>        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">所属组织</label>
        <div class="layui-input-block">
            <label id="org" class="layui-form-label"></label>   ${user.org.name}     </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">家庭住址</label>
        <div class="layui-input-block">
            <label id="address" class="layui-form-label"></label>   ${user.address}     </div>
    </div>
</div>




<script src="${ctx}/static/admin/js/config.js"></script>
<script src="${ctx}/static/admin/js/script.js"></script>
</body>

</html>
