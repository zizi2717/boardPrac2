package com.prac.board;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.prac.board.vo.BoardVO;

@Controller
public class HomeController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		
		List<BoardVO> viewAll = 
				sqlSession.getMapper(com.prac.board.mapper.BoardMapper.class).viewAll();
		model.addAttribute("viewAll", viewAll);
		
		return "board/boardList";
	}
	
	@GetMapping(value = "detail")
	public String viewDetail(Model model, BoardVO vo) {
		
		BoardVO viewDetail = 
				sqlSession.getMapper(com.prac.board.mapper.BoardMapper.class).viewDetail(vo.getSeq());
		model.addAttribute("board", viewDetail);
		
		sqlSession.getMapper(com.prac.board.mapper.BoardMapper.class).plusCnt(vo.getSeq());
		
		return "board/viewDetail";
	}
	
}