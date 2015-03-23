<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%
            //open a database connection
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;
           
            try{
 
              
              String semVal=request.getParameter("semVal");
              int n=Integer.parseInt(semVal);
              int sem=1;
           
              for(int i=0;i<=n;i++)
              {
              out.print("<p class='style9'>Subjects : ");
              out.print("<select name='sub_select' id='sub_select'>");
              out.print("<option value=''>--Select--</option>");
               
         
              out.print("<option value='hello'>"+semVal+"</option>");           
              
              out.print("</select>");
          
              }
             
             
            }catch(Exception e ){
                out.print("<div><font color='red'>The following exception was thrown:</font></div>"+e);
                e.printStackTrace();
            }finally{
               
            }
%>