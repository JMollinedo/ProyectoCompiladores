/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package userinterface;

import java.io.StringReader;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

/**
 *
 * @author jmoll
 */
public class UseCup {
    public static String SyntaxAnalize(String content) throws Exception{
        String temporalFilePath = "C:\\Users\\Public\\Documents\\lexTemp.txt";
        ReadnWrite.writeAllText(temporalFilePath, content);
        List<JToken> tok = UseJFlex.FileTest2(temporalFilePath);
        ReadnWrite.deleteFile(temporalFilePath);
        for(JToken j : tok){
            if(j.TNVMatch(Token.OVERFLOWIDENTIFIER)){
                content = erraseOverId(content,j);
            }
        }
        List<List<JToken>> splited = splitedList(tok);
        List<JToken[]> errlex = new ArrayList();
        for(List<JToken> l : splited){
            if(HasErrors(l)){
                errlex.add(new JToken[]{l.get(0),l.get(l.size()-1)});
            }
        }
        for(int i = errlex.size()-1; i >= 0; i--){
            content = erraseInString(content,errlex.get(i)[0],errlex.get(i)[1]);
        }
        Sintax s = new Sintax(new userinterface.LexerCup(new StringReader(content)));
        s.parse();
        LinkedList<String> errs = s.SyntacticErrors;
        if(errs.isEmpty()){
            return "No Errors Founded";
        }
        StringBuilder sb = new StringBuilder();
        for(String err : errs){
            sb.append(err);
            sb.append("\n");
        }
        return sb.toString();
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
    private static String erraseOverId(String origin,JToken tok){
        StringBuilder sb = new StringBuilder();
        int prim = tok.charNumber;
        int endi = tok.charNumber+tok.length-1;
        int i = 0;
        while(i < prim){
            sb = sb.append(origin.charAt(i));
        }
        while(i <= endi){
            sb = sb.append(" ");
        }
        while(i < origin.length()){
            sb = sb.append(origin.charAt(i));
        }
        return sb.toString();
    }
    private static String erraseInString(String origin, JToken init, JToken fini){
        StringBuilder sb = new StringBuilder();
        int prim = init.charNumber;
        int endi = fini.charNumber+fini.length-1;
        int lines = fini.line - init.line;
        int i = 0;
        while(i < prim){
            sb = sb.append(origin.charAt(i));
        }
        for(int j = 0; j < lines; j++){
            sb = sb.append("\n");
        }
        for(int j = 0; j < fini.endColumn; j++){
            sb = sb.append(" ");
        }
        i = endi + 1;
        while(i < origin.length()){
            sb = sb.append(origin.charAt(i));
        }
        return sb.toString();
    }
}
