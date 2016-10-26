<%@page import="dao.CategoriaDAO"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Categoria"%>
<%@include file="../cabecalho.jsp" %>
<%
    CategoriaDAO dao = new CategoriaDAO();
    if (request.getParameter("codigo") != null) {
        Categoria obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
        if (obj != null) {
            Boolean funcionou = dao.excluir(obj);
            if (funcionou) {
            }
        }
    }
    List<Categoria> lista;
    if (request.getParameter("filtro") != null) {
        lista = dao.listar(request.getParameter("filtro"));
    } else {
        lista = dao.listar();
    }
%>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">
            Gerenciamento de Categorias
        </h1>
    </div>
</div>
<!-- /.row -->
<div class="row">
    <div class="panel panel-default">
        <div class="panel-body">
            <a  href="add.jsp" class="btn  btn-primary btn-sm fa fa-plus-square-o" > Novo</a>
        </div>
    </div>
</div>
<!-- /.row -->
<div class="row">
    <div class="panel panel-default">
        <form action="#" method="post">
            <div class="form-group input-group">
                <input type="text" class="form-control" name="filtro" placeholder="Pesquisar">
                <span class="input-group-btn"><button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button></span>
            </div>
        </form>
        <div class="panel-body">
            <div class="table-responsive">
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>Código</th>
                            <th>Nome</th>
                            <th>Ações</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (Categoria item : lista){
                        %>
                        <tr>
                            <td><%=item.getCodigo()%></td>
                            <td><%=item.getNome()%></td>
                            <td><a href="upd.jsp?codigo=<%=item.getCodigo()%>" class="btn  btn-primary btn-sm">Editar</a>
                                <button class="btn btn-danger btn-sm" data-toggle="modal" data-target="#myModal" onclick="codigo=<%=item.getCodigo()%>">Excluir</button>  
                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
                <!-- /.table-responsive -->
            </div>
        </div>
        <!-- /.panel-body -->
    </div>
    <!-- /.panel -->
</div>
                        <!-- Button trigger modal -->
<%@include file="../modalexcluir.jsp"%>
<%@include file="../rodape.jsp"%>




