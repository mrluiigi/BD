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
public class Plantacao {
    private int id;
    private String tipo;
    private int area;
    private LocalDate mesColheita;
    private List<Consumo> recursosConsumidos;

    public int getId() {
        return id;
    }

    public String getTipo() {
        return tipo;
    }

    public int getArea() {
        return area;
    }

    public LocalDate getMesColheita() {
        return mesColheita;
    }

    public List<Consumo> getRecursosConsumidos() {
        return recursosConsumidos;
    }
}
