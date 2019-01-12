/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package projeto_bd;

import java.util.List;

/**
 *
 * @author Barbosa
 */
public class Funcionario {
    private int numero;
    private String nome;
    private int tipo;
    private float salario;
    private int contacto;
    private int horario;
    private List<String> sitiosOndeTrabalha;

    public int getNumero() {
        return numero;
    }

    public String getNome() {
        return nome;
    }

    public int getTipo() {
        return tipo;
    }

    public float getSalario() {
        return salario;
    }

    public int getContacto() {
        return contacto;
    }

    public int getHorario() {
        return horario;
    }

    public List<String> getSitiosOndeTrabalha() {
        return sitiosOndeTrabalha;
    }
}
