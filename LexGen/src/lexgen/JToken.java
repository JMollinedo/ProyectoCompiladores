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
    protected int charNumber;
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
    public void setCharNumber(int number){
        this.charNumber = number;
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
    public int getCharNumber(){
        return charNumber;
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
    
    protected static JToken fromCSV(String csv){
        JToken jt = new JToken();
        csv = csv.substring(1, csv.length()-1);
        String data[] = csv.split(new StringBuilder().append('"').append(',').append('"').toString());
        jt.jTID = Integer.parseInt(data[0]);
        jt.line = Integer.parseInt(data[1]);
        jt.startColumn = Integer.parseInt(data[2]);
        jt.endColumn = Integer.parseInt(data[3]);
        jt.value = data[5];
        return jt;
    }

    public boolean TNVMatch(Token token, String value){
        if(value == null){
            return this.token == token;
        }
        if(value.isEmpty()){
            return this.token == token;
        }
        return this.token == token && this.value.toUpperCase().equals(value.toUpperCase());
    }
    
    public boolean TokenTypeNValueMatch(JToken token){
        return TNVMatch(token.token, token.value);
    }
}
