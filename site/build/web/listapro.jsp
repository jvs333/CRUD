<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listagem de produtos</title>
        <link rel="stylesheet" href="tabela.css">
    </head>
    <body>
        <% 
            try {
                //Faz a conexão com o banco de dados
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3307/banco", "site", "site");
                //Lista os dados da tabela produto do banco de dados
                st = conecta.prepareStatement("SELECT * FROM produto");
                //Método executeQuery() roda o código SQL e trás os dados que são atribuidos a variável rs
                ResultSet rs = st.executeQuery();
                %>
                <table border="1">
                    <tr>
                        <th>Código</th><th>Nome</th><th>Marca</th><th>Preço</th>
                    </tr>
                <%
                //Para mostrarmos todos os resultados precisamos manipulalos um por um
                //Fazemos isso com uma estrutura de repetiçao while(){}
                //Que fara a interação do resultado enquanto houverem linhas
                while (rs.next()) {
                %>
                <!-- Cada linha terá os dados divididos nas colunas da tabela html da página da mesma forma que é organizada na tabela do banco de dados -->
                <tr>
                    <td><%= rs.getString("codigo")%></td>
                    <td><%= rs.getString("nome")%></td>
                    <td><%= rs.getString("marca")%></td>
                    <td><%= rs.getString("preco")%></td>
                </tr>
                <%
                }
                //Fora da estrutura de repetição fechamos nossa tabela
                %>
                </table>
                <%
            } catch (Exception x) {
                out.print("Mensagem de erro:" + x.getMessage());
            }
    %>
    </body>
</html>
