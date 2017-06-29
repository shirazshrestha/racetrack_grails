<%@ page import="racetrack.User" %>



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'userId', 'error')} ">
	<label for="userId">
		<g:message code="user.userId.label" default="User Id" />
		
	</label>
	<g:textField name="userId" value="${userInstance?.userId}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} ">
	<label for="password">
		<g:message code="user.password.label" default="Password" />
		
	</label>
	<g:textField name="password" value="${userInstance?.password}"/>
</div>

