package com.global.struts.action;




import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.global.dao.BaseDao;
import com.global.dao.EmployeeDao;
import com.global.dao.impl.BaseDaoImpl;
import com.global.dao.impl.EmployeeDaoImpl;
import com.global.struts.form.EmployeeForm;
import com.global.struts.form.SelectEmployeeForm;
import com.global.struts.form.UpdataEmployeeForm;
import com.global.vo.Deliveryspot;
import com.global.vo.Employee;
import com.global.vo.Position;

/** 
 * MyEclipse Struts
 * Creation date: 11-24-2008
 * 
 * XDoclet definition:
 * @struts.action path="/employee" name="employeeForm" input="/empManage/addEmp.jsp" scope="request" validate="true"
 */
public class UptataEmployeeAction extends BaseDispatchAction {
	/*
	 * Generated Methods
	 */

	/** 
	 * Method execute
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 */
	
//	修改员工信息
	public ActionForward updateEmployee(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		UpdataEmployeeForm updataEmployeeForm = (UpdataEmployeeForm) form;
		
		EmployeeDao edao = (EmployeeDao) super.getBean("EmployeeDao");
		Position p = new Position();
		Deliveryspot d = new Deliveryspot();
		BaseDao bdao = (BaseDao) super.getBean("BaseDao");
		
		String positionid = request.getParameter("positionID");
		p = (Position) bdao.get(Position.class, new Integer(positionid));
		
		String deliveryspotid = request.getParameter("deliverySpotID");
		d = (Deliveryspot) bdao.get(Deliveryspot.class, new Integer(deliveryspotid));
		
		String empid = request.getParameter("empid");
		String name = request.getParameter("name").trim();
		String address = request.getParameter("address");
		String tel = request.getParameter("tel").trim();
		String email = request.getParameter("email").trim();
		String cardid = request.getParameter("cardID").trim();
		String salary = request.getParameter("salary").trim();
		String gender = request.getParameter("gender");
		
		Employee emp =(Employee) bdao.get(Employee.class, new Integer(empid));
		
		emp.setPosition(p);
		emp.setDeliveryspot(d);
		emp.setAddress(address);
		emp.setCardid(cardid);
		emp.setEmail(email);
		
		emp.setSalary(Double.parseDouble(salary));
		emp.setName(name);
		emp.setGender(gender);
		emp.setTel(tel);
		
		
		
		edao.updateEmployee(emp);
		request.setAttribute("dsid", ""+emp.getDeliveryspot().getDeliveryspotid());
		return mapping.findForward("selectEmpAction");
	}
	
	
}