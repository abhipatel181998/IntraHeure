<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="data" value="${searchDepartmentData}"></c:set>
<c:set var="lengthOfJSON" value="${f:length(data)}"></c:set>

[
<c:forEach items="${searchDepartmentData}" var="data"
	varStatus="status">
{
	"departmentName"  : "${data.departmentName}",
	"departmentDesc" : "${data.departmentDesc }"
}
<c:if test="${status.count ne lengthOfJSON}">
,
</c:if>
</c:forEach>
]
