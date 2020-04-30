/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;


public class Conexao {
    
    
    private static EntityManagerFactory emf;
    
    
    
    static public EntityManagerFactory getConexao(){
        if( emf == null){
            emf = Persistence.createEntityManagerFactory("jorgeComercioPU");
            return emf;
        }else{
            return emf;
        }
    }
    
    public void closeConexao(){
        emf.close();
    }
    
    
    
}
