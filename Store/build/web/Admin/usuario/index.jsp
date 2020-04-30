<%@page import="dao.UsuarioDAO"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Usuario"%>
<%@include file="../cabecalho.jsp" %>
<%
    UsuarioDAO dao = new UsuarioDAO();
    if (request.getParameter("login") != null) {
        if (dao.excluir(dao.buscarPorChavePrimaria(request.getParameter("login")))) {
        }
    }
    List<Usuario> lista;
    if (request.getParameter("filtro") != null) {
        lista = dao.listar(request.getParameter("filtro"));
    } else {
        lista = dao.listar();
    }
%>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">
            Gerenciamento de Usuários
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
                            <th>Login</th>

                            <th>Admin</th>
                            <th>Ações</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (Usuario item : lista) {
                        %>
                        <tr>
                            <td><%=item.getLogin()%></td>
                            <td><%=item.getAdmin()%></td>
                            <td><a href="upd.jsp?login=<%=item.getLogin()%>" class="btn  btn-primary btn-sm">Editar</a>
                                <a href="index.jsp?login=<%=item.getLogin()%>" class="btn  btn-danger btn-sm">Excluir</a>  
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
<%@include file="../rodape.jsp"%>




