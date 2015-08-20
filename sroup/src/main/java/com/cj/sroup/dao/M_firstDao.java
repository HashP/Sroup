package com.cj.sroup.dao;

import java.util.HashMap;

public interface M_firstDao {
	int get_studyNo(String study_address);
	String get_Admin(int study_no);
	String check_cafeuser(HashMap<String, String> map);
}
