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
    private String tipoDeRecurso;
    private int quantidadeConsumida;
    private LocalDate dataDoUltimoConsumo;

    public String getTipoDeRecurso() {
        return tipoDeRecurso;
    }

    public int getQuantidadeConsumida() {
        return quantidadeConsumida;
    }

    public LocalDate getDataDoUltimoConsumo() {
        return dataDoUltimoConsumo;
    }
}
