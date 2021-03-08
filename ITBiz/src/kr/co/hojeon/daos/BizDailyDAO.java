package kr.co.hojeon.daos;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Repository;

import kr.co.hojeon.beans.BDListFromMainBean;
import kr.co.hojeon.beans.BizDailyMasterBean;
import kr.co.hojeon.beans.UserBean;

@Repository
public class BizDailyDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<BDListFromMainBean> getBizDailyStatusForMain(String userid) {
		//List<BDListFromMainBean> listbm = sqlSessionTemplate.selectList("main.getBizDailyStatusForMain", loginUserBean.getUserid());
		return sqlSessionTemplate.selectList("main.getBizDailyStatusForMain", userid);
	}
	
	public List<BizDailyMasterBean> searchAllDataFromStatusList(String userid, String work_status) {
		Map map = new HashMap();
		map.put("userid", userid);
		map.put("work_status", work_status);
		return sqlSessionTemplate.selectList("main.searchAllDataFromStatus", map);
	}
}
