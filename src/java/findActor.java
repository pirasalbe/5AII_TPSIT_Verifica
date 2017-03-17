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
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author pirasalbe
 */
public class findActor extends HttpServlet {

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
        
        String query = "select * "
                + "from (film f inner join cast c on c.IdFilm=f.IdFilm)"
                + "inner join attori a on a.IdAtt=c.IdAtt "
                + "where a.cognome like '" + request.getParameter("actor") + "%'";
        
        Connection c = null;
        Statement s = null;
        ResultSet r = null;
        String result = "";
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            c = DriverManager.getConnection("jdbc:mysql://localhost:3306/cinema", "root","");
            s = c.createStatement();
            
            //query
            r = s.executeQuery(query);
            
            while(r.next()){
                result += "<div class='row'>"
                                + "<form action='plot'>"
                                    + "<div class='alert alert-info col-sm-2'>"
                                        + "<div><a href='plot?title=" + r.getString("titolo") + "'>" +  r.getString("titolo") + "</a></div>"
                                        + "<div>" +  r.getString("genere") + "</div>"
                                        + "<div>" +  r.getString("annopub") + "</div>"
                                    + "</div>"
                                + "</form>"
                            + "</div>";
            }
        } catch(ClassNotFoundException | SQLException e){
            System.out.println(e); //for debug purpose
            result += e;
            result += "<br>" + query;
        }
        
        
        try (PrintWriter out = response.getWriter()) {
            out.println("<head>\n" +
                        "<title>Cookie Maker</title>" +
                        "<meta charset=\"UTF-8\">" +
                        "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">" +
                        "<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\">" +
                        "</head>");
            out.println("<body>");
            
            out.println("<div class='container'>");
            
            //show result query
            out.println(result);
            
            //come back home
            out.println("<div class='row'>"
                    + "<div class='col-sm-2'>"
                    + "<input type='button' class='btn btn-default' value='Home' onClick=\"javascript:location.href='index.html'\" />"
                    + "</div></div>");
            
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
