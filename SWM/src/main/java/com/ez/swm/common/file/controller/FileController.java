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
	
	//���ϴٿ�ε�
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
		//���� ������ �������� ��� ǥ���ؾ� ���� �˷��ִ� ����Դϴ�. 
		//attachment�� ��� �ٿ�ε�˴ϴ�.
		
		//fileName=\"" + URLEncoder.encode(originalFileName,"UTF-8")+"\";"); 
		//�츮�� ������ �ٿ�ε� �������� �ϸ�, ������ ������ ��ġ�� �����ϴ� â�� �߰�
		//������ �̸��� �����Ǿ��ִµ�, �� �κ��� �� ������ �����Ѵ�.(���ڵ��ؾ� �ѱ��� �ȱ���)
		// +"\";");  �� �� �ٿ��� �ٿ�ε尡 ��
		
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush(); 
		response.getOutputStream().close();

	}

	
	
	
}
