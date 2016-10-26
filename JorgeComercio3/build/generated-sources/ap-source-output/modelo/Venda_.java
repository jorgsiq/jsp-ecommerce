package modelo;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import modelo.Itemvenda;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2016-10-18T01:58:52")
@StaticMetamodel(Venda.class)
public class Venda_ { 

    public static volatile SingularAttribute<Venda, Integer> codcliente;
    public static volatile SingularAttribute<Venda, Integer> codigo;
    public static volatile SingularAttribute<Venda, Double> total;
    public static volatile SingularAttribute<Venda, Date> datavenda;
    public static volatile ListAttribute<Venda, Itemvenda> itemvendaList;
    public static volatile SingularAttribute<Venda, Integer> codstatus;

}