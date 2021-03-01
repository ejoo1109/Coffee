<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../header.jsp" %>
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">게시글 수정</h1>
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
                			<form action="" method="post" role="form">
                				<div class="form-group">
                					<label>글번호</label>
                					<input class="form-control" name="bno" readonly="readonly" value="${board.bno}">                				
                				</div> 
                				<div class="form-group">
                					<label>제목</label>
                					<input class="form-control" name="title" value="${board.title}">                				
                				</div>  
                				<div class="form-group">
                					<label>내용</label>
                					<textarea class="form-control" rows="3" name="content">${board.content}</textarea>               				
                				</div> 
                				<div class="form-group">
                					<label>작성자</label>
                					<input class="form-control" name="writer" readonly="readonly" value="${board.writer}">                				
                				</div>  
                				<button type="submit" data-oper='modify' class="btn btn-default">수정</button>              			
                				<button type="submit" data-oper='remove' class="btn btn-danger"><a href="/board/delete?bno=${board.bno}" class="move">삭제</a></button>              			
                				<button type="submit" data-oper='list' class="btn btn-info">리스트</button>              			
                			</form>
                		</div>
                	</div>
                </div>
            </div>
			<%-- remove와 list를 위한 폼--%>

			<%-- 스크립트 --%>
<%@include file="../footer.jsp" %>    