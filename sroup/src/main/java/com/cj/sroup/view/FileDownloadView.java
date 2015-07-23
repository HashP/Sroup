package com.cj.sroup.view;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

public class FileDownloadView extends AbstractView{
	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		String filename = (String)model.get("filename");
		// 파일을 읽어오는 스트림 얻기		
		File file = new File("c:/spring_study",filename);
		FileInputStream fis = new FileInputStream(file);
		// System.out.println("파일정보" + filename);
		
		// 파일다운로드하기
		filename = URLEncoder.encode(filename,"utf-8");
		response.setContentType("apllication/octet-stream");
		response.setHeader("Content-Disposition", "attachment;filename="+filename);
		response.setHeader("Content-Transfer-Encoding", "binary");
		// 브라우저로 내려보내는 스트림 얻기
		OutputStream os = response.getOutputStream();
		
		FileCopyUtils.copy(fis,os);
		
	}
	
}
