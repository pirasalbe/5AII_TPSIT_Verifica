/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author pirasalbe
 */
public class plot extends HttpServlet {
    private int views = 0;
    
    private synchronized void increment() { views++; }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        increment();
        
        //my views
        Cookie[] cookies = request.getCookies();
        Cookie userCookie = null;
        String name = request.getParameter("title").replace(" ", "_");
        int myviews = 1;
        
        for(Cookie c : cookies){
            if(c.getName().equals(name))
                myviews = Integer.parseInt(c.getValue()) + 1;
        }
        
        userCookie = new Cookie(name, Integer.toString(myviews));
        userCookie.setMaxAge(60*60*24*31); //Store cookie for 1 m
        response.addCookie(userCookie);
        
        String query = "select * "
                + "from (film f inner join regia r on f.IdFilm=r.IdFilm) "
                + "inner join registi re on re.IdReg=r.IdReg "
                + "where f.titolo = '" + request.getParameter("title") + "'";
        
        Connection c = null;
        Statement s = null;
        ResultSet r = null;
        String result = "", plot = "", title = "", regia="", cast="";
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            c = DriverManager.getConnection("jdbc:mysql://localhost:3306/cinema", "root","");
            s = c.createStatement();
            
            //query
            r = s.executeQuery(query);
            
            //obtain regia and other
            while(r.next()){
                title = "<div><" + r.getString("titolo") + "'>" +  r.getString("titolo") + " (" +  r.getString("annopub") + ")</div>";
                plot =  "<div>" +  r.getString("trama") + "</div>";
                regia += "<div>" +  r.getString("re.nome") + " " + r.getString("re.cognome") + "</div>";
            }

            //obtain cast           
            
            query = "select * "
                + "from (film f inner join cast c on c.IdFilm=f.IdFilm)"
                + "inner join attori a on a.IdAtt=c.IdAtt "
                + "where f.titolo = '" + request.getParameter("title") + "'";
            
            //query
            r = s.executeQuery(query);
            
            while(r.next()){
                cast += "<div>" +  r.getString("a.nome") + " " + r.getString("a.cognome") + "</div>";
            }
            
            result += "<div class='row'>"
                            + "<div class='alert alert-success'>"
                            + "<div>Regia: </div>"
                            + regia
                            + "<br>"
                            + "<div>Cast: </div>"
                            + cast
                            + "<br>"
                            + "<div>Plot: </div>"
                            + plot
                            + "</div>"
                        + "</div>";

        } catch(ClassNotFoundException | SQLException e){
            System.out.println(e); //for debug purpose
            result += e;
            result += "<br>" + query;
        }
        
        
        try (PrintWriter out = response.getWriter()) {
            out.println("<head>\n" +
                        "<title>Plot</title>" +
                        "<meta charset=\"UTF-8\">" +
                        "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">" +
                        "<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\">" +
                        "</head>");
            out.println("<body>");
            
            out.println("<div class='container'>");
            
            out.println("<div class=\"row\">\n" +
                        "<div class=\"jumbotron text-center\"><h2>" + title + "</h2></div>\n" +
                        "</div>");
            
            //show result query
            out.println(result);
            
            //come back home
            out.println("<div class='row'>"
                    + "<input type='button' class='btn btn-default' value='Home' onClick=\"javascript:location.href='index.html'\" />"
                    + "</div>");
            
            //views
            out.println("<br>"
                    + "<div class='row alert alert-info'>"
                    + "<div class='col-sm-4'>"
                    + "Total Views: " + views
                    + "</div>"
                    + "<div class='col-sm-4'>"
                    + "My Views: " + myviews
                    + "</div>"
                    + "</div>");
            
            out.println("</div>");
            
            out.println("</body>");
            out.println("</html>");
        } finally {
            try {
            //free memory
                if (r!=null) r.close();
                if(s!=null) s.close();
                if(c !=null) c.close();
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
