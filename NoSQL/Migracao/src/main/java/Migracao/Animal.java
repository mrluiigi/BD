package Migracao;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import org.bson.Document;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 *
 * @author Barbosa
 */
public class Animal extends Documento{
    private int id;
    private String especie;
    private float peso;
    private LocalDate dataNascimento;
    private LocalDate validadeVacina;
    private String genero;
    private String vida;
    private List<Consumo> recursosConsumidos;

    public Animal(int id, String especie, float peso, LocalDate dataNascimento, LocalDate validadeVacina, String genero, String vida, List<Consumo> recursosConsumidos) {
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
        JSONArray consumos = new JSONArray();
        for(Consumo e : this.recursosConsumidos) {
            consumos.add(e.toJSONObject());
        }
        obj.put("RecursosConsumidos", consumos);
        return obj;
    }
    
    public Document toDocument() {
        Document doc = new Document("_id", id)
                .append("Especie", especie)
                .append("Peso", peso)
                .append("DataNascimento", dataNascimento)
                .append("ValidadeVacina", validadeVacina)    
                .append("Genero", genero)
                .append("Vida", vida);
        List<Document> r = new ArrayList<>();
        for(Consumo e : this.recursosConsumidos) {
            r.add(e.toDocument());
        }
        doc.append("RecursosConsumidos", r);

        return doc;
    }
}
