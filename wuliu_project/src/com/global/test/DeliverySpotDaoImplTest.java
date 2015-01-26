package com.global.test;

import java.util.List;

import com.global.dao.DeliverySpotDao;
import com.global.dao.ReceiptDao;
import com.global.vo.Deliveryspot;

public class DeliverySpotDaoImplTest extends BaseCase {


	public void testQueryCityByProvinceIDFromCity() {
		
	
		/*DeliverySpotDao dao = (DeliverySpotDao) super.getBean("DeliverySpotDao");
		
		Deliveryspot dd = new Deliveryspot();
		dd.setDeliveryspotno("005");
		
		dao.addDeliverySpot(dd);
		System.out.println("---");*/
		DeliverySpotDao dao = (DeliverySpotDao) super.getBean("DeliverySpotDao");
		List l = dao.queryAllDeliverySpotOfAddUser();
		for (int i = 0; i < l.size(); i++) {
			Deliveryspot ds = (Deliveryspot)l.get(i);
			System.out.println(ds.getName());
		}
		
		
	}

}
