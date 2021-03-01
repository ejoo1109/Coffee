<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../header.jsp" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">1:1 문의 게시판</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                    	<div class="col-lg-12" style="text-align: right;">
                        
                            <button id='regBtn' type='button' class='btn btn-xs pull-right' onclick="location.href='register'">글 작성</button>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>번 호</th>
                                        <th>제 목</th>
                                        <th>작성자</th>
                                        <th>작성일</th>
                                        <th>수정일</th>
                                    </tr>									
                                </thead>
								<!-- 게시판 리스트 반복문 -->
			<tbody>
				<c:if test='${list.isEmpty()}'>
					<tr>
						<td colspan="6"><h3 style="text-align: center;">작성된 게시글이 없습니다.</h3></td>
					</tr>
				</c:if>
		
					<c:forEach var="vo" items="${list}">
						<tr>
							<td>${vo.bno}</td>
							<td><a href="${vo.bno}" class="move">${vo.title}</a></td>
							<td>${vo.writer}</td>
							<td><fmt:formatDate	value="${vo.regdate}" pattern="yyyy-MM-dd" /></td>
							<td><fmt:formatDate	value="${vo.updatedate}" pattern="yyyy-MM-dd" /></td>
						</tr>
					</c:forEach>
			</tbody>
                            </table>
							<div class="row"> <!-- start search -->
                            	<div class="col-md-12">
                            	  <div class="col-md-8"><!--search Form-->
                            		
                            	   </div>
                            	   <div class="col-md-2 col-md-offset-2">
                            	   	<!--페이지 목록 갯수 지정하는 폼-->
                            	   	<select class="form-control" id="amount">
                            	   		<option value="10" <c:out value="${pageVO.cri.amount==10?'selected':''}"/>>10</option>
                            	   		<option value="20" <c:out value="${pageVO.cri.amount==20?'selected':''}"/>>20</option>
                            	   		<option value="30" <c:out value="${pageVO.cri.amount==30?'selected':''}"/>>30</option>
                            	   		<option value="40" <c:out value="${pageVO.cri.amount==40?'selected':''}"/>>40</option>
                            	   	</select>
								  </div>
                             	 </div>                             	 
                      		 </div><!-- end search -->
                            <!-- start Pagination -->
                            <div class="col-md-4 text-center" >
                            	<ul class="pagination">
                            		<c:if test="${pageVO.prev}">
                            			<li class="paginate_button previous"><a href="${pageVO.startPage-1}">이전</a>
                            		</c:if>
                            		<c:forEach var="idx" begin="${pageVO.startPage}" end="${pageVO.endPage}">
                            			<li class="paginate_button ${pageVO.cri.pageNum==idx?'active':''}"><a href="${idx}">${idx}</a>
                            		</c:forEach>
                            		<c:if test="${pageVO.next}">
                            			<li class="paginate_button next"><a href="${pageVO.endPage+1}">다음</a>
                            		</c:if>
                            	</ul>
                            </div>
                            <!-- end Pagination -->   
                            </div>
                            <!-- end panel-body -->
                        </div>
                        <!-- end panel -->
                    </div>                   
                </div>               
            <!-- /.row -->
<!-- 페이지 링크 값을 넘기기 위한 폼 :
주소줄에 가지고 다녀야하는 값이 여러개여서 폼을 하나짜서 움직임. 
value값 잘 넘어왔는지 확인하려면 F12 source에서 확인 -->
<form action="" id="actionForm">
	<input type="hidden" name="type" value="${pageVO.cri.type}"/>
	<input type="hidden" name="keyword" value="${pageVO.cri.keyword}"/>
	<input type="hidden" name="pageNum" value="${pageVO.cri.pageNum}" />
	<input type="hidden" name="amount" value="${pageVO.cri.amount}" />
	
</form>
<!-- 모달 추가 -->

<!-- 스크립트 -->
<script>
//actionForm 가져오기 - 페이지 이동시 사용할 폼
var actionForm = $("#actionForm");

//페이지 번호 클릭시 동작
//하단에 previous , 숫자, next의 버튼의 a 태그는 모두 해당되기 때문에 클래스로 지정
$(".paginate_button a").click(function(e){
	//a태그의 이동기능이 걸려있기때문에 기능 중지
	e.preventDefault();
	//페이지 이동시 pageNum의 값을 사용자가 선택한 값으로 변경
	actionForm.find("input[name='pageNum']").val($(this).attr("href"));
	actionForm.submit();
})

//amount값(페이지에 보여지는 게시물 갯수) 변경시 동작
$(".form-control").change(function(){
	//amount값을 사용자가 선택한 값으로 변경
	actionForm.find("input[name='amount']").val($(this).val());
	actionForm.submit();
	
})

//list게시판의 제목 클릭시 동작 (현재글번호, pageNum, acmount, 검색정보)
$(".move").click(function(e){
	e.preventDefault();
	actionForm.append("<input type='hidden' name='bno' value='"+$(this).attr("href")+"'>");
	actionForm.attr("action","read"); 
	// /board/read
	actionForm.submit();
})
</script>
<%@include file="../footer.jsp" %>       