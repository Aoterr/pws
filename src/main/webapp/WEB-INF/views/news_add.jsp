<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div style="padding: 10px 10px 10px 10px" id="dd">
	<form action="">

		<div style="margin-bottom:10px">
			<label class="textbox-label">Switch:</label>
			<input class="easyui-textbox" label="Full name:" prompt="Full name" >
		</div>
		<div style="margin-bottom:10px">
			<label class="textbox-label">Switch:</label>
			<input class="easyui-datebox" label="Birthday:" prompt="Birthday" data-options="editable:false,panelWidth:220,panelHeight:240,iconWidth:30">
		</div>
		<div style="margin-bottom:10px">
			<label class="textbox-label">Switch:</label>
			<input class="easyui-passwordbox" label="Password:" prompt="Password">
		</div>
		<div style="margin-bottom:10px">
			<label class="textbox-label">Switch:</label>
			<input class="easyui-numberbox" label="Number:" prompt="Number" >
		</div>
		<div style="margin-bottom:10px">
			<label class="textbox-label">Switch:</label><!--
				--><input class="easyui-switchbutton">
		</div>

	</form>
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
