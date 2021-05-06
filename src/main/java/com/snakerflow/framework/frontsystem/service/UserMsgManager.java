package com.snakerflow.framework.frontsystem.service;

import com.snakerflow.app.modules.dao.BorrowDao;
import com.snakerflow.app.modules.entity.Borrow;
import com.snakerflow.framework.flow.service.SnakerEngineFacets;
import com.snakerflow.framework.security.shiro.ShiroUtils;
import com.snakerflow.framework.utils.DateUtils;
import org.apache.commons.lang.StringUtils;
import org.snaker.engine.entity.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Component
public class UserMsgManager {

    @Autowired
    private SnakerEngineFacets facets;

/*    public List<Order> getOrderByUserId(String userId){
        facets.getEngine().query().gethis
    }*/


}

