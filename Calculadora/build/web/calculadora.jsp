<%-- 
    Document   : calculadora
    Created on : 16/12/2020, 15:51:36
    Author     : fmpc9
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Calculadora Básica</title>
    </head>
    <body>
        <h2>Resultado do Cálculo!</h2>
        <div>
            <%= request.getAttribute("dvalorA") %> <%= request.getAttribute("opcao") %> <%= request.getAttribute("dvalorB") %> = <%= request.getAttribute("resultado") %> <br>
            <%
            Cookie[] cookies = request.getCookies();
            int count = 0;
            if (cookies != null){
                for(Cookie tempCookie : cookies){
                    if("myApp.HitCounter".equals(tempCookie.getName())){
                        count = Integer.parseInt(tempCookie.getValue());
                        count = count + 1;
                        tempCookie.setValue(count+"");
                        response.addCookie(tempCookie);
                    }
                }
            }
            if(count == 0){
                Cookie tempCookie = new Cookie("myApp.HitCounter","0");
                tempCookie.setMaxAge(60*60*24*365);
                response.addCookie(tempCookie);
            }
            %>
            <center>
               <p>Número total de visitas: <%= count%></p>
            </center>
        <input type="button" value="Retornar" onclick="history.back()">
    </body>
</html>