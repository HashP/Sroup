package com.cj.sroup.view;

import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import com.cj.sroup.vo.E_rollbookVO;


public class ExcelView extends AbstractExcelView {
	
	@Override
	protected void buildExcelDocument(Map<String, Object> model,
			HSSFWorkbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
			
		HSSFSheet sheet = workbook.createSheet("출석부");
		
		HSSFRow title_row = sheet.createRow(0);
		
		title_row.createCell(0).setCellValue("이름");
		title_row.createCell(1).setCellValue("출석");
		title_row.createCell(2).setCellValue("비고");
		title_row.createCell(3).setCellValue("출석률");
		title_row.createCell(4).setCellValue("");
		title_row.createCell(5).setCellValue("");

		ArrayList<E_rollbookVO> rollbooks = (ArrayList<E_rollbookVO>)model.get("rollbooks");
		System.out.println("["+rollbooks.get(0).getName()+"!");
		System.out.println("? : "+rollbooks.size());
		System.out.println(rollbooks.get(0).getName());
		System.out.println(rollbooks.get(1).getName());
		System.out.println(rollbooks.get(2).getName());
		int cnt=0;
		for(int i=0; i<rollbooks.size(); i++){
			E_rollbookVO e = rollbooks.get(i);

			HSSFRow data_row = sheet.createRow(1+i);

			
			data_row.createCell(0).setCellValue(e.getName());
			data_row.createCell(1).setCellValue(e.getAttend());
			data_row.createCell(2).setCellValue(e.getNote());
			data_row.createCell(3).setCellValue(e.getAttend_rate());
//			data_row.createCell(5).setCellValue(e.getSalary());
//			data_row.createCell(6).setCellValue(e.getCommision());
			cnt=i+1;
		}
		HSSFRow total_row = sheet.createRow(cnt+2);
		total_row.createCell(0).setCellValue("총 인원");
		total_row.createCell(1).setCellValue(cnt);			
		
		// 파일다운로드뷰와 같은 설정을 한다.
		response.setContentType("application/octet-stream");
		// 다운로드 되는 파일의 이름 설정하기
		response.setHeader("Content-Disposition", "attachment;filename=rollbook.xls");
		// 바이너리 데이타로 인코딩한다.
		response.setHeader("Content-Transfer-Encoding", "binary");
		
	}

}
