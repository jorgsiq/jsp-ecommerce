package dao;

import java.util.List;
import modelo.Produto;


public class ProdutoDAO extends GenericDAO<Produto, Integer> {
    
    public ProdutoDAO(){
        super(Produto.class);
    }
    public List<Produto> listar(Integer codigo, String tipo){
        List<Produto> lista;
        try{
            String namedquery;
            if(tipo.equals("M")){
                namedquery = "findByMarca";
            }
            else{
                namedquery = "findByCategoria";
            }
            lista = em.createNamedQuery("Produto." + namedquery).setParameter("codigo", codigo).getResultList();
        }
        catch(Exception ex){
            ex.printStackTrace();
            lista = null;
        }
        return lista;
    }
    
    public List<Produto> destaquesHome(){
        List<Produto> lista;
        try{
            lista = em.createNamedQuery("Produto.destaquesHome").getResultList();
        }
        catch(Exception ex){
            ex.printStackTrace();
            lista = null;
        }
        return lista;
    }
    public List<Produto> galeriaHome(){
        List<Produto> lista;
        try{
            lista = em.createNamedQuery("Produto.galeriaHome").getResultList();
        }
        catch(Exception ex){
            ex.printStackTrace();
            lista = null;
        }
        return lista;
    }
}