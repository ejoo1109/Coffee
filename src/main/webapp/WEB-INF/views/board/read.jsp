<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../header.jsp" %>
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">게시글 조회</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>            
            <div class="row">
                <div class="col-lg-12">
                	<div class="panel panel-default">
                        <div class="panel-heading">
                        
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                			<form action="" role="form">
                				<div class="form-group">
                					<label>글번호</label>
                					<input class="form-control" name="bno" readonly="readonly" value="${board.bno}">                				
                				</div> 
                				<div class="form-group">
                					<label>제목</label>
                					<input class="form-control" name="title" readonly="readonly" value="${board.title}">                				
                				</div>  
                				<div class="form-group">
                					<label>내용</label>
                					<textarea class="form-control" rows="3" name="content" readonly="readonly">${board.content}</textarea>               				
                				</div> 
                				<div class="form-group">
                					<label>작성자</label>
                					<input class="form-control" name="writer" readonly="readonly" value="${board.writer}">                				
                				</div>  
                				<button type="button" class="btn btn-default" ><a href="/board/modify?bno=${board.bno}" class="move">수정</a></button>     			
                				<button type="reset" class="btn btn-info" onclick="location.href='/board/list'">목록</button>          			
                			</form>
                		</div>
                	</div>
                </div>
            </div>           
<%@include file="../footer.jsp" %>       