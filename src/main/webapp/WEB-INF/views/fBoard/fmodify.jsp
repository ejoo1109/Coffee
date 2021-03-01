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
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                			<form action="" method="post" role="form">
                				<div class="form-group">
                				    <label>번호</label>
                					<input class="form-control" name="fbno" readonly="readonly" value="${fboard.fbno}">                				
                				</div> 
                				<div class="form-group">
                					<label>제목</label>
                					<input class="form-control" name="ftitle" value="${fboard.ftitle}">                				
                				</div>  
                				<div class="form-group">
                					<label>내용</label>
                					<textarea class="form-control" rows="3" name="fcontent">${fboard.fcontent}</textarea>               				
                				</div> 
                				<div class="form-group">
                					<label>작성자</label>
                					<input class="form-control" name="fwriter" readonly="readonly" value="${fboard.fwriter}">                				
                				</div> 

		                				<button type="submit" data-oper='modify' class="btn btn-default">수정</button>              			
		                				<button type="submit" data-oper='remove' class="btn btn-danger"><a href="/fBoard/fdelete?fbno=${fboard.fbno}" class="move">삭제</a></button>              			
                						<button type="submit" data-oper='list' class="btn btn-info">리스트</button>              			
                			</form>
                		</div>
                	</div>
                </div>
            </div>
            	<input type="hidden" name="fbno" value="${fboard.fbno}"/>
            	
<%--첨부파일 보여주기 --%>
<%-- <div class="bigPictureWrapper">
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
remove와 list를 위한 폼
페이지 나누기를 위해 필요한 값 세팅     
<form action="" id="myform" method="post">
	<input type="hidden" name="type" value="${cri.type}"/>
	<input type="hidden" name="keyword" value="${cri.keyword}"/>
	<input type="hidden" name="bno" value="${board.bno}"/>
	<input type="hidden" name="pageNum" value="${cri.pageNum}"/>
	<input type="hidden" name="amount" value="${cri.amount}"/>
	시큐리티 때문에 추가
	<input type="hidden" name="writer" value="${board.writer}"/>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
</form>
스크립트
<script>
	var bnoVal= ${board.bno};
	//토큰값 생성
	var csrfHeaderName="${_csrf.headerName}";
	var csrfTokenValue="${_csrf.token}";
</script> --%>
<script>
$(function(){
	var form = $("#myform");
	
	$("button").click(function(e){
		//버튼을 누르면 submit기능 막기
		e.preventDefault(); 
		
		var oper= $(this).data("oper");
		console.log(oper);
		
		if(oper == 'remove'){
			 form.attr("action","fdelete");
		
		}else if(oper == 'modify'){
			//원래의 수정 폼 보내기
			form = $("form[role='form']");			
			
		}else if(oper == 'list'){
			 form.attr("action","fBoardlist")
			 //메소드 속성을 get으로 바꿔서 submit요청
			 form.attr("method","get"); 
			 //폼 안의 bno 제거하기
			 form.find("input[name='fbno']").remove();
		}
		form.submit();
	})
</script>
<%@include file="../footer.jsp" %>       