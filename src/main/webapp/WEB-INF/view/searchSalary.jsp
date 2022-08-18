<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="data" value="${searchSalaryData}"></c:set>
<c:set var="lengthOfJSON" value="${f:length(data)}"></c:set>

[
<c:forEach items="${searchSalaryData}" var="data"
	varStatus="status">
{
	"basicSalary"  : "${data.basicSalary}"
}
<c:if test="${status.count ne lengthOfJSON}">
,
</c:if>
</c:forEach>
]
