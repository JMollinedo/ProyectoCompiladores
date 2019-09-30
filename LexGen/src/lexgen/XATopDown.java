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
    
    //Class MNF
    //<editor-fold>
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
    //</editor-fold>
    
    //De uso comun
    boolean IDFirst(){
        return CTok.TNVMatch(Tokens.Identificador, null)
                || CTok.TNVMatch(Tokens.OperadorAgrupador, "[" );
    }
    boolean ExpresionFirst(){
        return CTok.TNVMatch(Tokens.Identificador, null)
                || CTok.TNVMatch(Tokens.OperadorAgrupador, "(")
                || CTok.TNVMatch(Tokens.OperadorAgrupador, "[")
                || CTok.TNVMatch(Tokens.Varchar, null)
                || CTok.TNVMatch(Tokens.Entero, null)
                || CTok.TNVMatch(Tokens.Flotante, null)
                || CTok.TNVMatch(Tokens.Reservada, "NULL")
                || CTok.TNVMatch(Tokens.Reservada, "SUM")
                || CTok.TNVMatch(Tokens.Reservada, "AVG")
                || CTok.TNVMatch(Tokens.Reservada, "MIN")
                || CTok.TNVMatch(Tokens.Reservada, "MAX")
                || CTok.TNVMatch(Tokens.Reservada, "COUNT");
    }
    
    //Empiezan los Recursivos
    void Inicial(){
        InicialA();
        if(Error == null) Final();
    }
    void InicialA(){
        if(CTok.TNVMatch(Tokens.Reservada,"SELECT")){
            //Select();
        }else if(CTok.TNVMatch(Tokens.Reservada,"INSERT")){
            //Insert();
        }else if(CTok.TNVMatch(Tokens.Reservada,"DELETE")){
            //Delete();
        }else if(CTok.TNVMatch(Tokens.Reservada,"UPDATE")){
            //Update();
        }else if(CTok.TNVMatch(Tokens.Reservada,"CREATE")){
            //Create();
        }else if(CTok.TNVMatch(Tokens.Reservada,"ALTER")){
            //After();
        }else if(CTok.TNVMatch(Tokens.Reservada,"DROP")){
            //Drop();
        }else if(CTok.TNVMatch(Tokens.Reservada,"TRUNCATE")){
            //Truncate();
        }else{
            ERRORTHROW();
            List<JToken> expectedTokens = new ArrayList();
            expectedTokens.add(new JToken(Tokens.Reservada,"SELECT"));
            expectedTokens.add(new JToken(Tokens.Reservada,"INSERT"));
            expectedTokens.add(new JToken(Tokens.Reservada,"DELETE"));
            expectedTokens.add(new JToken(Tokens.Reservada,"UPDATE"));
            expectedTokens.add(new JToken(Tokens.Reservada,"CREATE"));
            expectedTokens.add(new JToken(Tokens.Reservada,"ALTER"));
            expectedTokens.add(new JToken(Tokens.Reservada,"DROP"));
            expectedTokens.add(new JToken(Tokens.Reservada,"TRUNCATE"));
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
    
    //ID , Objects , Alias
    //<editor-fold>
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
    void Object4(){
        ID();
        Object4A();
    }
    void Object4A(){
        if(CTok.TNVMatch(Tokens.Punto,null)){
            ReadNext(Tokens.Punto, null);
            if(Error == null) Object3();
        }
    }
    void IFE(){
        if(CTok.TNVMatch(Tokens.Reservada, "IF")){
            ReadNext(Tokens.Reservada, "IF");
            if(Error == null) ReadNext(Tokens.Reservada, "EXISTS");
        }
    }
    void Alias(){
        if(CTok.TNVMatch(Tokens.Reservada,"AS")){
            ReadNext(Tokens.Reservada,"AS");
            AliasA();
        }else if(IDFirst()
                || CTok.TNVMatch(Tokens.Varchar, null)
                ){
            AliasA();
        }
    }
    void AliasA(){
        if(IDFirst()){
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
    //</editor-fold>
    
    //TIPO DE DATO
    //<editor-fold>
    void Tipo_dato(){
        Tipo_datoD();
        if(Error == null) Tipo_datoB();
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
    //</editor-fold>
    
    //DROP
    //<editor-fold>
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
        if(Error == null) ID();
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
        if(Error == null) DropIndexB();
    }
    void DropIndexA(){
        ID();
        if(Error == null) ReadNext(Tokens.Reservada, "ON");
        if(Error == null) Object3();
    }
    void DropIndexB(){
        if(CTok.TNVMatch(Tokens.Coma, null)){
            ReadNext(Tokens.Coma,null);
            if(Error == null) DropIndexA();
            if(Error == null) DropIndexB();
        }
    }
    //</editor-fold>
    
    //TRUNCATE
    void Truncate(){
        ReadNext(Tokens.Reservada, "TRUNCATE");
        if(Error == null) ReadNext(Tokens.Reservada, "TABLE");
        if(Error == null) Object3();
    }
    
    //EXPRESION
    //<editor-fold>
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
                IDFirst()
                || CTok.TNVMatch(Tokens.Entero, null)
                || CTok.TNVMatch(Tokens.Flotante , null)
                || CTok.TNVMatch(Tokens.Varchar, null)
                || CTok.TNVMatch(Tokens.Reservada, "NULL")
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
            expectedTokens.add(new JToken(Tokens.Reservada,"NULL"));
            Error.SetET(expectedTokens);
        }
    }
    void ExpresionE(){
        if(IDFirst()){
            Object4();
        }else if(CTok.TNVMatch(Tokens.Entero, null)){
            ReadNext(Tokens.Entero,null);
        }else if(CTok.TNVMatch(Tokens.Flotante, null)){
            ReadNext(Tokens.Flotante,null);
        }else if(CTok.TNVMatch(Tokens.Varchar, null)){
            ReadNext(Tokens.Varchar,null);
        }else if(CTok.TNVMatch(Tokens.Reservada,"NULL")){
            ReadNext(Tokens.Reservada,"NULL");
        }else if(CTok.TNVMatch(Tokens.Reservada,"SUM")){
            ReadNext(Tokens.Reservada,"SUM");
            if(Error == null) ReadNext(Tokens.Reservada,"(");
            if(Error == null) ExpresionF();
        }else if(CTok.TNVMatch(Tokens.Reservada,"AVG")){
            ReadNext(Tokens.Reservada,"AVG");
            if(Error == null) ReadNext(Tokens.Reservada,"(");
            if(Error == null) ExpresionF();
        }else if(CTok.TNVMatch(Tokens.Reservada,"MIN")){
            ReadNext(Tokens.Reservada,"MIN");
            if(Error == null) ReadNext(Tokens.Reservada,"(");
            if(Error == null) ExpresionF();
        }else if(CTok.TNVMatch(Tokens.Reservada,"MAX")){
            ReadNext(Tokens.Reservada,"MAX");
            if(Error == null) ReadNext(Tokens.Reservada,"(");
            if(Error == null) ExpresionF();
        }else if(CTok.TNVMatch(Tokens.Reservada,"COUNT")){
            ReadNext(Tokens.Reservada,"COUNT");
            if(Error == null) ReadNext(Tokens.Reservada,"(");
            if(Error == null) ExpresionF();
        }else{
            ERRORTHROW();
            List<JToken> expectedTokens = new ArrayList();
            expectedTokens.add(new JToken(Tokens.Identificador,null));
            expectedTokens.add(new JToken(Tokens.OperadorAgrupador,"["));
            expectedTokens.add(new JToken(Tokens.Varchar,null));
            expectedTokens.add(new JToken(Tokens.Entero,null));
            expectedTokens.add(new JToken(Tokens.Flotante,null));
            expectedTokens.add(new JToken(Tokens.Reservada,"NULL"));
            expectedTokens.add(new JToken(Tokens.Reservada,"SUM"));
            expectedTokens.add(new JToken(Tokens.Reservada,"AVG"));
            expectedTokens.add(new JToken(Tokens.Reservada,"MIN"));
            expectedTokens.add(new JToken(Tokens.Reservada,"MAX"));
            expectedTokens.add(new JToken(Tokens.Reservada,"COUNT"));
            Error.SetET(expectedTokens);
        }
    }
    void ExpresionF(){
        if(IDFirst()){
            Object4();
            if(Error == null) ReadNext(Tokens.Reservada,")");
        }else if(CTok.TNVMatch(Tokens.Entero, null)){
            ReadNext(Tokens.Entero,null);
            if(Error == null) ReadNext(Tokens.Reservada,")");
        }else{
            ERRORTHROW();
            List<JToken> expectedTokens = new ArrayList();
            expectedTokens.add(new JToken(Tokens.Identificador,null));
            expectedTokens.add(new JToken(Tokens.OperadorAgrupador,"["));
            expectedTokens.add(new JToken(Tokens.Entero,null));
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
    //</editor-fold>
    
    //NOT()
    void Not(){
        if(CTok.TNVMatch(Tokens.Reservada, "NOT")){
            ReadNext(Tokens.Reservada, "NOT");
        }
    }
    
    //TOP()
    void Top(){
        if(CTok.TNVMatch(Tokens.Reservada, "TOP")){
            ReadNext(Tokens.Reservada,"TOP");
            if(Error == null) ReadNext(Tokens.OperadorAgrupador,"(");
            if(Error == null) ReadNext(Tokens.Entero,null);
            if(Error == null) ReadNext(Tokens.OperadorAgrupador,")");
            if(Error == null) TopA();
        }
    }
    void TopA(){
        if(CTok.TNVMatch(Tokens.Reservada, "PERCENT")){
            ReadNext(Tokens.Reservada,"PERCENT");
        }
    }
    
    //Search Condition
    //<editor-fold>
    void SearchCondition(){
        if(
                CTok.TNVMatch(Tokens.Reservada, "NOT")
                ||(ExpresionFirst() && !CTok.TNVMatch(Tokens.OperadorAgrupador, "(") )
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
            ERRORTHROW();
            List<JToken> expectedTokens = new ArrayList();
            expectedTokens.add(new JToken(Tokens.OperadorAgrupador,"("));
            expectedTokens.add(new JToken(Tokens.Identificador,null));
            expectedTokens.add(new JToken(Tokens.OperadorAgrupador,"["));
            expectedTokens.add(new JToken(Tokens.Varchar,null));
            expectedTokens.add(new JToken(Tokens.Entero,null));
            expectedTokens.add(new JToken(Tokens.Flotante,null));
            expectedTokens.add(new JToken(Tokens.Reservada,"NULL"));
            expectedTokens.add(new JToken(Tokens.Reservada,"SUM"));
            expectedTokens.add(new JToken(Tokens.Reservada,"AVG"));
            expectedTokens.add(new JToken(Tokens.Reservada,"MIN"));
            expectedTokens.add(new JToken(Tokens.Reservada,"MAX"));
            expectedTokens.add(new JToken(Tokens.Reservada,"COUNT"));
            Error.SetET(expectedTokens);
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
    //</editor-fold>
    
    //Where
    void Where(){
        if(CTok.TNVMatch(Tokens.Reservada,"WHERE")){
            ReadNext(Tokens.Reservada,"WHERE");
            if(Error == null) SearchCondition();
        }
    }
        
    //Select Columns
    void SelectColumns(){
        Expresion();
        if(Error == null) Alias();
        if(Error == null) SelectColumnsA();
    }
    void SelectColumnsA(){
        if(CTok.TNVMatch(Tokens.Coma, null)){
            ReadNext(Tokens.Coma, null);
            if(Error == null) Expresion();
            if(Error == null) Alias();
            if(Error == null) SelectColumnsA();
        }
    }
    
    //ColumnList
    void ColumnList(){
        ReadNext(Tokens.OperadorAgrupador,"(");
        if(Error == null) ColumnListA();
        ReadNext(Tokens.OperadorAgrupador,")");
    }
    void ColumnListA(){
        ID();
        ColumnListB();
    }
    void ColumnListB(){
        if(CTok.TNVMatch(Tokens.Coma, null)){
            ReadNext(Tokens.Coma, null);
            if(Error == null) ID();
            if(Error == null) ColumnListB();
        }
    }
    
    //Select
    //<editor-fold>
    void Select(){
        ReadNext(Tokens.Reservada,"SELECT");
        if(Error == null) SelectA();
        if(Error == null) Top();
        if(Error == null) SelectColumns();
        if(Error == null) FromSelect();
        if(Error == null) Where();
        if(Error == null) Group();
        if(Error == null) Having();
        if(Error == null) Order();
    }
    void SelectA(){
        if(CTok.TNVMatch(Tokens.Reservada, "ALL")){
            ReadNext(Tokens.Reservada,"ALL");
        }else if(CTok.TNVMatch(Tokens.Reservada, "DISTINCT")){
            ReadNext(Tokens.Reservada,"DISTINCT");
        }
    }
    void Having(){
        if(CTok.TNVMatch(Tokens.Reservada, "HAVING")){
            ReadNext(Tokens.Reservada,"HAVING");
            if(Error == null) SearchCondition();
        }
    }
    void Order(){
        if(CTok.TNVMatch(Tokens.Reservada, "ORDER")){
            ReadNext(Tokens.Reservada,"ORDER");
            if(Error == null) ReadNext(Tokens.Reservada,"BY");
            if(Error == null) ExpresionE();
            if(Error == null) OrderA();
            if(Error == null) OrderB();
            if(Error == null) OrderC();
        }
    }
    void OrderA(){
        if(CTok.TNVMatch(Tokens.Reservada, "COLLATE")){
            ReadNext(Tokens.Reservada,"COLLATE");
            if(Error == null) ID();
        }
    }
    void OrderB(){
        if(CTok.TNVMatch(Tokens.Reservada, "ASC")){
            ReadNext(Tokens.Reservada,"ASC");
        }else if(CTok.TNVMatch(Tokens.Reservada, "DESC")){
            ReadNext(Tokens.Reservada,"DESC");
        }
    }
    void OrderC(){
        if(ExpresionFirst() && !CTok.TNVMatch(Tokens.OperadorAgrupador, "(")){
            ExpresionE();
            if(Error == null) OrderA();
            if(Error == null) OrderB();
        }
    }
    void Group(){
        if(CTok.TNVMatch(Tokens.Reservada, "GROUP")){
            ReadNext(Tokens.Reservada,"GROUP");
            if(Error == null) ReadNext(Tokens.Reservada,"BY");
            if(Error == null) ExpresionE();
            if(Error == null) GroupA();
        }
    }
    void GroupA(){
        if(CTok.TNVMatch(Tokens.Coma, null)){
            ReadNext(Tokens.Coma,null);
            if(Error == null) ExpresionE();
            if(Error == null) GroupA();
        }
    }
    //</editor-fold>
    
    //Insert
    //<editor-fold>
    void Insert(){
        ReadNext(Tokens.Reservada,"INSERT");
        if(Error == null) Top();
        if(Error == null) InsertInto();
        if(Error == null) Object3();
        if(Error == null) InsertColumnsList();
        if(Error == null) InsertValores();
    }
    void InsertInto(){
        if(CTok.TNVMatch(Tokens.Reservada,"INTO")){
            ReadNext(Tokens.Reservada,"INTO");
        }
    }
    void InsertColumnsList(){
        if(CTok.TNVMatch(Tokens.OperadorAgrupador,"(")){
            ColumnList();
        }
    }
    void InsertExpresion(){
        InsertExpresionA();
        if(Error == null) InsertExpresionB();
    }
    void InsertExpresionA(){
        if(CTok.TNVMatch(Tokens.Reservada , "DEFAULT")){
            ReadNext(Tokens.Reservada , "DEFAULT");
        }else if(CTok.TNVMatch(Tokens.Entero , null)){
            ReadNext(Tokens.Entero , null);
        }else if(CTok.TNVMatch(Tokens.Flotante  , null)){
            ReadNext(Tokens.Flotante , null);
        }else if(CTok.TNVMatch(Tokens.Varchar , null)){
            ReadNext(Tokens.Varchar , null);
        }else{
            ERRORTHROW();
            List<JToken> expectedTokens = new ArrayList();
            expectedTokens.add(new JToken(Tokens.Reservada,"DEFAULT"));
            expectedTokens.add(new JToken(Tokens.Entero,null));
            expectedTokens.add(new JToken(Tokens.Flotante,null));
            expectedTokens.add(new JToken(Tokens.Varchar,null));
            Error.SetET(expectedTokens);
        }
    }
    void InsertExpresionB(){
        if(CTok.TNVMatch(Tokens.Coma, null)){
            ReadNext(Tokens.Coma,null);
            if(Error == null) InsertExpresionA();
            if(Error == null) InsertExpresionB();
        }
    }
    void InsertValores(){
        if(CTok.TNVMatch(Tokens.Reservada,"VALUES")){
            ReadNext(Tokens.Reservada,"VALUES");
            if(Error == null ) ReadNext(Tokens.Reservada,"(");
            if(Error == null ) InsertExpresion();
            if(Error == null ) ReadNext(Tokens.Reservada,")");
            if(Error == null ) InsertValoresA();
        }else if(CTok.TNVMatch(Tokens.Reservada,"DEFAULT")){
            ReadNext(Tokens.Reservada,"VALUES");
            if(Error == null) ReadNext(Tokens.Reservada,"DEFAULT");
        }else{
            ERRORTHROW();
            List<JToken> expectedTokens = new ArrayList();
            expectedTokens.add(new JToken(Tokens.Reservada,"VALUES"));
            expectedTokens.add(new JToken(Tokens.Reservada,"DEFAULT"));
            Error.SetET(expectedTokens);
        }
    }
    void InsertValoresA(){
        if(CTok.TNVMatch(Tokens.Coma, null)){
            ReadNext(Tokens.Coma,null);
            if(Error == null ) ReadNext(Tokens.Reservada,"(");
            if(Error == null ) InsertExpresion();
            if(Error == null ) ReadNext(Tokens.Reservada,")");
            if(Error == null ) InsertValoresA();
        }
    }
    //</editor-fold>
    
    //Delete
    //<editor-fold>
    void Delete(){
        ReadNext(Tokens.Reservada,"DELETE");
        if(Error == null) Top();
        if(Error == null) FromDelete();
        if(Error == null) DeleteA();
    }
    void FromDelete(){
        if(CTok.TNVMatch(Tokens.Reservada, "From")){
            ReadNext(Tokens.Reservada,"FROM");
        }
    }
    void DeleteA(){
        if(CTok.TNVMatch(Tokens.Reservada,"OPENQUERY")){
            ReadNext(Tokens.Reservada,"OPENQUERY");
            //Server
            if(Error == null ) ReadNext(Tokens.OperadorAgrupador,"(");
            if(Error == null ) ID();
            if(Error == null ) ReadNext(Tokens.Coma,null);
            if(Error == null ) ReadNext(Tokens.Varchar,null);
            if(Error == null ) ReadNext(Tokens.OperadorAgrupador,")");
        }else if(IDFirst()){
            Object3();
            if(Error == null) DeleteB();
            if(Error == null) Where();
        }else{
            ERRORTHROW();
            List<JToken> expectedTokens = new ArrayList();
            expectedTokens.add(new JToken(Tokens.Reservada,"OPENQUERY"));
            expectedTokens.add(new JToken(Tokens.OperadorAgrupador,"["));
            expectedTokens.add(new JToken(Tokens.Identificador,null));
            Error.SetET(expectedTokens);
        }
    }
    void DeleteB(){
        ReadNext(Tokens.Reservada,"FROM");
        if(Error == null) Object3();
        if(Error == null) DeleteC();
    }
    void DeleteC(){
        if(CTok.TNVMatch(Tokens.OperadorAgrupador,",")){
            ReadNext(Tokens.OperadorAgrupador,",");
            if(Error == null) Object3();
            if(Error == null) DeleteC();
        }
    }
    //</editor-fold>
    
    //Update
    //<editor-fold>
    void Update(){
        ReadNext(Tokens.Reservada,"UPDATE");
        if(Error == null) Top();
        if(Error == null) Object3();
        if(Error == null) ReadNext(Tokens.Reservada,"SET");
        if(Error == null) UpdateA();
        if(Error == null) DeleteB();
        if(Error == null) Where();
    }
    void UpdateA(){
        ID();
        if(Error == null) ReadNext(Tokens.OperadorLogico,"=");
        if(Error == null) UpdateB();
        if(Error == null) UpdateC();
    }
    void UpdateB(){
        if(CTok.TNVMatch(Tokens.Reservada, "DEFAULT")){
            ReadNext(Tokens.Reservada,"DEFAULT");
        }else if(ExpresionFirst()){
            Expresion();
        }else{
            ERRORTHROW();
            List<JToken> expectedTokens = new ArrayList();
            expectedTokens.add(new JToken(Tokens.OperadorAgrupador,"("));
            expectedTokens.add(new JToken(Tokens.Identificador,null));
            expectedTokens.add(new JToken(Tokens.OperadorAgrupador,"["));
            expectedTokens.add(new JToken(Tokens.Varchar,null));
            expectedTokens.add(new JToken(Tokens.Entero,null));
            expectedTokens.add(new JToken(Tokens.Flotante,null));
            expectedTokens.add(new JToken(Tokens.Reservada,"NULL"));
            expectedTokens.add(new JToken(Tokens.Reservada,"SUM"));
            expectedTokens.add(new JToken(Tokens.Reservada,"AVG"));
            expectedTokens.add(new JToken(Tokens.Reservada,"MIN"));
            expectedTokens.add(new JToken(Tokens.Reservada,"MAX"));
            expectedTokens.add(new JToken(Tokens.Reservada,"COUNT"));
            expectedTokens.add(new JToken(Tokens.Reservada,"DEFAULT"));
            Error.SetET(expectedTokens);
        }
    }
    void UpdateC(){
        if(CTok.TNVMatch(Tokens.Coma, null)){
            ReadNext(Tokens.Coma,null);
            if(Error == null) UpdateA();
            if(Error == null) UpdateC();
        }
    }
    //</editor-fold>
    
    //FromSelect
    //<editor-fold>
    void FromSelect(){
        if(CTok.TNVMatch(Tokens.Reservada, "FROM")){
            ReadNext(Tokens.Reservada,"FROM");
            if(Error == null) Object3();
            if(Error == null) Join();
            if(Error == null) FromSelectA();
        }
    }
    void FromSelectA(){
        if(CTok.TNVMatch(Tokens.Coma, null)){
            ReadNext(Tokens.Coma,null);
            if(Error == null) Object3();
            if(Error == null) Alias();
            if(Error == null) Join();
            
        }
    }
    void Join(){
        if(CTok.TNVMatch(Tokens.Reservada, "INNER")
                || CTok.TNVMatch(Tokens.Reservada, "RIGHT")
                || CTok.TNVMatch(Tokens.Reservada, "LEFT")
                || CTok.TNVMatch(Tokens.Reservada, "FULL")
                || CTok.TNVMatch(Tokens.Reservada, "JOIN")
                ){
            Type();
            if(Error == null) ReadNext(Tokens.Reservada, "JOIN");
            if(Error == null) Object3();
            if(Error == null) Alias();
            if(Error == null) ReadNext(Tokens.Reservada, "ON");
            if(Error == null) SearchCondition();
            if(Error == null) Join();
        }
    }
    void Type(){
        if(CTok.TNVMatch(Tokens.Reservada, "RIGHT")){
            ReadNext(Tokens.Reservada,"RIGHT");
            Outer();
        }
        else if(CTok.TNVMatch(Tokens.Reservada, "LEFT")){
            ReadNext(Tokens.Reservada,"LEFT");
            Outer();
        }
        else if(CTok.TNVMatch(Tokens.Reservada, "FULL")){
            ReadNext(Tokens.Reservada,"FULL");
            Outer();
        }
        else if(CTok.TNVMatch(Tokens.Reservada, "INNER")){
            ReadNext(Tokens.Reservada,"INNER");
        }
    }
    void Outer(){
        if(CTok.TNVMatch(Tokens.Reservada, "OUTER")){
            ReadNext(Tokens.Reservada,"OUTER");
        }
    }
    //</editor-fold>
    
    void Create(){
        ReadNext(Tokens.Reservada,"CREATE");
        if(Error == null) CreateA();
    }
    void CreateA(){
        if(CTok.TNVMatch(Tokens.Reservada, "TABLE")){
            CreateTable();
        }
        else if(CTok.TNVMatch(Tokens.Reservada, "USER")){
            CreateUser();
        }
        else if(CTok.TNVMatch(Tokens.Reservada, "DATABASE")){
            CreateDB();
        }
        else if(CTok.TNVMatch(Tokens.Reservada, "VIEW")){
            CreateView();
        }
        else if(CTok.TNVMatch(Tokens.Reservada, "INDEX")){
            CreateIndex();
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
    void CreateUser(){
        ReadNext(Tokens.Reservada,"USER");
        if(Error == null) ReadNext(Tokens.Identificador,null);
    }
    void CreateDB(){
        ReadNext(Tokens.Reservada,"DATABASE");
        if(Error == null) ReadNext(Tokens.Identificador,null);
        if(Error == null) CreateDBA();
    }
    void CreateDBA(){
        if(CTok.TNVMatch(Tokens.Reservada, "COLLATE")){
            ReadNext(Tokens.Reservada,"COLLATE");
            if(Error == null) ReadNext(Tokens.Identificador,null);
        }
    }
    void CreateView(){
        ReadNext(Tokens.Reservada,"VIEW");
        if(Error == null) Object2();
        if(Error == null) ReadNext(Tokens.Reservada,"AS");
        if(Error == null) Select();
    }
    void CreateIndex(){
        
    }
    void CreateTable(){
        
    }
}
