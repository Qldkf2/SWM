package com.ez.swm.common;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ez.swm.admin.vo.StudycafeWrite;
import com.ez.swm.freeBoard.vo.FreeBoardWrite;
import com.ez.swm.meeting.vo.MeetingBoard;
import com.ez.swm.meeting.vo.MeetingBoardModify;


@Component("fileUtils")
public class FileUtils {
	
	
	
	public List<Map<String, Object>> parseInsertFileInfo(MeetingBoard meetingBoard, MultipartHttpServletRequest request) throws Exception{
		Iterator<String> iterator = request.getFileNames();
		 String filePath ="C:\\Users\\kimbb\\git\\SWM\\SWM\\src\\main\\webapp\\resources\\files\\meeting\\";
		MultipartFile multipartFile=null;
		String originalFileName = null; 
		String originalFileExtension = null;
		String storedFileName = null;

		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>()	;
		Map<String,Object> listMap = null;
		
		int  party_no = meetingBoard.getMeeting_board_no();

		File file = new File(filePath);
		
		while(iterator.hasNext()) {
			multipartFile=request.getFile(iterator.next());

			if(multipartFile.isEmpty()==false) {

				originalFileName = multipartFile.getOriginalFilename();

				originalFileExtension=originalFileName.substring(originalFileName.lastIndexOf(".")); 
				storedFileName = getRandomString() + originalFileExtension;

				file=new File(filePath+storedFileName);
				multipartFile.transferTo(file);
				
				listMap = new HashMap<String,Object>(); 
				listMap.put("MEETING_BOARD_NO", party_no); 
				listMap.put("ORIGINAL_FILE_NAME", originalFileName); 
				listMap.put("STORED_FILE_NAME", storedFileName); 
				listMap.put("FILE_SIZE", multipartFile.getSize()); 
				list.add(listMap);
				
			}
		}
		// System.out.println("유틸즈 : " + list);
		
		return list;
	}
	// 모임 내 게시글 수정
public List<Map<String, Object>> parseUpdateFileInfo(MeetingBoardModify meetingBoardModify, MultipartHttpServletRequest request) throws Exception{
		Iterator<String> iterator = request.getFileNames();
		 String filePath ="C:\\Users\\kimbb\\git\\SWM\\SWM\\src\\main\\webapp\\resources\\files\\meeting\\";
		MultipartFile multipartFile=null;
		String originalFileName = null; 
		String originalFileExtension = null;
		String storedFileName = null;

		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>()	;
		Map<String,Object> listMap = null;
		
		int  party_no = meetingBoardModify.getMeeting_board_no();

		File file = new File(filePath);
		
		while(iterator.hasNext()) {
			multipartFile=request.getFile(iterator.next());

			if(multipartFile.isEmpty()==false) {

				originalFileName = multipartFile.getOriginalFilename();

				originalFileExtension=originalFileName.substring(originalFileName.lastIndexOf(".")); 
				storedFileName = getRandomString() + originalFileExtension;

				file=new File(filePath+storedFileName);
				multipartFile.transferTo(file);
				
				listMap = new HashMap<String,Object>(); 
				listMap.put("MEETING_BOARD_NO", party_no); 
				listMap.put("ORIGINAL_FILE_NAME", originalFileName); 
				listMap.put("STORED_FILE_NAME", storedFileName); 
				listMap.put("FILE_SIZE", multipartFile.getSize()); 
				list.add(listMap);
				
			}
		}
		// System.out.println("유틸즈 : " + list);
		
		return list;
	}

// 스터디 카페 등록
public List<Map<String, Object>> parseInsertFileInfo(StudycafeWrite studycafeWrite, MultipartHttpServletRequest request) throws Exception{
	 String filePath ="C:\\Users\\kimbb\\git\\SWM\\SWM\\src\\main\\webapp\\resources\\files\\studycafe\\";
	Iterator<String> iterator = request.getFileNames();

	MultipartFile multipartFile=null;
	String originalFileName = null; 
	String originalFileExtension = null;
	String storedFileName = null;
	String roomName = null;

	List<Map<String, Object>> list = new ArrayList<Map<String,Object>>()	;
	Map<String,Object> listMap = null;
	
	int  studycafe_no = studycafeWrite.getStudycafe_no();
	String roomNames[] = studycafeWrite.getRoom_name();
	// int i >> 룸네임[] 을 다 넣을려고 하나만들어줌 ㅇㅋ?(인덱스용)
	int i = 0;
	File file = new File(filePath);
	
	while(iterator.hasNext()) {
		multipartFile=request.getFile(iterator.next());

		if(multipartFile.isEmpty()==false) {

			originalFileName = multipartFile.getOriginalFilename();

			originalFileExtension=originalFileName.substring(originalFileName.lastIndexOf(".")); 
			storedFileName = getRandomString() + originalFileExtension;

			file=new File(filePath+storedFileName);
			multipartFile.transferTo(file);
			
			listMap = new HashMap<String,Object>(); 
			listMap.put("STUDYCAFE_NO", studycafe_no); 
			listMap.put("ORIGINAL_FILE_NAME", originalFileName); 
			listMap.put("STORED_FILE_NAME", storedFileName); 
			listMap.put("FILE_SIZE", multipartFile.getSize()); 
			listMap.put("ROOM_NAME",roomNames[i++]);
			list.add(listMap);
			
		}
	}
	// System.out.println("유틸즈 : " + list);
	
	return list;
}

public List<Map<String, Object>> parseInsertFileInfo(FreeBoardWrite freeBoardWrite, MultipartHttpServletRequest request) throws Exception{
	Iterator<String> iterator = request.getFileNames();
	 String filePath ="C:\\Users\\kimbb\\git\\SWM\\SWM\\src\\main\\webapp\\resources\\files\\freeBoard\\";
	MultipartFile multipartFile=null;
	String originalFileName = null; 
	String originalFileExtension = null;
	String storedFileName = null;

	List<Map<String, Object>> list = new ArrayList<Map<String,Object>>()	;
	Map<String,Object> listMap = null;
	
	int  free_no = freeBoardWrite.getFree_no();

	File file = new File(filePath);
	
	while(iterator.hasNext()) {
		multipartFile=request.getFile(iterator.next());

		if(multipartFile.isEmpty()==false) {

			originalFileName = multipartFile.getOriginalFilename();

			originalFileExtension=originalFileName.substring(originalFileName.lastIndexOf(".")); 
			storedFileName = getRandomString() + originalFileExtension;

			file=new File(filePath+storedFileName);
			multipartFile.transferTo(file);
			
			listMap = new HashMap<String,Object>(); 
			listMap.put("FREE_NO", free_no); 
			listMap.put("ORIGINAL_FILE_NAME", originalFileName); 
			listMap.put("STORED_FILE_NAME", storedFileName); 
			listMap.put("FILE_SIZE", multipartFile.getSize()); 
			list.add(listMap);
			
		}
	}
	// System.out.println("유틸즈 : " + list);
	
	return list;
}
	
	public static String getRandomString() {
				return UUID.randomUUID().toString().replaceAll("-", "");
	}		
			
			
			
}
		
		
