package Migracao;



import java.util.List;
import org.bson.Document;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 *
 * @author Barbosa
 */
public class Funcionario extends Documento{
    private int numero;
    private String nome;
    private String tipo;
    private float salario;
    private String contacto;
    private String horario;
    private List<Integer> animais;
    private List<Integer> plantacoes;

    public Funcionario(int numero, String nome, String tipo, float salario, String contacto, String horario, List<Integer> animais, List<Integer> plantacoes) {
        this.numero = numero;
        this.nome = nome;
        this.tipo = tipo;
        this.salario = salario;
        this.contacto = contacto;
        this.horario = horario;
        this.animais = animais;
        this.plantacoes = plantacoes;
    }
    
    public int getNumero() {
        return numero;
    }

    public String getNome() {
        return nome;
    }

    public String getTipo() {
        return tipo;
    }

    public float getSalario() {
        return salario;
    }

    public String getContacto() {
        return contacto;
    }

    public String getHorario() {
        return horario;
    }

    public List<Integer> getAnimais() {
        return animais;
    }

    public List<Integer> getPlantacoes() {
        return plantacoes;
    }
       @Override
    public JSONObject toJSONObject() {
        JSONObject obj = new JSONObject();
        obj.put("_id", numero);
        obj.put("Nome", nome);
        obj.put("Tipo", tipo);
        obj.put("Salario", salario);
        obj.put("Contacto", contacto);
        obj.put("Horário", horario);
        JSONArray listAnimais = new JSONArray();
        for(Integer e : this.animais) {
            listAnimais.add(e);
        }
        obj.put("ListaAnimais", listAnimais);
        JSONArray listPlantacoes = new JSONArray();
        for(Integer e : this.plantacoes) {
            listPlantacoes.add(e);
        }
        obj.put("ListaPlantacoes", listPlantacoes);
        return obj;
    }
    @Override
        public Document toDocument() {
        Document doc = new Document("_id", numero)
            .append("Nome", nome)
            .append("Tipo", tipo)
            .append("Salario", salario)
            .append("Contacto", contacto)
            .append("Horário", horario)
            .append("ListaAnimais", animais)
            .append("ListaPlantacoes", plantacoes);

        return doc;
    }
}
