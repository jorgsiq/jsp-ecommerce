<%@page import="java.util.List"%>
<%@page import="modelo.Marca"%>
<%@page import="modelo.Categoria"%>
<%@page import="dao.CategoriaDAO"%>
<%@page import="dao.MarcaDAO"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="dao.ProdutoDAO"%>
<%@page import="modelo.Produto"%>
<%@page import="util.Upload"%>

<%@include file="../cabecalho.jsp" %>
<%
    String msg = "", classe = "";
    Integer count = 0;
    CategoriaDAO Categoriadao = new CategoriaDAO();
    MarcaDAO Marcadao = new MarcaDAO();
    List<Categoria> clista = Categoriadao.listar();
    List<Marca> mlista = Marcadao.listar();
    Upload Upload = new Upload();
    Upload.setFolderUpload("imagens");
    ProdutoDAO dao = new ProdutoDAO();
    Produto obj = new Produto();
    if (request.getMethod().equals("GET")) {
        obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
    }
    if (request.getMethod().equals("POST")) {
        if (Upload.formProcess(getServletContext(), request)) {
            obj = dao.buscarPorChavePrimaria(Integer.parseInt(Upload.getForm().get("codigo").toString()));
            if (Upload.getForm().get("titulo") != null && !Upload.getForm().get("titulo").toString().trim().isEmpty()) {
                obj.setTitulo((Upload.getForm().get("titulo").toString()));
            }
            if (Upload.getForm().get("descricao") != null && !Upload.getForm().get("descricao").toString().trim().isEmpty()) {
                obj.setDescricao((Upload.getForm().get("descricao").toString()));
            }
            if (Upload.getForm().get("quant") != null && !Upload.getForm().get("quant").toString().trim().isEmpty()) {
                obj.setQuant(Integer.parseInt(Upload.getForm().get("quant").toString()));
            }
            if (Upload.getForm().get("preco") != null && !Upload.getForm().get("preco").toString().trim().isEmpty()) {
                obj.setPreco(BigDecimal.valueOf(Double.parseDouble(Upload.getForm().get("preco").toString())));
            }
            if (Upload.getForm().get("codcategoria") != null && !Upload.getForm().get("codcategoria").toString().trim().isEmpty()) {
                Categoria citem = Categoriadao.buscarPorChavePrimaria(Integer.parseInt(Upload.getForm().get("codcategoria").toString()));
                if (clista.contains(citem)) {
                    obj.setCodcategoria(Categoriadao.buscarPorChavePrimaria(Integer.parseInt((Upload.getForm().get("codcategoria").toString()))));
                } else {
                    count++;
                    msg = "Categoria errada ";
                    classe = "alert-danger";
                }
            }
            if (Upload.getForm().get("codmarca") != null && !Upload.getForm().get("codmarca").toString().trim().isEmpty()) {
                Marca mitem = Marcadao.buscarPorChavePrimaria(Integer.parseInt(Upload.getForm().get("codmarca").toString()));
                if (mlista.contains(mitem)) {
                    obj.setCodmarca(Marcadao.buscarPorChavePrimaria(Integer.parseInt((Upload.getForm().get("codmarca").toString()))));
                } else {
                    count++;
                    msg = "Marca errada ";
                    classe = "alert-danger";
                }
            }
            if (Upload.getForm().get("destaque") != null) {
                obj.setDestaque(true);
            } else {
                obj.setDestaque(false);
            }
            if (Upload.getFiles().size() != 0 && Upload.getFiles().get(0) != null && !Upload.getFiles().get(0).toString().trim().isEmpty()) {
                obj.setImagem1((Upload.getFiles().get(0).toString()));
            }
            if (Upload.getFiles().size() >= 2 && Upload.getFiles().get(1) != null && !Upload.getFiles().get(1).toString().trim().isEmpty()) {
                obj.setImagem2((Upload.getFiles().get(1).toString()));
            }
            if (Upload.getFiles().size() >= 3 && Upload.getFiles().get(2) != null && !Upload.getFiles().get(2).toString().trim().isEmpty()) {
                obj.setImagem3((Upload.getFiles().get(2).toString()));
            }
            if (dao.alterar(obj)) {
                msg = "Atualizado com sucesso";
                classe = "alert-success";
            } else {
                msg += "Erro ao atualizar";
                classe = "alert-danger";
            }
        }
    }
