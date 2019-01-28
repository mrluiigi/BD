package Migracao;



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
public class Encomenda extends Documento{
    private int id;
    private float valor;
    private LocalDate data;
    private int cliente;
    private List<ProdutoEncomenda> produtosAnimais;    
    private List<ProdutoEncomenda> produtosVegetais;

    public Encomenda(int id, float valor, LocalDate data, List<ProdutoEncomenda> produtosAnimais, List<ProdutoEncomenda> produtosVegetais, int cliente) {
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

    public LocalDate getData() {
        return data;
    }

    public List<ProdutoEncomenda> getProdutosAnimais() {
        return produtosAnimais;
    }

    public List<ProdutoEncomenda> getProdutosVegetais() {
        return produtosVegetais;
    }
    
    /*@Override
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
        obj.put("ProdutosAnimais", listAnimais);
        JSONArray listVegetais = new JSONArray();
        for(Integer e : this.produtosVegetais) {
            listVegetais.add(e);
        }
        obj.put("ProdutosVegetais", listVegetais);
        return obj;
    }*/
    
    @Override
        public Document toDocument() {
        Document doc = new Document("_id", id)
            .append("Valor", valor)
            .append("Data", data)
            .append("Cliente", cliente)
            .append("ProdutosAnimais", produtosAnimais)
            .append("ProdutosVegetais", produtosVegetais);
        
            List<Document> a = new ArrayList<>();
            for(ProdutoEncomenda e : this.produtosAnimais) {
                a.add(e.toDocument());
            }
            doc.append("ProdutosAnimais", a);
            
            List<Document> v = new ArrayList<>();
            for(ProdutoEncomenda e : this.produtosVegetais) {
                v.add(e.toDocument());
            }
            doc.append("ProdutosVegetais", v);

        return doc;
    }
}
