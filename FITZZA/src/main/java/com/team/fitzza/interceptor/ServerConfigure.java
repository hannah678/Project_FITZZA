package com.team.fitzza.interceptor;

import java.util.Arrays;
import java.util.List;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class ServerConfigure implements WebMvcConfigurer {
	//로그인 상태에서만 이동 가능한 URL
	private static final List<String> URL_PATTERNS = Arrays.asList(
			"/board/reportOk", "/board/boardDelete", "/member/pwdCheck",
			"/member/pwdCheckOk", "/member/memberEdit", "/member/memberEditOk",
			"/member/myPage", "/member/myPage01", "/member/myPage02",
			"/member/myPage03", "/member/myPage04", "/member/myPage05",
			"/member/myPage06", "/member/myPage07", "member/byeCheck",
			"member/byeOk", "/member/changeProfileImg", "/board/old/oldWrite",
			"/board/old/oldWriteOk", "/board/old/oldEdit", "/board/old/oldEditOk",
			"/reply/replyWrite", "/reply/replyEditOk", "/reply/replyDelete",
			"/board/review/reviewWrite", "/board/review/reviewWriteOk",
			"/board/review/reviewEdit",	"/board/review/reviewEditOk",
			"/board/todayCodi/todayCodiWrite", "/board/todayCodi/todayCodiWriteOk");
	//권한이 admin인 사용자만 이동 가능한 URL
	private static final List<String> URL_PATTERNS_ADMIN = Arrays.asList(
			"/admin/adminHome", "/admin/adminUser", "/admin/adminReport",
			"/admin/adminOld", "/admin/adminBoard");
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new LoginInterceptor()).addPathPatterns(URL_PATTERNS);
		registry.addInterceptor(new AdminInterceptor()).addPathPatterns(URL_PATTERNS_ADMIN);
	}
}
