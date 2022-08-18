<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="cityByState" value="${cityByState}"></c:set>
<c:set var="lengthOfJSON" value="${f:length(cityByState)}"></c:set>


[
<c:forEach items="${cityByState}" var="data"
	varStatus="status">
{
	"cityId" : ${data.cityId},
	"cityName"  : "${data.cityName}"
}
<c:if test="${status.count ne lengthOfJSON}">
,
</c:if>
</c:forEach>
]

