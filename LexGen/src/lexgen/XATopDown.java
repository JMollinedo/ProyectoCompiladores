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
public class XATopDown {
    public List<JToken> TokensList;
    private int CTP;
    private JToken CurrentToken;
    private JTError Error;
    
    public static List<XATopDown> analize(List<JToken> tokens, List<JToken> BatchEndToken){
        List<XATopDown> Expressions = new ArrayList();
        List<JToken> extra = new ArrayList();
        for (JToken token : tokens) {
            extra.add(token);
            for (JToken beToken : BatchEndToken) {
                if(token.TokenTypeNValueMatch(beToken)){
                    XATopDown n = new XATopDown(extra);
                    n.ExcAnalisys();
                    Expressions.add(n);
                    extra.clear();
                }
            }
        }
        return Expressions;
    }
    
    private void ExcAnalisys(){
        
    }
    
    private XATopDown(List<JToken> tokens){
        TokensList = new ArrayList();
        TokensList.addAll(tokens);
        CurrentToken = null;
        CTP = -1;
        Error = null;
    }
    
    private void ReadNextToken(JToken expected){
        if(CurrentToken.TokenTypeNValueMatch(expected)){
            CTP++;
            if(CTP < TokensList.size())
                CurrentToken = TokensList.get(CTP);
        }else{
            ERRORTHROW();
        }
    }
    
    private void ERRORTHROW() {
        Error = new JTError(CurrentToken);
    }
    private void ERRORANUL(){
        Error = null;
    }
}
