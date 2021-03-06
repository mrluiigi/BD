package Migracao;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.util.ArrayList;
import java.util.List;
import org.bson.Document;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 *
 * @author Barbosa
 */
public class Plantacao extends Documento{
    private int id;
    private String tipo;
    private float area;
    private int mesColheita;
    private List<Consumo> recursosConsumidos;

    public Plantacao(int id, String tipo, float area, int mesColheita, List<Consumo> recursosConsumidos) {
        this.id = id;
        this.tipo = tipo;
        this.area = area;
        this.mesColheita = mesColheita;
        this.recursosConsumidos = recursosConsumidos;
    }

    public int getId() {
        return id;
    }

    public String getTipo() {
        return tipo;
    }

    public float getArea() {
        return area;
    }

    public int getMesColheita() {
        return mesColheita;
    }

    public List<Consumo> getRecursosConsumidos() {
        return recursosConsumidos;
    }
    
    @Override
    public JSONObject toJSONObject() {
        JSONObject obj = new JSONObject();
        obj.put("_id", id);
        obj.put("Tipo", tipo);
        obj.put("Area", area);
        obj.put("MesColheita", mesColheita);
        JSONArray consumos = new JSONArray();
        for(Consumo e : this.recursosConsumidos) {
            consumos.add(e.toJSONObject());
        }
        obj.put("RecursosConsumidos", consumos);
        return obj;
    }
    
    @Override
     public Document toDocument() {
        Document doc = new Document("_id", id)
                .append("Tipo", tipo)
                .append("Area", area)
                .append("MesColheita", mesColheita);
        List<Document> r = new ArrayList<>();
        for(Consumo e : this.recursosConsumidos) {
            r.add(e.toDocument());
        }
        doc.append("RecursosConsumidos", r);

        return doc;
    }
}
