package modelo;

import java.math.BigDecimal;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import modelo.Categoria;
import modelo.Itemvenda;
import modelo.Marca;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2016-10-18T01:58:52")
@StaticMetamodel(Produto.class)
public class Produto_ { 

    public static volatile SingularAttribute<Produto, BigDecimal> preco;
    public static volatile SingularAttribute<Produto, Integer> codigo;
    public static volatile SingularAttribute<Produto, String> imagem3;
    public static volatile SingularAttribute<Produto, String> imagem2;
    public static volatile SingularAttribute<Produto, String> titulo;
    public static volatile SingularAttribute<Produto, String> imagem1;
    public static volatile SingularAttribute<Produto, Boolean> destaque;
    public static volatile SingularAttribute<Produto, Categoria> codcategoria;
    public static volatile ListAttribute<Produto, Itemvenda> itemvendaList;
    public static volatile SingularAttribute<Produto, Integer> quant;
    public static volatile SingularAttribute<Produto, Marca> codmarca;
    public static volatile SingularAttribute<Produto, String> descricao;

}