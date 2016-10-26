/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 *
 * @author aluno
 */
@Embeddable
public class ItemvendaPK implements Serializable {

    @Basic(optional = false)
    @Column(name = "codvenda")
    private int codvenda;
    @Basic(optional = false)
    @Column(name = "codproduto")
    private int codproduto;

    public ItemvendaPK() {
    }

    public ItemvendaPK(int codvenda, int codproduto) {
        this.codvenda = codvenda;
        this.codproduto = codproduto;
    }

    public int getCodvenda() {
        return codvenda;
    }

    public void setCodvenda(int codvenda) {
        this.codvenda = codvenda;
    }

    public int getCodproduto() {
        return codproduto;
    }

    public void setCodproduto(int codproduto) {
        this.codproduto = codproduto;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) codvenda;
        hash += (int) codproduto;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ItemvendaPK)) {
            return false;
        }
        ItemvendaPK other = (ItemvendaPK) object;
        if (this.codvenda != other.codvenda) {
            return false;
        }
        if (this.codproduto != other.codproduto) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.ItemvendaPK[ codvenda=" + codvenda + ", codproduto=" + codproduto + " ]";
    }
    
}
