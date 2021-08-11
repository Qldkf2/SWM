package com.ez.swm.freeBoard.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ez.swm.common.FileUtils;
import com.ez.swm.freeBoard.dao.FreeBoardDao;
import com.ez.swm.freeBoard.vo.FreeBoard;
import com.ez.swm.freeBoard.vo.FreeBoardComment;
import com.ez.swm.freeBoard.vo.FreeBoardCommentList;
import com.ez.swm.freeBoard.vo.FreeBoardFile;
import com.ez.swm.freeBoard.vo.FreeBoardWrite;
@Service
public class FreeBoardService {

	@Autowired
	private FreeBoardDao freeBoardDao;
	@Autowired
	private FileUtils fileUtils;
	
	private HashMap<String, Object> valueMap;

	// Ŀ�´�Ƽ �Խñ� �ۼ�
	public int communityBoardWrite(FreeBoardWrite freeBoardWrite,MultipartHttpServletRequest request) throws Exception{
		int free_no = freeBoardDao.communityBoardWrite(freeBoardWrite);
				freeBoardWrite.setFree_no(free_no);
				
		List<Map<String,Object>> files = fileUtils.parseInsertFileInfo(freeBoardWrite, request);
		/* System.out.println("�� ���� �� ����  :? " + files); */
			int size = files.size();
			for(int i=0; i<size; i++) {
				freeBoardDao.insertFile(files.get(i));
		}
			return free_no;
	}
	
	// Ŀ�´�Ƽ �Խñ� ����Ʈ����
	public List<FreeBoard> communityBoardList() {
		return freeBoardDao.communityBoardList();
	}

	// Ŀ�´�Ƽ �Խñ� �󼼺���
	public FreeBoard communityBoardDetail(int free_no) {
		return freeBoardDao.communityBoardDetail(free_no);
	}

	// Ŀ�´�Ƽ �Խñ� ����
	public void deleteFreeBoard(int wrotenNo) {
		freeBoardDao.deleteFreeBoard(wrotenNo);
	}

	// Ŀ�´�Ƽ �Խñ� ��ۺ���
	public List<FreeBoardCommentList> communityComment(int free_no) {
		return freeBoardDao.communityComment(free_no);
	}

	// ��۴ޱ�
	public void writeComment(FreeBoardComment commentVo) {
		int refno = commentVo.getFree_comment_refno();

		if (refno == 0) { // �׳� ����϶�
			commentVo.setFree_comment_level(1);
		} else { // �����϶�
			int lastLevel = freeBoardDao.CommCommentLevel(refno);
			commentVo.setFree_comment_level(lastLevel + 1);
		}

		freeBoardDao.writeComment(commentVo);
	}
	
	//��� ����
	public int deleteFreeComment(int free_no) {
		return freeBoardDao.deleteFreeComment(free_no);
	}

	//Ŀ�´�Ƽ ����
	public void updateFreeBorad(FreeBoard commVo) {
		freeBoardDao.updateFreeBorad(commVo);
	}

	public List<FreeBoardFile> freeBoardGetFile(int free_no) {
		return freeBoardDao.freeBoardGetFile(free_no);
	}


}
