package projeto_bd;

import java.util.List;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 *
 * @author Barbosa
 */
public class Encomenda extends Document{
    private int id;
    private float valor;
    private String data;
    private int cliente;
    private List<Integer> produtosAnimais;    
    private List<Integer> produtosVegetais;

    public Encomenda(int id, float valor, String data, List<Integer> produtosAnimais, List<Integer> produtosVegetais, int cliente) {
        this.id = id;
        this.valor = valor;
        this.data = data;
        this.produtosAnimais = produtosAnimais;
        this.produtosVegetais = produtosVegetais;
        this.cliente = cliente;
    }

    public int getId() {
        return id;
    }
    
    public float getValor() {
        return valor;
    }

    public String getData() {
        return data;
    }

    public List<Integer> getProdutosAnimais() {
        return produtosAnimais;
    }

    public List<Integer> getProdutosVegetais() {
        return produtosVegetais;
    }
    
    @Override
    public JSONObject toJSONObject() {
        JSONObject obj = new JSONObject();
        obj.put("_id", id);
        obj.put("Valor", valor);
        obj.put("Data", data);
        obj.put("Cliente", cliente);
        JSONArray listAnimais = new JSONArray();
        for(Integer e : this.produtosAnimais) {
            listAnimais.add(e);
        }
        obj.put("Encomendas", listAnimais);
        JSONArray listVegetais = new JSONArray();
        for(Integer e : this.produtosVegetais) {
            listVegetais.add(e);
        }
        obj.put("Encomendas", listVegetais);
        return obj;
    }
}
