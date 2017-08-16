package com.openvpn.entity;
// default package



/**
 * Admin entity. @author MyEclipse Persistence Tools
 */

public class Admin  implements java.io.Serializable {


    // Fields    

     private Integer id;
     private String username;
     private String password;
     private String email;
     private Integer adminLevel;


    // Constructors

    /** default constructor */
    public Admin() {
    }

    
    /** full constructor */
    public Admin(String username, String password, String email, Integer adminLevel) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.adminLevel = adminLevel;
    }

   
    // Property accessors

    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return this.username;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getAdminLevel() {
        return this.adminLevel;
    }
    
    public void setAdminLevel(Integer adminLevel) {
        this.adminLevel = adminLevel;
    }
   








}