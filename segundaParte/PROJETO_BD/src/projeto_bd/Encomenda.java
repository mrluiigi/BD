/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package projeto_bd;

import java.time.LocalDate;
import java.util.Map;

/**
 *
 * @author Barbosa
 */
public class Encomenda {
    private float valor;
    private LocalDate data;
    // ID e quantidade
    private Map<Integer, Integer> produtos;

    public float getValor() {
        return valor;
    }

    public LocalDate getData() {
        return data;
    }

    public Map<Integer, Integer> getProdutos() {
        return produtos;
    }
}
