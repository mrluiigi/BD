package projeto_bd;

import java.util.List;
import org.json.simple.JSONObject;

public class Cliente extends Document{
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
        obj.put("NIF", NIF);
        obj.put("Nome", nome);
        obj.put("Tipo", tipo);
        obj.put("Contacto", contacto);
        
        return obj;
    }
}
