package com.maxiaolong.jpetstore.dao.impl;

import com.maxiaolong.jpetstore.dao.DAO;
import com.maxiaolong.jpetstore.dao.LogDAO;
import com.maxiaolong.jpetstore.domain.Log;

import java.util.List;

/**
 * Created by maxiaolong on 2016/4/3.
 */
public class LogDAOJdbcImpl extends DAO<Log> implements LogDAO{
    @Override
    public void saveLog(Log log) {
        String sql="insert into log(userid,timestamp,dowhat)" +
                "values(?,?,?)";
        update(sql,log.getUserid(),log.getTimestamp(),log.getDowhat());
    }

    @Override
    public List<Log> getLog() {
        String sql="select * from log";
        return getForList(sql);
    }
}
