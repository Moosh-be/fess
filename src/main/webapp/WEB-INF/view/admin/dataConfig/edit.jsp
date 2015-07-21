<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fess | <bean:message key="labels.data_crawling_configuration" /></title>
<jsp:include page="/WEB-INF/view/common/admin2/head.jsp"></jsp:include>
</head>
<body class="skin-blue sidebar-mini">
	<div class="wrapper">
		<jsp:include page="/WEB-INF/view/common/admin2/header.jsp"></jsp:include>
		<jsp:include page="/WEB-INF/view/common/admin2/sidebar.jsp">
			<jsp:param name="menuCategoryType" value="crawl" />
			<jsp:param name="menuType" value="dataConfig" />
		</jsp:include>

		<div class="content-wrapper">

			<%-- Content Header --%>
			<section class="content-header">
				<h1>
						<bean:message key="labels.data_crawling_title_details" />
				</h1>
				<ol class="breadcrumb">
					<li><s:link href="index">
							<bean:message key="labels.data_crawling_link_list" />
						</s:link></li>
					<c:if test="${crudMode == 1}">
						<li class="active"><a href="#"><bean:message key="labels.data_crawling_link_create" /></a></li>
					</c:if>
					<c:if test="${crudMode == 2}">
						<li class="active"><a href="#"><bean:message key="labels.data_crawling_link_update" /></a></li>
					</c:if>
					<c:if test="${crudMode == 3}">
						<li class="active"><a href="#"><bean:message key="labels.data_crawling_link_delete" /></a></li>
					</c:if>
					<c:if test="${crudMode == 4}">
						<li class="active"><a href="#"><bean:message key="labels.data_crawling_link_confirm" /></a></li>
					</c:if>
				</ol>
			</section>

			<section class="content">

				<%-- Form --%>
				<s:form>
					<html:hidden property="crudMode" />
					<c:if test="${crudMode==2}">
						<html:hidden property="id" />
						<html:hidden property="versionNo" />
					</c:if>
					<html:hidden property="createdBy" />
					<html:hidden property="createdTime" />
					<html:hidden property="sortOrder"/>
					<div class="row">
						<div class="col-md-12">
							<div class="box">
								<%-- Box Header --%>
								<div class="box-header with-border">
									<h3 class="box-title">
										<c:if test="${crudMode == 1}">
											<bean:message key="labels.data_crawling_link_create" />
										</c:if>
										<c:if test="${crudMode == 2}">
											<bean:message key="labels.data_crawling_link_update" />
										</c:if>
									</h3>
									<div class="box-tools pull-right">
										<span class="label label-default"><s:link href="index">
												<bean:message key="labels.data_crawling_link_list" />
											</s:link></span>
									</div>
								</div>
								<%-- Box Body --%>
								<div class="box-body">
									<%-- Message --%>
									<div>
										<html:messages id="msg" message="true">
											<div class="alert-message info">
												<bean:write name="msg" ignore="true" />
											</div>
										</html:messages>
										<html:errors />
									</div>
									<%-- Form Fields --%>
									<div class="form-group">
										<label for="name"><bean:message key="labels.name" /></label>
										<html:text property="name" styleClass="form-control" />
									</div>
									<div class="form-group">
											<label for="handlerName"><bean:message key="labels.handler_name" /></label>
											<html:select property="handlerName" size="1" styleClass="form-control">
													<c:forEach var="hn" varStatus="s" items="${handlerNameItems}">
															<html:option value="${f:u(hn.value)}">${f:h(hn.label)}</html:option>
													</c:forEach>
											</html:select>
									</div>
									<div class="form-group">
										<label for="handlerParameter"><bean:message key="labels.handler_parameter" /></label>
										<html:textarea property="handlerParameter" styleClass="form-control" rows="5" />
									</div>
									<div class="form-group">
										<label for="handlerScript"><bean:message key="labels.handler_script" /></label>
										<html:textarea property="handlerScript" styleClass="form-control" rows="5" />
									</div>
									<div class="form-group">
										<label for="boost"><bean:message key="labels.boost" /></label>
										<html:text property="boost" styleClass="form-control" />
									</div>
									<div class="form-group">
										<label for="roleTypeIds"><bean:message key="labels.role_type" /></label>
										<html:select property="roleTypeIds" multiple="true" styleClass="form-control">
											<c:forEach var="rt" varStatus="s" items="${roleTypeItems}">
												<html:option value="${f:u(rt.id)}">${f:h(rt.name)}</html:option>
											</c:forEach>
										</html:select>
									</div>
									<div class="form-group">
										<label for="roleTypeIds"><bean:message key="labels.label_type" /></label>
										<html:select property="labelTypeIds" multiple="true" styleClass="form-control">
											<c:forEach var="l" varStatus="s" items="${labelTypeItems}">
												<html:option value="${f:u(l.id)}">${f:h(l.name)}</html:option>
											</c:forEach>
										</html:select>
									</div>
									<div class="form-group">
										<label for="available"><bean:message key="labels.available" /></label>
										<html:select property="available" styleClass="form-control">
											<html:option value="true">
												<bean:message key="labels.enabled" />
											</html:option>
											<html:option value="false">
												<bean:message key="labels.disabled" />
											</html:option>
										</html:select>
									</div>
								</div>

								<%-- Box Footer --%>
								<div class="box-footer">
									<c:if test="${crudMode == 1}">
										<input type="submit" class="btn" name="back" value="<bean:message key="labels.data_crawling_button_back"/>" />
										<input type="submit" class="btn btn-primary" name="confirmfromcreate"
											value="<bean:message key="labels.data_crawling_button_create"/>"
										/>
									</c:if>
									<c:if test="${crudMode == 2}">
										<input type="submit" class="btn" name="back" value="<bean:message key="labels.data_crawling_button_back"/>" />
										<input type="submit" class="btn btn-primary" name="confirmfromupdate"
											value="<bean:message key="labels.data_crawling_button_confirm"/>"
										/>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</s:form>

			</section>
		</div>

		<jsp:include page="/WEB-INF/view/common/admin2/footer.jsp"></jsp:include>
	</div>
	<jsp:include page="/WEB-INF/view/common/admin2/foot.jsp"></jsp:include>
</body>
</html>
