/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package userinterface;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author jmoll
 */
public class Simbolo {
    private String id;
    private Map<String,String> atributos;
    
    public String getId(){
        return id;
    }
    public void setId(String id){
        this.id = id;
    }
    
    public Simbolo(){
        atributos = new HashMap();
        id = null;
    }
    public Simbolo(String id){
        this();
        this.id = id;
    }
    public Simbolo(String id, String...atributos){
        this(id);
        for(String s : atributos){
            String[] spl = s.split("=");
            setAtributo(spl[0],spl[1]);
        }
    }
    
    public void setAtributos(String...atributos){
        for(String s : atributos){
            String[] spl = s.split("=");
            setAtributo(spl[0],spl[1]);
        }
    }
    public void setAtributo(String nombre, String valor){
        if(atributos.containsKey(nombre)){
            atributos.replace(nombre, valor);
        }else{
            atributos.put(nombre, valor);
        }
    }
    public void setAtributoAsInt(String nombre, int valor){
        setAtributo(nombre, Integer.toString(valor));
    }
    public void getAtributoAsDouble(String nombre, double valor){
        setAtributo(nombre, Double.toString(valor));
    }
    public void getAtributoAsBool(String nombre, boolean valor){
        setAtributo(nombre, Boolean.toString(valor));
    }
    
    public String getAtributo(String nombre){
        if(atributos.containsKey(nombre)){
            return atributos.get(nombre);
        }
        return null;
    }
    public int getAtributoAsInt(String nombre){
        String a = getAtributo(nombre);
        if(a == null){
            throw new Error("Atributo No Encontrado");
        }
        return Integer.parseInt(a);
    }
    public double getAtributoAsDouble(String nombre){
        String a = getAtributo(nombre);
        if(a == null){
            throw new Error("Atributo No Encontrado");
        }
        return Double.parseDouble(a);
    }
    public boolean getAtributoAsBool(String nombre){
        String a = getAtributo(nombre);
        if(a == null){
            throw new Error("Atributo No Encontrado");
        }
        return Boolean.parseBoolean(a);
    }
    
    public void dropAtributo(String nombre){
        if(atributos.containsKey(nombre)){
            atributos.remove(nombre);
        }
    }
    public boolean existsAtributo(String nombre){
        return atributos.containsKey(nombre);
    }
}