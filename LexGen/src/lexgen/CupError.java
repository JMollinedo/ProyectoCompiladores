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
public class CupError {
    private int column;
    private int line;
    private String value;
    private List<String> expected;
    
    public int getColumn(){
        return column;
    }
    public int getLine(){
        return line;
    }
    public String getValue(){
        return value;
    }
    public List<String> getExpected(){
        List<String> ax = new ArrayList();
        if(ax.addAll(expected))
            return ax;
        return null;
    }
    public CupError(int column, int line, String value, List<String> expected){
        this.column = column;
        this.line = line;
        this.value = value;
        this.expected = new ArrayList();
        this.expected.addAll(expected);
    }
}
