<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="data" value="${resignationData}"></c:set>
<c:set var="lengthOfJSON" value="${f:length(data)}"></c:set>

[
<c:forEach items="${resignationData}" var="data" varStatus="status">
{
	"reason": "${data.reason}",
	"date" 	: "${data.requestDate }"
}
<c:if test="${status.count ne lengthOfJSON}">
,
</c:if>
</c:forEach>
]
