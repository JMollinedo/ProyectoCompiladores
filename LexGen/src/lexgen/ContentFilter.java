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
public class ContentFilter {
    private final List<String> original;
    private List<String> modified;
    private void eraseInLine(int line, int startIndex, int lastIndex){
        StringBuilder sb = new StringBuilder();
        String li = modified.get(line);
        for(int i = 0; i < li.length(); i++){
            if(i<startIndex || i>lastIndex){
                sb.append(li.charAt(i));
            }else{
                sb.append(" ");
            }
        }
        modified.set(line, li);
    }
    private void eraseInLine(int line, int startIndex){
        StringBuilder sb = new StringBuilder();
        String li = modified.get(line);
        for(int i = 0; i < li.length(); i++){
            if(i<startIndex){
                sb.append(li.charAt(i));
            }else{
                sb.append(" ");
            }
        }
        modified.set(line, li);
    }
    public void erase(int startCol, int startLine, int endCol, int endLine){
        if(startLine == endLine){
            eraseInLine(startLine,startCol,endCol);
        }else{
            int i = startCol;
            eraseInLine(i,startCol);
            i++;
            while(i < endLine){
                modified.set(i, " ");
            }
            eraseInLine(i,0,endLine);
        }
    }
    public void reset(){
        modified = new ArrayList(original);
    }
    public ContentFilter(String original){
        this.original = new ArrayList();
        String [] ar = original.split(System.lineSeparator());
        for(String a : ar){
            this.original.add(a);
        }
        modified  = new ArrayList(this.original);
    }
    public String fileContent(){
        StringBuilder sb = new StringBuilder();
        for(String s : modified){
            sb = sb.append(s).append("\n");
        }
        return sb.toString();
    }
    public void CleanIds(List<JToken> orl){
        for(JToken j : orl){
            if(j.TNVMatch(Token.OVERFLOWIDENTIFIER)) eraseInLine(j.line,j.startColumn,j.endColumn);
        }
    }
}
