<%@page import="dao.ClienteDAO"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Cliente"%>
<%@include file="../cabecalho.jsp" %>
<%
    ClienteDAO dao = new ClienteDAO();
    if (request.getParameter("codigo") != null) {
        if (dao.excluir(dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo"))))){
        }
    }
    List<Cliente> lista;
    if (request.getParameter("filtro") != null) {
        lista = dao.listar(request.getParameter("filtro"));
    } else {
        lista = dao.listar();
    }
%>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">
            Gerenciamento de Clientes
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
                            <th>Email</th>
                            <th>Endereço</th>
                            <th>Bairro</th>
                            <th>Cidade</th>
                            <th>Estado</th>
                            <th>Cep</th>
                            <th>Ações</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (Cliente item : lista){
                        %>
                        <tr>
                            <td><%=item.getCodigo()%></td>
                            <td><%=item.getNome()%></td>
                            <td><%=item.getEmail()%></td>
                            <td><%=item.getEndereco()%></td>
                            <td><%=item.getBairro()%></td>
                            <td><%=item.getCidade()%></td>
                            <td><%=item.getEstado()%></td>
                            <td><%=item.getCep()%></td>
                            <td><a href="upd.jsp?codigo=<%=item.getCodigo()%>" class="btn  btn-primary btn-sm">Editar</a>
                                <a href="index.jsp?codigo=<%=item.getCodigo()%>" class="btn  btn-danger btn-sm">Excluir</a>  
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
<%@include file="../rodape.jsp" %>




