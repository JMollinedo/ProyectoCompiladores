/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package userinterface;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author jmoll
 */
public class CupError {
    private final int line;
    private final int column;
    private final Object value;
    private final  List<String> expected;
    
    public CupError(int line, int column, Object value){
        this.line = line;
        this.column = column;
        this.value = value;
        expected = new ArrayList();
    }
    
    public void addExpected(String expected){
        this.expected.add(expected);
    }
    
    public static boolean areEqual(CupError a, CupError b) throws Exception{
        if(a == null && b == null) throw new Exception("Both are Null");
        if(a == null || b == null) return false;
        return a.line == b.line && a.column == b.column;
    }
    
    public String asString(){
        StringBuilder sb = new StringBuilder();
        sb = sb.append("Error! Line ").append(line).append(", Column ")
                .append(column).append(". Symbol ").append(value)
                .append(". Expected: ");
        for(String s : expected){
            sb = sb.append(s).append(" ");
        }
        return sb.deleteCharAt(sb.length()-1).toString();
    }
    
    public static String errorsFromList(List<CupError> errors) throws Exception{
        StringBuilder sb = new StringBuilder();
        int i = 0;
        while(i < errors.size() - 1){
            CupError a = errors.get(i);
            int j = i + 1;
            while(j < errors.size()){
                CupError b = errors.get(i+1);
                if(areEqual(a,b)){
                    for(String s : b.expected){
                        a.addExpected(s);
                    }
                    errors.remove(j);
                   j--; 
                }
                j++;
            }
            i++;
        }
        for(CupError c : errors){
            sb = sb.append(c.asString()).append("\n");
        }
        return sb.deleteCharAt(sb.length()-1).toString();
    }
}
