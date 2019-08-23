<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee lists</title>
<%
pageContext.setAttribute("APP_PATH",request.getContextPath());
%>
	<script type="text/javascript" src="${APP_PATH}/static/jquery/jquery.min.js"></script>
	<link rel="stylesheet" href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css">
	<script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
	<!-- 搭建显示页面 -->
	<div class="contaioner">
		<!-- 显示标题 -->
		<div class="row">
			<div class="col-sm-12">
				<h1>SSM-CRUD</h1>
			</div>
		</div>
		<!-- 显示右侧按钮 -->
		<div class="row">
			<div class="col-sm-4 col-sm-offset-8">
				<button class="btn btn-primary">新增</button>
				<button class="btn btn-danger">删除</button>
			</div>
		</div>
		<!-- 显示表格数据-->
		<div class="row">
			<div class="col-sm-12">
				<table class="table table-hover"> 
					<tr>
						<th>#</th>
						<th>empName</th>
						<th>gender</th>
						<th>email</th>
						<th>department</th>
						<th>操作</th>
					</tr>
					<c:foreach item="${pageInfo.list}" var="emp"></c:foreach>
					<tr>
						<th></th>
						<th></th>
						<th></th>
						<th></th>
						<th></th>
						<th></th>
						<th>
							<button class="btn btn-primary btn-sm">
								<span class="glyphicon glyphicon-pencil" aria-hidden="true">
								编辑
								</span>
							</button>
							
							<button class="btn btn-danger btn-sm">
								<span class="glyphicon glyphicon-trash" aria-hidden="true">
								删除
								</span>
							</button>
						</th>
						<th></th>
						<th></th>
					</tr>
				</table>
			</div>
		</div>
		<!-- 显示下侧分页信息和按钮 -->
		<div class="row">
			<!-- 分页文字信息 -->
			<div class="col-sm-6">
				当前记录数：xxx
			</div>
			<!--分页条信息  -->
			<div class="col-sm-6">
				<nav aria-label="Page navigation">
				  <ul class="pagination">
				  	<li><a href="#">首页</a></li>
				    <li class="page-item">
				      <a class="page-link" href="#" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
				    <li class="page-item"><a class="page-link" href="#">1</a></li>
				    <li class="page-item"><a class="page-link" href="#">2</a></li>
				    <li class="page-item"><a class="page-link" href="#">3</a></li>
				    <li class="page-item">
				      <a class="page-link" href="#" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
				    <li><a href="#">末页</a></li>
				  </ul>
				</nav>
			</div>
		</div>
	</div>
</body>
</html>