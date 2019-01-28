package Migracao;



import java.time.LocalDate;
import org.bson.Document;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class Consumo extends Documento {
    private int id;
    private int quantidadeConsumida;
    private LocalDate dataDoUltimoConsumo;

    public Consumo(int id, int quantidadeConsumida, LocalDate dataDoUltimoConsumo) {
        this.id = id;
        this.quantidadeConsumida = quantidadeConsumida;
        this.dataDoUltimoConsumo = dataDoUltimoConsumo;
    }
    
    public int getId() {
        return id;
    }

    public int getQuantidadeConsumida() {
        return quantidadeConsumida;
    }

    public LocalDate getDataDoUltimoConsumo() {
        return dataDoUltimoConsumo;
    }
    
    @Override
    public JSONObject toJSONObject() {
        JSONObject obj = new JSONObject();
        obj.put("_id", id);
        obj.put("quantidadeConsumida", quantidadeConsumida);
        obj.put("dataDoUltimoConsumo", dataDoUltimoConsumo);
        return obj;
    }
    
    @Override
     public Document toDocument() {
        Document doc = new Document("_id", id)
                .append("QuantidadeConsumida", quantidadeConsumida)
                .append("DataDoUltimoConsumo", dataDoUltimoConsumo);
        return doc;
    }
}
