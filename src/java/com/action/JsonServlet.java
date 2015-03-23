/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.action;

import java.io.IOException;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import java.sql.*;

public class JsonServlet extends HttpServlet {

        private static final long serialVersionUID = 1L;

        protected void doGet(HttpServletRequest request,
                HttpServletResponse response) throws ServletException, IOException {

                String sportsName = request.getParameter("sportsName");
                List<String> list = new ArrayList<String>();
                String json = null;
                try
                {
               Class.forName("com.mysql.jdbc.Driver").newInstance();
              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/test?user=root&password=root");
              Statement st = con.createStatement();
             ResultSet rs=st.executeQuery("select code,subject from subject_details where semester=1 and department='"+sportsName+"'");
             while(rs.next())
             {
                 String a=rs.getString("subject");
                 list.add(a);
             }
              

               

                json = new Gson().toJson(list);
                response.setContentType("application/json");
                response.getWriter().write(json);
        }catch(Exception e)
        {
          
            e.printStackTrace();
        }
        }
        
            
        
}
