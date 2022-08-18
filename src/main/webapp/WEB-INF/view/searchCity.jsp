<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="data" value="${searchCityData}"></c:set>
<c:set var="lengthOfJSON_CITY" value="${f:length(data)}"></c:set>

[
<c:forEach items="${searchCityData}" var="data"
	varStatus="status">
{
	"cityName"  : "${data.cityName}",
	"cityDesc" : "${data.cityDesc }"
}
<c:if test="${status.count ne lengthOfJSON_CITY}">
,
</c:if>
</c:forEach>
]
