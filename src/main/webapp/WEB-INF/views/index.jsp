<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>jQuery.EasyUI- 1.2.6 后台经典框架使用DEMO</title>
    <link href="${ctx}/static/css/default.css" rel="stylesheet" type="text/css" />

    <link rel="stylesheet" type="text/css" href="${ctx}/static/js/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="${ctx}/static/js/themes/icon.css" />
    <script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx}/static/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src='${ctx}/static/js/XiuCai.index.js'> </script>

    <script type="text/javascript">

	var _menus = {
	"menus": [{
		"menuid": "1",
		"icon": "icon-sys",
		"menuname": "控件使用",
		"menus": [{
			"menuid": "12",
			"menuname": "疯狂秀才",
			"icon": "icon-add",
			"url": "http://hxling.cnblogs.com",
			"child": [{
				"menuid": "140",
				"menuname": "角色管理 3",
				"icon": "icon-role",
				"url": "demo2.html"
			},
			{
				"menuid": "150",
				"menuname": "权限设置 3",
				"icon": "icon-set",
				"url": "demo.html"
			}]
		},
		{
			"menuid": "13",
			"menuname": "用户管理",
			"icon": "icon-users",
			"url": "demo2.html",
			"child": [{
				"menuid": "141",
				"menuname": "角色管理 3",
				"icon": "icon-role",
				"url": "demo2.html"
			},
			{
				"menuid": "151",
				"menuname": "权限设置 3",
				"icon": "icon-set",
				"url": "demo.html"
			}]
		},
		{
			"menuid": "14",
			"menuname": "角色管理",
			"icon": "icon-role",
			"url": "demo2.html",
			"child": [{
				"menuid": "142",
				"menuname": "角色管理 3",
				"icon": "icon-role",
				"url": "demo2.html"
			},
			{
				"menuid": "152",
				"menuname": "权限设置 3",
				"icon": "icon-set",
				"url": "demo.html"
			}]
		},
		{
			"menuid": "15",
			"menuname": "权限设置",
			"icon": "icon-set",
			"url": "demo.html",
			"child": [{
				"menuid": "143",
				"menuname": "角色管理 3",
				"icon": "icon-role",
				"url": "demo2.html"
			},
			{
				"menuid": "153",
				"menuname": "权限设置 3",
				"icon": "icon-set",
				"url": "demo.html"
			}]
		},
		{
			"menuid": "16",
			"menuname": "系统日志",
			"icon": "icon-log",
			"url": "demo1.html",
			"child": [{
				"menuid": "144",
				"menuname": "角色管理 3",
				"icon": "icon-role",
				"url": "demo2.html"
			},
			{
				"menuid": "154",
				"menuname": "权限设置 3",
				"icon": "icon-set",
				"url": "demo.html"
			}]
		}]
	},
	{
		"menuid": "8",
		"icon": "icon-sys",
		"menuname": "员工管理",
		"menus": [{
			"menuid": "21",
			"menuname": "员工列表",
			"icon": "icon-nav",
			"url": "demo.html"
		},
		{
			"menuid": "22",
			"menuname": "视频监控",
			"icon": "icon-nav",
			"url": "demo1.html",
			"child": [{
				"menuid": "221",
				"menuname": "员工列表 3",
				"icon": "icon-nav",
				"url": "demo.html"
			},
			{
				"menuid": "222",
				"menuname": "视频监控 3",
				"icon": "icon-nav",
				"url": "demo1.html"
			}]
		}]
	},
	{
		"menuid": "56",
		"icon": "icon-sys",
		"menuname": "部门管理",
		"menus": [{
			"menuid": "31",
			"menuname": "添加部门",
			"icon": "icon-nav",
			"url": "demo1.html"
		},
		{
			"menuid": "321",
			"menuname": "部门列表",
			"icon": "icon-nav",
			"url": "demo2.html",
			"child": [{
				"menuid": "311",
				"menuname": "添加部门 4",
				"icon": "icon-nav",
				"url": "demo1.html"
			},
			{
				"menuid": "312",
				"menuname": "部门列表 4",
				"icon": "icon-nav",
				"url": "demo2.html"
			}]
		}]
	}]
};

        //设置登录窗口
        function openPwd() {
            $('#w').window({
                title: '修改密码',
                width: 300,
                modal: true,
                shadow: true,
                closed: true,
                height: 160,
                resizable:false
            });
        }
        //关闭登录窗口
        function closePwd() {
            $('#w').window('close');
        }

        

        //修改密码
        function serverLogin() {
            var $newpass = $('#txtNewPass');
            var $rePass = $('#txtRePass');

            if ($newpass.val() == '') {
                msgShow('系统提示', '请输入密码！', 'warning');
                return false;
            }
            if ($rePass.val() == '') {
                msgShow('系统提示', '请在一次输入密码！', 'warning');
                return false;
            }

            if ($newpass.val() != $rePass.val()) {
                msgShow('系统提示', '两次密码不一至！请重新输入', 'warning');
                return false;
            }

            $.post('/ajax/editpassword.ashx?newpass=' + $newpass.val(), function(msg) {
                msgShow('系统提示', '恭喜，密码修改成功！<br>您的新密码为：' + msg, 'info');
                $newpass.val('');
                $rePass.val('');
                close();
            })
            
        }

        $(function() {

            openPwd();

            $('#editpass').click(function() {
                $('#w').window('open');
            });

            $('#btnEp').click(function() {
                serverLogin();
            })

			$('#btnCancel').click(function(){closePwd();})

            $('#loginOut').click(function() {
                $.messager.confirm('系统提示', '您确定要退出本次登录吗?', function(r) {

                    if (r) {
                        location.href = '/ajax/loginout.ashx';
                    }
                });
            })
        });
		
		

    </script>

