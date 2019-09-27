/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lexgen;

/**
 *
 * @author jmoll
 */
public class JTError extends JToken {
    public JTError(JToken token){
        jTID = token.jTID;
        value = token.value;
        line = token.line;
        startColumn = token.startColumn;
        endColumn = token.endColumn;
        this.token = token.token;
        value = token.value;
    }
    
    public String ErrorMessage(){
        StringBuilder sb = new StringBuilder();
        sb.append("Error in Parsing: \n");
        sb.append(value);
        sb.append("\n in line: ");
        sb.append(line);
        sb.append("\n from Column: ");
        sb.append(startColumn);
        sb.append("\n to Column: ");
        sb.append(endColumn);
        sb.append("\n Token Type: ");
        sb.append(token);
        return sb.toString();
    }
}
