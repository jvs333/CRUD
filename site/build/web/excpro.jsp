<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exclusão de produtos</title>
    </head>
    <body>
        <%
            int cod;
            cod = Integer.parseInt(request.getParameter("codigo"));
            
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conecta = DriverManager.getConnection("jdbc:mysql://localhost:3307/banco", "site", "site");
                PreparedStatement st = conecta.prepareStatement("DELETE FROM produto WHERE codigo=?");
                st.setInt(1, cod);
                int resultado = st.executeUpdate();
                if (resultado == 0) {
                    out.print("Este produto não está cadastrado");
                } else {
                    out.print("O produto de código " + cod + " foi excluido com sucesso!");
                }
            } catch (Exception erro) {
                String mensagemErro = erro.getMessage();
                out.print("Entre em contato com o suporte e informe o erro " + mensagemErro);
        }
        %>
    </body>
</html>
