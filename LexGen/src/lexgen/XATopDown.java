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
    private JToken CTok;
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
    private void ResetPosition(int resetPos){
        CTP = resetPos;
        CTok = TokensList.get(CTP);
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
        CTok = TokensList.get(CTP);
        Inicial();
    }
    private XATopDown(List<JToken> tokens){
        TokensList = new ArrayList();
        TokensList.addAll(tokens);
        CTok = null;
        CTP = -1;
        Error = null;
    }
    
    private void ReadNext(Tokens expected, String value){
        if(CTok.TNVMatch(expected, value)){
            CTP++;
            if(CTP < TokensList.size())
                CTok = TokensList.get(CTP);
        }else{
            ERRORTHROW();
            List<JToken> expectedTokens = new ArrayList();
            expectedTokens.add(new JToken(expected,value));
            Error.SetET(expectedTokens);
        }
    }
    private void ERRORTHROW() {
        Error = new JTError(CTok);
    }
    
    //De uso comun
    boolean IDfirst(){
        return
                CTok.TNVMatch(Tokens.Identificador, null)
                || CTok.TNVMatch(Tokens.OperadorAgrupador, "[" );
    }
    
    //Empiezan los Recursivos
    void Inicial(){
        InicialA();
        if(Error == null) Final();
    }
    void InicialA(){
        if(CTok.TNVMatch(Tokens.Reservada,"ALTER")){
            //Alter();
        }
        else if(CTok.TNVMatch(Tokens.Reservada,"CREATE")){
            //Alter();
        }
        else if(CTok.TNVMatch(Tokens.Reservada,"DELETE")){
            //Alter();
        }
        else if(CTok.TNVMatch(Tokens.Reservada,"DROP")){
            Drop();
        }
        else if(CTok.TNVMatch(Tokens.Reservada,"INSERT")){
            //Alter();
        }
        else if(CTok.TNVMatch(Tokens.Reservada,"SELECT")){
            //Select();
        }
        else if(CTok.TNVMatch(Tokens.Reservada,"TRUNCATE")){
            Truncate();
        }
        else if(CTok.TNVMatch(Tokens.Reservada,"UPDATE")){
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
    void Final(){
        if(CTok.TNVMatch(Tokens.PYC,null)){
            ReadNext(Tokens.PYC, null);
        }
        else if(CTok.TNVMatch(Tokens.Reservada ,"GO")){
            ReadNext(Tokens.Reservada ,"GO");
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
        if(CTok.TNVMatch(Tokens.Identificador, null)){
            ReadNext(Tokens.Identificador, null);
        }else if(CTok.TNVMatch(Tokens.OperadorAgrupador, "[" )){
            ReadNext(Tokens.OperadorAgrupador, "[");
            if(Error == null) ReadNext(Tokens.Identificador, null);
            if(Error == null) ReadNext(Tokens.OperadorAgrupador, "]");
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
        if(Error == null) Object2A();
    }
    void Object2A(){
        if(CTok.TNVMatch(Tokens.Punto,null)){
            ReadNext(Tokens.Punto, null);
            if(Error == null) ID();
        }
    }
    void Object3(){
        ID();
        Object3A();
    }
    void Object3A(){
        if(CTok.TNVMatch(Tokens.Punto,null)){
            ReadNext(Tokens.Punto, null);
            if(Error == null) Object2();
        }
    }
    void IFE(){
        if(CTok.TNVMatch(Tokens.Reservada, "IF")){
            ReadNext(Tokens.Reservada, "IF");
            if(Error == null) ReadNext(Tokens.Reservada, "EXISTS");
        }
    }
    
    //TIPO DE DATO
    void Tipo_dato(){
        Tipo_datoD();
        Tipo_datoB();
    }
    void Tipo_datoD(){
        if(
            CTok.TNVMatch(Tokens.TipoDatoBin, null)
            || CTok.TNVMatch(Tokens.TipoDatoBit, null)
            || CTok.TNVMatch(Tokens.TipoDatoChars, null)
            || CTok.TNVMatch(Tokens.TipoDatoDecimalAprox, null)
            || CTok.TNVMatch(Tokens.TipoDatoDecimalExacto, null)
            || CTok.TNVMatch(Tokens.TipoDatoEntero, null)
            || CTok.TNVMatch(Tokens.TipoDatoFechaHora, null)
            || CTok.TNVMatch(Tokens.TipoDatoOtro, null)
            || CTok.TNVMatch(Tokens.TipoDatoUnicode, null)
          ){
            Tipo_datoA();
        }
        else if(CTok.TNVMatch(Tokens.OperadorAgrupador, "[" )){
            ReadNext(Tokens.OperadorAgrupador, "[" );
            if(Error == null) Tipo_datoA();
            if(Error == null) ReadNext(Tokens.OperadorAgrupador, "]" );
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
            expectedTokens.add(new JToken(Tokens.OperadorAgrupador, "["));
            Error.SetET(expectedTokens);
        }
    }
    void Tipo_datoA(){
        if(CTok.TNVMatch(Tokens.TipoDatoBin, null)){
            ReadNext(Tokens.TipoDatoBin, null);
        }
        else if(CTok.TNVMatch(Tokens.TipoDatoBit, null)){
            ReadNext(Tokens.TipoDatoBit, null);
        }
        else if(CTok.TNVMatch(Tokens.TipoDatoChars, null)){
            ReadNext(Tokens.TipoDatoChars, null);
        }
        else if(CTok.TNVMatch(Tokens.TipoDatoDecimalAprox, null)){
            ReadNext(Tokens.TipoDatoDecimalAprox, null);
        }
        else if(CTok.TNVMatch(Tokens.TipoDatoDecimalExacto, null)){
            ReadNext(Tokens.TipoDatoDecimalExacto, null);
        }
        else if(CTok.TNVMatch(Tokens.TipoDatoEntero, null)){
            ReadNext(Tokens.TipoDatoEntero, null);
        }
        else if(CTok.TNVMatch(Tokens.TipoDatoFechaHora, null)){
            ReadNext(Tokens.TipoDatoFechaHora, null);
        }
        else if(CTok.TNVMatch(Tokens.TipoDatoOtro, null)){
            ReadNext(Tokens.TipoDatoOtro, null);
        }
        else if(CTok.TNVMatch(Tokens.TipoDatoUnicode, null)){
            ReadNext(Tokens.TipoDatoUnicode, null);
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
    void Tipo_datoB(){
        if(CTok.TNVMatch(Tokens.OperadorAgrupador, "(")){
            ReadNext(Tokens.OperadorAgrupador, "(");
            if(Error == null) ReadNext(Tokens.Entero, null);
            if(Error == null) Tipo_datoC();
            if(Error == null) ReadNext(Tokens.OperadorAgrupador, ")");
        }
    }
    void Tipo_datoC(){
        if(CTok.TNVMatch(Tokens.Coma, null)){
            ReadNext(Tokens.Coma,null);
            if(Error == null) ReadNext(Tokens.Entero, null);
        }
    }
    
    //DROP
    void Drop(){
        ReadNext(Tokens.Reservada, "DROP");
        if(Error == null) DropA();
    }
    void DropA(){
        if(CTok.TNVMatch(Tokens.Reservada, "TABLE")){
            DropTable();
        }
        else if(CTok.TNVMatch(Tokens.Reservada, "USER")){
            DropUser();
        }
        else if(CTok.TNVMatch(Tokens.Reservada, "DATABASE")){
            DropDatabase();
        }
        else if(CTok.TNVMatch(Tokens.Reservada, "VIEW")){
            DropView();
        }
        else if(CTok.TNVMatch(Tokens.Reservada, "INDEX")){
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
        ReadNext(Tokens.Reservada, "TABLE");
        if(Error == null) IFE();
        if(Error == null) Object3();
        if(Error == null) DropTableA();
    }
    void DropTableA(){
        if(CTok.TNVMatch(Tokens.Coma, null)){
            ReadNext(Tokens.Coma,null);
            if(Error == null) Object3();
            if(Error == null) DropTableA();
        }
    }
    //DROP USER
    void DropUser(){
        ReadNext(Tokens.Reservada, "USER");
        if(Error == null) IFE();
        if(Error == null) ReadNext(Tokens.Identificador, null);
    }
    //DROP DATABASE
    void DropDatabase(){
        ReadNext(Tokens.Reservada, "DATABASE");
        if(Error == null) IFE();
        if(Error == null) ID();
        if(Error == null) DropDatabaseA();
    }
    void DropDatabaseA(){
        if(CTok.TNVMatch(Tokens.Coma, null)){
            ReadNext(Tokens.Coma,null);
            if(Error == null) ID();
            if(Error == null) DropDatabaseA();
        }
    }
    //DROP VIEW
    void DropView(){
        ReadNext(Tokens.Reservada, "VIEW");
        if(Error == null) IFE();
        if(Error == null) Object2();
        if(Error == null) DropViewA();
    }
    void DropViewA(){
        if(CTok.TNVMatch(Tokens.Coma, null)){
            ReadNext(Tokens.Coma,null);
            if(Error == null) Object2();
            if(Error == null) DropViewA();
        }
    }
    //DROP INDEX
    void DropIndex(){
        ReadNext(Tokens.Reservada, "INDEX");
        if(Error == null) IFE();
        if(Error == null) DropIndexA();
        if(Error == null) Object3();
        if(Error == null) DropIndexB();
    }
    void DropIndexA(){
        if(IDfirst()){
            ID();
            if(Error == null) ReadNext(Tokens.Reservada, "ON");
        }
    }
    void DropIndexB(){
        if(CTok.TNVMatch(Tokens.Coma, null)){
            ReadNext(Tokens.Coma,null);
            if(Error == null) DropIndexA();
            if(Error == null) Object3();
            if(Error == null) DropIndexB();
        }
    }
    
    //TRUNCATE
    void Truncate(){
        ReadNext(Tokens.Reservada, "TRUNCATE");
        if(Error == null) ReadNext(Tokens.Reservada, "TABLE");
        if(Error == null) Object3();
    }
    
    //ALIAS
    void Alias(){
        if(CTok.TNVMatch(Tokens.Reservada,"AS")){
            AliasA();
        }else if(IDfirst()){
            AliasA();
        }
    }
    void AliasA(){
        if(IDfirst()){
            ID();
        }else if(CTok.TNVMatch(Tokens.Varchar,null)){
            ReadNext(Tokens.Varchar, null);
        }else{
            ERRORTHROW();
            List<JToken> expectedTokens = new ArrayList();
            expectedTokens.add(new JToken(Tokens.Identificador,null));
            expectedTokens.add(new JToken(Tokens.OperadorAgrupador,"["));
            expectedTokens.add(new JToken(Tokens.Varchar,null));
            Error.SetET(expectedTokens);
        }
    }
    
    //EXPRESION
    void Expresion(){
        ExpresionB();
        if(Error == null) ExpresionA();
    }
    void ExpresionA(){
        if(CTok.TNVMatch(Tokens.OperadorAritmetico, "+")){
            ReadNext(Tokens.OperadorAritmetico,"+");
            if(Error == null) ExpresionB();
            if(Error == null) ExpresionA();
        }else if(CTok.TNVMatch(Tokens.OperadorAritmetico, "-")){
            ReadNext(Tokens.OperadorAritmetico,"-");
            if(Error == null) ExpresionB();
            if(Error == null) ExpresionA();
        }
    }
    void ExpresionB(){
        ExpresionD();
        if(Error == null) ExpresionC();
    }
    void ExpresionC(){
        if(CTok.TNVMatch(Tokens.OperadorAritmetico, "*")){
            ReadNext(Tokens.OperadorAritmetico,"*");
            if(Error == null) ExpresionD();
            if(Error == null) ExpresionC();
        }else if(CTok.TNVMatch(Tokens.OperadorAritmetico, "/")){
            ReadNext(Tokens.OperadorAritmetico,"/");
            if(Error == null) ExpresionD();
            if(Error == null) ExpresionC();
        }
    }
    void ExpresionD(){
        if(CTok.TNVMatch(Tokens.OperadorAgrupador, "(")){
            ReadNext(Tokens.OperadorAritmetico,"(");
            if(Error == null) Expresion();
            if(Error == null) ReadNext(Tokens.OperadorAritmetico,")");
        }else if(
                IDfirst()
                || CTok.TNVMatch(Tokens.Entero, null)
                || CTok.TNVMatch(Tokens.Flotante , null)
                || CTok.TNVMatch(Tokens.Varchar, null)
                ){
            ExpresionE();
        }else{
            ERRORTHROW();
            List<JToken> expectedTokens = new ArrayList();
            expectedTokens.add(new JToken(Tokens.OperadorAgrupador,"("));
            expectedTokens.add(new JToken(Tokens.Identificador,null));
            expectedTokens.add(new JToken(Tokens.OperadorAgrupador,"["));
            expectedTokens.add(new JToken(Tokens.Varchar,null));
            expectedTokens.add(new JToken(Tokens.Entero,null));
            expectedTokens.add(new JToken(Tokens.Flotante,null));
            Error.SetET(expectedTokens);
        }
    }
    void ExpresionE(){
        if(IDfirst()){
            Object2();
        }else if(CTok.TNVMatch(Tokens.Entero, null)){
            ReadNext(Tokens.Entero,null);
        }else if(CTok.TNVMatch(Tokens.Flotante, null)){
            ReadNext(Tokens.Flotante,null);
        }else if(CTok.TNVMatch(Tokens.Varchar, null)){
            ReadNext(Tokens.Varchar,null);
        }else{
            ERRORTHROW();
            List<JToken> expectedTokens = new ArrayList();
            expectedTokens.add(new JToken(Tokens.Identificador,null));
            expectedTokens.add(new JToken(Tokens.OperadorAgrupador,"["));
            expectedTokens.add(new JToken(Tokens.Varchar,null));
            expectedTokens.add(new JToken(Tokens.Entero,null));
            expectedTokens.add(new JToken(Tokens.Flotante,null));
            Error.SetET(expectedTokens);
        }
    }
    void Expresiones(){
        if(CTok.TNVMatch(Tokens.Coma, null)){
            ReadNext(Tokens.Coma, null);
            if(Error == null) Expresion();
            if(Error == null) Expresiones();
        }
    }
    
    //NOT()
    void Not(){
        if(CTok.TNVMatch(Tokens.Reservada, "NOT")){
            ReadNext(Tokens.Reservada, "NOT");
        }
    }
    
    //Search Condition
    void SearchCondition(){
        if(
                CTok.TNVMatch(Tokens.Reservada, "NOT")
                ||IDfirst()
                || CTok.TNVMatch(Tokens.Entero, null)
                || CTok.TNVMatch(Tokens.Flotante , null)
                || CTok.TNVMatch(Tokens.Varchar, null)
                ){
            Not();
            if(Error == null) Predicado();
            if(Error == null) SearchConditionA();
        }
        else if(CTok.TNVMatch(Tokens.OperadorAgrupador, "(")){
            int index = CTP;
            
            Predicado();
            if(Error == null) SearchConditionA();
            
            else{
                JTError tmp = null;
                Error.copyTo(tmp);
                
                Error = null;
                ResetPosition(index);
                
                CTok.TNVMatch(Tokens.OperadorAgrupador, "(");
                if(Error == null) SearchCondition();
                if(Error == null) CTok.TNVMatch(Tokens.OperadorAgrupador, ")");
                if(Error == null) SearchConditionA();
            }
        }else{
            
        }
    }
    void SearchConditionA(){
        if(CTok.TNVMatch(Tokens.Reservada, "AND")){
            ReadNext(Tokens.Reservada, "AND");
            if (Error == null) SearchCondition();
            if (Error == null) SearchConditionA();
        }else if(CTok.TNVMatch(Tokens.Reservada, "OR")){
            ReadNext(Tokens.Reservada, "OR");
            if (Error == null) SearchCondition();
            if (Error == null) SearchConditionA();
        }
    }
    void Predicado(){
        Expresion();
        if (Error == null) PredicadoA();
    }
    void PredicadoA(){
        if(CTok.TNVMatch(Tokens.OperadorLogico, null)){
            ReadNext(Tokens.OperadorLogico, null);
            if(Error == null) Expresion();
        }
        else if(CTok.TNVMatch(Tokens.Reservada, "IS")){
            ReadNext(Tokens.Reservada, "IS");
            if(Error == null) Not();
            if(Error == null) ReadNext(Tokens.Reservada , "NULL");
        }else if(
                CTok.TNVMatch(Tokens.Reservada, "NOT")
                || CTok.TNVMatch(Tokens.Reservada, "IN")
                || CTok.TNVMatch(Tokens.Reservada, "BETWEEN")
                || CTok.TNVMatch(Tokens.Reservada, "LIKE")
                ){
            Not();
            if(Error == null) PredicadoC();
        }else{
            ERRORTHROW();
            List<JToken> expectedTokens = new ArrayList();
            expectedTokens.add(new JToken(Tokens.OperadorLogico, null));
            expectedTokens.add(new JToken(Tokens.Reservada, "IS"));
            expectedTokens.add(new JToken(Tokens.Reservada, "NOT"));
            expectedTokens.add(new JToken(Tokens.Reservada, "IN"));
            expectedTokens.add(new JToken(Tokens.Reservada, "BETWEEN"));
            expectedTokens.add(new JToken(Tokens.Reservada, "LIKE"));
            Error.SetET(expectedTokens);
        }
    }
    void PredicadoC(){
        if(CTok.TNVMatch(Tokens.Reservada, "IN")){
            ReadNext(Tokens.Reservada, "IN");
            if(Error == null) ReadNext(Tokens.OperadorAgrupador, "(");
            if(Error == null) Expresion();
            if(Error == null) Expresiones();
            if(Error == null) ReadNext(Tokens.OperadorAgrupador, ")");
        }
        else if(CTok.TNVMatch(Tokens.Reservada, "BETWEEN")){
            ReadNext(Tokens.Reservada, "BETWEEN");
            if(Error == null) Expresion();
            if(Error == null) ReadNext(Tokens.Reservada , "AND");
            if(Error == null) Expresion();
        }else if(CTok.TNVMatch(Tokens.Reservada, "LIKE")){
            ReadNext(Tokens.Reservada, "LIKE");
            if(Error == null) Expresion();
        }else{
            ERRORTHROW();
            List<JToken> expectedTokens = new ArrayList();
            expectedTokens.add(new JToken(Tokens.Reservada, "LIKE"));
            expectedTokens.add(new JToken(Tokens.Reservada, "IN"));
            expectedTokens.add(new JToken(Tokens.Reservada, "BETWEEN"));
            Error.SetET(expectedTokens);
        }
    }
    
    //Where
    void Where(){
        ReadNext(Tokens.Reservada,"WHERE");
        if(Error == null) SearchCondition();
    }
    
    //Expresion con Agregacion
    void ExpresionAgregacion(){
        ExpresionAgregacionB();
        if(Error == null) ExpresionAgregacionA();
    }
    void ExpresionAgregacionA(){
        if(CTok.TNVMatch(Tokens.OperadorAritmetico, "+")){
            ReadNext(Tokens.OperadorAritmetico,"+");
            if(Error == null) ExpresionAgregacionB();
            if(Error == null) ExpresionAgregacionA();
        }else if(CTok.TNVMatch(Tokens.OperadorAritmetico, "-")){
            ReadNext(Tokens.OperadorAritmetico,"-");
            if(Error == null) ExpresionAgregacionB();
            if(Error == null) ExpresionAgregacionA();
        }
    }
    void ExpresionAgregacionB(){
        ExpresionAgregacionD();
        if(Error == null) ExpresionAgregacionC();
    }
    void ExpresionAgregacionC(){
        if(CTok.TNVMatch(Tokens.OperadorAritmetico, "*")){
            ReadNext(Tokens.OperadorAritmetico,"*");
            if(Error == null) ExpresionAgregacionD();
            if(Error == null) ExpresionAgregacionC();
        }else if(CTok.TNVMatch(Tokens.OperadorAritmetico, "/")){
            ReadNext(Tokens.OperadorAritmetico,"/");
            if(Error == null) ExpresionAgregacionD();
            if(Error == null) ExpresionAgregacionC();
        }
    }
    void ExpresionAgregacionD(){
        if(CTok.TNVMatch(Tokens.OperadorAgrupador, "(")){
            ReadNext(Tokens.OperadorAritmetico,"(");
            if(Error == null) ExpresionAgregacion();
            if(Error == null) ReadNext(Tokens.OperadorAritmetico,")");
        }else if(
                IDfirst()
                || CTok.TNVMatch(Tokens.Entero, null)
                || CTok.TNVMatch(Tokens.Flotante , null)
                || CTok.TNVMatch(Tokens.Varchar, null)
                ){
            ExpresionAgregacionE();
        }else{
            ERRORTHROW();
            List<JToken> expectedTokens = new ArrayList();
            expectedTokens.add(new JToken(Tokens.OperadorAgrupador,"("));
            expectedTokens.add(new JToken(Tokens.Identificador,null));
            expectedTokens.add(new JToken(Tokens.OperadorAgrupador,"["));
            expectedTokens.add(new JToken(Tokens.Varchar,null));
            expectedTokens.add(new JToken(Tokens.Entero,null));
            expectedTokens.add(new JToken(Tokens.Flotante,null));
            Error.SetET(expectedTokens);
        }
    }
    void ExpresionAgregacionE(){
        if(
                IDfirst()
                || CTok.TNVMatch(Tokens.Entero, null)
                || CTok.TNVMatch(Tokens.Flotante , null)
                || CTok.TNVMatch(Tokens.Varchar, null)
                ){
            ExpresionE();
        }else if(CTok.TNVMatch(Tokens.Reservada, "SUM")){
            CTok.TNVMatch(Tokens.Reservada, "SUM");
            if(Error == null) CTok.TNVMatch(Tokens.OperadorAgrupador, "(");
            if(Error == null) ExpresionAgregacionF();
        }else if(CTok.TNVMatch(Tokens.Reservada, "AVG")){
            CTok.TNVMatch(Tokens.Reservada, "AVG");
            if(Error == null) CTok.TNVMatch(Tokens.OperadorAgrupador, "(");
            if(Error == null) ExpresionAgregacionF();
        }else if(CTok.TNVMatch(Tokens.Reservada, "MIN")){
            CTok.TNVMatch(Tokens.Reservada, "MIN");
            if(Error == null) CTok.TNVMatch(Tokens.OperadorAgrupador, "(");
            if(Error == null) ExpresionAgregacionF();
        }else if(CTok.TNVMatch(Tokens.Reservada, "MAX")){
            CTok.TNVMatch(Tokens.Reservada, "MAX");
            if(Error == null) CTok.TNVMatch(Tokens.OperadorAgrupador, "(");
            if(Error == null) ExpresionAgregacionF();
        }else{
            ERRORTHROW();
            List<JToken> expectedTokens = new ArrayList();
            expectedTokens.add(new JToken(Tokens.Identificador,null));
            expectedTokens.add(new JToken(Tokens.OperadorAgrupador,"["));
            expectedTokens.add(new JToken(Tokens.Varchar,null));
            expectedTokens.add(new JToken(Tokens.Entero,null));
            expectedTokens.add(new JToken(Tokens.Flotante,null));
            Error.SetET(expectedTokens);
        }
    }
    void ExpresionAgregacionF(){
        if(IDfirst()){
            Object2();
            if(Error == null) CTok.TNVMatch(Tokens.OperadorAgrupador, ")");
        }else if(CTok.TNVMatch(Tokens.Entero, null)){
            CTok.TNVMatch(Tokens.Entero, null);
            if(Error == null) CTok.TNVMatch(Tokens.OperadorAgrupador, ")");
        }else{
            ERRORTHROW();
            List<JToken> expectedTokens = new ArrayList();
            expectedTokens.add(new JToken(Tokens.Identificador,null));
            expectedTokens.add(new JToken(Tokens.OperadorAgrupador,"["));
            expectedTokens.add(new JToken(Tokens.Entero,null));
            Error.SetET(expectedTokens);
        }
    }
    
    //Select Columns
    void SelectColumns(){
        ExpresionAgregacion();
        if(Error == null) Alias();
        if(Error == null) SelectColumnsA();
    }
    void SelectColumnsA(){
        if(CTok.TNVMatch(Tokens.Coma, null)){
            ReadNext(Tokens.Coma, null);
            if(Error == null) ExpresionAgregacion();
            if(Error == null) Alias();
            if(Error == null) SelectColumnsA();
        }
    }
}
