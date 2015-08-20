package com.cj.sroup.service;

import java.util.HashMap;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public interface M_firstService {
	int get_studyNo(String study_address);
	String get_Admin(int study_no);
	String check_cafeuser(HashMap<String, String> map);
	String get_profileName(String login_id);
}
