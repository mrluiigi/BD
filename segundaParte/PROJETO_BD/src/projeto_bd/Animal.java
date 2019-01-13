/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package projeto_bd;

import java.util.List;
import org.json.simple.JSONObject;

/**
 *
 * @author Barbosa
 */
public class Animal extends Document{
    private int id;
    private String especie;
    private float peso;
    private String dataNascimento;
    private String validadeVacina;
    private String genero;
    private String vida;
    private List<Consumo> recursosConsumidos;

    public Animal(int id, String especie, float peso, String dataNascimento, String validadeVacina, String genero, String vida, List<Consumo> recursosConsumidos) {
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

    public String getDataNascimento() {
        return dataNascimento;
    }

    public String getValidadeVacina() {
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
    
    @Override
    public JSONObject toJSONObject() {
        JSONObject obj = new JSONObject();
        obj.put("_id", id);
        obj.put("Especie", especie);
        obj.put("Peso", peso);
        obj.put("DataNascimento", dataNascimento);
        obj.put("ValidadeVacina", validadeVacina);     
        obj.put("Genero", genero);  
        obj.put("Vida", vida);  
        return obj;
    }
    
}
