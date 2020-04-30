package modelo;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import modelo.ItemvendaPK;
import modelo.Produto;
import modelo.Venda;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2016-10-18T01:58:52")
@StaticMetamodel(Itemvenda.class)
public class Itemvenda_ { 

    public static volatile SingularAttribute<Itemvenda, Double> preco;
    public static volatile SingularAttribute<Itemvenda, Venda> venda;
    public static volatile SingularAttribute<Itemvenda, Produto> produto;
    public static volatile SingularAttribute<Itemvenda, Integer> quant;
    public static volatile SingularAttribute<Itemvenda, ItemvendaPK> itemvendaPK;

}