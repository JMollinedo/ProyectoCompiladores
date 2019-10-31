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
public class ContentFilter {
    public static String filter(List<JToken> tokens , String text){
        StringBuilder sb = new StringBuilder();
        List<String> batches = new ArrayList();
        List<Integer> batchend = new ArrayList();
        int cbachestart = 0;
        for(JToken t : tokens){
            if(t.TNVMatch(Token.PyC, null) || t.TNVMatch(Token.Go, null)){
                int a = t.endColumn - t.startColumn + 1;
                String aux = text.substring(cbachestart, t.chrnum + a);
                batches.add(aux);
                batchend.add(t.jTID-1);
                cbachestart = t.chrnum + a;
            }
        }
        if(cbachestart < text.length()-1){
            String aux = text.substring(cbachestart);
            batches.add(aux);
        }
        int curB = 0;
        for(int i = 0; i < tokens.size(); i++){
            JToken t = tokens.get(i);
            if(t.TNVMatch(Token.PyC, null) || t.TNVMatch(Token.Go, null)){
                sb = sb.append(batches.get(curB));
                curB++;
            }
            if(isError(t)){
                String[] lines = batches.get(curB).split("\\r?\\n");
                i = batchend.get(curB) + 1;
                curB++;
                for(int k = 0; k < lines.length; k++){
                    String s = lines[k];
                    for(int j = 0; j < s.length();j++){
                        sb.append(" ");
                    }
                    if(k < lines.length - 1){
                        sb.append("\n");
                    }
                }
            }
        }
        if(curB < batches.size()){
            sb = sb.append(batches.get(curB));
        }
        return sb.toString();
    }
    private static boolean isError(JToken t){
        if(t.TNVMatch(Token.IdentificadorError, null)){
            return true;
        }
        if(t.TNVMatch(Token.FlotanteError, null)){
            return true;
        }
        if(t.TNVMatch(Token.CadenaError, null)){
            return true;
        }
        if(t.TNVMatch(Token.MalComentario, null)){
            return true;
        }
        if(t.TNVMatch(Token.ERROR, null)){
            return true;
        }
        return false;
    }
    private ContentFilter(){}
}
