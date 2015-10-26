<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><la:message key="labels.admin_brand_title"/> | <la:message key="labels.user_configuration" /></title>
<jsp:include page="/WEB-INF/view/common/admin/head.jsp"></jsp:include>
</head>
<body class="skin-blue sidebar-mini">
	<div class="wrapper">
		<jsp:include page="/WEB-INF/view/common/admin/header.jsp"></jsp:include>
		<jsp:include page="/WEB-INF/view/common/admin/sidebar.jsp">
			<jsp:param name="menuCategoryType" value="user" />
			<jsp:param name="menuType" value="user" />
		</jsp:include>

		<div class="content-wrapper">

			<%-- Content Header --%>
			<section class="content-header">
				<h1>
					<la:message key="labels.user_title_details" />
				</h1>
				<ol class="breadcrumb">
					<li><la:link href="/admin/user">
							<la:message key="labels.user_link_list" />
						</la:link></li>
					<c:if test="${crudMode == 1}">
						<li class="active"><a href="#"><la:message key="labels.user_link_create" /></a></li>
					</c:if>
					<c:if test="${crudMode == 2}">
						<li class="active"><a href="#"><la:message key="labels.user_link_update" /></a></li>
					</c:if>
					<c:if test="${crudMode == 3}">
						<li class="active"><a href="#"><la:message key="labels.user_link_delete" /></a></li>
					</c:if>
					<c:if test="${crudMode == 4}">
						<li class="active"><a href="#"><la:message key="labels.user_link_confirm" /></a></li>
					</c:if>
				</ol>
			</section>

			<section class="content">

				<%-- Form --%>
				<la:form>
					<la:hidden property="crudMode" />
					<c:if test="${crudMode==2 || crudMode==3 || crudMode==4}">
						<la:hidden property="id" />
						<la:hidden property="versionNo" />
					</c:if>
					<div class="row">
						<div class="col-md-12">
							<div class="box">
								<%-- Box Header --%>
								<div class="box-header with-border">
									<h3 class="box-title">
										<c:if test="${crudMode == 1}">
											<la:message key="labels.user_link_create" />
										</c:if>
										<c:if test="${crudMode == 2}">
											<la:message key="labels.user_link_update" />
										</c:if>
										<c:if test="${crudMode == 3}">
											<la:message key="labels.user_link_delete" />
										</c:if>
										<c:if test="${crudMode == 4}">
											<la:message key="labels.user_link_confirm" />
										</c:if>
									</h3>
									<div class="box-tools pull-right">
										<span class="label label-default"><la:link href="/admin/user">
												<la:message key="labels.user_link_list" />
											</la:link></span>
									</div>
								</div>
								<%-- Box Body --%>
								<div class="box-body">
									<%-- Message --%>
									<div>
										<la:info id="msg" message="true">
											<div class="alert-message info">
												${msg}
											</div>
										</la:info>
										<la:errors />
									</div>

									<%-- Form Fields --%>
									<table class="table table-bordered">
										<tbody>
											<tr>
												<th class="col-xs-2"><la:message key="labels.user_name" /></th>
												<td>${f:h(name)}<la:hidden property="name" /></td>
											</tr>
											<tr>
													<th><la:message key="labels.roles" /></th>
													<td>
															<c:forEach var="rt" varStatus="s" items="${roleItems}">
																	<c:forEach var="rtid" varStatus="s" items="${roles}">
																			<c:if test="${rtid==rt.id}">
																					${f:h(rt.name)}<br/>
																			</c:if>
																	</c:forEach>
															</c:forEach>
															<la:select property="roles" multiple="true" style="display:none;">
																	<c:forEach var="rt" varStatus="s" items="${roleItems}">
																			<la:option value="${rt.id}">${f:h(rt.name)}</la:option>
																	</c:forEach>
															</la:select>
													</td>
											</tr>
											<tr>
													<th><la:message key="labels.groups" /></th>
													<td>
															<c:forEach var="rt" varStatus="s" items="${groupItems}">
																	<c:forEach var="rtid" varStatus="s" items="${groups}">
																			<c:if test="${rtid==rt.id}">
																					${f:h(rt.name)}<br/>
																			</c:if>
																	</c:forEach>
															</c:forEach>
															<la:select property="groups" multiple="true" style="display:none;">
																	<c:forEach var="rt" varStatus="s" items="${groupItems}">
																			<la:option value="${rt.id}">${f:h(rt.name)}</la:option>
																	</c:forEach>
															</la:select>
													</td>
											</tr>
										</tbody>
									</table>

								</div>
								<%-- Box Footer --%>
								<div class="box-footer">
									<c:if test="${crudMode == 1}">
										<input type="submit" class="btn" name="createagain" value="<la:message key="labels.user_button_back"/>" />
										<input type="submit" class="btn btn-primary" name="create"
											value="<la:message key="labels.user_button_create"/>"
										/>
									</c:if>
									<c:if test="${crudMode == 2}">
										<input type="submit" class="btn" name="editagain" value="<la:message key="labels.user_button_back"/>" />
										<input type="submit" class="btn btn-primary" name="update"
											value="<la:message key="labels.user_button_update"/>"
										/>
									</c:if>
									<c:if test="${crudMode == 3}">
										<input type="submit" class="btn" name="back" value="<la:message key="labels.user_button_back"/>" />
										<input type="submit" class="btn btn-primary" name="delete"
											value="<la:message key="labels.user_button_delete"/>"
										/>
									</c:if>
									<c:if test="${crudMode == 4}">
										<input type="submit" class="btn" name="back" value="<la:message key="labels.user_button_back"/>" />
										<input type="submit" class="btn" name="editfromconfirm"
											value="<la:message key="labels.user_button_edit"/>"
										/>
										<input type="submit" class="btn" name="deletefromconfirm"
											value="<la:message key="labels.user_button_delete"/>"
										/>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</la:form>

			</section>
		</div>

		<jsp:include page="/WEB-INF/view/common/admin/footer.jsp"></jsp:include>
	</div>
	<jsp:include page="/WEB-INF/view/common/admin/foot.jsp"></jsp:include>
</body>
</html>
