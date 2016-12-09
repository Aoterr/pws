<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/commons/common-js.jsp"></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台管理系统</title>
<style type="text/css">
.content {
	padding: 10px 10px 10px 10px;
}
td{
	padding: 100px 100px 100px 100px;
}

</style>
	<style>
	#dd{
	background-color: #EEE;
	}
	
	</style>
</head>
<body class="easyui-layout">
	<div data-options="region:'north'" style="height: 50px">
		<div style="background-color: gray; height: 100%;">	
		这里是头部
		</div>
	</div>
	<div data-options="region:'west',title:'菜单',split:true"
		style="width: 180px;background-color: gray;">
		<ul id="menu" class="easyui-tree"
			style="margin-top: 10px; margin-left: 5px;">
			<li><span>客户管理</span>
				<ul>
					<li data-options="attributes:{'url':'/pws/page/news_add'}">新增客户</li>
					<li data-options="attributes:{'url':'/pws/page/item-list'}">查询客户</li>
					<li data-options="attributes:{'url':'/pws/page/news_list'}">客户列表</li>
				</ul></li>
			<li><span>网站内容管理</span>
				<ul>
					<li data-options="attributes:{'url':'/pws/page/content-category'}">内容分类管理</li>
					<li data-options="attributes:{'url':'/pws/page/content'}">内容管理</li>
				</ul></li>
		</ul>
	</div>

	<div data-options="region:'center',title:''"  ">
		<div id="tabs" class="easyui-tabs" style="width:60%;">
			
			<div title="我的门户">

				<table border="1" style="padding: 100px" >
					<tr>
						<td><div
								style="background-color:gray; width: 100px; height: 100px; "><a href="javascript:void(0)" onclick="addPanel()">点击</a></div></td>
						
						<td><div
								style="background-color:gray; width: 100px; height: 100px; ">点击</div></td>
					</tr>
					<tr>
						<td>
							<div
								style="background-color:gray; width: 100px; height: 100px; ">点击</div>
						</td>
						<td><div
								style="background-color:gray; width: 100px; height: 100px; ">点击</div></td>
					</tr>
				</table>






			</div>
			<div title="首页" style="padding: 20px;">
			<div><img alt="" src="/pws/static/img/bg.jpg"></div>
			
			</div>
		</div>
	</div>
	<div data-options="region:'east'" style="width: 100px;">
	<div>财富财富财富财富财富财富财富财富财富财富财富财富财富财富财富财富财富财富财富财富财富财富财富财富财富财富财富财富财富财富财富财富财富财富财富财富财富财富财富财富财富财富财富财富财富财富财富财富财富财富财富财富财富财富财富财富</div>
	
	</div>
	<script type="text/javascript">
		$(function() {
			$('#menu').tree({
				onClick : function(node) {
					if ($('#menu').tree("isLeaf", node.target)) {
						var tabs = $("#tabs");
						var tab = tabs.tabs("getTab", node.text);
						if (tab) {
							tabs.tabs("select", node.text);
						} else {
							tabs.tabs('add', {
								title : node.text,
								href : node.attributes.url,
								closable : true,
								bodyCls : "content"
							});
						}
					}
				}
			});
		});
		function addPanel(){
			$("#tabs").tabs('add',{
				title : 'dd',
				content: '<div style="padding:10px">Content</div>',
				closable: true
			});
		}
	</script>
</body>
</html>