<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="data" value="${searchLeaveRequestData}"></c:set>
<c:set var="lengthOfJSON_CITY" value="${f:length(data)}"></c:set>

[
<c:forEach items="${searchLeaveRequestData}" var="data"
	varStatus="status">
{
	"leaveType"  	:	"${data.leaveTypeVo.leaveName}",
	"leaveReason" 	:	"${data.leaveReason}",
	"fromDate"		:	"${data.fromDate}",
	"toDate"		:	"${data.toDate}",
	"rejectReason"	:	"${data.rejectReason}",
	"requestStatus"	:	"${data.requestStatus}",
	"loginId"		:	"${data.loginVo.loginId }"
}
<c:if test="${status.count ne lengthOfJSON_CITY}">
,
</c:if>
</c:forEach>
]
