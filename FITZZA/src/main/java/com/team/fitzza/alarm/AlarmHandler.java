package com.team.fitzza.alarm;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.team.fitzza.dao.AlarmDAO;
import com.team.fitzza.vo.BoardVO;

@Component
public class AlarmHandler extends TextWebSocketHandler {
	@Inject
	AlarmDAO dao;
	
	//각각의 세션을 <세션아이디, 세션>의 맵 형태로 저장
	HashMap<String, WebSocketSession> sessionMap = new HashMap<>();
	//<유저의 아이디, 유저의 웹소켓 아이디>를 저장
	HashMap<String, String> sessionIdMap = new HashMap<>();
	//json용 객체
	Gson gson = new Gson();
	
	//소켓 시작시 실행
	@Override
	public void afterConnectionEstablished(WebSocketSession wsSession) throws Exception{
		super.afterConnectionEstablished(wsSession);
		String wsId = wsSession.getId();
		sessionMap.put(wsId, wsSession);
		String logId = (String)wsSession.getAttributes().get("logId");
		sessionIdMap.put(logId, wsId);
		System.out.println("소켓 시작됨");
		System.out.println("소켓에 연결된 유저의 아이디 = "+logId);
		
	}
	
	//메시지를 받으면 실행
	@Override
	public void handleTextMessage(WebSocketSession wsSession, TextMessage message) {
		String msg = message.getPayload();
		Map<String, String> map = gson.fromJson(msg, Map.class);
		String logId = (String)wsSession.getAttributes().get("logId");
		String logNickName = (String)wsSession.getAttributes().get("logNickName");
		BoardVO vo = dao.replyReceiverInfo(Integer.parseInt(map.get("board_num")));
		String title = vo.getTitle();
		String receiver = vo.getUser_id();
		String alarmType = map.get("alarmType");
		String alarmMsg = "";
		
		//현재 로그인 한 사람과 알람을 받을 사람이 같다면 알람을 보내지 않음
		if(logId.equals(receiver)) {
			return;
		}
		if(alarmType.equals("reply")) {
			alarmMsg = logNickName+" 님이"+"<br/>"+" \""+title+"\" 글에 댓글을 남겼습니다.";
		}
		
		//현재 소켓이 열린(접속해 있는) 사람의 아이디를 순회
		for(String userId:sessionIdMap.keySet()) {
			//이번 아이디가 알람을 받을 사람의 아이디라면
			if(userId.equals(receiver)) {
				//그 사람의 소켓을 가져온다
				WebSocketSession wss = sessionMap.get(sessionIdMap.get(userId));
				try {
					wss.sendMessage(new TextMessage(alarmMsg));
				} catch (IOException e) {
					e.printStackTrace();
				}
				return;
			}
		}
	}
	
	//소켓 종료시 실행
	@Override
	public void afterConnectionClosed(WebSocketSession wsSession, CloseStatus status) throws Exception{
		String logId = (String)wsSession.getAttributes().get("logId");
		sessionMap.remove(wsSession.getId());
		sessionIdMap.remove(logId);
		super.afterConnectionClosed(wsSession, status);
		System.out.println("소켓 종료됨");
		System.out.println("소켓 연결 종료된 유저의 아이디 = "+logId);
	}
}
