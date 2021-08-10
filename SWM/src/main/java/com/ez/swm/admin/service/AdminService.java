package com.ez.swm.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ez.swm.admin.dao.AdminDao;
import com.ez.swm.admin.vo.StudycafeWrite;
import com.ez.swm.common.FileUtils;

@Service
public class AdminService {
	@Autowired
	AdminDao adminDao;
	
	@Autowired
	private FileUtils fileUtils;
	
	public int studycafeWrite(StudycafeWrite studycafeWrite,MultipartHttpServletRequest request) throws Exception {
		int studycafe_no = adminDao.studycafeWrite(studycafeWrite,request);
			studycafeWrite.setStudycafe_no(studycafe_no);
		
		List<Map<String,Object>> files = fileUtils.parseInsertFileInfo(studycafeWrite, request);
		System.out.println("카페 파일들 오냐 ? " + files);
		int size = files.size();
		for(int i=0; i<size; i++) {
			adminDao.insertFile(files.get(i));
	}
		return studycafe_no;
	}
}
