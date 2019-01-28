/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package projeto_bd;

import org.json.simple.JSONObject;

/**
 *
 * @author Barbosa
 */
public class Produto extends Document{
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
}
