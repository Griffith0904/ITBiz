package kr.co.hojeon.interceptors;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Lazy;
import org.springframework.web.servlet.HandlerInterceptor;

import kr.co.hojeon.beans.UserBean;

public class CheckLoginInterceptor implements HandlerInterceptor {
	@Resource(name="loginUserBean")
	@Lazy
	private UserBean loginUserBean;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		//System.out.println("★★★★★★★★ preHandle in HandlerInterceptor★★★★★★★★★★★★★★★");
		//return true;
		/* 잘되나 초기 개발 테스트를 위해 막음 */
		if (loginUserBean.isUserLoginYN() == false) {
			System.out.println("★★★★★★★★ preHandle not login in HandlerInterceptor★★★★★★★★★★★★★★★");
			String contextPath = request.getContextPath();
			response.sendRedirect(contextPath + "/user/not_login");
			return false;
		} else {
			return true;
		}
		
	}
}
