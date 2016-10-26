<%@page import="modelo.Marca"%>
<%@page import="dao.MarcaDAO"%>
<%@page import="modelo.Categoria"%>
<%@page import="java.util.List"%>
<%@page import="dao.CategoriaDAO"%>
<%
    CategoriaDAO cDAO = new CategoriaDAO();
    List<Categoria> cLista = cDAO.listar();
    
    MarcaDAO mDAO = new MarcaDAO();
    List<Marca> mLista = mDAO.listar();
    
%>
<!DOCTYPE HTML>
<html>
<head>
<title>JORGE'STORE</title>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all"/>
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/owl.carousel.css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Swim Wear Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<script src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
	<!-- cart -->
		<script src="js/simpleCart.min.js"> </script>
	<!-- cart -->
</head>
<body>
	<!--header-->
		<div class="header">
			<div class="header-top">
			<div class="container">
				<div class="top-right">
				<ul>
					<li class="text"><a href="login.html">Minha conta</a></li>
					<li><div class="cart box_1">
							<a href="checkout.html">
								 <span class="simpleCart_total"> R$0.00 </span> (<span id="simpleCart_quantity" class="simpleCart_quantity"> 0 Produtos</span>)
							</a>	
							<p><a href="javascript:;" class="simpleCart_empty">Esvaziar Carrinho</a></p>
							<div class="clearfix"> </div>
						</div></li>
				</ul>
				</div>
				<div class="clearfix"></div>
			</div>
			</div>
			<div class="header-bottom">
					<div class="container">
<!--/.content-->
<div class="content white">
	<nav class="navbar navbar-default" role="navigation">
	    <div class="navbar-header">
	        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
	        </button>
	        <h1 class="navbar-brand"><a href="index.jsp"><img img border="0" alt="W3Schools" src="images/lala.jpg"  width="325" height="75"></a></h1>
	    </div>
	    <!--/.navbar-header-->
            <br/>
	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	        <ul class="nav navbar-nav">
			<li><a href="index.jsp">Home</a></li>
		        <li class="dropdown">
		            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Marcas <b class="caret"></b></a>
		            <ul class="dropdown-menu multi-column columns-3">
			            <div class="row">
				            <div class="col-sm-4">
					            <ul class="multi-column-dropdown">
						            <% for (Marca obj : mLista){%>
						            <li><a class="list" href="produtos.jsp?marca=<%=obj.getCodigo()%>"><%=obj.getNome()%></a></li>
                                                            <% } %>
					            </ul>
				            </div> 
			            </div>
		            </ul>
		        </li>
		        <li class="dropdown">
		            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Categorias <b class="caret"></b></a>
		            <ul class="dropdown-menu multi-column columns-3">
			            <div class="row">
				            <div class="col-sm-4">
					           <ul class="multi-column-dropdown">
                                                            <% for (Categoria obj : cLista){%>
						            <li><a class="list" href="produtos.jsp?categoria=<%=obj.getCodigo()%>"><%=obj.getNome()%></a></li>
                                                            <% } %>
					            </ul>
				            </div>
			            </div>
		            </ul>
		        </li>
	        </ul>
	    </div>
	    <!--/.navbar-collapse-->
	</nav>
	<!--/.navbar-->
</div><br/>
			   <div class="search-box">
					<div id="sb-search" class="sb-search">
						<form>
							<input class="sb-search-input" placeholder="Pesquise alguma coisa..." type="search" name="search" id="search">
							<input class="sb-search-submit" type="submit" value="">
							<span class="sb-icon-search"> </span>
						</form>
					</div>
				</div>
			
<!-- search-scripts -->
					<script src="js/classie.js"></script>
					<script src="js/uisearch.js"></script>
						<script>
							new UISearch( document.getElementById( 'sb-search' ) );
						</script>
					<!-- //search-scripts -->
					<div class="clearfix"></div>
					</div>
				</div>
			</div>
			<!--header-->
