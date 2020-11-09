package board.model;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("myboardCommentsDao")
public class BoardCommentsDao {

    final String namespace="board.model.BoardComments";
    
    @Autowired
    SqlSessionTemplate sqlSessionTemplate;
    
    public void insertComments(BoardComments boardComments) {
   sqlSessionTemplate.insert(namespace+".InsertComments", boardComments);
   
    }

    public List<BoardComments> selectComments(int cnum) {
   List<BoardComments> lists = new ArrayList<BoardComments>();
   lists = sqlSessionTemplate.selectList(namespace+".SelectComments", cnum);
   return lists;
   
    }

    public void updateCom(BoardComments boardComments) {
   sqlSessionTemplate.update(namespace+".UpdateCom", boardComments);
   
    }

}