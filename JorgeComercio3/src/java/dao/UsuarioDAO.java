/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import modelo.Usuario;


public class UsuarioDAO extends GenericDAO<Usuario, String> {
    
    public UsuarioDAO(){
        super(Usuario.class);
    }
}