package com.global.dao;

import java.util.List;
import java.util.Set;

import com.global.vo.Receiptdetaile;

public interface ReceiptDetaileDao {
	//添加交接单详细信息
	public void addReceiptDetaile(Receiptdetaile receiptDetaile);

	//删除交接单详细信息
	public void deleteReceiptDetaile(Receiptdetaile receiptDetaile);

	//根据交接单ID查询交接单详细信息
	public Set queryReceiptDetaileByReceiptID(int receiptID);
	
//	根据交接单ID查询交接单详细信息
	public List queryReceiptDetaileByReceiptID2(int receiptID,int intOffset,int munber);
	
	//分页 获取交接单详细条目数
	public int countReceiptDetaileByReceiptID(int receiptID);

}