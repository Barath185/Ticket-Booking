<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="models.MovieModel" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Movies out</title>
        <style>
         body {
    background-image: url('images/background.jpg');
    background-repeat: no;
    background-size: 1000px;
     
    }
            .grid-item {
                width: 40%;
                padding: 10px;
                display: inline-block;
                vertical-align: top;
            }
            .grid-item img {
                width: 80%;
                height: 50%;
            }
            @media (max-width: 800px) {
                .grid-item {
                    width: 100%;
                }
            }
        </style>
    </head>
    <body>
        <div class="cd-full-width" align="center">
            <div class="container-fluid js-tm-page-content" data-page-no="3">
                <div class="cd-bg-video-wrapper" data-video="video/sunset-cloud">
                </div>
                <div class="tm-img-gallery-container">
                    <div class="tm-img-gallery gallery-one">
					    <h1 class="tm-text-title tm-gallery-title" style="color: white;">
					        <strong><b>Streaming Now</b></strong>
					    </h1>
					    <%    List<MovieModel> styles = (List<MovieModel>)request.getAttribute("list");
					    if(styles!=null){
					        for(MovieModel type: styles){%>
					        <div class="grid-item">
					        <a href="views/moviedetails.jsp?id=<%= type.getId() %>">
							    <img src="<%= type.getImage()%>" alt="Image" class="img-fluid tm-img">
							    <h3 class="tm-text-title tm-gallery-title" style="color: white;">
							        <strong><b><%= type.getMovie() %></b></strong>
							    </h3>
							</a>
					    </div>		           
					         <%}
} %>
					</div>
                </div> <!-- .tm-img-gallery-container -->
            </div> <!-- .container-fluid -->
        </div> <!-- .cd-full-width -->
    </body>
</html>