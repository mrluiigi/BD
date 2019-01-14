package Migracao;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import org.bson.Document;
import org.json.simple.JSONObject;

/**
 *
 * @author Barbosa
 */
public abstract class Documento {
    public JSONObject toJSONObject() {return null;};
    public Document toDocument() {return null;};
}