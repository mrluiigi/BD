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
public class Cliente extends Document{
    private int NIF;
    private String nome;
    private String tipo;
    private int contacto;
    private List<Encomenda> encomendas;

    public Cliente(int NIF, String nome, String tipo, int contacto, List<Encomenda> encomendas) {
        this.NIF = NIF;
        this.nome = nome;
        this.tipo = tipo;
        this.contacto = contacto;
        this.encomendas = encomendas;
    }
    
    

    public int getNIF() {
        return NIF;
    }

    public String getTipo() {
        return tipo;
    }

    public int getContacto() {
        return contacto;
    }

    public List<Encomenda> getEncomendas() {
        return encomendas;
    }
}
