package com.cj.sroup.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.cj.sroup.dao.M_galleryDao;
import com.cj.sroup.vo.M_galleryVO;

@Service
@Transactional
public class M_galleryServiceImpl implements M_galleryService{

	@Autowired
	private M_galleryDao m_gallerydao;
	
	@Override
	public void addGallery(M_galleryVO m_gallery) {
		// TODO Auto-generated method stub
		m_gallerydao.addGallery(m_gallery);
		
	}
	

	@Override
	public String m_albumImageUpload(MultipartFile photofile) {		
		// 업로드된 파일이 있는 경우
				if(!photofile.isEmpty()){
					// 첨부파일정보 조회하기
					String filename = System.currentTimeMillis() + photofile.getOriginalFilename();
					String contentType = photofile.getContentType();
					long filesize = photofile.getSize();
					System.out.println("파일명: "+filename);
					System.out.println("파일타입: "+contentType);
					System.out.println("파일크기: "+filesize + "bytes");
					
					// 업로드된 파일을 지정된 폴더에 저장하기
					byte[] filedate;
					try {						
						filedate = photofile.getBytes();
						File file = new File("C:/web_study/apache-tomcat-8.0.23/webapps/sroup/resources/upload/album_photo",filename);
						FileCopyUtils.copy(filedate, file);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					return filename;
				}
				return null;
	}

	@Override
	public HashMap<String, Integer> getPrevNext(M_galleryVO m_gallery) {			
		return m_gallerydao.getPrevNext(m_gallery);
	}

	@Override
	public M_galleryVO detail_Gallery(int g_no) {	
		return m_gallerydao.detail_Gallery(g_no);
	}


	@Override
	public int getAllGalleryNo(int study_no) {		
		return m_gallerydao.getAllGalleryNo(study_no);
	}


	@Override
	public List<M_galleryVO> getGallery_list(HashMap<String, Integer> num) {		
		return m_gallerydao.getGallery_list(num);
	}


	@Override
	public void delGallery(int g_no) {
		m_gallerydao.delGallery(g_no);
		
	}


	@Override
	public void reGallery(M_galleryVO m_board) {
		m_gallerydao.reGallery(m_board);		
	}




	
	
}
