<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style scoped>
	#list .list-image{
		width: 32px;
		height: 32px;
		border: 0;
		margin-right: 5px;
		float: left;
	}
	#list .list-header{
		font-size: 16px;
		font-weight: bold;
	}
	#list .list-content{
		text-overflow: ellipsis;
		overflow: hidden;
	}
</style>
<link rel="stylesheet" type="text/css" href="../../themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="../../themes/icon.css">
<link rel="stylesheet" type="text/css" href="../demo.css">
<div style="padding: 10px 10px 10px 10px" id="dd">
	<div style="margin:20px 0;"></div>
	<div class="easyui-panel" style="width:100%;max-width:400px;padding:5px 60px;">
		<input class="easyui-searchbox" data-options="prompt:'Please Input Value',menu:'#mm',searcher:doSearch" style="width:100%">
	</div>
	<div id="mm">
		<div data-options="name:'all',iconCls:'icon-ok'">All News</div>
		<div data-options="name:'sports'">Sports News</div>
	</div>
	<script>
        function doSearch(value,name){
            alert('You input: ' + value+'('+name+')');
        }
	</script>
	<ul id="list" class="m-list">
		<li>
			<img class="list-image" src="/pws/static/easyui/themes/images/modem.png"/>
			<div class="list-header">modem</div>
			<div class="list-content">modulates an analog carrier signal to encode digital information.</div>
		</li>
		<li>
			<img class="list-image" src="pws/static/easyui/themes/images/scanner.png"/>
			<div class="list-header">scanner</div>
			<div class="list-content">scans images, printed text, handwriting, or an object.</div>
		</li>
		<li>
			<img class="list-image" src="/pws/static/easyui/themes/images/pda.png"/>
			<div class="list-header">pda</div>
			<div class="list-content">A personal digital assistant.</div>
		</li>
		<li>
			<img class="list-image" src="/pws/static/easyui/themes/images/tablet.png"/>
			<div class="list-header">tablet</div>
			<div class="list-content">one-piece mobile computer.</div>
		</li>
	</ul>
</div>
<script type="text/javascript">
	var itemAddEditor;
	$(function() {
		itemAddEditor = TAOTAO.createEditor("#itemAddForm [name=desc]");
		TAOTAO.init({
			fun : function(node) {
				TAOTAO.changeItemParam(node, "itemAddForm");
			}
		});
	});

	function submitForm() {
		if (!$('#itemAddForm').form('validate')) {
			$.messager.alert('提示', '表单还未填写完成!');
			return;
		}
		//处理商品的价格的单位，将元转化为分
		$("#itemAddForm [name=price]").val(
				eval($("#itemAddForm [name=priceView]").val()) * 100);
		//将编辑器中的内容同步到隐藏多行文本中
		itemAddEditor.sync();

		//输入的规格参数数据保存为json
		var paramJson = [];
		$("#itemAddForm .params li").each(function(i, e) {
			var trs = $(e).find("tr");
			var group = trs.eq(0).text();
			var ps = [];
			for (var i = 1; i < trs.length; i++) {
				var tr = trs.eq(i);
				ps.push({
					"k" : $.trim(tr.find("td").eq(0).find("span").text()),
					"v" : $.trim(tr.find("input").val())
				});
			}
			paramJson.push({
				"group" : group,
				"params" : ps
			});
		});
		paramJson = JSON.stringify(paramJson);

		$("#itemAddForm [name=itemParams]").val(paramJson);

		/*
		$.post("/rest/item/save",$("#itemAddForm").serialize(), function(data){
			if(data.status == 200){
				$.messager.alert('提示','新增商品成功!');
			}
		});
		 */

		//提交到后台的RESTful
		$.ajax({
			type : "POST",
			url : "/pws/item",
			data : $("#itemAddForm").serialize(),
			success : function(msg) {
				$.messager.alert('提示', '新增商品成功!');
			},
			error : function() {
				$.messager.alert('提示', '新增商品失败!');
			}
		});
	}

	function clearForm() {
		$('#itemAddForm').form('reset');
		itemAddEditor.html('');
	}
</script>
