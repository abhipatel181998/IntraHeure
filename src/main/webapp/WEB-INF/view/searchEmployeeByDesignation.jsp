<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="data" value="${employeeByDesignation}"></c:set>
<c:set var="lengthOfJSON" value="${f:length(data)}"></c:set>

[
<c:forEach items="${employeeByDesignation}" var="data"
	varStatus="status">
{
	"loginId" : ${data.loginVo.loginId},
	"employeeName"  : "${data.firstName } ${data.lastName }"
}
<c:if test="${status.count ne lengthOfJSON}">
,
</c:if>
</c:forEach>
]
