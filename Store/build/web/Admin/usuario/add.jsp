<%@page import="util.Criptografia"%>
<%@page import="dao.UsuarioDAO"%>
<%@page import="modelo.Usuario"%>
<%@include file="../cabecalho.jsp" %>
<%
    String msg = "",classe = "";
    if (request.getParameter("login") != null && !request.getParameter("login").isEmpty()) {
        Usuario obj = new Usuario();
        UsuarioDAO dao = new UsuarioDAO();
        obj.setLogin(request.getParameter("login"));
        obj.setSenha(Criptografia.convertPasswordToMD5(request.getParameter("senha")));
        if (request.getParameter("admin") != null) {
            obj.setAdmin(true);
        } else {
            obj.setAdmin(false);
        }
        if (dao.incluir(obj)) {
            msg = "Incluido com sucesso";
            classe = "alert-success";
        } else {
            msg = "Erro ao incluir";
            classe = "alert-danger";
        }
    }
%>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">
            Gerenciamento de Usuários
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
            Adicionar Usuário
        </div>
        <div class="panel-body">
            <div class="alert <%=classe%>"><%=msg%></div>
            <form action="add.jsp" method="post">
                <div class="col-lg-6">
                    <div class="form-group">
                        <label>Login</label>
                        <input name="login" class="form-control" type="text" required />
                        <label>Senha</label>
                        <input name="senha" class="form-control" type="text" required />
                        <label>Admin</label>
                        <input name="admin" class="form-control" type="checkbox"/>  
                    </div>
                    <button class="btn btn-primary btn-sm" type="submit">Salvar</button>
            </form>
        </div>
    </div>
</div>
<!-- /.row -->
<%@include file="../rodape.jsp"%>