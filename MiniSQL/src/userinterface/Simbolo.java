/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package userinterface;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
            if(spl[0].isEmpty()){
                throw new Error("Nombre de Atributo Invalido");
            }
            if(spl[1].isEmpty()){
                spl[1] = null;
            }
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
    
    public static List<Simbolo> encontrarId(List<Simbolo> simbolos, String Id){
        List<Simbolo> lista = new ArrayList();
        for(Simbolo s : simbolos){
            if(s.id.equals(Id)){
                lista.add(s);
            }
        }
        return lista;
    }
    
    public static Simbolo encontrar(List<Simbolo> simbolos, String...condiciones){
        Map<String,String> busqueda = new HashMap();
        for(String s : condiciones){
            String[] spl = s.split("=");
            busqueda.put(spl[0],spl[1]);
        }
        for(Simbolo s : simbolos){
            for(String k : busqueda.keySet()){
                if(s.getAtributo(k) == null ? busqueda.get(k) == null : s.getAtributo(k).equals(busqueda.get(k))){
                    return s;
                }
            }
        }
        return null;
    }
    
    public static String toText(List<Simbolo> simbolos){
        StringBuilder sb = new StringBuilder();
        Map<String,Integer> atrib = atributos(simbolos);
        sb = sb.append("Simbolo");
        for(String a : atrib.keySet()){
            StringBuilder bui = new StringBuilder();
            bui = bui.append(",").append(a);
            sb = sb.append(bui.toString());
        }
        for(Simbolo s : simbolos){
            sb = sb.append("\n");
            sb = sb.append(s.id);
            for(String a : atrib.keySet()){
                StringBuilder bui = new StringBuilder();
                bui = bui.append(",");
                if(s.getAtributo(a)!=null){
                    bui = bui.append(s.getAtributo(a));
                }
                else
                {
                    bui = bui.append("---");
                }
                sb = sb.append(bui.toString());
            }
        }
        return sb.toString();
    }
    
    private static Map<String,Integer> atributos(List<Simbolo> simbolos){
        Map<String,Integer> lista = new HashMap();
        for(Simbolo s : simbolos){
            for(String a : s.atributos.keySet()){
                if(!lista.containsKey(a)){
                    lista.put(a, s.getAtributo(a).length());
                }
                if(lista.get(a)<s.getAtributo(a).length()){
                    lista.put(a, s.getAtributo(a).length());
                }
            }
        }
        return lista;
    }
}