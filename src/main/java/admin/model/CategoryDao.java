package admin.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component("myCategoryDao") 
public class CategoryDao {

	private String namespace = "admin.model.Category";
	@Autowired 
	SqlSessionTemplate sqlSessionTemplate;
	
	public void insertCate(Category category) {
		
		
		int cnt = sqlSessionTemplate.insert(namespace+".InsertCate", category); 
		System.out.println("Cate insert cnt : "+cnt);
	}
	
	public int getTotalCount(Map<String, String> map) {
		int cnt = sqlSessionTemplate.selectOne(namespace+".GetTotalCount",map);
		return cnt;
	}

	public List<Category> selectCateAll(Paging pageInfo, Map<String, String> map) {
		List<Category> lists = new ArrayList<Category>();
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		lists = sqlSessionTemplate.selectList(namespace+".GetCateList",map,rowBounds);
		System.out.println("Cate list size():"+lists.size());
		return lists;
	}

	public void deleteCate(int cnum) {
		int cnt = sqlSessionTemplate.delete(namespace+".DeleteCate", cnum);
		System.out.println("Cate delete cnt : "+cnt);
		
	}

	public Category getOneCate(int cnum) {
		Category category = sqlSessionTemplate.selectOne(namespace+".GetOneCate", cnum);		
		return category;
	}

	public int updateCate(Category category) {
		int cnt = sqlSessionTemplate.update(namespace+".UpdateCate", category);
		System.out.println("Cate update cnt : "+cnt);
		return cnt;
	}

	public List<Category> selectAll() {
		List<Category> lists = new ArrayList<Category>();
		lists = sqlSessionTemplate.selectList(namespace+".SelectAll");
		return lists;
	}

	
}
