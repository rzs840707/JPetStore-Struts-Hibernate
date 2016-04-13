package com.maxiaolong.jpetstore.interceptor;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;
import java.util.Locale;

/**
 * Created by maxiaolong on 2016/4/12 0012.
 */
public class LangInterceptor implements Interceptor {
    @Override
    public void destroy() {

    }

    @Override
    public void init() {

    }

    @Override
    public String intercept(ActionInvocation actionInvocation) throws Exception {
//        String local= (String[]) (actionInvocation.getInvocationContext().getParameters().get("local"))[0];
        String[] local= (String[]) actionInvocation.getInvocationContext().getParameters().get("local");
        System.out.print(local[0]);
        if(local[0]!=null){
            String loc[]=local[0].split("_");
            Locale locale=new Locale(loc[0],loc[1]);
            actionInvocation.getInvocationContext().getSession().put("WW_TRANS_I18N_LOCALE", locale);
            String result=actionInvocation.invoke();
        }
        return null;
    }
}
