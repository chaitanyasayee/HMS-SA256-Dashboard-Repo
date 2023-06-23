<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "com.browser.Database.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Blockchain | Data</title>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<style>
.filterable {
    margin-top: 15px;
}
.filterable .panel-heading .pull-right {
    margin-top: -20px;
}
.filterable .filters input[disabled] {
    background-color: transparent;
    border: none;
    cursor: auto;
    box-shadow: none;
    padding: 0;
    height: auto;
}
.filterable .filters input[disabled]::-webkit-input-placeholder {
    color: #333;
}
.filterable .filters input[disabled]::-moz-placeholder {
    color: #333;
}
.filterable .filters input[disabled]:-ms-input-placeholder {
    color: #333;
}

</style>
</head>
<body>


<%
Connection con;
con = DatabaseConnection.createConnection();
try{
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from blockchain");

%>


<div class="container">
    <h3>Blockchain Hash Details</h3>
    <hr style="background:blue; ">
    
    <div class="row">
        <div class="panel panel-primary filterable" style="overflow:scroll;height:auto;">
            <div class="panel-heading">
                <h3 class="panel-title">Server Data Blockchain Hash Values Details</h3>
                <div class="pull-right">
                    <button class="btn btn-default btn-xs btn-filter"><span class="glyphicon glyphicon-filter"></span> Filter</button>
                </div>
            </div>
            <table class="table">
                <thead>
                    <tr class="filters">
                        <th><input type="text" class="form-control" placeholder="S.no" disabled></th>
                        <th><input type="text" class="form-control" placeholder="Domain Name" disabled></th>
                        <th><input type="text" class="form-control" placeholder="Block1" disabled></th>
                        <th><input type="text" class="form-control" placeholder="Block2" disabled></th>
                        <th><input type="text" class="form-control" placeholder="Block3" disabled></th>
                        <th><input type="text" class="form-control" placeholder="Block4" disabled></th> 
                        <th><input type="text" class="form-control" placeholder="Block5" disabled></th> 
                        <th><input type="text" class="form-control" placeholder="Block6" disabled></th>   
                    </tr>
                </thead>
                <tbody>
                <%
                int i = 1;
               	while(rs.next()){
                	                
                %>
                    <tr>
                        <td><%=i %></td>
                        <td><%=rs.getString("domain") %></td>
                        <td><%=rs.getString("block1") %></td>
                        <td><%=rs.getString("block2") %></td>
                        <td><%=rs.getString("block3") %></td>
                        <td><%=rs.getString("block4") %></td>
                        <td><%=rs.getString("block5") %></td>
                        <td><%=rs.getString("block6") %></td>
                    </tr>
                    <%
                    i++;
               		}
					}catch(Exception e){
						e.printStackTrace();
					}
                 %>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script>
$(document).ready(function(){
    $('.filterable .btn-filter').click(function(){
        var $panel = $(this).parents('.filterable'),
        $filters = $panel.find('.filters input'),
        $tbody = $panel.find('.table tbody');
        if ($filters.prop('disabled') == true) {
            $filters.prop('disabled', false);
            $filters.first().focus();
        } else {
            $filters.val('').prop('disabled', true);
            $tbody.find('.no-result').remove();
            $tbody.find('tr').show();
        }
    });

    $('.filterable .filters input').keyup(function(e){
        /* Ignore tab key */
        var code = e.keyCode || e.which;
        if (code == '9') return;
        /* Useful DOM data and selectors */
        var $input = $(this),
        inputContent = $input.val().toLowerCase(),
        $panel = $input.parents('.filterable'),
        column = $panel.find('.filters th').index($input.parents('th')),
        $table = $panel.find('.table'),
        $rows = $table.find('tbody tr');
        /* Dirtiest filter function ever ;) */
        var $filteredRows = $rows.filter(function(){
            var value = $(this).find('td').eq(column).text().toLowerCase();
            return value.indexOf(inputContent) === -1;
        });
        /* Clean previous no-result if exist */
        $table.find('tbody .no-result').remove();
        /* Show all rows, hide filtered ones (never do that outside of a demo ! xD) */
        $rows.show();
        $filteredRows.hide();
        /* Prepend no-result row if all rows are filtered */
        if ($filteredRows.length === $rows.length) {
            $table.find('tbody').prepend($('<tr class="no-result text-center"><td colspan="'+ $table.find('.filters th').length +'">No result found</td></tr>'));
        }
    });
});

</script>


</body>
</html>