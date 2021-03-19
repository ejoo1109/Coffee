<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../header.jsp" %>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <body>
	<div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">글 작성</h1>
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
                					<label>제목</label>
                					<input class="form-control" name="title">                				
                				</div>  
                				<div class="form-group">
                					<label>내용</label>
                					<textarea class="form-control" rows="3" name="content"></textarea>               				
                				</div> 
                				<div class="form-group">
                					<label>작성자</label>
                					<input class="form-control" name="writer">                				
                				</div>  
                				<button type="submit" class="btn btn-default">완료</button>              			
                				<button type="reset" class="btn btn-default" onclick="location.href='list'">취소</button>              			
                			</form>
                		</div>
                	</div>
                </div>
            </div>
<%--파일등록 --%>
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">파일첨부</div>
			<div class="panel-body">
				<div class="form-group uploadDiv">
					<input type="file" name="uploadFile" id="" multiple/>
				</div>
				<div class="uploadResult">
					<ul></ul>
				</div>
			</div>
		</div>
	</div>
</div>   
<div class="bigPictureWrapper">
		<div class="bigPicture"></div>
</div>
</div>
<script src="../resources/js/Board/register.js"></script>           
<%@include file="../footer.jsp" %>       