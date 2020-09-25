<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<script>
    $(document).ready(function(){
    	
    	var fav ="";
        
            $.ajax({
            	type: "GET",
                url : "http://localhost:8081/jpetstore/actions/Account.action?getUserinfo&id=j2ee",
                dataType : "json",
                success : function(data){                     
                     var show = "";
                     var i = 0;
                    $.each(data,function(key, value){
                    	
                    	if(i<14)
                    		{
                    			show += "<tr><td>"+key+"</td>";
                    			show += "<td>"+value+"</td></tr>";  
                    			i++;
                    		}
                    	        			
                    	});   
                    $("#account").append(show);
                    

                }
            
            });
            
            $.ajax({
            	type: "GET",
                url : "http://localhost:8080/jpetstore/actions/Catalog.action?getProductListByCategory=&id=CATS",
                dataType : "json",
                success : function(data){                     
                     var show = "<tr><th>Product ID</th><th>Name</th></tr>";
                    $.each(data,function(key, value){  
                    	
                    	show += "<tr><td>"+value.productId+"</td>";
                    	show += "<td>"+value.name+"</td></tr>";                   	
        				

                    	});   
                    $("#fav").append(show);

                }
            
            });
            
            $.ajax({
            	type: "GET",
                url : "http://localhost:8082/jpetstore/actions/Order.action?listOrders&id=j2ee",
                dataType : "json",
                success : function(data){                     
                     var show = "<tr><th>Order ID</th><th>Date</th><th>Total Price</th></tr>";
                    $.each(data,function(key, value){                      	
                    	show += "<tr><td>"+value.orderId+"</td>";
                    	show += "<td>"+value.orderDate+"</td>";
                    	show += "<td>$"+value.totalPrice+"</td></tr>";                   	
        				

                    	});   
                    $("#order").append(show);

                }
            
            });
            
            
            
    });
 
</script>

<title>test web</title>
</head>
<body>
<h2>j2ee User info</h2>
<table id="account" border="1">
</table>

<h2>j2ee Order List</h2>
<table id="order" border="1">
</table>

<h2>Cats Category info</h2>
<table id="fav" border="1">
</table>


</body>
</html>