<!DOCTYPE html>
<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>我的申请 - 人事管理平台</title>
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
    <legend>我的申请</legend>
</fieldset>



<table id="demo" lay-filter="test"></table>
<div id="detail" style="display: none">
    <div class="layui-form-item">
        <label class="layui-form-label">业务名称</label>
        <div class="layui-input-block">
            <label id="processName" class="layui-form-label"></label>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">申请时间</label>
        <div class="layui-input-block">
            <label id="createTime" class="layui-form-label"></label>        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">申请数额</label>
        <div class="layui-input-block">
            <label id="amount" class="layui-form-label"></label>        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">申请理由</label>
        <div class="layui-input-block">
            <label id="reason" class="layui-form-label"></label>        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">审核状态</label>
        <div class="layui-input-block">
            <label id="state" class="layui-form-label"></label>        </div>
    </div>
</div>
<script>
    layui.use('table', function(){
        var table = layui.table;

        //第一个实例
        table.render({
            elem: '#demo'
            ,height: 400
            ,width: 'auto'
            ,method: 'post'
            ,url: '${ctx}/front/formSave/myApply' //数据接口
            ,page: true //开启分页
            ,cols: [[ //表头
              //  {field: 'id', title: 'ID', width:160, sort: true, fixed: 'left'}
                {field: 'processName', title: '申请业务', width:160}
                ,{field: 'createTime', title: '申请时间', width:160}
                ,{field: 'orderState', title: '当前状态', width:160,templet:function (d) {
                        if (d.orderState==1){
                            return '运行中';
                        }else{
                            return '已结束';
                        }
                    }}
                ,{fixed: 'right', width:160, align:'center', toolbar: '#barDemo'}
              //  ,{field: 'reviewer', title: '审核人', width: 160}
            ]]


        });
        table.on('tool(test)',function(obj){
            var data=obj.data;
            var variable=eval('(' +data.variable+')');
            if(obj.event === 'detail'){
                $.ajax(
                    {
                        url: "${ctx}/front/formSave/myApply_detail_borrow",
                        type: "POST",
                        dataType: "json",
                        data: {"orderId":data.id,"processName":data.processName},
                        async: false,
                        success: function(d) {
                            $('#detail').removeAttr("style");
                            $('#reason').text(d.borrow.reason);
                            $('#processName').text("借款申请");
                            $('#createTime').text(d.borrow.operateTime);
                            $('#amount').text(d.borrow.amount);
                            $('#state').text(d.approval);
                            layer.open({
                                type: 1,
                                title: '发起调度',
                                shadeClose: true,
                                shade: 0.8,
                                area: ['650px', '60%'],
                                content: $('#detail'),//iframe的url
                                end: function(){
                                    $('#detail').attr("style","display: none");
                                }
                            });
                        }
                    });
            }
        })
    });
</script>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">详情</a>
</script>

<script src="${ctx}/static/admin/js/config.js"></script>
<script src="${ctx}/static/admin/js/script.js"></script>
</body>

</html>
