package com.cj.sroup.controller;

import java.io.BufferedInputStream;  
import java.io.BufferedOutputStream;  
import java.io.File;  
import java.io.FileOutputStream;  
import java.io.IOException;  
import java.text.SimpleDateFormat;  
import java.util.Date;  
import java.util.Iterator;  
import java.util.List;  
  
import javax.servlet.ServletException;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
  
import org.apache.commons.fileupload.disk.DiskFileItem;  
import org.apache.commons.fileupload.disk.DiskFileItemFactory;  
import org.apache.commons.fileupload.servlet.ServletFileUpload;  
import org.apache.commons.fileupload.util.Streams;  
  
  
public class UploadServlet extends HttpServlet {  
  
    private static final long serialVersionUID = -5036264969905378310L;  
  
    @Override  
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {  
        super.doGet(req, resp);  
    }  
  
    @Override  
    protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {  
  
        request.setCharacterEncoding("UTF-8");  
        Date date = new Date();
        SimpleDateFormat sdfFileName = new SimpleDateFormat("yyyyMMddHHmmss");  
        SimpleDateFormat sdfFolderName = new SimpleDateFormat("yyyyMMdd");  
          
        String newfileName = sdfFileName.format(date);//  
        String newFolderName = sdfFolderName.format(date);
          
        String fileRealPath = "C:\\upload";//
        String fileRealResistPath = "C:\\upload";//
  
        String savePath = this.getServletConfig().getServletContext().getRealPath("/") + "\\" + "uploads\\" + newFolderName + "\\";  
        File file = new File(savePath);  
        if (!file.isDirectory()) {  
            file.mkdirs();  
        }  
  
        try {  
            String firstFileName = "";  
              
            DiskFileItemFactory fac = new DiskFileItemFactory();  
            ServletFileUpload upload = new ServletFileUpload(fac);  
            upload.setHeaderEncoding("UTF-8");  
            // 获取多个上传文件  
            List fileList = upload.parseRequest(request);  
            
            Iterator it = fileList.iterator();  
            while (it.hasNext()) {  
                Object obit = it.next();  
                if (obit instanceof DiskFileItem) {  
                    DiskFileItem item = (DiskFileItem) obit;  
  
                    String fileName = item.getName();  
                    if (fileName != null) {  
                        firstFileName = item.getName().substring(item.getName().lastIndexOf("\\") + 1); 
                        String formatName = firstFileName.substring(firstFileName.lastIndexOf("."));  
                        fileRealPath = savePath + newfileName + formatName;
  
                        BufferedInputStream in = new BufferedInputStream(item.getInputStream());
                        BufferedOutputStream outStream = new BufferedOutputStream(new FileOutputStream(new File(fileRealPath)));
                        Streams.copy(in, outStream, true);
                       
                        if (new File(fileRealPath).exists()) {  
                            
                            fileRealResistPath = "uploads/" + newFolderName + "/" + fileRealPath.substring(fileRealPath.lastIndexOf("\\") + 1);  
                              
                            
                        }  
  
                    }  
                }  
            }  
        } catch (org.apache.commons.fileupload.FileUploadException ex) {  
            ex.printStackTrace();  
            return;  
        }  
        response.getWriter().write("1");  
  
    }  
  
}  
