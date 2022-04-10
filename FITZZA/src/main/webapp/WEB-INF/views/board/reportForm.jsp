<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- modal로 띄우기 -->
<div class="modal-dialog">
			<div class="modal-content">
				<c:if test="${logStatus=='Y'}">
					<div class="modal-header">
						<h2>게시물 신고</h2>
						<button class="close" data-dismiss="modal">&times;</button>
					</div>
					<form method="post" id="reportForm">
						<ul>
							<li>신고 이유 &emsp; 
								<select name="category_num">
									<option value="1">광고</option>
									<option value="2">사기거래</option>
									<option value="3">욕설/비방</option>
									<option value="4">사칭</option>
								</select>
							</li>
							<hr/>
							<li>신고 내용<br/>
								<textarea name="report_content" rows="5" cols="30"></textarea>
							</li>
							<hr/>
							<li><input type='submit' value='신고 접수'/></li>
						</ul>
					</form>
				</c:if>
				<c:if test="${logStatus=='N'}">
					<h3>로그인 후에 가능합니다.</h3>
				</c:if>
			</div>
		</div>