/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lexgen;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author jmoll
 */
public class JToken {
    private int jTID;
    private int line;
    private int startColumn;
    private int endColumn;
    private Tokens token;
    private String value;
    
    public void setJTID(int id){
        this.jTID = id;
    }
    public void setLine(int line){
        this.line = line;
    }
    public void setStartColumn(int column){
        this.startColumn = column;
    }
    public void setEndColumn(int column){
        this.endColumn = column;
    }
    public void setToken(Tokens token){
        this.token = token;
    }
    public void setValue(String value){
        this.value = value;
    }
    
    public int getJTID(){
        return jTID;
    }
    
    public int getLine(){
        return line;
    }
    public int getStartColumn(){
        return startColumn;
    }
    public int getEndColumn(){
        return endColumn;
    }
    public Tokens getToken(){
        return token;
    }
    public String getValue(){
        return value;
    }
    
    protected static String toCSVtable(List<JToken> list){
        StringBuilder builder = new StringBuilder();
        builder = builder.append("TID,line,startColumn,endColumn,token,value");
        for(JToken t : list){
            builder = builder.append("\n").append(t.toCSV());
        }
        return builder.toString();
    }
    
    protected String toCSV(){
        return new StringBuilder()
                .append('"').append(jTID).append('"').append(',')
                .append('"').append(line).append('"').append(',')
                .append('"').append(startColumn).append('"').append(',')
                .append('"').append(endColumn).append('"').append(',')
                .append('"').append(token).append('"').append(',')
                .append('"').append(value).append('"')
                .toString();
    }
    
    protected static JToken fromCSV(String csv){
        JToken jt = new JToken();
        String data[] = csv.split(new StringBuilder().append('"').append(',').append('"').toString());
        jt.jTID = Integer.parseInt(data[0]);
        jt.line = Integer.parseInt(data[1]);
        jt.startColumn = Integer.parseInt(data[2]);
        jt.endColumn = Integer.parseInt(data[3]);
        jt.token = getTokenByName(data[4]);
        jt.value = data[5];
        return jt;
    }
    
    protected static Tokens getTokenByName(String name){
        Tokens token;
        switch(name){
            case "TipoDato": token = Tokens.TipoDato; break;
            case "Reservada": token = Tokens.Reservada; break;
            case "Operador": token = Tokens.Operador; break;
            case "Identificador": token = Tokens.Identificador; break;
            case "Flotante": token = Tokens.Identificador; break;
            case "Entero": token = Tokens.Identificador; break;
            case "ERROR": token = Tokens.ERROR; break;
            default: token = null; break;
        }
        return token; 
    }
    
    protected static List<JToken> fromCSVtable(String table){
        String[] lis = table.split("\n");
        List<JToken> tk = new ArrayList();
        for (int i = 1; i < lis.length; i++) {
            tk.add(fromCSV(lis[i]));
        }
        return tk;
    }
    
    protected static List<JToken> fromCSVtable(List<String> table){
        List<JToken> tk = new ArrayList();
        for (int i = 1; i < table.size(); i++) {
            tk.add(fromCSV(table.get(i)));
        }
        return tk;
    }
    
}
