/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lexgen;

import java.io.*;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author jmoll
 */
public class UseJFlex {
    public static String FileTest(String path) throws FileNotFoundException, IOException{
        Reader lector = new BufferedReader(new FileReader(path));
        Lexer lex = new Lexer(lector);
        List<JToken> tokens = new ArrayList();
        Tokens token = lex.yylex();
        while (token != null) {
            JToken jt = new JToken();
            if(token == Tokens.Identificador && lex.lexeme.length() > 31){
                jt.setJTID(tokens.size()+1);
                jt.setEndColumn(lex.col + 30);
                jt.setLine(lex.lin);
                jt.setStartColumn(lex.col);
                jt.setToken(token);
                jt.setValue(lex.lexeme.substring(0, 31));
                tokens.add(jt);
                
                jt = new JToken();
                jt.setJTID(tokens.size()+1);
                jt.setEndColumn(lex.len + lex.col - 1);
                jt.setLine(lex.lin);
                jt.setStartColumn(lex.col + 31);
                jt.setToken(Tokens.OVERFLOWIDENTIFIER);
                jt.setValue(lex.lexeme.substring(31));
            }else{
                jt.setJTID(tokens.size()+1);
                jt.setEndColumn(lex.len + lex.col - 1);
                jt.setLine(lex.lin);
                jt.setStartColumn(lex.col);
                jt.setToken(token);
                jt.setValue(lex.lexeme);
            }
            tokens.add(jt);
            token = lex.yylex();
        }
        lector.close();
        return JToken.toCSVtable(tokens);
    }
    
    public static List<JToken> GetTokens(String path) throws IOException{
        return JToken.fromCSVtable(
                Files.readAllLines(
                        new File(path).toPath(),
                        Charset.forName("UTF-8")
                ));
    }
}
