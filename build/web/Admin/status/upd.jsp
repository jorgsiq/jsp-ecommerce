<%@page import="modelo.Status"%>
<%@page import="dao.StatusDAO"%>
<%@include file="../cabecalho.jsp" %>
<%
    if (request.getParameter("codigo") == null || request.getParameter("codigo").isEmpty()) {
        response.sendRedirect("index.jsp");
        return;
    }
    String msg = "",classe = "";
    StatusDAO dao = new StatusDAO();
    Status obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
    if ((request.getParameter("descricao") != null) && (!request.getParameter("descricao").isEmpty())) {
        obj.setDescricao(request.getParameter("descricao"));
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
            Gerenciamento de Status
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
           Atualizar Status
        </div>
        <div class="panel-body">
            <div class="alert <%=classe%>"><%=msg%></div>
            <form action="upd.jsp" method="post">
                <div class="col-lg-6">
                    <div class="form-group">
                        <label>Código</label>
                        <input name="codigo" value="<%=request.getParameter("codigo")%>" class="form-control" type="text" readonly />
                    </div>
                    <div class="form-group">
                        <label>Descricao</label>
                        <input name="descricao" class="form-control" value="<%=obj.getDescricao()%>" type="text" required />
                    </div>
                    <button class="btn btn-primary btn-sm" type="submit">Salvar</button>
            </form>
        </div>
    </div>
</div>
<!-- /.row -->
<%@include file="../rodape.jsp" %>