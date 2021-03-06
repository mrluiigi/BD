package Migracao;



import java.util.ArrayList;
import java.util.List;
import org.bson.Document;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class Cliente extends Documento{
    private int NIF;
    private String nome;
    private String tipo;
    private int contacto;
    private List<Integer> encomendas;

    public Cliente(int NIF, String nome, String tipo, int contacto, List<Integer> encomendas) {
        this.NIF = NIF;
        this.nome = nome;
        this.tipo = tipo;
        this.contacto = contacto;
        this.encomendas = encomendas;
    }

    public int getNIF() {
        return NIF;
    }

    public String getNome() {
        return nome;
    }
    
    public String getTipo() {
        return tipo;
    }

    public int getContacto() {
        return contacto;
    }

    public List<Integer> getEncomendas() {
        return encomendas;
    }
    
    @Override
    public JSONObject toJSONObject() {
        JSONObject obj = new JSONObject();
        obj.put("_id", NIF);
        obj.put("Nome", nome);
        obj.put("Tipo", tipo);
        obj.put("Contacto", contacto);
        JSONArray list = new JSONArray();
        for(Integer e : this.encomendas) {
            list.add(e);
        }
        obj.put("Encomendas", list);
        return obj;
    }
    
    @Override
     public Document toDocument() {
        Document doc = new Document("_id", NIF)
            .append("Nome", nome)
            .append("Tipo", tipo)
            .append("Contacto", contacto)
            .append("Encomendas", encomendas);

        return doc;
    }
}
