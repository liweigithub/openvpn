package com.openvpn.entity;
// default package


import java.util.Date;


/**
 * LogId entity. @author MyEclipse Persistence Tools
 */

public class Log  implements java.io.Serializable {
    // Fields    

     private String username;
     private Date startTime;
     private Date endTime;
     private String trustedIp;
     private Integer trustedPort;
     private String protocol;
     private String remoteIp;
     private String remoteNetmask;
     private Long bytesReceived;//实际扣除的手机流量
     private Long bytesSent;//已经使用的流量
     private Integer status;


   

  
    public Log() {
    }


   
    // Property accessors

    public String getUsername() {
        return this.username;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }

    public String getTrustedIp() {
        return this.trustedIp;
    }
    
    public void setTrustedIp(String trustedIp) {
        this.trustedIp = trustedIp;
    }

    public Integer getTrustedPort() {
        return this.trustedPort;
    }
    
    public void setTrustedPort(Integer trustedPort) {
        this.trustedPort = trustedPort;
    }

    public String getProtocol() {
        return this.protocol;
    }
    
    public void setProtocol(String protocol) {
        this.protocol = protocol;
    }

    public String getRemoteIp() {
        return this.remoteIp;
    }
    
    public void setRemoteIp(String remoteIp) {
        this.remoteIp = remoteIp;
    }

    public String getRemoteNetmask() {
        return this.remoteNetmask;
    }
    
    public void setRemoteNetmask(String remoteNetmask) {
        this.remoteNetmask = remoteNetmask;
    }

    public Long getBytesReceived() {
        return this.bytesReceived;
    }
    
    public void setBytesReceived(Long bytesReceived) {
        this.bytesReceived = bytesReceived;
    }

    public Long getBytesSent() {
        return this.bytesSent;
    }
    
    public void setBytesSent(Long bytesSent) {
        this.bytesSent = bytesSent;
    }

    public Integer getStatus() {
        return this.status;
    }
    
    public void setStatus(Integer status) {
        this.status = status;
    }



	public Date getStartTime() {
		return startTime;
	}



	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}



	public Date getEndTime() {
		return endTime;
	}



	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
   



 
  


}