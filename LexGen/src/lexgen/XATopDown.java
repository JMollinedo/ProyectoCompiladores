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
            if(!token.TNVMatch(Tokens.OVERFLOWIDENTIFIER, null)){
                extra.add(token);
            }
            for (JToken beToken : BatchEndToken) {
                if(token.TokenTypeNValueMatch(beToken)){
                    int li = extra.size()-1;
                    extra.add(Ending(extra.get(li)));
                    if(!JTError.HasErrors(extra)){
                        XATopDown n = new XATopDown(extra);
                        n.ExcAnalisys();
                        Expressions.add(n);
                        extra.clear();
                    }
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
            Select();
        }else if(CTok.TNVMatch(Tokens.Reservada,"INSERT")){
            Insert();
        }else if(CTok.TNVMatch(Tokens.Reservada,"DELETE")){
            Delete();
        }else if(CTok.TNVMatch(Tokens.Reservada,"UPDATE")){
            Update();
        }else if(CTok.TNVMatch(Tokens.Reservada,"CREATE")){
            Create();
        }else if(CTok.TNVMatch(Tokens.Reservada,"ALTER")){
            Alter();
        }else if(CTok.TNVMatch(Tokens.Reservada,"DROP")){
            Drop();
        }else if(CTok.TNVMatch(Tokens.Reservada,"TRUNCATE")){
            Truncate();
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
                || CTok.TNVMatch(Tokens.Reservada, "SUM")
                || CTok.TNVMatch(Tokens.Reservada, "AVG")
                || CTok.TNVMatch(Tokens.Reservada, "MAX")
                || CTok.TNVMatch(Tokens.Reservada, "MIN")
                || CTok.TNVMatch(Tokens.Reservada, "COUNT")
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
            expectedTokens.add(new JToken(Tokens.Reservada,"SUM"));
            expectedTokens.add(new JToken(Tokens.Reservada,"AVG"));
            expectedTokens.add(new JToken(Tokens.Reservada,"MIN"));
            expectedTokens.add(new JToken(Tokens.Reservada,"MAX"));
            expectedTokens.add(new JToken(Tokens.Reservada,"COUNT"));
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
            if(Error == null) ReadNext(Tokens.OperadorAgrupador,"(");
            if(Error == null) ExpresionF();
        }else if(CTok.TNVMatch(Tokens.Reservada,"AVG")){
            ReadNext(Tokens.Reservada,"AVG");
            if(Error == null) ReadNext(Tokens.OperadorAgrupador,"(");
            if(Error == null) ExpresionF();
        }else if(CTok.TNVMatch(Tokens.Reservada,"MIN")){
            ReadNext(Tokens.Reservada,"MIN");
            if(Error == null) ReadNext(Tokens.OperadorAgrupador,"(");
            if(Error == null) ExpresionF();
        }else if(CTok.TNVMatch(Tokens.Reservada,"MAX")){
            ReadNext(Tokens.Reservada,"MAX");
            if(Error == null) ReadNext(Tokens.OperadorAgrupador,"(");
            if(Error == null) ExpresionF();
        }else if(CTok.TNVMatch(Tokens.Reservada,"COUNT")){
            ReadNext(Tokens.Reservada,"COUNT");
            if(Error == null) ReadNext(Tokens.OperadorAgrupador,"(");
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
            if(Error == null) ReadNext(Tokens.OperadorAgrupador,")");
        }else if(CTok.TNVMatch(Tokens.Entero, null)){
            ReadNext(Tokens.Entero,null);
            if(Error == null) ReadNext(Tokens.OperadorAgrupador,")");
        }else if(CTok.TNVMatch(Tokens.OperadorAritmetico, "*")){
            ReadNext(Tokens.OperadorAritmetico,"*");
            if(Error == null) ReadNext(Tokens.OperadorAgrupador,")");
        }else{
            ERRORTHROW();
            List<JToken> expectedTokens = new ArrayList();
            expectedTokens.add(new JToken(Tokens.Identificador,null));
            expectedTokens.add(new JToken(Tokens.OperadorAgrupador,"["));
            expectedTokens.add(new JToken(Tokens.OperadorAritmetico,"*"));
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
        Not();
        if(Error == null) Predicado();
        if(Error == null) SearchConditionA();
        /*if(
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
        }*/
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
        if(ExpresionFirst()){
            Expresion();
            if(Error == null) Alias();
            if(Error == null) SelectColumnsA();
        }else if(CTok.TNVMatch(Tokens.OperadorAritmetico, "*")){
            ReadNext(Tokens.OperadorAritmetico, "*");
            if(Error == null) SelectColumnsA();
        }else{
            ERRORTHROW();
            List<JToken> expectedTokens = new ArrayList();
            expectedTokens.add(new JToken(Tokens.OperadorAritmetico,"*"));
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
            if(Error == null) Expresion();
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
            Expresion();
            if(Error == null) OrderA();
            if(Error == null) OrderB();
        }
    }
    void Group(){
        if(CTok.TNVMatch(Tokens.Reservada, "GROUP")){
            ReadNext(Tokens.Reservada,"GROUP");
            if(Error == null) ReadNext(Tokens.Reservada,"BY");
            if(Error == null) Expresion();
            if(Error == null) GroupA();
        }
    }
    void GroupA(){
        if(CTok.TNVMatch(Tokens.Coma, null)){
            ReadNext(Tokens.Coma,null);
            if(Error == null) Expresion();
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
            if(Error == null) Alias();
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
    
    //Create
    //<editor-fold>
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
        else if(CTok.TNVMatch(Tokens.Reservada, "INDEX")
                || CTok.TNVMatch(Tokens.Reservada, "CLUSTERED")
                || CTok.TNVMatch(Tokens.Reservada, "NONCLUSTERED")
                || CTok.TNVMatch(Tokens.Reservada, "UNIQUE")
                ){
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
            expectedTokens.add(new JToken(Tokens.Reservada,"CLUSTERED"));
            expectedTokens.add(new JToken(Tokens.Reservada,"NONCLUSTERED"));
            expectedTokens.add(new JToken(Tokens.Reservada,"UNIQUE"));
            Error.SetET(expectedTokens);
        }
    }
    void CreateUser(){
        ReadNext(Tokens.Reservada,"USER");
        if(Error == null) ID();
    }
    void CreateDB(){
        ReadNext(Tokens.Reservada,"DATABASE");
        if(Error == null) ID();
        if(Error == null) CreateDBA();
    }
    void CreateDBA(){
        if(CTok.TNVMatch(Tokens.Reservada, "COLLATE")){
            ReadNext(Tokens.Reservada,"COLLATE");
            if(Error == null) ID();
        }
    }
    void CreateView(){
        ReadNext(Tokens.Reservada,"VIEW");
        if(Error == null) Object2();
        if(Error == null) ReadNext(Tokens.Reservada,"AS");
        if(Error == null) Select();
    }
    void CreateIndex(){
        CreateIndexA();
        if(Error == null)ColumnConstrC();
        if(Error == null) ReadNext(Tokens.Reservada,"INDEX");
        if(Error == null) ID();
        if(Error == null) ReadNext(Tokens.Reservada,"ON");
        if(Error == null) Object3();
        if(Error == null) TableConstrB();
        if(Error == null) IncludeIndex();
        if(Error == null) Where();
        if(Error == null) OptionalOn();
    }
    void CreateIndexA(){
        if(CTok.TNVMatch(Tokens.Reservada, "UNIQUE")){
            ReadNext(Tokens.Reservada,"UNIQUE");
        }
    }
    void IncludeIndex(){
        if(CTok.TNVMatch(Tokens.Reservada, "INCLUDE")){
            ReadNext(Tokens.Reservada,"INCLUDE");
            if(Error == null) ColumnList();
        }
    }
    void OptionalOn(){
        if(CTok.TNVMatch(Tokens.Reservada, "ON")){
            ReadNext(Tokens.Reservada,"ON");
            if(Error == null) ID();
            if(Error == null) ReadNext(Tokens.OperadorAgrupador,"(");
            if(Error == null) ID();
            if(Error == null) ReadNext(Tokens.OperadorAgrupador,")");
        }
    }
    //CreateTable
    //<editor-fold>
    void CreateTable(){
        ReadNext(Tokens.Reservada,"TABLE");
        if(Error == null) Object3();
        if(Error == null) ReadNext(Tokens.OperadorAgrupador,"(");
        if(Error == null) CNC();
        if(Error == null) CNCA();
        if(Error == null) ReadNext(Tokens.OperadorAgrupador,")");
    }
    void NFR(){
        if(CTok.TNVMatch(Tokens.Reservada, "NOT")){
            ReadNext(Tokens.Reservada,"NOT");
            if(Error == null) ReadNext(Tokens.Reservada,"FOR");
            if(Error == null) ReadNext(Tokens.Reservada,"REPLICATION");
        }
    }
    void CNC(){
        if(IDFirst()){
            ColumnDef();
        }else if(CTok.TNVMatch(Tokens.Reservada, "CONSTRAINT")
                || CTok.TNVMatch(Tokens.Reservada, "PRIMARY")
                || CTok.TNVMatch(Tokens.Reservada, "UNIQUE")
                || CTok.TNVMatch(Tokens.Reservada, "FOREIGN")
                || CTok.TNVMatch(Tokens.Reservada, "CHECK")
                ){
            TableConstr();
        }
        else if(CTok.TNVMatch(Tokens.Reservada, "INDEX")){
            TableIndex();
        }
        else{
            ERRORTHROW();
            List<JToken> expectedTokens = new ArrayList();
            expectedTokens.add(new JToken(Tokens.OperadorAgrupador,"["));
            expectedTokens.add(new JToken(Tokens.Identificador,null));
            expectedTokens.add(new JToken(Tokens.Reservada,"CONSTRAINT"));
            expectedTokens.add(new JToken(Tokens.Reservada,"PRIMARY"));
            expectedTokens.add(new JToken(Tokens.Reservada,"UNIQUE"));
            expectedTokens.add(new JToken(Tokens.Reservada,"FOREIGN"));
            expectedTokens.add(new JToken(Tokens.Reservada,"CHECK"));
            expectedTokens.add(new JToken(Tokens.Reservada,"INDEX"));
            Error.SetET(expectedTokens);
        }
    }
    void CNCA(){
        if(CTok.TNVMatch(Tokens.Coma, null)){
            ReadNext(Tokens.Coma,null);
            if(Error == null) CNC();
            if(Error == null) CNCA();
        }
    }
    //ColumnDef
    //<editor-fold>
    void ColumnDef(){
        ID();
        if(Error == null) Tipo_dato();
        if(Error == null) ColumnDefA();
        if(Error == null) ColumnDefB();
        if(Error == null) ColumnDefE();
        //if(Error == null) NFR();
        if(Error == null){
            int i = CTP;
            if(CTok.TNVMatch(Tokens.Reservada, "NOT")){
                ReadNext(Tokens.Reservada, "NOT");
                if(CTok.TNVMatch(Tokens.Reservada, "FOR")){
                    ResetPosition(i);
                    NFR();
                }else{
                    ResetPosition(i);
                }
            }
        }
        if(Error == null) ColumnDefG();
        if(Error == null) ColumnDefH();
        if(Error == null) ColumnConstr();
    }
    void ColumnDefA(){
        if(CTok.TNVMatch(Tokens.Reservada, "COLLATE")){
            ReadNext(Tokens.Reservada,"COLLATE");
            if(Error == null) ID();
        }
    }
    void ColumnDefB(){
        if(CTok.TNVMatch(Tokens.Reservada, "CONSTRAINT")){
            ReadNext(Tokens.Reservada,"CONSTRAINT");
            if(Error == null) ID();
            if(Error == null) ColumnDefC();
        }
    }
    void ColumnDefC(){
        if(CTok.TNVMatch(Tokens.Reservada, "DEFAULT")){
            ReadNext(Tokens.Reservada,"DEFAULT");
            if(Error == null) ColumnDefD();
        }
    }
    void ColumnDefD(){
        if(CTok.TNVMatch(Tokens.Entero, null)){
            ReadNext(Tokens.Entero, null);
        }else if(CTok.TNVMatch(Tokens.Flotante, null)){
            ReadNext(Tokens.Flotante, null);
        }else if(CTok.TNVMatch(Tokens.Varchar, null)){
            ReadNext(Tokens.Varchar, null);
        }else if(CTok.TNVMatch(Tokens.Reservada , "NULL")){
            ReadNext(Tokens.Reservada, "NULL");
        }else{
            ERRORTHROW();
            List<JToken> expectedTokens = new ArrayList();
            expectedTokens.add(new JToken(Tokens.Entero,null));
            expectedTokens.add(new JToken(Tokens.Flotante,null));
            expectedTokens.add(new JToken(Tokens.Varchar,null));
            expectedTokens.add(new JToken(Tokens.Reservada,"NULL"));
            Error.SetET(expectedTokens);
        }
    }
    void ColumnDefE(){
        if(CTok.TNVMatch(Tokens.Reservada, "IDENTITY")){
            ReadNext(Tokens.Reservada,"IDENTITY");
            if(Error == null) ColumnDefF();
        }
    }
    void ColumnDefF(){
        if(CTok.TNVMatch(Tokens.OperadorAgrupador, "(")){
            ReadNext(Tokens.OperadorAgrupador,"(");
            if(Error == null) ReadNext(Tokens.Entero,null);
            if(Error == null) ReadNext(Tokens.Coma,null);
            if(Error == null) ReadNext(Tokens.Entero,null);
            if(Error == null) ReadNext(Tokens.OperadorAgrupador,")");
        }
    }
    void ColumnDefG(){
        if(CTok.TNVMatch(Tokens.Reservada , "NULL")){
            ReadNext(Tokens.Reservada , "NULL");
        }else if(CTok.TNVMatch(Tokens.Reservada, "NOT")){
            ReadNext(Tokens.Reservada , "NOT");
            if(Error == null) ReadNext(Tokens.Reservada , "NULL");
        }
    }
    void ColumnDefH(){
        if(CTok.TNVMatch(Tokens.Reservada, "ROWGUIDCOL")){
            ReadNext(Tokens.Reservada,"ROWGUIDCOL");
        }
    }
    //</editor-fold>
    //ColumnConstr
    //<editor-fold>
    void ColumnConstr(){
        if(CTok.TNVMatch(Tokens.Reservada, "CONSTRAINT")
                || CTok.TNVMatch(Tokens.Reservada, "PRIMARY")
                || CTok.TNVMatch(Tokens.Reservada, "UNIQUE")
                || CTok.TNVMatch(Tokens.Reservada, "FOREIGN")
                || CTok.TNVMatch(Tokens.Reservada, "REFERENCES")
                || CTok.TNVMatch(Tokens.Reservada, "CHECK")
                ){
            ColumnConstrA();
            if(Error == null) ColumnConstrB();
            if(Error == null) ColumnConstr();
        }   
    }
    void ColumnConstrA(){
        if(CTok.TNVMatch(Tokens.Reservada, "CONSTRAINT")){
            ReadNext(Tokens.Reservada,"CONSTRAINT");
            if(Error == null) ID();
        }
    }
    void ColumnConstrB(){
        if(CTok.TNVMatch(Tokens.Reservada, "PRIMARY")){
            ReadNext(Tokens.Reservada,"PRIMARY");
            if(Error == null) ReadNext(Tokens.Reservada,"KEY");
            if(Error == null) ColumnConstrC();
        }else if(CTok.TNVMatch(Tokens.Reservada, "UNIQUE")){
            ReadNext(Tokens.Reservada,"UNIQUE");
            if(Error == null) ColumnConstrC();
        }else if(CTok.TNVMatch(Tokens.Reservada, "FOREIGN")
                || CTok.TNVMatch(Tokens.Reservada, "REFERENCES")
                ){
            ColumnConstrD();
            if(Error == null) ReadNext(Tokens.Reservada,"REFERENCES");
            if(Error == null) Object2();
            if(Error == null) ColumnConstrE();
            if(Error == null) ColumnConstrF();
            if(Error == null) ColumnConstrG();
            if(Error == null) NFR();
        }else if(CTok.TNVMatch(Tokens.Reservada, "CHECK")){
            ReadNext(Tokens.Reservada,"CHECK");
            if(Error == null) NFR();
            if(Error == null) ReadNext(Tokens.OperadorAgrupador,"(");
            if(Error == null) SearchCondition();
            if(Error == null) ReadNext(Tokens.OperadorAgrupador,")");
        }else{
            ERRORTHROW();
            List<JToken> expectedTokens = new ArrayList();
            expectedTokens.add(new JToken(Tokens.Reservada,"PRIMARY"));
            expectedTokens.add(new JToken(Tokens.Reservada,"UNIQUE"));
            expectedTokens.add(new JToken(Tokens.Reservada,"FOREIGN"));
            expectedTokens.add(new JToken(Tokens.Reservada,"REFERENCES"));
            expectedTokens.add(new JToken(Tokens.Reservada,"CHECH"));
            Error.SetET(expectedTokens);
        }
    }
    void ColumnConstrC(){
        if(CTok.TNVMatch(Tokens.Reservada, "CLUSTERED")){
            ReadNext(Tokens.Reservada, "CLUSTERED");
        }else if(CTok.TNVMatch(Tokens.Reservada, "NONCLUSTERED")){
            ReadNext(Tokens.Reservada, "NONCLUSTERED");
        }
    }
    void ColumnConstrD(){
        if(CTok.TNVMatch(Tokens.Reservada, "FOREIGN")){
            ReadNext(Tokens.Reservada, "FOREIGN");
            if(Error == null) ReadNext(Tokens.Reservada, "KEY");
        }
    }
    void ColumnConstrE(){
        if(CTok.TNVMatch(Tokens.OperadorAgrupador, "(")){
            ReadNext(Tokens.OperadorAgrupador, "(");
            if(Error == null) ID();
            ReadNext(Tokens.OperadorAgrupador, ")");
        }
    }
    void ColumnConstrF(){
        if(CTok.TNVMatch(Tokens.Reservada, "ON")){
            ReadNext(Tokens.Reservada, "ON");
            if(Error == null) ReadNext(Tokens.Reservada, "DELETE");
            if(Error == null) ColumnConstrI();
        }
    }
    void ColumnConstrG(){
        if(CTok.TNVMatch(Tokens.Reservada, "ON")){
            ReadNext(Tokens.Reservada, "ON");
            if(Error == null) ReadNext(Tokens.Reservada, "UPDATE");
            if(Error == null) ColumnConstrI();
        }
    }
    void ColumnConstrH(){
        if(CTok.TNVMatch(Tokens.Reservada, "NULL")){
            ReadNext(Tokens.Reservada, "NULL");
        }else if(CTok.TNVMatch(Tokens.Reservada, "DEFAULT")){
            ReadNext(Tokens.Reservada, "DEFAULT");
        }else{
            ERRORTHROW();
            List<JToken> expectedTokens = new ArrayList();
            expectedTokens.add(new JToken(Tokens.Reservada,"NULL"));
            expectedTokens.add(new JToken(Tokens.Reservada,"DEFAULT"));
            Error.SetET(expectedTokens);
        }
    }
    void ColumnConstrI(){
        if(CTok.TNVMatch(Tokens.Reservada, "CASCADE")){
            ReadNext(Tokens.Reservada, "CASCADE");
        }else if(CTok.TNVMatch(Tokens.Reservada, "SET")){
            ReadNext(Tokens.Reservada, "SET");
            if(Error == null) ColumnConstrH();
        }else{
            ERRORTHROW();
            List<JToken> expectedTokens = new ArrayList();
            expectedTokens.add(new JToken(Tokens.Reservada,"CASCADE"));
            expectedTokens.add(new JToken(Tokens.Reservada,"SET"));
            Error.SetET(expectedTokens);
        }
    }
    //</editor-fold>
    //TableConstr
    //<editor-fold>
    void TableConstr(){
        ColumnConstrA();
        if(Error == null) TableConstrA();
    }
    void TableConstrA(){
        if(CTok.TNVMatch(Tokens.Reservada, "PRIMARY")){
            ReadNext(Tokens.Reservada,"PRIMARY");
            if(Error == null) ReadNext(Tokens.Reservada,"KEY");
            if(Error == null) ColumnConstrC();
            if(Error == null) TableConstrB();
        }else if(CTok.TNVMatch(Tokens.Reservada, "UNIQUE")){
            ReadNext(Tokens.Reservada,"UNIQUE");
            if(Error == null) ColumnConstrC();
            if(Error == null) TableConstrB();
        }else if(CTok.TNVMatch(Tokens.Reservada, "FOREIGN")){
            ReadNext(Tokens.Reservada,"FOREIGN");
            if(Error == null) ReadNext(Tokens.Reservada,"KEY");
            if(Error == null) TableConstrD();
            if(Error == null) ReadNext(Tokens.Reservada,"REFERENCES");
            if(Error == null) Object2();
            if(Error == null) ColumnConstrE();
            if(Error == null) ColumnConstrF();
            if(Error == null) ColumnConstrG();
            if(Error == null) NFR();
        }else if(CTok.TNVMatch(Tokens.Reservada, "CHECK")){
            ReadNext(Tokens.Reservada,"CHECK");
            if(Error == null) NFR();
            if(Error == null) ReadNext(Tokens.OperadorAgrupador,"(");
            if(Error == null) SearchCondition();
            if(Error == null) ReadNext(Tokens.OperadorAgrupador,")");
        }else{
            ERRORTHROW();
            List<JToken> expectedTokens = new ArrayList();
            expectedTokens.add(new JToken(Tokens.Reservada,"PRIMARY"));
            expectedTokens.add(new JToken(Tokens.Reservada,"UNIQUE"));
            expectedTokens.add(new JToken(Tokens.Reservada,"FOREIGN"));
            expectedTokens.add(new JToken(Tokens.Reservada,"CHECH"));
            Error.SetET(expectedTokens);
        }
    }
    void TableConstrB(){
        ReadNext(Tokens.OperadorAgrupador,"(");
        if(Error == null) ID();
        if(Error == null) OrderB();
        if(Error == null) TableConstrC();
        if(Error == null) ReadNext(Tokens.OperadorAgrupador,")");
    }
    void TableConstrC(){
        if(CTok.TNVMatch(Tokens.Coma, null)){
            ReadNext(Tokens.Coma,null);
            if(Error == null) ID();
            if(Error == null) OrderB();
            if(Error == null) TableConstrC();
        }
    }
    void TableConstrD(){
        ReadNext(Tokens.OperadorAgrupador,"(");
        if(Error == null) ID();
        if(Error == null) TableConstrE();
        if(Error == null) ReadNext(Tokens.OperadorAgrupador,")");
    }
    void TableConstrE(){
        if(CTok.TNVMatch(Tokens.Coma, null)){
            ReadNext(Tokens.Coma,null);
            if(Error == null) ID();
            if(Error == null) TableConstrE();
        }
    }
    //</editor-fold>
    void TableIndex(){
        ReadNext(Tokens.Reservada,"INDEX");
        if(Error == null) ID();
        if(Error == null) ColumnConstrC();
        if(Error == null) TableConstrB();
    }
    //</editor-fold>
    //</editor-fold>
    
    //Alter
    //<editor-fold>
    void Alter(){
        ReadNext(Tokens.Reservada,"ALTER");
        if(Error == null) AlterA();
    }
    void AlterA(){
        if(CTok.TNVMatch(Tokens.Reservada, "TABLE")){
            AlterTable();
        }
        else if(CTok.TNVMatch(Tokens.Reservada, "USER")){
            AlterUser();
        }
        else if(CTok.TNVMatch(Tokens.Reservada, "DATABASE")){
            AlterDB();
        }
        else if(CTok.TNVMatch(Tokens.Reservada, "VIEW")){
            AlterView();
        }else{
            ERRORTHROW();
            List<JToken> expectedTokens = new ArrayList();
            expectedTokens.add(new JToken(Tokens.Reservada,"TABLE"));
            expectedTokens.add(new JToken(Tokens.Reservada,"USER"));
            expectedTokens.add(new JToken(Tokens.Reservada,"DATABASE"));
            expectedTokens.add(new JToken(Tokens.Reservada,"VIEW"));
            Error.SetET(expectedTokens);
        }
    }
    void AlterDB(){
        ReadNext(Tokens.Reservada,"DATABASE");
        if(Error == null) AlterDBA();
        if(Error == null) AlterDBB();
    }
    void AlterDBA(){
        if(CTok.TNVMatch(Tokens.Reservada, "CURRENT")){
            ReadNext(Tokens.Reservada,"CURRENT");
        }else if(IDFirst()){
            ID();
        }else{
            ERRORTHROW();
            List<JToken> expectedTokens = new ArrayList();
            expectedTokens.add(new JToken(Tokens.Reservada,"CURRENT"));
            expectedTokens.add(new JToken(Tokens.OperadorAgrupador,"["));
            expectedTokens.add(new JToken(Tokens.Identificador,null));
            Error.SetET(expectedTokens);
        }
    }
    void AlterDBB(){
        if(CTok.TNVMatch(Tokens.Reservada, "COLLATE")){
            ReadNext(Tokens.Reservada,"COLLATE");
            if(Error == null) ID();
        }else if(CTok.TNVMatch(Tokens.Reservada, "SET")){
            ReadNext(Tokens.Reservada,"SET");
            if(Error == null) ReadNext(Tokens.Reservada,"ROLLBACK");
            if(Error == null) ReadNext(Tokens.Reservada,"IMMEDIATE");
        }else{
            ERRORTHROW();
            List<JToken> expectedTokens = new ArrayList();
            expectedTokens.add(new JToken(Tokens.Reservada,"COLLATE"));
            expectedTokens.add(new JToken(Tokens.Reservada,"SET"));
            Error.SetET(expectedTokens);
        }
    }
    void AlterUser(){
        ReadNext(Tokens.Reservada,"USER");
        ID();
    }
    void AlterView(){
        ReadNext(Tokens.Reservada,"VIEW");
        if(Error == null) Object2();
        if(Error == null) AlterViewA();
        if(Error == null) ReadNext(Tokens.Reservada,"AS");
        if(Error == null) Select();
    }
    void AlterViewA(){
        if(CTok.TNVMatch(Tokens.OperadorAgrupador,"(")){
            ColumnList();
        }
    }
    void AlterTable(){
        ReadNext(Tokens.Reservada,"TABLE");
        if(Error == null) Object3();
        if(Error == null) AlterTableA();
    }
    void AlterTableA(){
        if(CTok.TNVMatch(Tokens.Reservada,"ALTER")){
            AlterColumn();
        }else if(CTok.TNVMatch(Tokens.Reservada,"ADD")){
            ReadNext(Tokens.Reservada,"ADD");
            if(Error == null) CNC();
            if(Error == null) CNCA();
        }else if(CTok.TNVMatch(Tokens.Reservada, "DROP")){
            AlterTableDrop();
        }else{
            ERRORTHROW();
            List<JToken> expectedTokens = new ArrayList();
            expectedTokens.add(new JToken(Tokens.Reservada,"ALTER"));
            expectedTokens.add(new JToken(Tokens.Reservada,"ADD"));
            expectedTokens.add(new JToken(Tokens.Reservada,"DROP"));
            Error.SetET(expectedTokens);
        }
    }
    void AlterColumn(){
        ReadNext(Tokens.Reservada,"ALTER");
        if(Error == null) ReadNext(Tokens.Reservada,"COLUMN");
        if(Error == null) ID();
        if(Error == null) AlterColumnC();
    }
    void AlterColumnC(){
        if(CTok.TNVMatch(Tokens.TipoDatoBin, null)
                ||CTok.TNVMatch(Tokens.TipoDatoBit, null)
                ||CTok.TNVMatch(Tokens.TipoDatoChars, null)
                ||CTok.TNVMatch(Tokens.TipoDatoDecimalAprox, null)
                ||CTok.TNVMatch(Tokens.TipoDatoDecimalExacto, null)
                ||CTok.TNVMatch(Tokens.TipoDatoEntero, null)
                ||CTok.TNVMatch(Tokens.TipoDatoFechaHora, null)
                ||CTok.TNVMatch(Tokens.TipoDatoOtro, null)
                ||CTok.TNVMatch(Tokens.TipoDatoUnicode, null)
                ||CTok.TNVMatch(Tokens.OperadorAgrupador, "[")
                ){
            AlterColumnA();
        }
        else if(CTok.TNVMatch(Tokens.Reservada, "ADD")
                ||CTok.TNVMatch(Tokens.Reservada, "DROP")
                ){
            AlterColumnD();
            AlterColumnE();
        }
        else{
            ERRORTHROW();
            List<JToken> expectedTokens = new ArrayList();
            expectedTokens.add(new JToken(Tokens.Reservada,"ADD"));
            expectedTokens.add(new JToken(Tokens.Reservada,"DROP"));
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
    void AlterColumnA(){
        Tipo_dato();
        if(Error == null) ColumnDefA();
        if(Error == null) ColumnDefG();
    }
    void AlterColumnD(){
        if(CTok.TNVMatch(Tokens.Reservada, "ADD")){
            ReadNext(Tokens.Reservada,"ADD");
        }else if(CTok.TNVMatch(Tokens.Reservada, "DROP")){
            ReadNext(Tokens.Reservada,"DROP");
        }else{
            ERRORTHROW();
            List<JToken> expectedTokens = new ArrayList();
            expectedTokens.add(new JToken(Tokens.Reservada,"ADD"));
            expectedTokens.add(new JToken(Tokens.Reservada,"DROP"));
            Error.SetET(expectedTokens);
        }
    }
    void AlterColumnE(){
        if(CTok.TNVMatch(Tokens.Reservada, "ROWGUIDCOL")){
            ReadNext(Tokens.Reservada,"ROWGUIDCOL");
        }else if(CTok.TNVMatch(Tokens.Reservada, "NOT")){
            ReadNext(Tokens.Reservada,"NOT");
            if(Error == null) ReadNext(Tokens.Reservada,"FOR");
            if(Error == null) ReadNext(Tokens.Reservada,"REPLICATION");
        }else{
            ERRORTHROW();
            List<JToken> expectedTokens = new ArrayList();
            expectedTokens.add(new JToken(Tokens.Reservada,"ROWGUIDCOL"));
            expectedTokens.add(new JToken(Tokens.Reservada,"NOT"));
            Error.SetET(expectedTokens);
        }
    }
    void AlterTableDrop(){
        ReadNext(Tokens.Reservada,"DROP");
        if(Error == null) AlterTableDropA();
        if(Error == null) AlterTableDropD();
        /*
        S-> "DROP" A D
        D-> , A D|e
        A-> B IFE ID TableConstrE
        B-> CONSTRAINT|COLUMNS|e
        */
    }
    void AlterTableDropD(){
        if(CTok.TNVMatch(Tokens.Coma, null)){
            ReadNext(Tokens.Coma,null);
            if(Error == null) AlterTableDropA();
            if(Error == null) AlterTableDropD();
        }
    }
    void AlterTableDropA(){
        AlterTableDropB();
        if(Error == null) IFE();
        if(Error == null) ID();
        if(Error == null) AlterTableDropC();
    }
    void AlterTableDropB(){
        if(CTok.TNVMatch(Tokens.Reservada, "CONSTRAINT")){
            ReadNext(Tokens.Reservada,"CONSTRAINT");
        }else if(CTok.TNVMatch(Tokens.Reservada, "COLUMN")){
            ReadNext(Tokens.Reservada,"COLUMN");
        }
    }
    void AlterTableDropC(){
        if(CTok.TNVMatch(Tokens.Coma, null)){
            int i = CTP;
            ReadNext(Tokens.Coma,null);
            if(IDFirst()){
                if(Error == null) ID();
                if(Error == null) AlterTableDropC();
            }else{
                ResetPosition(i);
            }
        }
    }
    //</editor-fold>
}