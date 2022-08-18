<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="data" value="${searchStateData}"></c:set>
<c:set var="lengthOfJSON" value="${f:length(data)}"></c:set>

[
<c:forEach items="${searchStateData}" var="data"
	varStatus="status">
{
	"stateName"  : "${data.stateName}",
	"stateDesc" : "${data.stateDesc }"
}
<c:if test="${status.count ne lengthOfJSON}">
,
</c:if>
</c:forEach>
]
