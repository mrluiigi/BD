package projeto_bd;

import java.time.LocalDate;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class Consumo extends Document {
    private int id;
    private int quantidadeConsumida;
    private String dataDoUltimoConsumo;

    public Consumo(int id, int quantidadeConsumida, String dataDoUltimoConsumo) {
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

    public String getDataDoUltimoConsumo() {
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
}
