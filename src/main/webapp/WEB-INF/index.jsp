<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ninja Gold Game</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<body>
    <div id="goldShow">
        Your Gold: <div><c:out value="${total}"/></div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <form action="/processMoney" method="POST" class="tables-body" id="farmTable">
                    <div class="margin-top-10">
                        <h3>Farm</h3>
                        <p>(earns 10-20 gold)</p>
                        <input type="hidden" class="form-control" name="building" value="farm">
                    </div>
                    <button type="submit" class="btn btn-primary margin-top-10">Find Gold!</button>
                </form>
            </div>
            <div class="col-md-3">
                <form action="/processMoney" method="POST" class="tables-body" id="caveTable">
                    <div class="margin-top-10">
                        <h3>Cave</h3>
                        <p>(earns 5-10 gold)</p>
                        <input type="hidden" class="form-control" name="building" value="cave">
                    </div>
                    <button type="submit" class="btn btn-primary margin-top-10">Find Gold!</button>
                </form>
            </div>
            <div class="col-md-3">
              <form action="/processMoney" method="POST" class="tables-body" id="houseTable">
                <div class="margin-top-10">
                    <h3>House</h3>
                    <p>(earns 2-5 gold)</p>
                    <input type="hidden" class="form-control" name="building" value="house">
                </div>
                <button type="submit" class="btn btn-primary margin-top-10">Find Gold!</button>
              </form>
            </div>
            <div class="col-md-3">
              <form action="/processMoney" method="POST" class="tables-body" id="casinoTable">
                <div class="margin-top-10">
                    <h3>Casino</h3>
                    <p>(earns/takes 0-50 golds)</p>
                    <input type="hidden" class="form-control" name="building" value="casino">
                </div>
                <button type="submit" class="btn btn-primary margin-top-10">Find Gold!</button>
              </form>
            </div>
        </div>

     	<div class="row">
            <div class="col">
                <div class="display-body">
                    <p>Activities:</p>
                    <div class="display-box">
                        <c:forEach items = "${history}" var="item">
                            <p>${item}</p>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="row">
            <div class="col">
              <form action="/restart" method="POST" id="restart">
                <div class="restart-body">
                    <button type="submit" class="btn btn-primary restart-btn">Restart!</button>
                </div>
              </form>
            </div>
        </div>
</body>
</html>