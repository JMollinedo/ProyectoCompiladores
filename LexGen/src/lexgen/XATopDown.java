/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lexgen;

import java.io.IOException;
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
    
    private static JToken Ending(JToken prev){
        JToken t = new JToken();
        t.endColumn = prev.endColumn+1;
        t.startColumn = prev.endColumn+1;
        t.line = prev.line;
        t.token = Tokens.FinSintaxis;
        t.value = null;
        return t;
    }
    
    public static String analizeCSVfile(String path) throws IOException{
        List<JToken> BET = new ArrayList();
        BET.add(new JToken(Tokens.Reservada,"GO"));
        BET.add(new JToken(Tokens.PYC,null));
        List<XATopDown> result = analize(UseJFlex.GetTokensFromFile(path),BET);
        StringBuilder sb = new StringBuilder();
        for(int i = 0; i < result.size(); i++){
            sb.append("Batch ");
            sb.append(i);
            sb.append(":\t");
            if(result.get(i).Error == null){
                sb.append("OK");
            }else{
                sb.append("ERROR\n");
                sb.append(result.get(i).Error.ErrorMessage());
            }
            sb.append("\n\n");
        }
        return sb.toString();
    }
    public static String analizeCSVText(String csvText){
        List<JToken> BET = new ArrayList();
        BET.add(new JToken(Tokens.Reservada,"GO"));
        BET.add(new JToken(Tokens.PYC,null));
        List<XATopDown> result = analize(UseJFlex.GetTokensFromText(csvText),BET);
        StringBuilder sb = new StringBuilder();
        for(int i = 0; i < result.size(); i++){
            sb.append("Batch ");
            sb.append(i);
            sb.append(":\t");
            if(result.get(i).Error == null){
                sb.append("OK");
            }else{
                sb.append("ERROR\n");
                sb.append(result.get(i).Error.ErrorMessage());
            }
            sb.append("\n\n");
        }
        return sb.toString();
    }
    
    private static List<XATopDown> analize(List<JToken> tokens, List<JToken> BatchEndToken){
        List<XATopDown> Expressions = new ArrayList();
        List<JToken> extra = new ArrayList();
        for (JToken token : tokens) {
            extra.add(token);
            for (JToken beToken : BatchEndToken) {
                if(token.TokenTypeNValueMatch(beToken)){
                    int li = extra.size()-1;
                    extra.add(Ending(extra.get(li)));
                    XATopDown n = new XATopDown(extra);
                    n.ExcAnalisys();
                    Expressions.add(n);
                    extra.clear();
                }
            }
        }
        if(!extra.isEmpty()){
            int li = extra.size()-1;
            extra.add(Ending(extra.get(li)));
            XATopDown n = new XATopDown(extra);
            n.ExcAnalisys();
            Expressions.add(n);
            extra.clear();
        }
        return Expressions;
    }
    private void ExcAnalisys(){
        CTP = 0;
        CurrentToken = TokensList.get(CTP);
        INICIAL();
    }
    private XATopDown(List<JToken> tokens){
        TokensList = new ArrayList();
        TokensList.addAll(tokens);
        CurrentToken = null;
        CTP = -1;
        Error = null;
    }
    
    private void ReadNextToken(Tokens expected, String value){
        if(CurrentToken.TokenTypeNValueMatch(expected, value)){
            CTP++;
            if(CTP < TokensList.size())
                CurrentToken = TokensList.get(CTP);
        }else{
            ERRORTHROW();
            List<JToken> expectedTokens = new ArrayList();
            expectedTokens.add(new JToken(expected,value));
            Error.SetET(expectedTokens);
        }
    }
    private void ERRORTHROW() {
        Error = new JTError(CurrentToken);
    }
    
    //Empiezan los Recursivos
    void INICIAL(){
        INICIALA();
        if(Error == null) FINAL();
    }
    void INICIALA(){
        if(CurrentToken.TokenTypeNValueMatch(Tokens.Reservada,"ALTER")){
            //Alter();
        }
        else if(CurrentToken.TokenTypeNValueMatch(Tokens.Reservada,"CREATE")){
            //Alter();
        }
        else if(CurrentToken.TokenTypeNValueMatch(Tokens.Reservada,"DELETE")){
            //Alter();
        }
        else if(CurrentToken.TokenTypeNValueMatch(Tokens.Reservada,"DROP")){
            Drop();
        }
        else if(CurrentToken.TokenTypeNValueMatch(Tokens.Reservada,"INSERT")){
            //Alter();
        }
        else if(CurrentToken.TokenTypeNValueMatch(Tokens.Reservada,"SELECT")){
            //Select();
        }
        else if(CurrentToken.TokenTypeNValueMatch(Tokens.Reservada,"TRUNCATE")){
            //Alter();
        }
        else if(CurrentToken.TokenTypeNValueMatch(Tokens.Reservada,"UPDATE")){
            //Alter();
        }else{
            ERRORTHROW();
            List<JToken> expectedTokens = new ArrayList();
            expectedTokens.add(new JToken(Tokens.Reservada,"ALTER"));
            expectedTokens.add(new JToken(Tokens.Reservada,"CREATE"));
            expectedTokens.add(new JToken(Tokens.Reservada,"DELETE"));
            expectedTokens.add(new JToken(Tokens.Reservada,"DROP"));
            expectedTokens.add(new JToken(Tokens.Reservada,"INSERT"));
            expectedTokens.add(new JToken(Tokens.Reservada,"SELECT"));
            expectedTokens.add(new JToken(Tokens.Reservada,"TRUNCATE"));
            expectedTokens.add(new JToken(Tokens.Reservada,"UPDATE"));
            Error.SetET(expectedTokens);
        }
        
    }
    void FINAL(){
        if(CurrentToken.TokenTypeNValueMatch(Tokens.PYC,null)){
            ReadNextToken(Tokens.PYC, null);
        }
        else if(CurrentToken.TokenTypeNValueMatch(Tokens.Reservada ,"GO")){
            ReadNextToken(Tokens.Reservada ,"GO");
        }
        else{
            ERRORTHROW();
            List<JToken> expectedTokens = new ArrayList();
            expectedTokens.add(new JToken(Tokens.PYC,null));
            expectedTokens.add(new JToken(Tokens.Reservada ,"GO"));
            Error.SetET(expectedTokens);
        }
    }
    
    void ID(){
        if(CurrentToken.TokenTypeNValueMatch(Tokens.Identificador, null)){
            ReadNextToken(Tokens.Identificador, null);
        }else if(CurrentToken.TokenTypeNValueMatch(Tokens.OperadorAgrupador, "[" )){
            ReadNextToken(Tokens.OperadorAgrupador, "[");
            if(Error == null) ReadNextToken(Tokens.Identificador, null);
            if(Error == null) ReadNextToken(Tokens.OperadorAgrupador, "]");
        }
        else{
            ERRORTHROW();
            List<JToken> expectedTokens = new ArrayList();
            expectedTokens.add(new JToken(Tokens.Identificador, null));
            expectedTokens.add(new JToken(Tokens.OperadorAgrupador, "["));
            Error.SetET(expectedTokens);
        }
    }
    void Object2(){
        ID();
        if(Error == null) Object2a();
    }
    void Object2a(){
        if(CurrentToken.TokenTypeNValueMatch(Tokens.Punto,null)){
            ReadNextToken(Tokens.Punto, null);
            if(Error == null) ID();
        }
    }
    void Object3(){
        ID();
        Object3a();
    }
    void Object3a(){
        if(CurrentToken.TokenTypeNValueMatch(Tokens.Punto,null)){
            ReadNextToken(Tokens.Punto, null);
            if(Error == null) Object2();
        }
    }
    void IFE(){
        if(CurrentToken.TokenTypeNValueMatch(Tokens.Reservada, "IF")){
            ReadNextToken(Tokens.Reservada, "IF");
            if(Error == null) ReadNextToken(Tokens.Reservada, "EXISTS");
        }
    }
    
    //TIPO DE DATO
    void TIPO_DATO(){
        TIPO_DATOA();
        TIPO_DATOB();
    }
    void TIPO_DATOA(){
        if(CurrentToken.TokenTypeNValueMatch(Tokens.TipoDatoBin, null)){
            ReadNextToken(Tokens.TipoDatoBin, null);
        }
        else if(CurrentToken.TokenTypeNValueMatch(Tokens.TipoDatoBit, null)){
            ReadNextToken(Tokens.TipoDatoBit, null);
        }
        else if(CurrentToken.TokenTypeNValueMatch(Tokens.TipoDatoChars, null)){
            ReadNextToken(Tokens.TipoDatoChars, null);
        }
        else if(CurrentToken.TokenTypeNValueMatch(Tokens.TipoDatoDecimalAprox, null)){
            ReadNextToken(Tokens.TipoDatoDecimalAprox, null);
        }
        else if(CurrentToken.TokenTypeNValueMatch(Tokens.TipoDatoDecimalExacto, null)){
            ReadNextToken(Tokens.TipoDatoDecimalExacto, null);
        }
        else if(CurrentToken.TokenTypeNValueMatch(Tokens.TipoDatoEntero, null)){
            ReadNextToken(Tokens.TipoDatoEntero, null);
        }
        else if(CurrentToken.TokenTypeNValueMatch(Tokens.TipoDatoFechaHora, null)){
            ReadNextToken(Tokens.TipoDatoFechaHora, null);
        }
        else if(CurrentToken.TokenTypeNValueMatch(Tokens.TipoDatoOtro, null)){
            ReadNextToken(Tokens.TipoDatoOtro, null);
        }
        else if(CurrentToken.TokenTypeNValueMatch(Tokens.TipoDatoUnicode, null)){
            ReadNextToken(Tokens.TipoDatoUnicode, null);
        }
        else{
            ERRORTHROW();
            List<JToken> expectedTokens = new ArrayList();
            expectedTokens.add(new JToken(Tokens.TipoDatoBin, null));
            expectedTokens.add(new JToken(Tokens.TipoDatoBit, null));
            expectedTokens.add(new JToken(Tokens.TipoDatoChars, null));
            expectedTokens.add(new JToken(Tokens.TipoDatoDecimalAprox, null));
            expectedTokens.add(new JToken(Tokens.TipoDatoDecimalExacto, null));
            expectedTokens.add(new JToken(Tokens.TipoDatoEntero, null));
            expectedTokens.add(new JToken(Tokens.TipoDatoFechaHora, null));
            expectedTokens.add(new JToken(Tokens.TipoDatoOtro, null));
            expectedTokens.add(new JToken(Tokens.TipoDatoUnicode, null));
            Error.SetET(expectedTokens);
        }
    }
    void TIPO_DATOB(){
        if(CurrentToken.TokenTypeNValueMatch(Tokens.OperadorAgrupador, "(")){
            ReadNextToken(Tokens.OperadorAgrupador, "(");
            if(Error == null) ReadNextToken(Tokens.Entero, null);
            if(Error == null) TIPO_DATOC();
            if(Error == null) ReadNextToken(Tokens.OperadorAgrupador, ")");
        }
    }
    void TIPO_DATOC(){
        if(CurrentToken.TokenTypeNValueMatch(Tokens.Coma, null)){
            ReadNextToken(Tokens.Coma,null);
            if(Error == null) ReadNextToken(Tokens.Entero, null);
        }
    }
    
    //DROP
    void Drop(){
        ReadNextToken(Tokens.Reservada, "DROP");
        if(Error == null) DropA();
    }
    void DropA(){
        if(CurrentToken.TokenTypeNValueMatch(Tokens.Reservada, "TABLE")){
            DropTable();
        }
        else if(CurrentToken.TokenTypeNValueMatch(Tokens.Reservada, "USER")){
            DropLogin();
        }
        else if(CurrentToken.TokenTypeNValueMatch(Tokens.Reservada, "DATABASE")){
            DropDatabase();
        }
        else if(CurrentToken.TokenTypeNValueMatch(Tokens.Reservada, "VIEW")){
            DropView();
        }
        else if(CurrentToken.TokenTypeNValueMatch(Tokens.Reservada, "INDEX")){
            DropIndex();
        }
        else{
            ERRORTHROW();
            List<JToken> expectedTokens = new ArrayList();
            expectedTokens.add(new JToken(Tokens.Reservada,"TABLE"));
            expectedTokens.add(new JToken(Tokens.Reservada,"USER"));
            expectedTokens.add(new JToken(Tokens.Reservada,"DATABASE"));
            expectedTokens.add(new JToken(Tokens.Reservada,"VIEW"));
            expectedTokens.add(new JToken(Tokens.Reservada,"INDEX"));
            Error.SetET(expectedTokens);
        }
    }
    //DROP TABLE
    void DropTable(){
        ReadNextToken(Tokens.Reservada, "TABLE");
        if(Error == null) IFE();
        if(Error == null) Object3();
        if(Error == null) DropTableA();
    }
    void DropTableA(){
        if(CurrentToken.TokenTypeNValueMatch(Tokens.Coma, null)){
            ReadNextToken(Tokens.Coma,null);
            if(Error == null) Object3();
            if(Error == null) DropTableA();
        }
    }
    //DROP LOGIN
    void DropLogin(){
        ReadNextToken(Tokens.Reservada, "USER");
        if(Error == null) IFE();
        if(Error == null) ReadNextToken(Tokens.Identificador, null);
    }
    //DROP DATABASE
    void DropDatabase(){
        ReadNextToken(Tokens.Reservada, "DATABASE");
        if(Error == null) IFE();
        if(Error == null) ID();
        if(Error == null) DropDatabaseA();
    }
    void DropDatabaseA(){
        if(CurrentToken.TokenTypeNValueMatch(Tokens.Coma, null)){
            ReadNextToken(Tokens.Coma,null);
            if(Error == null) ID();
            if(Error == null) DropDatabaseA();
        }
    }
    //DROP VIEW
    void DropView(){
        ReadNextToken(Tokens.Reservada, "VIEW");
        if(Error == null) IFE();
        if(Error == null) Object2();
        if(Error == null) DropViewA();
    }
    void DropViewA(){
        if(CurrentToken.TokenTypeNValueMatch(Tokens.Coma, null)){
            ReadNextToken(Tokens.Coma,null);
            if(Error == null) Object2();
            if(Error == null) DropViewA();
        }
    }
    //DROP INDEX
    void DropIndex(){
        ReadNextToken(Tokens.Reservada, "INDEX");
        if(Error == null) IFE();
        if(Error == null) DropIndexA();
        if(Error == null) Object3();
        if(Error == null) DropIndexB();
    }
    void DropIndexA(){
        if(
            CurrentToken.TokenTypeNValueMatch(Tokens.Identificador, null)
            || CurrentToken.TokenTypeNValueMatch(Tokens.OperadorAgrupador, "[" )
          ){
            ID();
            if(Error == null) ReadNextToken(Tokens.Reservada, "ON");
        }
    }
    void DropIndexB(){
        if(CurrentToken.TokenTypeNValueMatch(Tokens.Coma, null)){
            ReadNextToken(Tokens.Coma,null);
            if(Error == null) DropIndexA();
            if(Error == null) Object3();
            if(Error == null) DropIndexB();
        }
    }
}
