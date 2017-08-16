package com.openvpn.entity;
// default package

import java.sql.Timestamp;


/**
 * Status entity. @author MyEclipse Persistence Tools
 */

public class Status  implements java.io.Serializable {


    // Fields    

     private String username;
     private Long totalUsed;
     private Timestamp originTime;


    // Constructors

    /** default constructor */
    public Status() {
    }

    
    /** full constructor */
    public Status(String username, Long totalUsed, Timestamp originTime) {
        this.username = username;
        this.totalUsed = totalUsed;
        this.originTime = originTime;
    }

   
    // Property accessors

    public String getUsername() {
        return this.username;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }

    public Long getTotalUsed() {
        return this.totalUsed;
    }
    
    public void setTotalUsed(Long totalUsed) {
        this.totalUsed = totalUsed;
    }

    public Timestamp getOriginTime() {
        return this.originTime;
    }
    
    public void setOriginTime(Timestamp originTime) {
        this.originTime = originTime;
    }
   








}