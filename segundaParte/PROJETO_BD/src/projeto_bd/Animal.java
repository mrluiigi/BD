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
public class Animal extends Document{
    private int id;
    private String especie;
    private float peso;
    private LocalDate dataNascimento;
    private LocalDate validadeVacina;
    private char genero;
    private char vida;
    private List<Consumo> recursosConsumidos;

    public Animal(int id, String especie, float peso, LocalDate dataNascimento, LocalDate validadeVacina, char genero, char vida, List<Consumo> recursosConsumidos) {
        this.id = id;
        this.especie = especie;
        this.peso = peso;
        this.dataNascimento = dataNascimento;
        this.validadeVacina = validadeVacina;
        this.genero = genero;
        this.vida = vida;
        this.recursosConsumidos = recursosConsumidos;
    }
    
    

    public int getId() {
        return id;
    }

    public String getEspecie() {
        return especie;
    }

    public float getPeso() {
        return peso;
    }

    public LocalDate getDataNascimento() {
        return dataNascimento;
    }

    public LocalDate getValidadeVacina() {
        return validadeVacina;
    }

    public char getGenero() {
        return genero;
    }

    public char getVida() {
        return vida;
    }

    public List<Consumo> getRecursosConsumidos() {
        return recursosConsumidos;
    }
}
