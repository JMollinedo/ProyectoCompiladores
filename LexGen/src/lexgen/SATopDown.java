/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lexgen;

import java.util.LinkedList;
import java.util.List;
import java.util.Queue;

/**
 *
 * @author jmoll
 */
public class SATopDown {
    public List<JToken> TokensList;
    private JToken CurrentToken;
    
    public SATopDown(List<JToken> Tokens){
        TokensList = Tokens;
        CurrentToken = null;
    }
    
    public boolean TopDownAnalisys(String ErrorMessage){
        Queue<JToken> tokensRead = new LinkedList();
        for(int i = 0; i < TokensList.size(); i++){
            tokensRead.add(TokensList.get(i));
        }
        boolean result = false;
        try{
            while(tokensRead.poll() != null){
                Analize();
            }
            result = true;
            ErrorMessage = null;
        }catch(Exception e){
            ErrorMessage = e.getMessage();
        }
        CurrentToken = null;
        return result;
    }
    
    private void Analize()throws Exception{
    }
    
    private void ERRORTHROW() throws Exception{
        StringBuilder sb = new StringBuilder();
        sb.append("Error in Parsing: \n");
        sb.append(CurrentToken.getValue());
        sb.append("\n in line: ");
        sb.append(CurrentToken.getLine());
        sb.append("\n from Column: ");
        sb.append(CurrentToken.getStartColumn());
        sb.append("\n to Column: ");
        sb.append(CurrentToken.getEndColumn());
        sb.append("\n Token Type: ");
        sb.append(CurrentToken.getToken());
        throw new Exception(sb.toString());
    }
}
