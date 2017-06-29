<%@ page import="racetrack.Race" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'race.label', default: 'Race')}" />
		<title>Search for Races</title>
	</head>
	<body>
	<div class="nav">
		<g:render template="/adminmenubar" />
	</div>
		<a href="#create-race" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-race" class="content scaffold-create" role="main">
			<h1>Search Race</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${raceInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${raceInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>

			<g:form action="search" method="post" >
				<fieldset class="form">
					<div class="dialog">
						<table>
							<tr class='prop'>
								<td valign='top' class='name'>
									<label>City:</label>
								</td>
								<td valign='top' class='value'>
									<input type="text" maxlength='30' name='city'>
								</input>
								</td>
							</tr>

							<tr class='prop'>
								<td valign='top' class='name'>
									<label for='state'>State:</label>
								</td>
								<td valign='top' class='value'>
									<g:select name='state'
											  from='${[""] + new Race().constraints.state.inList}'>
									</g:select>
								</td>
							</tr>

							<tr class='prop'>
								<td valign='top' class='name'>
									<label>Date:</label>
								</td>
								<td valign='top' class='value'>
									between
									<g:datePicker name='minDate' precision='day' />
									and
									<g:datePicker name='maxDate' precision='day'
												  value='${new Date().plus(365*2)}'/>
								</td>
							</tr>
							<tr class='prop'>
								<td valign='top' class='name'>
									<label>Distance:</label>
								</td>
								<td valign='top' class='value'>
									<select name='distanceOperator' >
										<option value='AT_LEAST' >At least</option>
										<option value='EXACTLY' >Exactly</option>
										<option value='AT_MOST' >At most</option>
									</select>
									<input type='text' name='distance' size='5'>
								</input> mi
								</td>
							</tr>

						</table>
					</div>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="search" class="save" value="Search" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
