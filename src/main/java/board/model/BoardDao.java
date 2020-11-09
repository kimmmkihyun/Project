package board.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component("myBoardDao")
public class BoardDao {

	String namespace = "board.model.BoardBean";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public void insertBoard(BoardBean board) {
		
		int cnt = sqlSessionTemplate.insert(namespace+".InsertBoard",board);
		   System.out.println("dao insert cnt : "+cnt);
	}  
	 
	public List<BoardBean> getBoardList(Paging pageInfo, Map<String, String> map) {
		 List<BoardBean> lists = new ArrayList<BoardBean>();
		 RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		lists = sqlSessionTemplate.selectList(namespace+".GetBoardList",map,rowBounds);
		return lists;   
	}

	public int getTotalCount(Map<String, String> map) {
		int cnt = sqlSessionTemplate.selectOne(namespace+".GetTotalCount",map);
		return cnt;
	}

	public BoardBean getOneBoard(int num) {
		BoardBean bean = sqlSessionTemplate.selectOne(namespace+".GetOneBoard", num);
		return bean;
	}

	public void deleteBoard(int num) {
		int cnt = sqlSessionTemplate.delete(namespace+".DeleteBoard", num);
		System.out.println("dao delete cnt : "+cnt);
	}

	public int updateOneBoard(BoardBean board) {
		int cnt = sqlSessionTemplate.update(namespace+".UpdateOneBoard",board);
		System.out.println("dao update cnt : " +cnt);
		return cnt;
	}
	public void readcountboard(int num) {
	    sqlSessionTemplate.update(namespace+".readcountboard", num);
	    
	}
     
}
