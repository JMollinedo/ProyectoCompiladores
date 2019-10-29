/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lexgen;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author jmoll
 */
public class UseJFlex {
    public static String FileTest(String path) throws IOException{
        return JToken.toCSVtable(FileTest2(path));
    }
    public static String SintaxAnalisis(String sint){
        StringBuilder sb = new StringBuilder();
        Sintax s = new Sintax(new LexerCup(new StringReader(sint)));
        if(s.SyntacticErrors.isEmpty()){
            sb.append("No Errors");
        }else{
            sb.append("Errors Founded");
            for(CupError c : s.SyntacticErrors){
                sb = sb.append("\n")
                        .append("Line")
                        .append(c.getLine())
                        .append(", Column ")
                        .append(c.getColumn())
                        .append(" Symbol Found")
                        .append(c.getValue())
                        .append(". Expected Symbols:")
                        .append(c.getExpected().get(0));
                for(int i = 1; i < c.getExpected().size() ; i++){
                    sb = sb.append(",").append(c.getExpected().get(i));
                }
            }
        }
        return sb.toString();
    }
    public static String CleanFileTest(String path){
        try {
            StringBuilder sb = new StringBuilder();
            List<List<JToken>> tok = splitedList(FileTest2(path));
            ContentFilter cf = new ContentFilter(ReadnWrite.readAllText(path));
            for(List<JToken> l : tok){
                if(HasErrors(l)){
                    JToken ini = l.get(0);
                    JToken fin = l.get(l.size()-1);
                    cf.erase(ini.startColumn, ini.line, fin.endColumn, fin.line);
                }else{
                    cf.CleanIds(l);
                }
            }
            return cf.fileContent();
        } catch (IOException ex) {
            Logger.getLogger(UseJFlex.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    private static List<JToken> FileTest2(String path) throws FileNotFoundException, IOException{
        Reader lector = new BufferedReader(new FileReader(path));
        Lexer lex = new Lexer(lector);
        List<JToken> tokens = new ArrayList();
        Token token = lex.yylex();
        while (token != null) {
            JToken jt = new JToken();
            if(token == Token.Identificador && lex.lexeme.length() > 31){
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
                jt.setToken(Token.OVERFLOWIDENTIFIER);
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
        return tokens;
    }
    private static List<List<JToken>> splitedList(List<JToken> list){
        List<List<JToken>> res = new ArrayList();
        List<JToken> aux = new ArrayList();
        for(JToken t : list){
            aux.add(t);
            if(t.TNVMatch(Token.Go) || t.TNVMatch(Token.PyC)){
                res.add(new ArrayList(aux));
                aux = new ArrayList();
            }
        }
        return res;
    }
    private static boolean HasErrors(List<JToken> list){
        for (JToken t : list) {
            if(t.TNVMatch(Token.IdentificadorError)){
                return true;
            }
            if(t.TNVMatch(Token.FlotanteError)){
                return true;
            }
            if(t.TNVMatch(Token.CadenaError)){
                return true;
            }
            if(t.TNVMatch(Token.MalComentario)){
                return true;
            }
            if(t.TNVMatch(Token.ERROR)){
                return true;
            }
        }
        return false;
    }
    
}
