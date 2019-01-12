package projeto_bd;

import java.util.List;

/**
 *
 * @author Barbosa
 */
public class Funcionario extends Document{
    private int numero;
    private String nome;
    private int tipo;
    private float salario;
    private String contacto;
    private char horario;
    private List<Integer> animais;
    private List<Integer> plantacoes;

    public Funcionario(int numero, String nome, int tipo, float salario, String contacto, char horario, List<Integer> animais, List<Integer> plantacoes) {
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

    public int getTipo() {
        return tipo;
    }

    public float getSalario() {
        return salario;
    }

    public String getContacto() {
        return contacto;
    }

    public char getHorario() {
        return horario;
    }

    public List<Integer> getAnimais() {
        return animais;
    }

    public List<Integer> getPlantacoes() {
        return plantacoes;
    }
    
    
}
