package com.cj.sroup.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cj.sroup.model.Editor;

@Controller
public class EditorController {
	 @RequestMapping("/insert.do")
	 public String insert(){
		 return "insert.jsp"; 
	 }		
 }

