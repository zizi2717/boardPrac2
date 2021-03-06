package com.prac.board.mapper;

import java.util.List;

import com.prac.board.vo.BoardVO;

public interface BoardMapper {
	public List<BoardVO> viewAll();
	public BoardVO viewDetail(int seq);
	public boolean plusCnt(int seq);
	public int insertBoard(BoardVO vo);
	public boolean deleteBoard(int seq);
	public boolean updateBoard(BoardVO vo);
}
