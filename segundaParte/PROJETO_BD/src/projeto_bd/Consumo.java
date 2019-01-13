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
public class Consumo {
    private int id;
    private int quantidadeConsumida;
    private LocalDate dataDoUltimoConsumo;

    public Consumo(int id, int quantidadeConsumida, LocalDate dataDoUltimoConsumo) {
        this.id = id;
        this.quantidadeConsumida = quantidadeConsumida;
        this.dataDoUltimoConsumo = dataDoUltimoConsumo;
    }
    
    public int getId() {
        return id;
    }

    public int getQuantidadeConsumida() {
        return quantidadeConsumida;
    }

    public LocalDate getDataDoUltimoConsumo() {
        return dataDoUltimoConsumo;
    }
}
