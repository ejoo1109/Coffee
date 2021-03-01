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

                        <!-- /.panel-heading -->
                        <div class="panel-body">
                			<form action="" role="form" method="post">
                				<div class="form-group">
                					<input class="form-control" name="fbno" value="${fboard.fbno}" readonly="readonly">                				
                				</div> 
                				<div class="form-group">
                					<label>제목</label>
                					<input class="form-control" name="ftitle" value="${fboard.ftitle}" readonly="readonly">                				
                				</div>  
                				<div class="form-group">
                					<label>내용</label>
                					<textarea class="form-control" rows="3" name="fcontent" readonly="readonly">${fboard.fcontent}</textarea>               				
                				</div> 
                				<div class="form-group">
                					<label>작성자</label>
                					<input class="form-control" name="fwriter" value="${fboard.fwriter}" readonly="readonly">                				
                				</div>  
                				
                				<button type="button" class="btn btn-default" ><a href="/fBoard/fmodify?fbno=${fboard.fbno}" class="move">수정</a></button>
                				<button type="reset" class="btn btn-info" onclick="location.href='/fBoard/fBoardlist'">리스트</button>          			
                			</form>
                		</div>
                	</div>
                </div>
            </div>

<%-- 				<input type="hidden" name="pageNum" value="${cri.pageNum}" />
				<input type="hidden" name="amount" value="${cri.amount}" />
				<input type="hidden" name="type" value="${cri.type}" />
				<input type="hidden" name="keyword" value="${cri.keyword}" /> --%>
			</form>
<%--첨부파일 보여주기 --%>
<%-- <div class="bigPictureWrapper">
		<div class="bigPicture"></div>
</div>
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading"><i class="fa fas fa-file"></i> Files</div>
			<div class="panel-body">
				<div class="uploadResult">
					<ul></ul>
				</div>
			</div>
		</div>
	</div>
</div>   

페이지 나누기를 위해 필요한 값 세팅     
<form action="modify" id="myform">
	<input type="hidden" name="type" value="${cri.type}"/>
	<input type="hidden" name="keyword" value="${cri.keyword}"/>
	<input type="hidden" name="bno" value="${board.bno}"/>
	<input type="hidden" name="pageNum" value="${cri.pageNum}"/>
	<input type="hidden" name="amount" value="${cri.amount}"/>	
</form>
댓글리스트 화면
<div class="row">
	<div class="col-lg-12">
		<div class = "panel panel-default">
			<div class="panel-heading">
				<i class="fa fa-comments fa-fw"></i>
				Reply
			<sec:authorize access="isAuthenticated()">
				<button id="addReplyBtn" class="btn btn-primary btn-xs pull-right">New Reply</button>
            </sec:authorize> 
			</div>
		</div>
		<div class="panel-body">
			<ul class="chat">
				<li class="left clearfix" data-rno='1'>
				<div>
					<div class="header">
						<strong class="primary-font">user00</strong>
						<small class="pull-right text muted">2021-01-18 10:10</small>
						<p>Good Job!!</p>
					</div>
				</div>
				</li>
			</ul>
		</div>
		<div class="panel-footer"></div><!-- 댓글 페이지 영역 1.2.3.4 나오게 하기-->
	</div>
</div>
</div>
댓글 작성화면
<!-- 댓글 등록  버튼 누르면  Modal -->
<!-- 댓글 등록 모달 -->
<div class="modal" tabindex="-1" role="dialog" id="replyModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        <h5 class="modal-title">Reply</h5>
      </div>
      <div class="modal-body">
        <div class="form-group">
        	<label for="">댓글내용</label>
        	<input type="text" class="form-control" name="reply" value="댓글내용"/>
        </div>
        <div class="form-group">
        	<label for="">작성자</label>
        	<input type="text" class="form-control" name="replyer" value="작성자"/>
        </div>
        <div class="form-group">
        	<label for="">작성일</label>
        	<input type="text" class="form-control" name="replyDate" value="작성일"/>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-warning" id="modalRegisterBtn">등록</button>
        <button type="button" class="btn btn-success" id="modalModBtn">수정</button>
        <button type="button" class="btn btn-danger" id="modalRemoveBtn">삭제</button>
        <button type="button" class="btn btn-primary"  id="modalCloseBtn" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>

<script>
	//현재 글 번호 가져오기
	let bnoVal = ${board.bno};

	//댓글 리스트를 보여줄 영역 가져오기
	let replyUl = $(".chat");

	//모달 영역 가져오기
	let modal = $(".modal");
	
	//모달 영역 안에 있는 요소 가져오기
	let modalInputReply = modal.find("input[name='reply']");
	let modalInputReplyer = modal.find("input[name='replyer']");
	let modalInputReplyDate = modal.find("input[name='replyDate']");
	
	let modalModBtn = $("#modalModBtn");
	let modalRemoveBtn = $("#modalRemoveBtn");
	let modalRegisterBtn = $("#modalRegisterBtn")
	
	//댓글 페이지 영역 가져오기
	var replyPageFooter = $(".panel-footer");
	
	//토큰값 생성
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	
	//댓글 작성자 보여주기 - 회원제 게시판인 경우
	var replyer = null;
	
	<sec:authorize access="isAuthenticated()"> 
	replyer = '<sec:authentication property="principal.username"/>'
	</sec:authorize>
	
</script>    --%>
<%@include file="../footer.jsp" %>       