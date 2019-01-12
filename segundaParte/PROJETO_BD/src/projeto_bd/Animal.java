/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package projeto_bd;

import java.time.LocalDate;
import java.util.List;

/**
 *
 * @author Barbosa
 */
public class Animal {
    private int id;
    private String especie;
    private int peso;
    private LocalDate dataNascimento;
    private LocalDate validadeVacina;
    private String genero;
    private String vida;
    private List<Consumo> recursosConsumidos;

    public int getId() {
        return id;
    }

    public String getEspecie() {
        return especie;
    }

    public int getPeso() {
        return peso;
    }

    public LocalDate getDataNascimento() {
        return dataNascimento;
    }

    public LocalDate getValidadeVacina() {
        return validadeVacina;
    }

    public String getGenero() {
        return genero;
    }

    public String getVida() {
        return vida;
    }

    public List<Consumo> getRecursosConsumidos() {
        return recursosConsumidos;
    }
}
