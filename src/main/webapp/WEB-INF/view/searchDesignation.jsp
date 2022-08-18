<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="data" value="${searchDesignationData}"></c:set>
<c:set var="lengthOfJSON_CITY" value="${f:length(data)}"></c:set>

[
<c:forEach items="${searchDesignationData}" var="data"
	varStatus="status">
{
	"designationName"  : "${data.designationName}",
	"designationDesc" : "${data.designationDesc }"
}
<c:if test="${status.count ne lengthOfJSON_CITY}">
,
</c:if>
</c:forEach>
]
