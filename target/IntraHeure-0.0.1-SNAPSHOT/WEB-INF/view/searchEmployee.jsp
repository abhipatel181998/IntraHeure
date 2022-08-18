<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="data" value="${searchEmployeeData}"></c:set>
<c:set var="lengthOfJSON_CITY" value="${f:length(data)}"></c:set>

[
<c:forEach items="${searchEmployeeData}" var="data" varStatus="status">
{
	"firstName" 	: "${data.firstName}",
	"lastName"		: "${data.lastName}",
	"gender"		: "${data.gender }",
	"email" 		: "${data.email}",
	"mobileNumber" 	: "${data.mobileNumber}",
	"joiningDate" 	: "${data.joiningDate}",
	"address"		: "${data.residentialAddress}",
	"state"			: "${data.stateVo.stateName}",
	"city"			: "${data.cityVo.cityName}",
	"pincode"		: "${data.pincode}",
	"department"	: "${data.departmentVo.departmentId}",
	"designation"	: "${data.designationVo.designationId}"
}
<c:if test="${status.count ne lengthOfJSON_CITY}">
,
</c:if>
</c:forEach>
]
