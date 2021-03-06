<%@page import="com.chicken.model.UserBean"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%
	UserBean userBean = (UserBean) request.getAttribute("userBean");
%>

<div id="inner">

	<!-- 左侧导航栏 -->
	<jsp:include page="left.jsp" flush="true"><jsp:param name="curSelected" value="myinfo" /></jsp:include>

	<!-- 右侧内容 -->	
	<div class="right">
			<div class="divline" style="font-size:15px;">个人信息</div><!--divline-->
			<div class="contentline" style="font-size:14px;"><br>
			    
			    <form action="MyInfoClServlet?dowhat=updateMyInfo" enctype="multipart/form-data" method="post">
				
					<!-- 帐号信息 -->
					<div class="title"><span>&nbsp;基本信息&nbsp;</span></div><br>
					<hr class="titlehr">
					
					<div class="uploaddivparent">
						
						<div class="uploaddiv">
							<img src="<%=userBean.getUavatar()%>?time=<%=Math.random() %>" style="width:50px;border: 2px solid #DCDCDC;"/>
						</div>
						
						<div class="uploaddiv">
							修改头像：&nbsp;&nbsp;<input type="file" name="avatar">
						</div>
						
						<div class="uploaddiv">
							用&nbsp;&nbsp;户&nbsp;&nbsp;名：&nbsp;&nbsp;<%=userBean.getUid() %>
						</div>
						
						<div class="uploaddiv">
							昵&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称：&nbsp;&nbsp;<input type="text" name="nickname" onkeyup="updateLeftStrLength(this)" maxlength="15" autocomplete="off" class="editline" value="<%=userBean.getUnickname()%>">&nbsp;&nbsp;<font>您还可以输入<span class="font_bold_green">10</span>个字</font>
						</div>	
					</div>
					
					<!-- 选填信息 -->
					<div class="title"><span>&nbsp;选填信息&nbsp;</span></div><br>
					<hr class="titlehr">
					
					<div class="uploaddivparent">
						<div class="uploaddiv">
							真实姓名：&nbsp;&nbsp;<input type="text" name="realname" autocomplete="off" class="editline" value="<%=userBean.getUrealname()%>">
						</div>
						
						<div class="uploaddiv">
							性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：&nbsp;&nbsp;
							<%
								if(userBean.getUsex().equals("M")) //男
								{
									%>
									<input type="radio" name="sex" value="M" checked="checked">男 &nbsp;&nbsp;
									<input type="radio" name="sex" value="F">女 
									<%
								}
								else //女
								{
									%>
									<input type="radio" name="sex" value="M">男 &nbsp;&nbsp;
									<input type="radio" name="sex" value="F" checked="checked">女 
									<%	
								}
							%>
						</div>	
						
						<div class="uploaddiv">
							家庭住址：&nbsp;&nbsp;<input type="text" name="address" autocomplete="off" class="editline" style="width:50%;" value="<%=userBean.getUaddress()%>">
						</div>	
						
						<div class="uploaddiv">
							联系方式：&nbsp;&nbsp;<input type="text" name="phone" autocomplete="off" class="editline" value="<%=userBean.getUphone()%>">
						</div>	
						
						<div class="uploaddiv">
							电子邮箱：&nbsp;&nbsp;<input type="text" name="email" autocomplete="off" class="editline" value="<%=userBean.getUemail()%>">
						</div>	
						
						<div class="uploaddiv">
							出生日期：&nbsp;&nbsp;<input type="date" name="birthday" autocomplete="off" class="editline" value="<%=userBean.getUbirthday()%>">
						</div>	
						
						<div class="uploaddiv">
							<input type="submit" class="greenbutton" value="保存"  onclick="return checkMyInfoValidness();"/>
						</div>
					</div>
				</form>
				
			</div><!--contentline-->
	</div>
</div>
