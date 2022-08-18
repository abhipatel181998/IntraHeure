<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="data" value="${searchComplainData}"></c:set>
<c:set var="lengthOfJSON_CITY" value="${f:length(data)}"></c:set>

[
<c:forEach items="${searchComplainData}" var="data" varStatus="status">
{
	"complainSub"  		: "${data.complainSub}",
	"complainDesc" 		: "${data.complainDesc }",
	"complainDate" 		: "${data.complainDate }",
	"replyDesc"    		: "${data.replyDesc }",
	"complainStatus"	: "${data.complainStatus }"
	
}
<c:if test="${status.count ne lengthOfJSON_CITY}">
,
</c:if>
</c:forEach>
]
