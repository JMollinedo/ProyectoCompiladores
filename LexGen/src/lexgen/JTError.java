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
public class JTError extends JToken {
    private List<JToken> expectedTokens;
    
    public List<JToken> GetET(){
        return expectedTokens;
    }
    public void SetET(List<JToken> expectedTokens){
        this.expectedTokens = new ArrayList();
        this.expectedTokens.addAll(expectedTokens);
    }
    
    public JTError(JToken token, List<JToken> expectedTokens){
        jTID = token.jTID;
        value = token.value;
        line = token.line;
        startColumn = token.startColumn;
        endColumn = token.endColumn;
        this.token = token.token;
        value = token.value;
        this.expectedTokens = new ArrayList();
        if(expectedTokens != null)
            this.expectedTokens.addAll(expectedTokens);
    }
    
    public static boolean HasErrors(List<JToken> list){
        for (JToken t : list) {
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
        }
        return false;
    }
    
    public JTError(JToken token){
        this(token,null);
    }
    
    public void copyTo(JTError jte){
        JToken a = new JToken();
        a.endColumn = this.endColumn;
        a.jTID = this.jTID;
        a.line = this.line;
        a.startColumn = this.startColumn;
        a.token = this.token;
        a.value = this.value;
        jte = new JTError(a,this.expectedTokens);
    }
    
    public String ErrorMessage(){
        StringBuilder sb = new StringBuilder();
        sb.append("Error in Parsing:");
        if(value != null){
            sb.append("\n");
            sb.append(value);
        }
        sb.append("\n in line: ");
        sb.append(line);
        sb.append("\n from Column: ");
        sb.append(startColumn);
        sb.append("\n to Column: ");
        sb.append(endColumn);
        sb.append("\n Token Type: ");
        sb.append(token);
        sb.append("\n Exepcted:");
        for(int i = 0; i < expectedTokens.size(); i++){
            sb.append("\n\t");
            sb.append(expectedTokens.get(i).token);
            if(expectedTokens.get(i).value != null){
                sb.append("\t");
                sb.append(expectedTokens.get(i).value);
            }
        }
        return sb.toString();
    }
}
