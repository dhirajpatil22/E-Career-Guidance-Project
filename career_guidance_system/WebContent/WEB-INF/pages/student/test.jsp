<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    
<!DOCTYPE html> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.hoverlink:hover
{
background-color: white;
color: red;
font-size: 21px;
}


</style>
</head>
<body bgcolor="cyan">
	<c:choose>
	<c:when test="${not empty sessionScope.questions}">
	
	   <form class="form-horizontal" method="post" action="saveresponse">
        <fieldset>
            <legend>
                <span id="timeleft" class="text-right"></span>
            </legend>
            <input type="hidden" name="regno" value="${sessionScope.student.regno}">
            <c:forEach items="${sessionScope.questions}" var="que" varStatus="loopCounter">
            <div class="form-group">
                <label class="col-lg-2 control-label">Question ${loopCounter.count}</label>
                <div class="col-lg-10 text-left">
                    <input type="hidden" value="${que.questionid}" name="qid${loopCounter.count}">
                
                    <h5>${que.question}</h5>
                    <label>
                        <input type="radio" name="question${loopCounter.count}_option" required="required" value="a">
                            ${que.optionA}                    </label><br>
                    <label>
                        <input type="radio" name="question${loopCounter.count}_option" required="required" value="b">
                            ${que.optionB}                    </label><br>
                    <label>
                        <input type="radio" name="question${loopCounter.count}_option" required="required" value="c">
                            ${que.optionC}                    </label><br>
                    <label>
                        <input type="radio" name="question${loopCounter.count}_option" required="required" value="d">
                            ${que.optionD}                    </label>
                </div>
            </div>
            </c:forEach>

            <div class="form-group">
                <div class="col-lg-10 col-lg-offset-5">
                    <button type="reset" class="btn btn-default">Reset</button>
                    <button type="submit" class="btn btn-primary">Submit your Quiz</button>
                </div>
            </div>
        </fieldset>
    </form>
    
    </c:when>
    
    <c:otherwise>
    <div>
    <h2 style="color: red">you dont have test please check your daily task</h2>
    <h4>${sessionScope.testmsg}</h4>
    <a href="profile" class="hoverlink"><b>please visit your profile></b></a>
    <img src="<c:url value='/images/images.png'/>" style="width:20%"/>
    </div>
    </c:otherwise>
    </c:choose>
    <script>
    /* $('.nav-collapse').click('li', function () {
        $('.nav-collapse').collapse('hide');
    }); */
    var myVar = setInterval(function () {
        myTimer()
    }, 1000);
    var d = 600;
    var min, sec;
    function myTimer() {
        d--;
        min = parseInt(d / 60);
        sec = parseInt((d / 60 - min) * 59);
        document.getElementById("timeleft").innerHTML = min + " miunte " + sec + " second left";
    }
</script>
 </body>
</html>