%>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">
            Gerenciamento de Produtos
        </h1>
        <ol class="breadcrumb">
               <li>
                <i class="fa fa-dashboard"><a href="index.jsp"> Atualizar</a></i>
            </li>
            <li class="active">
                <i class="fa fa-file"><a href="index.jsp"> listagem</a></i> 
            </li>
        </ol>
    </div>
</div>
<!-- /.row -->
<div class="row">
    <div class="panel panel-default">
        <div class="panel-heading">
            Atualizar Produto
        </div>
        <div class="panel-body">
            <div class="alert <%=classe%>"><%=msg%></div>
            <form action="upd.jsp" method="post" enctype="multipart/form-data">
                <div class="col-lg-6">
                    <div class="form-group">
                        <label>Codigo</label>
                        <input name="codigo" value="<%=obj.getCodigo()%>" class="form-control" type="text" required readonly />
                        <label>Titulo</label>
                        <input name="titulo" value="<%=obj.getTitulo()%>" class="form-control" type="text" required />
                        <label>Descrição</label>
                        <input name="descricao" value="<%=obj.getDescricao()%>" class="form-control" type="text" required />
                        <label>Quantidade</label>
                        <input name="quant" value="<%=obj.getQuant()%>" class="form-control" type="number" required />
                        <label>Preço</label>
                        <input name="preco" value="<%=obj.getPreco()%>" class="form-control" type="number" required />
                        <label>Categoria</label>
                        <select class="form-control" name="codcategoria">
                            <option disabled selected="selected" value="<%=obj.getCodcategoria().getCodigo()%>"><%=obj.getCodcategoria().getNome()%></option>
                            <%for (Categoria item : clista) {%>
                            <option value="<%=item.getCodigo()%>"><%=item.getNome()%></option>
                            <%}%>
                        </select>
                        <label>Marca</label>
                        <select class="form-control" name="codmarca">
                            <option readonly selected="selected" value="<%=obj.getCodmarca().getCodigo()%>"><%=obj.getCodmarca().getNome()%></option>
                            <%for (Marca item : mlista) {%>
                            <option value="<%=item.getCodigo()%>"><%=item.getNome()%></option>
                            <%}%>
                        </select>
                        <label>Destaque</label>
                        <input name="destaque" type="checkbox" <%if (obj.getDestaque()) {
                                out.print("checked");
                            }%> class="form-control" />
                        <div class="row">
                            <label>Imagem</label>
                            <input name="imagem1" class="form-control" type="file"/>
                            </br>
                            <img class="img-thumbnail center-block" <%if (obj.getImagem1() != null) {%>src="../../imagens/<%=obj.getImagem1()%><%}%>"/>
                        </div>
                        <div class="row">
                            <label>Imagem</label>
                            <input name="imagem2" class="form-control" type="file"/>
                            </br>
                            <img class="img-thumbnail center-block" <%if (obj.getImagem2() != null) {%>src="../../imagens/<%=obj.getImagem2()%><%}%>"/>
                        </div>
                        <div class="row">
                            <label>Imagem</label>
                            <input name="imagem3" class="form-control" type="file"/>
                            </br>
                            <img class="img-thumbnail center-block"  <%if (obj.getImagem2() != null) {%>src="../../imagens/<%=obj.getImagem3()%><%}%>"/>
                        </div>
                        </br>
                        <button class="btn btn-primary btn-sm" type="submit">Salvar</button>
                    </div>
                </div>
        </div>
        </form>
    </div>
</div>
<!-- /.row -->
<%@include file="../rodape.jsp"%>