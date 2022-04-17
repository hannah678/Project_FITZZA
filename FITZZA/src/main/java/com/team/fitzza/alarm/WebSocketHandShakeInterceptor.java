package com.team.fitzza.alarm;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

public class WebSocketHandShakeInterceptor extends HttpSessionHandshakeInterceptor {

	@Override
	public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
			Map<String, Object> attributes) throws Exception {
		// HttpSession과 WebSocketSession은 attribute를 공유하지 않는다.
		// WebSocketSession에서 HttpSession의 attribute를 쓰기 위해서는 핸드쉐이크 인터셉터에서
		// [ServerHttpRequest]->['Servlet'ServerHttpRequest]로 강제 형변환 뒤
		// getServletRequest()로 HttpServletRequest객체를 얻은 후
		// getSession()으로 HttpSession객체를 얻어서 그 안의 attribute를 
		// 매개변수로 받은 Map에 넣어야 한다
		ServletServerHttpRequest sshr = (ServletServerHttpRequest)request;
		HttpServletRequest servletRequest = sshr.getServletRequest();
		HttpSession session = servletRequest.getSession();
		attributes.put("logId", session.getAttribute("logId"));
		attributes.put("logNickName", session.getAttribute("logNickName"));
		return super.beforeHandshake(request, response, wsHandler, attributes);
	}
	
}
