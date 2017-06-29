<%@ page import="racetrack.Registration" %>



<div class="fieldcontain ${hasErrors(bean: registrationInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="registration.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="50" required="" value="${registrationInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: registrationInstance, field: 'dateOfBirth', 'error')} required">
	<label for="dateOfBirth">
		<g:message code="registration.dateOfBirth.label" default="Date Of Birth" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateOfBirth" precision="day"  value="${registrationInstance?.dateOfBirth}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: registrationInstance, field: 'gender', 'error')} ">
	<label for="gender">
		<g:message code="registration.gender.label" default="Gender" />
		
	</label>
	<g:select name="gender" from="${registrationInstance.constraints.gender.inList}" value="${registrationInstance?.gender}" valueMessagePrefix="registration.gender" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: registrationInstance, field: 'postalAddress', 'error')} ">
	<label for="postalAddress">
		<g:message code="registration.postalAddress.label" default="Postal Address" />
		
	</label>
	<g:textArea name="postalAddress" cols="40" rows="5" maxlength="255" value="${registrationInstance?.postalAddress}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: registrationInstance, field: 'emailAddress', 'error')} ">
	<label for="emailAddress">
		<g:message code="registration.emailAddress.label" default="Email Address" />
		
	</label>
	<g:field type="email" name="emailAddress" maxlength="50" value="${registrationInstance?.emailAddress}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: registrationInstance, field: 'race', 'error')} required">
	<label for="race">
		<g:message code="registration.race.label" default="Race" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="race" name="race.id" from="${racetrack.Race.list()}" optionKey="id" required="" value="${registrationInstance?.race?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: registrationInstance, field: 'createdAt', 'error')} required">
	<label for="createdAt">
		<g:message code="registration.createdAt.label" default="Created At" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="createdAt" precision="day"  value="${registrationInstance?.createdAt}"  />
</div>

