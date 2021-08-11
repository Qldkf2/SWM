package com.ez.swm.freeBoard.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ez.swm.freeBoard.vo.FreeBoard;
import com.ez.swm.freeBoard.vo.FreeBoardComment;
import com.ez.swm.freeBoard.vo.FreeBoardCommentList;
import com.ez.swm.freeBoard.vo.FreeBoardFile;
import com.ez.swm.freeBoard.vo.FreeBoardWrite;

@Repository
public class FreeBoardDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	// Ŀ�´�Ƽ �Խñ� �ۼ�
	public int communityBoardWrite(FreeBoardWrite freeBoardWrite) {
		 sqlSessionTemplate.insert("freeBoard.writeFreeBoard", freeBoardWrite);
		 return sqlSessionTemplate.selectOne("freeBoard.getFree_no");
	}

	// Ŀ�´�Ƽ �Խñ� ����Ʈ����
	public List<FreeBoard> communityBoardList() {
		Map<String, Object> map = new HashMap<String, Object>();
		return sqlSessionTemplate.selectList("freeBoard.FreeBoardList", map);
	}

	// Ŀ�´�Ƽ �Խñ� �󼼺���
	public FreeBoard communityBoardDetail(int free_no) {
		return sqlSessionTemplate.selectOne("freeBoard.FreeBoardDetail", free_no);
	}

	// Ŀ�´�Ƽ �Խñ� ����
	public void deleteFreeBoard(int free_no) {
		sqlSessionTemplate.delete("freeBoard.DeleteFreeBoard", free_no);
	}

	// Ŀ�´�Ƽ ��� ����
	public List<FreeBoardCommentList> communityComment(int free_no) {
		return sqlSessionTemplate.selectList("freeBoard.FreeComment", free_no);
	}

	// Ŀ�´�Ƽ ��۾���
	public void writeComment(FreeBoardComment commentVo) {
		sqlSessionTemplate.insert("freeBoard.writeComment", commentVo);

	}

	// �θ���, �ڽĴ�� ���п�
	public int CommCommentLevel(int commuComment_refno) {
		return sqlSessionTemplate.selectOne("freeBoard.commentLastLevel", commuComment_refno);
	}

	// Ŀ�´�Ƽ ��� ����
	public int deleteFreeComment(int free_comment_no) {
		return sqlSessionTemplate.delete("freeBoard.DeleteFreeComment", free_comment_no);
	}

	//Ŀ�´�Ƽ ����
	public void updateFreeBorad(FreeBoard freeBoard) {
		sqlSessionTemplate.update("freeBoard.FreeBoardUpdate", freeBoard);
	}

	public void insertFile(Map<String, Object> map) {
		sqlSessionTemplate.insert("File.freeBoardInsertFile", map);
		
	}

	public List<FreeBoardFile> freeBoardGetFile(int free_no) {
		return sqlSessionTemplate.selectList("File.freeBoardGetFile", free_no);
	}

}
