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
            </div>
<%--첨부파일 보여주기 --%>
<div class="bigPictureWrapper">
		<div class="bigPicture"></div>
</div>
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading"><i class="fa fas fa-file"></i> Files</div>
			<div class="panel-body">
				<div class="form-group uploadDiv">
					<input type="file" name="uploadFile" id=""/>
				</div>
				<div class="uploadResult">
					<ul></ul>
				</div>
			</div>
		</div>
	</div>
</div>   
<%-- remove와 list를 위한 폼--%>
<%-- 페이지 나누기를 위해 필요한 값 세팅 --%>     
<form action="" id="myform" method="post">
	<input type="hidden" name="type" value="${cri.type}"/>
	<input type="hidden" name="keyword" value="${cri.keyword}"/>
	<input type="hidden" name="bno" value="${board.bno}"/>
	<input type="hidden" name="pageNum" value="${cri.pageNum}"/>
	<input type="hidden" name="amount" value="${cri.amount}"/>
	<%--시큐리티 때문에 추가 --%>
<%-- 	<input type="hidden" name="writer" value="${board.writer}"/>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>  --%>
</form>
<%-- 스크립트 --%>
<script>
	var bnoVal= ${board.bno};
	//토큰값 생성
/* 	var csrfHeaderName="${_csrf.headerName}";
	var csrfTokenValue="${_csrf.token}"; */
</script>
<script src="/resources/js/Board/update.js"></script>
<%@include file="../footer.jsp" %>    