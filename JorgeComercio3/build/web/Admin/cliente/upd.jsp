<%@page import="modelo.Cliente"%>
<%@page import="dao.ClienteDAO"%>
<%@include file="../cabecalho.jsp" %>
<%
    if (request.getParameter("codigo") == null || request.getParameter("codigo").isEmpty()) {
        response.sendRedirect("index.jsp");
        return;
    }
    String msg = "", classe = "";
    ClienteDAO dao = new ClienteDAO();
    Cliente obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
    if ((request.getParameter("nome") != null) && (!request.getParameter("nome").isEmpty())) {
        obj.setNome(request.getParameter("nome"));
        obj.setEmail(request.getParameter("email"));
        obj.setEndereco(request.getParameter("endereco"));
        obj.setBairro(request.getParameter("bairro"));
        obj.setCidade(request.getParameter("cidade"));
        obj.setEstado(request.getParameter("estado"));
        obj.setCep(request.getParameter("cep"));

        if (dao.alterar(obj)) {
            msg = "Atualizado com sucesso";
            classe = "alert-success";
        } else {
            msg = "Erro ao atualizar";
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
            Atualizar Cliente
        </div>
        <div class="panel-body">
            <div class="alert <%=classe%>"><%=msg%></div>
            <form action="upd.jsp" method="post">
                <div class="col-lg-6">
                    <div class="form-group">
                        <label>Código</label>
                        <input name="codigo" value="<%=request.getParameter("codigo")%>" class="form-control" type="text" readonly />
                        <label>Nome</label>
                        <input name="nome" value="<%=obj.getNome()%>" class="form-control" type="text" required />
                        <label>Email</label>
                        <input name="email" value="<%=obj.getEmail()%>" class="form-control" type="email" required />
                        <label>Endereço</label>
                        <input name="endereco" class="form-control" value="<%=obj.getEndereco()%>" type="text" required />
                        <label>Bairro</label>
                        <input name="bairro" class="form-control" value="<%=obj.getBairro()%>" type="text" required />
                        <label>Cidade</label>
                        <input name="cidade" class="form-control" value="<%=obj.getCidade()%>" type="text" required />
                        <label>Unidade Federativa</label>
                        <input name="estado" class="form-control" value="<%=obj.getEstado()%>" type="text" required />
                        <label>Cep</label>
                        <input name="cep" class="form-control" type="text" value="<%=obj.getCep()%>" minlength="9" maxlength="9" required />
                    </div>
                    <button class="btn btn-primary btn-sm" type="submit">Salvar</button>
            </form>
        </div>
    </div>
</div>
<!-- /.row -->
<%@include file="../rodape.jsp"%>