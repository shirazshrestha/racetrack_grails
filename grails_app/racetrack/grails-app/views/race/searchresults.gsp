<%--
  Created by IntelliJ IDEA.
  User: Shiraz
  Date: 6/29/2017
  Time: 9:08 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main" />
    <title>Races Meeting Your Criteria</title>
</head>
<body>
<div class="body">
    <h1>Search Results</h1>
    <h2>
        <g:if test="${raceInstanceList?.size() == 1}">
            1 Race Meets Your Criteria:
        </g:if>
        <g:else>
            ${raceInstanceList?.size()} Races Meet Your Criteria:
        </g:else>
    </h2>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <div class="dialog">
        <table>
            <tr>
                <th>Name</th>
                <th nowrap>Start Date</th>
                <th nowrap>Start Time</th>
                <th>City</th>
                <th>State</th>
                <th>Distance</th>
                <th>Cost</th>
                <th></th>
            </tr>
            <g:each in="${raceInstanceList}">
                <tr>
                    <td nowrap>
                        <span class="lineItemValue">${it.name}</span>
                    </td>
                    <td nowrap>
                        <span class="lineItemValue">
                            <g:formatDate date="${it.startDateTime}" format="EEE, MMM d, yyyy"/>
                        </span>
                    </td>
                    <td nowrap>
                        <span class="lineItemValue">
                            <g:formatDate date="${it.startDateTime}" format="h:mm a z"/>
                        </span>
                    </td nowrap>
                    <td nowrap>
                        <span class="lineItemValue">${it.city}</span>
                    </td>
                    <td nowrap>
                        <span class="lineItemValue">${it.state}</span>
                    </td>
                    <td nowrap class="numericData">
                        <span class="lineItemValue">
                            <g:formatNumber number="${it.distance}" format="##0.0 mi"/>
                        </span>
                    </td>
                    <td nowrap class="numericData">
                        <span class="lineItemValue">
                            <g:formatNumber number="${it.cost}" format="\$0.00"/>
                        </span>
                    </td>
                    <td class="actionButtons">
                        <g:if test="${it.registrations?.size() < it.maxRunners}">
                            <span class="actionButton">
                                <g:link controller="registration" action="register" id="${it.id}">Register</g:link>
                            </span>
                        </g:if>
                        <g:else><strong>Full<strong></g:else>
                    </td>
                </tr>
            </g:each>
        </table>
    </div>
</div>
</body>
</html>