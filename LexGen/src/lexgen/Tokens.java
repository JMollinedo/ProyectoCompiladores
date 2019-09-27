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
public enum Tokens {
    //Fin de AnalisisSin
    FinSintaxis,
    //Tipo de Datos
    TipoDatoOtro,
    TipoDatoEntero,
    TipoDatoBit,
    TipoDatoDecimalExacto,
    TipoDatoDecimalAprox,
    TipoDatoFechaHora,
    TipoDatoChars,
    TipoDatoUnicode,
    TipoDatoBin,
    //Palabras Reservadas
    Reservada,
    //Operadores
    OperadorOtro,
    OperadorLogico,
    OperadorAritmetico,
    OperadorAgrupador,
    Punto,
    Coma,
    PYC,
    //IDs
    Identificador,
    //Definicion de Datos
    Flotante,
    Entero,
    Varchar,
    //ERRORES
    IdentificadorError,
    FlotanteError,
    VarcharError,
    MalComentario,
    ERROR,
    OVERFLOWIDENTIFIER
}
