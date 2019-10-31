/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package userinterface;

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
    public static String stringForCup(String path, String text) throws IOException{;
        List<JToken> tokens = FileTest2(path);
        return ContentFilter.filter(tokens, text);
    }
    public static String FileTest(String path) throws IOException{
        return JToken.toCSVtable(FileTest2(path));   
    }
    private static List<JToken> FileTest2(String path) throws FileNotFoundException, IOException{
        Reader lector = new BufferedReader(new FileReader(path));
        Lexer lex = new Lexer(lector);
        List<JToken> tokens = new ArrayList();
        Token token = lex.yylex();
        while (token != null) {
            JToken jt = new JToken();
            if(token == Token.Identificador && lex.lexeme.length() > 31){
                int aux = lex.col + 31;
                jt.setJTID(tokens.size()+1);
                jt.setEndColumn(aux);
                jt.setLine(lex.lin+1);
                jt.setStartColumn(lex.col+1);
                jt.setToken(token);
                jt.setValue(lex.lexeme.substring(0, 31));
                jt.setChrnum(lex.cha);
                tokens.add(jt);
                
                jt = new JToken();
                jt.setJTID(tokens.size()+1);
                jt.setEndColumn(aux + lex.lexeme.substring(31).length());
                jt.setLine(lex.lin+1);
                jt.setStartColumn(aux + 1);
                jt.setToken(Token.OVERFLOWIDENTIFIER);
                jt.setValue(lex.lexeme.substring(31));
                jt.setChrnum(lex.cha + 31);
            }else{
                jt.setJTID(tokens.size()+1);
                jt.setEndColumn(lex.len + lex.col + 1);
                jt.setLine(lex.lin+1);
                jt.setStartColumn(lex.col+1);
                jt.setToken(token);
                jt.setValue(lex.lexeme);
                jt.setChrnum(lex.cha);
            }
            tokens.add(jt);
            token = lex.yylex();
        }
        lector.close();
        return tokens;
    }
    
    public static List<JToken> GetTokensFromFile(String path) throws IOException{
        return JToken.fromCSVtable(
                Files.readAllLines(
                        new File(path).toPath(),
                        Charset.forName("UTF-8")
                ));
    }
    
    public static List<JToken> GetTokensFromText(String text){
        return JToken.fromCSVtable(text);
    }
}
