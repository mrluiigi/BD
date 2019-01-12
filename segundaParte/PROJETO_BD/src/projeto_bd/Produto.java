/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package projeto_bd;

import java.time.LocalDate;

/**
 *
 * @author Barbosa
 */
public class Produto {
    private int id;
    private String designacao;
    private float preco;
    private int stock;
    private LocalDate validade;

    public int getId() {
        return id;
    }

    public String getDesignacao() {
        return designacao;
    }

    public float getPreco() {
        return preco;
    }

    public int getStock() {
        return stock;
    }

    public LocalDate getValidade() {
        return validade;
    }
}
