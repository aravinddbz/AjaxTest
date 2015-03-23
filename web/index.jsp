<html>
<head>
<title>AJAX in Servlet using JQuery and JSON</title>
<script src="js/jquery-1.11.1.js" type="text/javascript"></script>

<script>
$(document).ready(function() {

$('#sports').change(function(event) {
        var sports = $("select#sports").val();
        $.get('populateSubjects.jsp', {
                sportsName : sports
        }, function(response) {

        var select = $('#player');
        select.find('option').remove();
          $.each(response, function(index, value) {
          $('<option>').val(value).text(value).appendTo(select);
      });
        });
        });
});

function populateSubjectMenu() {
 
    var selectedIndexVal = document.getElementById("sports1").selectedIndex;
    var selectedSemVal =document.getElementById("sports1").options[selectedIndexVal].value;
 
    
    callAjaxFunction(selectedSemVal);
   
  }
 
/* function called to do Ajax Request */
  function callAjaxFunction(semVal){
  var url="populateSubjects.jsp?semVal="+semVal;
 
    var xmlHttp;
        if (window.XMLHttpRequest) { // Mozilla, Safari, ...
 
        var xmlHttp = new XMLHttpRequest();
 
      } else if (window.ActiveXObject) { // IE
 
        var xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
      }
 
    xmlHttp.open('POST', url, true);
    xmlHttp.onreadystatechange = function() {
 
        if (xmlHttp.readyState == 4) {
 
            updatepage(xmlHttp.responseText);
        }
 
    }
xmlHttp.send(url);
  }
 
/* Call back function of Ajax Response*/
function updatepage(response){
//alert(str);
document.getElementById("result").innerHTML = response;
}
</SCRIPT>
</script>
</head>
<body>
<h3>AJAX in Servlet using JQuery and JSON</h3>
        Select Favorite Sports:
        <select id="sports1" onchange="populateSubjectMenu();">
                <option>Select Sports</option>
                <option value="2">Computer Science</option>
                <option value="3">IT</option>
        </select>
        <br /> <br /> 
        Select Favorite Player:
        <select id="player">
                <option>Select Player</option>
        </select>
        <div id="result"></div>

</body>
</html>