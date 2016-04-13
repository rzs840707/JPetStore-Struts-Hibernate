package com.maxiaolong.jpetstore.action;

import com.maxiaolong.jpetstore.dao.CategoryDAO;
import com.maxiaolong.jpetstore.dao.LogDAO;
import com.maxiaolong.jpetstore.dao.UserDAO;
import com.maxiaolong.jpetstore.dao.impl.CategoryDAOJdbcImpl;
import com.maxiaolong.jpetstore.dao.impl.LogDAOJdbcImpl;
import com.maxiaolong.jpetstore.dao.impl.UserDAOJdbcImpl;
import com.maxiaolong.jpetstore.domain.Category;
import com.maxiaolong.jpetstore.domain.Log;
import com.maxiaolong.jpetstore.domain.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;
import org.apache.struts2.json.annotations.JSON;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

/**
 * Created by maxiaolong on 2016/4/3.
 */
public class UserAction extends ActionSupport implements SessionAware,ServletResponseAware {
    private User user;
    private UserDAO userDAO;
    private CategoryDAO categoryDAO;
    private LogDAO logDAO;
    private Map<String,String> map;
    private Map<String,Object> session;
    private HttpServletResponse httpServletResponse;
    private String chknumber;
    private List<Log> logList;
    private String newPassword;

    public UserAction() {
        this.userDAO = new UserDAOJdbcImpl();
        this.categoryDAO=new CategoryDAOJdbcImpl();
        this.logDAO=new LogDAOJdbcImpl();
    }

    public List<Log> getLogList() {
        return logList;
    }

    public void setLogList(List<Log> logList) {
        this.logList = logList;
    }

    @Override
    public void setServletResponse(HttpServletResponse httpServletResponse) {
        this.httpServletResponse=httpServletResponse;
    }

    @Override
    public void setSession(Map<String, Object> map) {
        this.session=map;
    }

    @JSON(serialize=false)
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Map<String, String> getMap() {
        return map;
    }

    public void setMap(Map<String, String> map) {
        this.map = map;
    }

    public String getChknumber() {
        return chknumber;
    }

    public void setChknumber(String chknumber) {
        this.chknumber = chknumber;
    }

    public String getNewPassword() {
        return newPassword;
    }

    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }

    public Color getColor() {
        int red=(int)(Math.random()*1000%256);
        int green=(int)(Math.random()*1000%256);
        int blue=(int)(Math.random()*1000%256);
        return new Color(red,green,blue);
    }

    public String img() throws Exception{
        int width = 110;
        int height = 23;

        //创建一张内存中的缓存图片
        BufferedImage bufferedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);

        ///背景色
        //通过graphics绘制图像
        Graphics graphics = bufferedImage.getGraphics();
        //设置颜色
        graphics.setColor(Color.yellow);
        //填充
        graphics.fillRect(0, 0, width, height);

        ///画边框
        graphics.setColor(Color.blue);
        graphics.drawRect(0, 0, width - 1, height - 1);

        //写字母
        String content = "ABCDEFGHJKLMNPQRSTUVWXYZabcedfghijkmnpqrstuvwxyz23456789";
        Random random = new Random();
        //设置字体颜色
        graphics.setColor(Color.red);


        String vrStr="";  //null和空字符串有很大的区别
        //设置字体及大小
        graphics.setFont(new Font("宋体", Font.BOLD, 20));
        int x = 20;
        int y = 20;
        for (int i = 0; i < 4; i++) {
            int index = random.nextInt(content.length());
            char letter = content.charAt(index);
            vrStr+=letter;
            graphics.drawString(letter + " ", x, y);
            x = x + 20;
        }

        session.put("vrCode",vrStr);

        //绘制干扰线
        int x1;
        int x2;
        int y1;
        int y2;
        graphics.setColor(Color.LIGHT_GRAY);
        for (int i = 0; i < 10; i++) {
            x1 = random.nextInt(width);
            x2 = random.nextInt(width);
            y1 = random.nextInt(height);
            y2 = random.nextInt(height);
            graphics.drawLine(x1, y1, x2, y2);
        }

        //将图片输出到浏览器
        //将内存的图片通过浏览器输出流输出成jpg图片
        ImageIO.write(bufferedImage, "jpg", httpServletResponse.getOutputStream());
        return null;
    }

    public String login() throws Exception{
        User myuser=null;
        if ((myuser = userDAO.get(user.getUserid(),user.getPassword())) != null) {
            if(!user.getUserid().equals("admin")){
            List<Category> categoryList=categoryDAO.getAll();
            ActionContext.getContext().getSession().put("userinfo",myuser);
            ActionContext.getContext().getSession().put("categoryInfo",categoryList);
            String dowhat="用户登陆";
            ActionContext.getContext().getSession().put("dowhat",dowhat);
            return "index";
            }
            else{
                ActionContext.getContext().getSession().put("userinfo",myuser);
                ActionContext.getContext().getSession().put("admin","admin");
                String dowhat="管理员登陆";
                ActionContext.getContext().getSession().put("dowhat",dowhat);
                return "admin";
            }
        }
        return "input";
    }


    public void validateLogin() {
        System.out.print((String)session.get("vrCode")+"  "+chknumber);
        if(!((String)session.get("vrCode")).toLowerCase().equals(chknumber.toLowerCase())) {
            System.out.print("验证码错误");
            addFieldError("chknumberError",getText("codeError"));  //自动返回input视图
        }
    }

    public String register() throws Exception{
        userDAO.save(user);
        List<Category> categoryList=categoryDAO.getAll();
        ActionContext.getContext().getSession().put("userinfo",user);
        ActionContext.getContext().getSession().put("categoryInfo",categoryList);
        String dowhat="注册";
        ActionContext.getContext().getSession().put("dowhat",dowhat);
        return "index";
    }

    public String editInfo() throws Exception{
        User myuser= (User) ActionContext.getContext().getSession().get("userinfo");
        user.setUserid(myuser.getUserid());
        user.setPassword(newPassword);
        userDAO.update(user);
        List<Category> categoryList=categoryDAO.getAll();
        ActionContext.getContext().getSession().put("userinfo",user);
        String dowhat="修改个人信息";
        ActionContext.getContext().getSession().put("dowhat",dowhat);
        return "index";
    }

    public void validateEditInfo(){
        User myuser= (User) ActionContext.getContext().getSession().get("userinfo");
        if(!user.getPassword().equals(myuser.getPassword())){
            addFieldError("wrongPassword","wrong password");
        }
    }





    public String checkName() throws Exception{
        List<User> userList=userDAO.getAll();
        map=new HashMap<String, String>();
        for (User user:userList){
            if(user.getUserid().equals(this.user.getUserid())){
                map.put("flag","used");
                return "used";
            }
        }
        map.put("flag","unused");
        return "unused";
    }

    public String checkEmail() throws Exception{
        List<User> userList=userDAO.getAll();
        map=new HashMap<String, String>();
        for (User user:userList){
            if(user.getEmail().equals(this.user.getEmail())){
                map.put("flag","used");
                return "used";
            }
        }
        map.put("flag","unused");
        return "unused";
    }


    public String checkLog() throws Exception{
        logList=null;
        logList=logDAO.getLog();
        return "success";
    }

    public String selectLang() throws Exception{
        return SUCCESS;
    }



}

