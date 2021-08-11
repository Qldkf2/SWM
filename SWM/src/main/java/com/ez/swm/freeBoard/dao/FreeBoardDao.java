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

	// 커뮤니티 게시글 작성
	public int communityBoardWrite(FreeBoardWrite freeBoardWrite) {
		 sqlSessionTemplate.insert("freeBoard.writeFreeBoard", freeBoardWrite);
		 return sqlSessionTemplate.selectOne("freeBoard.getFree_no");
	}

	// 커뮤니티 게시글 리스트보기
	public List<FreeBoard> communityBoardList() {
		Map<String, Object> map = new HashMap<String, Object>();
		return sqlSessionTemplate.selectList("freeBoard.FreeBoardList", map);
	}

	// 커뮤니티 게시글 상세보기
	public FreeBoard communityBoardDetail(int free_no) {
		return sqlSessionTemplate.selectOne("freeBoard.FreeBoardDetail", free_no);
	}

	// 커뮤니티 게시글 삭제
	public void deleteFreeBoard(int free_no) {
		sqlSessionTemplate.delete("freeBoard.DeleteFreeBoard", free_no);
	}

	// 커뮤니티 댓글 보기
	public List<FreeBoardCommentList> communityComment(int free_no) {
		return sqlSessionTemplate.selectList("freeBoard.FreeComment", free_no);
	}

	// 커뮤니티 댓글쓰기
	public void writeComment(FreeBoardComment commentVo) {
		sqlSessionTemplate.insert("freeBoard.writeComment", commentVo);

	}

	// 부모댓글, 자식댓글 구분용
	public int CommCommentLevel(int commuComment_refno) {
		return sqlSessionTemplate.selectOne("freeBoard.commentLastLevel", commuComment_refno);
	}

	// 커뮤니티 댓글 삭제
	public int deleteFreeComment(int free_comment_no) {
		return sqlSessionTemplate.delete("freeBoard.DeleteFreeComment", free_comment_no);
	}

	//커뮤니티 수정
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
