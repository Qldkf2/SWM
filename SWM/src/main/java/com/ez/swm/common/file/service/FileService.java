package com.ez.swm.common.file.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ez.swm.common.file.dao.FileDao;
import com.ez.swm.meeting.vo.MeetingBoardFile;

@Service
public class FileService {
	
	@Autowired
	private	 FileDao fileDao;

	public MeetingBoardFile selectFileInfo(int idx) throws Exception {
		return fileDao.selectFileInfo(idx);
	}
}
