<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Post New Course</title>
</head>
<body>
	<form action="post_newcourse" method="get">
        <fieldset>
            <table>
                <tr><td><label>Course Name: </label></td><td><input type="text" name="coursename"></td></tr>
                <tr><td><label>Description: </label></td><td><textarea rows="5" cols="21" name="description"></textarea></td></tr>
                <tr><td><input type="submit" value="Add Course"></td></tr>
            </table>
        </fieldset>
    </form>
</body>
</html>