</head>
<body class="easyui-layout" style="overflow-y: hidden"  fit="true"   scroll="no">
<div data-options="region:'north',border:false" style="overflow: hidden; height: 30px;
        background: url(${cts}/static/images/layout-browser-hd-bg.gif) #7f99be repeat-x center 50%;
        line-height: 20px;color: #fff; font-family: Verdana, 微软雅黑,黑体">

    <span style="float:right; padding-right:20px;" class="head">欢迎 疯狂秀才 <a href="#" id="editpass">修改密码</a> <a href="#" id="loginOut">安全退出</a></span>
    <span style="padding-left:10px; font-size: 16px; "><img src="${ctx}/static/images/blocks.gif" width="20" height="20" align="absmiddle" /> jQuery.EasyUI- 1.2.6 应用实例</span>
</div>
<div data-options="region:'west',split:true,title:'导航菜单'" style="width:180px;" id="west">
    <div id="nav">

    </div>

</div>
<div data-options="region: 'east',collapsed:true,title: '日历', iconCls: 'icon-standard-date', split: false, minWidth: 200, maxWidth: 500" style="width: 220px; padding: 1px; border-left-width: 0px;" >
    <div id="eastLayout" class="easyui-layout" data-options="fit: true">
        <div data-options="region: 'north', split: false, border: false" style="height: 220px;">
            <div class="easyui-calendar" data-options="fit: true"></div>
        </div>
        <div data-options="region: 'center', title: '友情链接', iconCls: 'icon-hamburg-link'">
            <ul id="linkList" class="portlet-list link-list" >
            </ul>
        </div>
    </div>
</div>

<div data-options="region:'south',border:false" style="height:50px;background:#A9FACD;padding:10px;">south region</div>
<div id="mainPanle" data-options="region:'center'" style="background: #eee; overflow-y:hidden">
    <div id="tabs" class="easyui-tabs"  fit="true" border="false" >
        <div data-options="title:'欢迎使用',iconCls: 'icon-hamburg-home'" style="padding:20px;overflow:hidden; color:red; " >

        </div>
    </div>
</div>
<div id="mm" class="easyui-menu" style="width:150px;">
    <div id="tabupdate">刷新</div>
    <div class="menu-sep"></div>
    <div id="close">关闭</div>
    <div id="closeall">全部关闭</div>
    <div id="closeother">除此之外全部关闭</div>
    <div class="menu-sep"></div>
    <div id="closeright">当前页右侧全部关闭</div>
    <div id="closeleft">当前页左侧全部关闭</div>
    <div class="menu-sep"></div>
    <div id="exit">退出</div>
</div>

</body>
</html>