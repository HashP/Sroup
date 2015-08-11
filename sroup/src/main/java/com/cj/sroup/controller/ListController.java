package com.cj.sroup.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.cj.sroup.service.StudyService;
import com.cj.sroup.vo.CheckVO;
import com.cj.sroup.vo.ListVO;

@Controller
public class ListController {
	@Value("${profile.image.path}")
	private String filepath;
	
	@Autowired
	StudyService service;
	
	@RequestMapping("/list.do")
	public ModelAndView list() {
		
		ModelAndView mav = new ModelAndView();
		List<ListVO> lists = service.getAllStudies();
		mav.addObject("lists", lists);
		mav.setViewName("list/list");
		
		return mav;
	}
	@RequestMapping("/detail.do")
	public String detail() {
		return "list/detail";
	}
	@RequestMapping("/add.do")
	public String add() {
		return "list/add";
	}
	@RequestMapping(value=("/upload.do"), method = RequestMethod.POST)  
	@ResponseBody
	public String upload(HttpServletRequest req, HttpServletResponse resp, HttpSession session) throws Exception {
		
		 String responseStr = "";
	        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) req;
	        // 获取前台传值
	        Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();
	        // String ctxPath =
	        // request.getSession().getServletContext().getRealPath("/")+ "\\" +
	        // "images\\";
	        String configPath = File.separator + "upload" + File.separator;
	        String ctxPath = req.getSession().getServletContext().getRealPath("/");
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
	        String year = sdf.format(new Date());
	        configPath += year + File.separator;
	        sdf = new SimpleDateFormat("MM");
	        String month = sdf.format(new Date());
	        configPath += month + File.separator;
	        
	        ctxPath += configPath;
	        // 创建文件夹
	        File file = new File(ctxPath);
	        if (!file.exists()) {
	            file.mkdirs();
	        }
	        String fileName = null;
	        for (Map.Entry<String, MultipartFile> entity : fileMap.entrySet()) {
	            // 上传文件名
	            // System.out.println("key: " + entity.getKey());
	            MultipartFile mf = entity.getValue();
	            fileName = mf.getOriginalFilename();
	            
	            String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();

	            SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
	            String newFileName = df.format(new Date()) + "_" + new Random().nextInt(1000) + "." + fileExt;
	            responseStr = configPath + newFileName + "|" + fileName;
	            File uploadFile = new File(ctxPath + newFileName);
	            try {
	                FileCopyUtils.copy(mf.getBytes(), uploadFile);
	            } catch (IOException e) {
	                responseStr = "上传失败";
	                e.printStackTrace();
	            }
	            
	        }
	        resp.setHeader("Content-type", "text/html;charset=UTF-8");  
	        //这句话的意思，是告诉servlet用UTF-8转码，而不是用默认的ISO8859  
	        resp.setCharacterEncoding("UTF-8");
	        resp.getWriter().write(responseStr); 
	        System.out.println(ctxPath);
	        return null;
	    }
	

	@RequestMapping("/uploadify.do")
	public String uploadify() {
		return "list/uploadify";
	}
	@RequestMapping("/map.do")
	public void map(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		resp.setContentType("text/plain;charset=utf-8;");
		
		String addr = req.getParameter("addr");
		URL urlMy=new URL("http://maps.google.kr/maps/api/geocode/json?address="+ addr);
	       URLConnection tc = urlMy.openConnection();
	       BufferedReader in = new BufferedReader(new InputStreamReader(
	               tc.getInputStream()));
	      String line = "";
	      String str;
	       while((str = in.readLine()) != null) {
	          line += str;
	       }
	       
	       System.out.println(line);
	       resp.setContentType("text/html; charset=UTF-8");
	       resp.setCharacterEncoding("UTF-8");
	       resp.getWriter().print(line);
	}
	
	@RequestMapping("/sms.do")
	public void SendSMS(HttpServletRequest req, HttpServletResponse resp) throws Exception{
        SMS sms = new SMS();
        
        sms.appversion("TEST/1.0");
        sms.charset("utf8");
        //sms.setuser("1234", "zxcv1234");				// coolsms 계정 입력해주시면되요

        String phone = req.getParameter("phone");
        String user_id = req.getParameter("user_id");
        
        
        System.out.println("phone : " +phone);
        System.out.println("user_id : " + user_id);
        String number[] = new String[1];                                  // 받을 사람 폰번호
        number[0] = phone;
        	
        Random r = new Random();
        int ran = 100000+r.nextInt(900000);
        System.out.println("중복 전 : " + ran);
        CheckVO checkUser = service.userCheck(user_id);
        	
        if(checkUser == null) {
        	CheckVO check = new CheckVO();
        	check.setUser_id(user_id);
        	check.setCheck_code(Integer.toString(ran));
        	System.out.println("스트링으로 변환 : "+Integer.toString(ran));
        		
       		service.addCheck(check);
       	} else if(checkUser != null) {
       		ran = 100000+r.nextInt(900000);
       		CheckVO reCheck = new CheckVO();
       		reCheck.setUser_id(user_id);
       		reCheck.setCheck_code(Integer.toString(ran));
       		reCheck.setCheck_y_or_n("N");
       		System.out.println("중복 후 : " + ran);
        		
       		service.modifyCheck(reCheck);
       	}
        	
       	for( int i = 0 ; i < number.length ; i ++ ) {
       		SmsMessagePdu pdu = new SmsMessagePdu();
       		pdu.type = "SMS";
       		pdu.destinationAddress = number[i];
        	pdu.scAddress = phone;                   // 발신자 번호          
       		pdu.text = "[SROUP] 본인 확인 서비스입니다. 인증 번호는 " + ran + " 입니다.";					    // 보낼 메세지 내용
       		sms.add(pdu);
       		System.out.println("그냥 : " + ran);
        	//try {
        	//sms.connect();
        	// sms.send();
        	//sms.disconnect();
        	
        	//} catch (IOException e) {
        	//     System.out.println(e.toString());
        	// }
        	sms.printr();
        	sms.emptyall();
        }
        	
    }
	
	@RequestMapping("/check.do")
	public void checkCode(HttpServletRequest req, HttpServletResponse resp) throws Exception{
		
		String phone = req.getParameter("phone");
        String user_id = req.getParameter("user_id");
		
		CheckVO user = service.userCheck(user_id);
        String check_code = req.getParameter("code");
        String returnValue = "";
        
        if(user.getCheck_code().equals(check_code)) {
        	CheckVO checkCode = new CheckVO();
        	checkCode.setUser_id(user_id);
        	checkCode.setCheck_code(user.getCheck_code());
        	checkCode.setCheck_y_or_n("Y");
        	
        	service.modifyCheck(checkCode);
        	
        	returnValue = "Y";
        	resp.getWriter().write(returnValue);
        	
        	return;
        	
        } else if(user.getCheck_code() != check_code) {
        	returnValue = "N";
        	resp.getWriter().write(returnValue);
        	
        	return;
        }
	}
	
	
}
