package member.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component("myMemberDao")
public class MemberDao {
	private String namespace="member.model.Member";
	
	@Autowired
	SqlSessionTemplate sqlsessiontemplate;
	
	public void insertData(Member member){
		sqlsessiontemplate.insert(namespace+".InsertData",member);
	}
	
	public Member getMember(String mid) {
		Member member = sqlsessiontemplate.selectOne(namespace+".GetMember",mid);
		return member;
	}
	
	public int getTotalCount(Map<String,String> mlist){
		int cnt = sqlsessiontemplate.selectOne(namespace+".GetTotalCount",mlist);
		return cnt;
	}
	
	public List<Member> getMemberList(Paging paging, Map<String,String> mlist){
		List<Member> lists = new ArrayList<Member>();
		RowBounds rowBounds = new RowBounds(paging.getOffset(),paging.getLimit());
		lists = sqlsessiontemplate.selectList(namespace+".GetMemberList",mlist,rowBounds);
		return lists;
	}
	
	public int deleteData(int mnum) {
		int cnt= sqlsessiontemplate.delete(namespace+".DeleteMember",mnum);
		return cnt;
	}

	public Member getOneMember(int mnum) {
		Member member =sqlsessiontemplate.selectOne(namespace+".GetOneMember", mnum);
		return member;
	}

	public int updateMem(Member member) {
		int cnt = sqlsessiontemplate.update(namespace+".UpdateMem", member);
		return cnt;
	}
	
	public int getDuplicateId(String checkId) { 
		int cnt = sqlsessiontemplate.selectOne(namespace+".CheckID",checkId);
		return cnt;
	}
	
	public Member findIdByEmail(String name, String email1,String email2) {
		Member bean = new Member();
		bean.setMname(name);
		bean.setEmail1(email1);
		bean.setEmail2(email2);
		Member member = sqlsessiontemplate.selectOne(namespace+".FindIdByEmail", bean);
		return member;
		  
	}
	
	public Member findIdByHp(String name, String hp1,String hp2,String hp3) {
		Member bean = new Member();
		bean.setMname(name);
		bean.setHp1(hp1); 
		bean.setHp2(hp2);
		bean.setHp3(hp3);
		Member member = sqlsessiontemplate.selectOne(namespace+".FindIdByHp", bean);
		return member;
		
	}
	
	public Member findPwByEmail(String name, String id,String email1,String email2) {
		Member bean = new Member();
		bean.setMname(name);
		bean.setMid(id);
		bean.setEmail1(email1);
		bean.setEmail2(email2);
		Member member = sqlsessiontemplate.selectOne(namespace+".FindPwByEmail", bean);
		return member;
		  
	}
	
	public Member findPwByEmail(String name,String id, String hp1,String hp2,String hp3) {
		Member bean = new Member();
		bean.setMname(name);
		bean.setMid(id);
		bean.setHp1(hp1); 
		bean.setHp2(hp2);
		bean.setHp3(hp3);
		Member member = sqlsessiontemplate.selectOne(namespace+".FindPwByHp", bean);
		return member;
		
	}
	
	
	
}
