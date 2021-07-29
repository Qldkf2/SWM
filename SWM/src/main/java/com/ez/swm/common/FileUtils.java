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
import com.ez.swm.meeting.vo.MeetingBoard;


@Component("fileUtils")
public class FileUtils {
	
	private String filePath ="C:\\Users\\kimbb\\git\\SWM\\SWM\\src\\main\\webapp\\resources\\files\\meeting\\";
	
	public List<Map<String, Object>> parseInsertFileInfo(MeetingBoard meetingBoard, MultipartHttpServletRequest request) throws Exception{
		
		
		Iterator<String> iterator = request.getFileNames();
	
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
		System.out.println("АЇЖїБо : " + list);
		
		return list;
	}
	
	public static String getRandomString() {
				return UUID.randomUUID().toString().replaceAll("-", "");
	}		
			
			
			
}
		
		
