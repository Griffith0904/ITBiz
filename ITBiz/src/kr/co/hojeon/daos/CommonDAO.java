package kr.co.hojeon.daos;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommonDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<HashMap<String, Object>> getBaseData(String bch_code, String all_yn) {
		HashMap<String, Object> input_param = new HashMap<String, Object>();
		
		input_param.put("all_yn", all_yn);
		input_param.put("bch_code", bch_code);
		
		return sqlSessionTemplate.selectList("comm.getBaseData", input_param); 
	}
	
	public List<HashMap<String, Object>> getITUserInfo(String all_yn) {
		return sqlSessionTemplate.selectList("comm.getITUserInfo", all_yn);
	}
	
	public List<HashMap<String, Object>> getITUserInfoFromCheck(String[] reg_user) {
		System.out.println("★★★★★★★★★★★★ getITUserInfoFromCheck dao ★★★★★★★★★★★★");
		List<String> reg_users = new ArrayList<String>();
		
		if (reg_user != null) {
			if (reg_user.length > 0) {
				for (int i = 0; i < reg_user.length; i++) {
					String set_user = reg_user[i].toString();
					reg_users.add(set_user);
				}
			}
		} else {
			reg_users.add("XXXXX");
		}
		
		HashMap input_param = new HashMap();
		input_param.put("reg_users", reg_users);
		
		return sqlSessionTemplate.selectList("comm.getITUserInfoFromCheck", input_param);
	}
	
	// 부서명, 사용자 이름으로 전체 유저 검색
	public List<HashMap<String, Object>> getUserListByDeptEmp(String deptname, String empname) {
		HashMap<String, Object> input_param = new HashMap<String, Object>();
		
		input_param.put("deptname", deptname);
		input_param.put("empname", empname);
		
		return sqlSessionTemplate.selectList("comm.getUserListByDeptEmp", input_param);
	}
	
}
