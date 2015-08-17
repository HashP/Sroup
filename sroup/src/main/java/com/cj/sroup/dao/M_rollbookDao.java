package com.cj.sroup.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.MapKey;
import org.apache.ibatis.annotations.Select;

import com.cj.sroup.vo.M_RollbookVO;
import com.cj.sroup.vo.UserInfoVO;

public interface M_rollbookDao {

	public List<String> getSchedulesByStudyno(int studyNo);
	public List<UserInfoVO> getMembersByStudyno(int studyNo);
	
	@Select("select USER_ID, (select count(*) from S_ROLLBOOK where study_no = STUDY_MANAGEMENT.STUDY_NO and RB_name = STUDY_MANAGEMENT.USER_ID and RB_ATTEND = 'attend' and S_ROLLBOOK.RB_ATTEND_DAY <= sysdate) value from STUDY_MANAGEMENT where study_no = #{value}")
	@MapKey("USER_ID")
	public HashMap<String, HashMap<String, Object>> getAttendCountByStudyno(int studyNo);
	
	@Select("SELECT RB_NO 	as no"
			+ ", STUDY_NO 	as studyNo"
			+ ", RB_NAME	as name"
			+ ", RB_ATTEND_DAY as attendDay"
			+ ", RB_ATTEND 	as attend"
			+ ", RB_NOTE	as note"
			+ ", RB_WRITE_DAY as writeDay"
			+ ", RB_WRITER 	as writer" 
			+ " FROM S_ROLLBOOK"
			+ " WHERE study_no = #{study_no} and TO_CHAR(RB_ATTEND_DAY, 'yyyy-mm-dd') = #{date}")
	@MapKey("name")
	public HashMap<String, M_RollbookVO> getAttendByDay(HashMap<String, Object> searchOption);
	
	public int getNewRbNo();
	public void addNewRollbook(M_RollbookVO rollbook);
	public void updateRollbook(M_RollbookVO rollbook);
	public int getAttendCountByUserid(M_RollbookVO rollbook);
}
