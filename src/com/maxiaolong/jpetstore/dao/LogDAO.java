package com.maxiaolong.jpetstore.dao;

import com.maxiaolong.jpetstore.domain.Log;

import java.util.List;

/**
 * Created by maxiaolong on 2016/4/3.
 */
public interface LogDAO {
    void saveLog(Log log);
    List<Log> getLog();
}
