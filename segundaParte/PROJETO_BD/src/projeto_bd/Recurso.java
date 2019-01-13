/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package projeto_bd;

/**
 *
 * @author Barbosa
 */
public class Recurso extends Document{
    private int id;
    private String tipo;
    private String fornecedor;
    private float preco;
    private int stock;

    public Recurso(int id, String tipo, String fornecedor, float preco, int stock) {
        this.id = id;
        this.tipo = tipo;
        this.fornecedor = fornecedor;
        this.preco = preco;
        this.stock = stock;
    }

    public int getId() {
        return id;
    }

    public String getTipo() {
        return tipo;
    }

    public String getFornecedor() {
        return fornecedor;
    }

    public float getPreco() {
        return preco;
    }

    public int getStock() {
        return stock;
    }
}
