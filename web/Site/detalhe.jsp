<%@page import="modelo.Produto"%>
<%@page import="dao.ProdutoDAO"%>
<%
    if(request.getParameter("codigo")==null){
       response.sendRedirect("index.jsp");
       return;
    }
    Integer codigo = Integer.parseInt(request.getParameter("codigo"));
    ProdutoDAO pDAO = new ProdutoDAO();
    Produto prod = pDAO.buscarPorChavePrimaria(codigo);
    if(prod==null){
        response.sendRedirect("index.jsp");
       return;
    }
%>
			<!--header-->
                        <%@include file = "cabecalho.jsp"%>
                        
                        <!-- FlexSlider -->
  <script defer src="js/jquery.flexslider.js"></script>
<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />


<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<script src="js/jquery.min.js"></script>

<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
<script src="js/imagezoom.js"></script>

<script>
// Can also be used with $(document).ready()
$(window).load(function() {
  $('.flexslider').flexslider({
    animation: "slide",
    controlNav: "thumbnails"
  });
});
</script>

                        
	<div class="content">
		<div class="single">
			<div class="container">
				<div class="single-grids">
					
					<div class="col-md-4 single-grid">		
						<div class="flexslider">
                                                    <ul class="slides">
						
								<li data-thumb="../imagens/<%=prod.getImagem1()%>">
									<div class="thumb-image"> <img src="../imagens/<%=prod.getImagem1()%>" data-imagezoom="true" class="img-responsive"> </div>
								</li>
                                                                <%
                                                                if(prod.getImagem2()!=null){
                                                                
                                                                 %>   
								<li data-thumb="../imagens/<%=prod.getImagem2()%>">
									 <div class="thumb-image"> <img src="../imagens/<%=prod.getImagem2()%>" data-imagezoom="true" class="img-responsive"> </div>
								</li>
                                                                <% } %>
                                                                <%
                                                                if(prod.getImagem3()!=null){
                                                                
                                                                 %>
								<li data-thumb="../imagens/<%=prod.getImagem3()%>">
								   <div class="thumb-image"> <img src="../imagens/<%=prod.getImagem3()%>" data-imagezoom="true" class="img-responsive"> </div>
								</li> 
                                                                <% } %>
							</ul>
						</div>
					</div>	
					<div class="col-md-4 single-grid simpleCart_shelfItem">		
						<h3><%=prod.getTitulo()%></h3>
							<p><%=prod.getDescricao()%></p>
								
							<div class="galry">
								<div class="prices">
									<h5 class="item_price"> R$ <%=prod.getPreco()%></h5>
								</div>
								<div class="rating">
									<span>?</span>
									<span>?</span>
									<span>?</span>
									<span>?</span>
									<span>?</span>
								</div>
								<div class="clearfix"></div>
							</div>
								<p class="qty"> Qtd :  </p><input min="1" type="number" id="quantity" name="quantity" value="1" class="form-control input-small">
							<div class="btn_form">
								<a href="#" class="add-cart item_add">Comprar</a>	
							</div>
							<div class="tag">
								<p>Categoria : <a href="produtos.jsp?categoria=<%=prod.getCodcategoria().getCodigo()%>"><%=prod.getCodcategoria().getNome()%></a></p>
								<p>Marca : <a href="produtos.jsp?marca=<%=prod.getCodmarca().getCodigo()%>"><%=prod.getCodmarca().getNome()%></a></p>
							</div>
					</div>
					<div class="clearfix"> </div>
				</div>
			</div>
		</div>

		
</div>
<%@include file = "rodape.jsp"%>			
