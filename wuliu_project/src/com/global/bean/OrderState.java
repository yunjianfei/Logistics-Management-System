package com.global.bean;

import java.util.Date;

public class OrderState {
	private String createtime;

	private String deliveryspotName;

	private Integer deliveryspotid;

	private String flag;


	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public String getCreatetime() {
		return createtime;
	}

	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}

	public String getDeliveryspotName() {
		return deliveryspotName;
	}

	public void setDeliveryspotName(String deliveryspotName) {
		this.deliveryspotName = deliveryspotName;
	}

	public Integer getDeliveryspotid() {
		return deliveryspotid;
	}

	public void setDeliveryspotid(Integer deliveryspotid) {
		this.deliveryspotid = deliveryspotid;
	}
}
