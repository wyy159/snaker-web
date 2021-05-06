package com.snakerflow.framework.frontsystem.web;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.snakerflow.app.modules.entity.Borrow;
import com.snakerflow.app.modules.service.BorrowManager;
import com.snakerflow.framework.flow.entity.Approval;
import com.snakerflow.framework.flow.service.ApprovalManager;
import com.snakerflow.framework.flow.service.SnakerEngineFacets;
import com.snakerflow.framework.security.entity.User;
import com.snakerflow.framework.security.service.UserManager;
import com.snakerflow.framework.security.shiro.ShiroUtils;
import org.snaker.engine.access.QueryFilter;
import org.snaker.engine.entity.HistoryOrder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/front/formSave")
public class FormActionController {
    @Autowired
    private SnakerEngineFacets facets;
    @Autowired
    private BorrowManager manager;
    @Autowired
    private ApprovalManager approvalManager;

    @RequestMapping(value = "borrow", method= RequestMethod.POST)
    @ResponseBody
    public Map<String,String> borrowFormSave(String processId, String orderId, String taskId, Borrow model){
        /**
         * 业务处理类处理数据更新
         */
        manager.save(processId, orderId, taskId, model);
        Map<String,String> result=new HashMap<String, String>();
        result.put("page","index");
        result.put("code","200");
        result.put("message","提交成功！");
        return result;
    }

    @RequestMapping(value = "myApply", method= RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> myApply(){
        /**
         * 业务处理类处理数据展示
         */
        List<HistoryOrder> list=facets.getEngine().query().getHistoryOrders(new QueryFilter().setOperator(ShiroUtils.getUsername()));
        JSONArray jsonArray = JSONArray.parseArray(JSON.toJSONString(list));
        System.out.println( jsonArray.toJSONString());
        Map<String,Object> result=new HashMap<String, Object>();
        result.put("count",list.size());
        result.put("code","0");
        result.put("msg","查询完毕！");
        result.put("data",jsonArray);
        return result;
    }
    @RequestMapping(value = "myApply_detail_borrow", method= RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> myApplyDetailBorrow(String orderId,String processName){
        /**
         * 业务处理类处理数据展示
         */
        Map<String,Object> result=new HashMap<String, Object>();
        if ("借款申请流程".equals(processName)) {
            Borrow borrow = manager.findByOrderId(orderId);
            Approval approval=approvalManager.findByFlow(orderId,"").size()!=0?approvalManager.findByFlow(orderId,"").get(0):null;
            result.put("borrow",borrow);
            result.put("approval",approval==null?"审核中":approval.getResult());
            return result;
        }else if("请假流程测试".equals(processName))
        {
            return null;
        }
        return null;
    }

}
