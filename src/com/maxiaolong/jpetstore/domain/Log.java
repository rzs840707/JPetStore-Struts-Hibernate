package com.maxiaolong.jpetstore.domain;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;

/**
 * Created by maxiaolong on 2016/4/3.
 */

@Entity
@Table(name = "log")
public class Log {
    private int id;
    private String userid;
    private Timestamp timestamp;
    private String dowhat;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String uerid) {
        this.userid = uerid;
    }

    public Timestamp getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Timestamp timestamp) {
        this.timestamp = timestamp;
    }

    public String getDowhat() {
        return dowhat;
    }

    public void setDowhat(String dowhat) {
        this.dowhat = dowhat;
    }

    public Log() {
    }

    public Log(String uerid, String dowhat) {
        this.userid = uerid;
        this.timestamp=new Timestamp(System.currentTimeMillis());
        this.dowhat = dowhat;
    }

    @Override
    public String toString() {
        return "Log{" +
                "uerid='" + userid + '\'' +
                ", timestamp=" + timestamp +
                ", dowhat='" + dowhat + '\'' +
                '}';
    }
}