<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="models.MovieModel" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Movie Details</title>
<style>
    body {
        background-image: url("../images/background.jpg");
        background-size: cover;
        background-position: center;
        min-height: 100vh;
        margin: 0;
        padding: 20px;
        font-family: Arial, sans-serif;
        color: white;
    }
    .container {
        max-width: 800px;
        margin: 0 auto;
    }
    .movie-details {
        margin-top: 20px;
        display: flex;
        align-items: center; 
    }
    .movie-details h2 {
        margin-bottom: 10px;
    }
    .movie-details img {
        max-width: 50%;
        height: auto;
        margin-right: 20px; 
    }
    .book-details {
        flex-grow: 1;
    }
</style>
</head>
<body>
    <div class="container">
        <h1>Movie Details</h1> 
        <%
        List<MovieModel> styles = (List<MovieModel>)request.getAttribute("list");
	    if(styles!=null){
	        for(MovieModel type: styles){
        String id = request.getParameter("id");
        String title = "";
        String imageSrc = "";  
        if ("1".equals(id)) {
            title = type.getMovie();
            imageSrc = type.getImage();
        } 
        else if ("2".equals(id)) {
            title =  type.getMovie();
            imageSrc = type.getImage();
        } 
        else if ("3".equals(id)) {
            title =  type.getMovie();
            imageSrc = type.getImage();
        }
        else if ("4".equals(id)) {
            title =  type.getMovie();
            imageSrc = type.getImage();
        }
        %>   
        <div class="movie-details">
            <img src="<%= imageSrc %>" alt="Movie Image">
            <div class="book-details">
                <h2><%= title %> Book</h2>
                <p>Description of the book goes here...</p>
                <% 
                try {
                    Context ctx = new InitialContext();
                    DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/mkce");
                    Connection con = ds.getConnection();
                    PreparedStatement pstmt = con.prepareStatement("SELECT price, showtime, date FROM bookings WHERE movie = ?");
                    pstmt.setString(1, "Oppenheimer");
                    ResultSet rs = pstmt.executeQuery();
                    if (rs.next()) {
                        double price = rs.getDouble("price");
                        String showtime = rs.getString("showtime");
                        String date = rs.getString("date");  %>
                <p><strong>Price:</strong> <%= type.getPrice() %></p>
                <p><strong>Showtime:</strong> <%= type.getShowtime() %></p>
                <p><strong>Date:</strong> <%= type.getDate() %></p>
                <% 
                    }
                    rs.close();
                    pstmt.close();
                    con.close();
                } catch (Exception e) {
                    out.println("Error: " + e.getMessage());
                }
                %>
               <%}
	        }%>  
            </div>
        </div>
    </div>
</body>
</html>