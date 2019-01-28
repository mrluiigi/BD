/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Migracao;

import org.bson.Document;

/**
 *
 * @author jose9
 */
public class ProdutoEncomenda extends Documento{
    private int idProduto;
    private int quantidade;

    public ProdutoEncomenda(int idProduto, int quantidade) {
        this.idProduto = idProduto;
        this.quantidade = quantidade;
    }

    public int getIdProduto() {
        return idProduto;
    }

    public int getQuantidade() {
        return quantidade;
    }
    
    @Override
     public Document toDocument() {
        Document doc = new Document("idProduto", idProduto)
                .append("Quantidade", quantidade);

        return doc;
    }
    
}
