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
    protected int jTID;
    protected int line;
    protected int startColumn;
    protected int endColumn;
    protected Token token;
    protected String value;
    
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
    public void setToken(Token token){
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
    public Token getToken(){
        return token;
    }
    public String getValue(){
        return value;
    }
    
    public JToken(){};
    public JToken(Token token, String value){
        this();
        this.token = token;
        this.value = value;
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
    public boolean TNVMatch(Token token){
        return this.token == token;
    }
}
