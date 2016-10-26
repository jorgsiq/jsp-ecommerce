<%@page import="dao.ClienteDAO"%>
<%@page import="modelo.Cliente"%>
<%@page import="util.Criptografia"%>
<%@include file="../cabecalho.jsp" %>
<%
    String msg = "", classe = "";
    if (request.getParameter("nome") != null && !request.getParameter("nome").isEmpty()) {
        Cliente obj = new Cliente();
        ClienteDAO dao = new ClienteDAO();
        obj.setNome(request.getParameter("nome"));
        obj.setEmail(request.getParameter("email"));
        obj.setSenha(Criptografia.convertPasswordToMD5(request.getParameter("senha")));
        obj.setEndereco(request.getParameter("endereco"));
        obj.setBairro(request.getParameter("bairro"));
        obj.setCidade(request.getParameter("cidade"));
        obj.setEstado(request.getParameter("estado"));
        obj.setCep(request.getParameter("cep"));
        if (dao.incluir(obj)) {
            msg = "Incluido com sucesso";
            classe = "alert-success";
        } else {
            msg += "Erro ao incluir";
            classe = "alert-danger";
        }
    }
%>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">
            Gerenciamento de Clientes
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
            Adicionar Cliente
        </div>
        <div class="panel-body">
            <div class="alert <%=classe%>"><%=msg%></div>
            <form action="add.jsp" method="post">
                <div class="col-lg-6">
                    <div class="form-group">
                        <label>Nome</label>
                        <input name="nome" class="form-control" type="text" required />
                        <label>Email</label>
                        <input name="email" class="form-control" type="email" required />
                        <label>Senha</label>
                        <input name="senha" class="form-control" type="text" required />
                        <label>Endereço</label>
                        <input name="endereco" class="form-control" type="text" required />
                        <label>Bairro</label>
                        <input name="bairro" class="form-control" type="text" required />
                        <label>Cidade</label>
                        <input name="cidade" class="form-control" type="text" required />
                        <label>Unidade Federativa</label>
                        <input name="estado" class="form-control" type="text" required />
                        <label>Cep</label>
                        <input name="cep" class="form-control" type="text" minlength="9" maxlength="9" required />
                    </div>
                    <button class="btn btn-primary btn-sm" type="submit">Salvar</button>
            </form>
        </div>
    </div>
</div>
<!-- /.row -->
<%@include file="../rodape.jsp"%>