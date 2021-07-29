package com.ez.swm.common.file.controller;

import java.io.File;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.swm.common.file.service.FileService;
import com.ez.swm.meeting.vo.MeetingBoardFile;



@Controller
public class FileController {

	@Autowired
	private FileService fileService;
	
	//파일다운로드
	@RequestMapping(value="meeting/downloadFile")
	public void downloadFile(MeetingBoardFile meetingfile, HttpServletResponse response) throws Exception{
		
	
		MeetingBoardFile file = fileService.selectFileInfo(meetingfile.getIdx());
		
		String storedFileName=file.getStored_file_name();
		String originalFileName	=file.getOriginal_file_name();
		
		
		byte fileByte[]=FileUtils.readFileToByteArray(new File("C:\\Users\\kimbb\\git\\SWM\\SWM\\src\\main\\webapp\\resources\\files\\meeting\\"+storedFileName));
		
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(originalFileName,"UTF-8")+"\";"); 
		//Content-Disposition
		//응답 본문을 브라우저가 어떻게 표시해야 할지 알려주는 헤더입니다. 
		//attachment인 경우 다운로드됩니다.
		
		//fileName=\"" + URLEncoder.encode(originalFileName,"UTF-8")+"\";"); 
		//우리가 파일을 다운로드 받으려고 하면, 파일을 저장할 위치를 선택하는 창이 뜨고
		//파일의 이름이 지정되어있는데, 이 부분이 그 역할을 수행한다.(인코딩해야 한글이 안깨짐)
		// +"\";");  도 꼭 붙여야 다운로드가 댐
		
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush(); 
		response.getOutputStream().close();

	}

	
	
	
}
