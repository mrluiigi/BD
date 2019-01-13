/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.util.ArrayList;
import java.util.List;
import org.bson.Document;
import org.json.simple.JSONObject;

/**
 *
 * @author Barbosa
 */
public class Produto extends Documento{
    private int id;
    private String designacao;
    private float preco;
    private int stock;
    private String validade;
    private int origemID;

    public Produto(int id, String designacao, float preco, int stock, String validade, int origemID) {
        this.id = id;
        this.designacao = designacao;
        this.preco = preco;
        this.stock = stock;
        this.validade = validade;
        this.origemID = origemID;
    }
    
    public int getId() {
        return id;
    }

    public String getDesignacao() {
        return designacao;
    }

    public float getPreco() {
        return preco;
    }

    public int getStock() {
        return stock;
    }

    public String getValidade() {
        return validade;
    }
    
    
    @Override
    public JSONObject toJSONObject() {
        JSONObject obj = new JSONObject();
        obj.put("_id", id);
        obj.put("Designacao", designacao);
        obj.put("Preco", preco);
        obj.put("Stock", stock);
        if(validade != null) {
            obj.put("Validade", validade);
        }
        obj.put("Origem", origemID);
        return obj;
    }
    
    @Override
    public Document toDocument() {
        Document doc = new Document("_id", id)
                .append("Designacao", designacao)
                .append("Preco", preco)
                .append("Stock", stock);
        if(validade != null) {
            doc.append("Validade", validade);
        }
        doc.append("Origem", origemID);
        return doc;
    }
}
