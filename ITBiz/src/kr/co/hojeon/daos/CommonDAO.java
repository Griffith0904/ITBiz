package kr.co.hojeon.daos;

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
		String reg_users = "";
		for (int i = 0; i < reg_user.length; i++) {
			if (i == 0) {
				reg_users = reg_user[i];
			} else {
				reg_users = reg_users + "," + reg_user[i];
			}	 
		}
		String asdf = "fefefe";
		System.out.println(reg_users);
		System.out.println(asdf);
		asdf = reg_users;
		System.out.println(reg_user.getClass().getName());
		System.out.println(reg_users.getClass().getName());
		String reg = "'HJ16031401','HJ16082201','HJ18021901'";
		return sqlSessionTemplate.selectList("comm.getITUserInfoFromCheck", reg);
	}
}