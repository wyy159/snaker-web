<!DOCTYPE html>
<%@ page language="java" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>借款申请 - 人事管理平台</title>
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
    <legend>借款申请</legend>
</fieldset>


<form id="form_borrow" class="layui-form" onsubmit="ajaxSubmit()">
    <input type="hidden" name="processId" value="${processId}">
    <div class="layui-form-item">
        <label class="layui-form-label">借款人：</label>
        <div class="layui-input-block">
            <input type="text" name="operator" required="" lay-verify="required" placeholder="" autocomplete="off" class="layui-input layui-form-unedit" value="${operator}" readonly>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">借款数额：</label>
        <div class="layui-input-block">
            <input type="text" name="amount" required="" lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">借款日期：</label>
        <div class="layui-input-block">
            <input type="text" name="operateTime" required="" lay-verify="required" placeholder="" autocomplete="off" class="layui-input layui-form-unedit" value="${nowdate}" readonly>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">还款日期：</label>
        <div class="layui-input-block">
            <input type="date" name="repaymentDate" required="" lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">借款理由：</label>
        <div class="layui-input-block">
            <input type="text" name="reason" required="" lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="submit">立即提交</button>

        </div>
    </div>
</form>



<script src="${ctx}/static/admin/js/config.js"></script>
<script src="${ctx}/static/admin/js/script.js"></script>
<script type="text/javascript">
  function ajaxSubmit() {
    $.ajax(
          {
              url: "${ctx}/front/formSave/borrow",
              type: "POST",
              dataType: "json",
              data: $("#form_borrow").serializeArray(),
              async: false,
              success: function(data) {
              alert(data.message);
              }
          });

  }
</script>
</body>
</html>
