package projeto_bd;

import java.time.LocalDate;
import java.util.List;

/**
 *
 * @author Barbosa
 */
public class Encomenda extends Document{
    private int id;
    private float valor;
    private LocalDate data;
    private List<Integer> produtosAnimais;    
    private List<Integer> produtosVegetais;

    public Encomenda(int id, float valor, LocalDate data, List<Integer> produtosAnimais, List<Integer> produtosVegetais) {
        this.id = id;
        this.valor = valor;
        this.data = data;
        this.produtosAnimais = produtosAnimais;
        this.produtosVegetais = produtosVegetais;
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

    public List<Integer> getProdutosAnimais() {
        return produtosAnimais;
    }

    public List<Integer> getProdutosVegetais() {
        return produtosVegetais;
    }
}
