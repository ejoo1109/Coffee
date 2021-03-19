<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
   <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-3 col-md-9">

				<div class="card" style="width: 40rem; margin: 40px auto;">
					<div class="card-header">
						<h4>게시글 작성</h4>
					</div>
					<div class="card-body">

						<form action="" method="post" role="form">
							<div class="form-group">
								<label>제목</label> <input class="form-control" name="ftitle">
							</div>
							<div class="form-group">
								<label>내용</label>
								<textarea class="form-control" rows="5" name="fcontent"></textarea>
							</div>
							<div class="form-group">
								<label>작성자</label> <input class="form-control" name="fwriter">
							</div>
							<%--  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>  --%>
							<button type="submit" class="btn btn-primary">등록</button>
							<button type="reset" class="btn btn-default"
								onclick="location.href='/fBoard/fBoardlist'">취소</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>