package lexgen;
import static lexgen.Tokens.*;
%%
%class Lexer
%unicode
%type Tokens
%line
%column

nlinea = \r|\n|\r\n
ichar = [^\r\n]

espacio = {nlinea} | [ \t\f]

mlcoment = "/*" ~"*/"
ulcoment = "--" ({ichar}*) {nlinea}?
coment = {mlcoment} | {ulcoment}

tipodato="BIGINT"|"BINARY"|"BIT"|"CHAR"|"CURSOR"|"DATE"|"DATETIME"|"DATETIME2"|"DATETIMEOFFSET"|"DECIMAL"|"FLOAT"|"HIERARCHYID"|"IMAGE"|"INT"|"MONEY"|"NCHAR"|"NTEXT"|"NUMERIC"|"NVARCHAR"|"REAL"|"ROWVERSION"|"SMALLDATETIME"|"SMALLINT"|"SMALLMONEY"|"SQL_VARIANT"|"TEXT"|"TIME"|"TINYINT"|"UNIQUEIDENTIFIER"|"VARBINARY"|"VARCHAR"|"XML"
reservadas="ADD"|"ALL"|"ALTER"|"AND"|"ANY"|"AS"|"ASC"|"AUTHORIZATION"|"BACKUP"|"BEGIN"|"BETWEEN"|"BREAK"|"BROWSE"|"BULK"|"BY"|"CASCADE"|"CASE"|"CHECK"|"CHECKPOINT"|"CLOSE"|"CLUSTERED"|"COALESCE"|"COLLATE"|"COLUMN"|"COMMIT"|"COMPUTE"|"CONSTRAINT"|"CONTAINS"|"CONTAINSTABLE"|"CONTINUE"|"CONVERT"|"CREATE"|"CROSS"|"CURRENT"|"CURRENT_DATE"|"CURRENT_TIME"|"CURRENT_TIMESTAMP"|"CURRENT_USER"|"DATABASE"|"DBCC"|"DEALLOCATE"|"DECLARE"|"DEFAULT"|"DELETE"|"DENY"|"DESC"|"DISK"|"DISTINCT"|"DISTRIBUTED"|"DOUBLE"|"DROP"|"DUMP"|"ELSE"|"END"|"ERRLVL"|"ESCAPE"|"EXCEPT"|"EXEC"|"EXECUTE"|"EXISTS"|"EXIT"|"EXTERNAL"|"FETCH"|"FILE"|"FILLFACTOR"|"FOR"|"FOREIGN"|"FREETEXT"|"FREETEXTTABLE"|"FROM"|"FULL"|"FUNCTION"|"GOTO"|"GRANT"|"GROUP"|"HAVING"|"HOLDLOCK"|"IDENTITY"|"IDENTITY_INSERT"|"IDENTITYCOL"|"IF"|"IN"|"INDEX"|"INNER"|"INSERT"|"INTERSECT"|"INTO"|"IS"|"JOIN"|"KEY"|"KILL"|"LEFT"|"LIKE"|"LINENO"|"LOAD"|"MERGE"|"NATIONAL"|"NOCHECK"|"NONCLUSTERED"|"NOT"|"NULL"|"NULLIF"|"OF"|"OFF"|"OFFSETS"|"ON"|"OPEN"|"OPENDATASOURCE"|"OPENQUERY"|"OPENROWSET"|"OPENXML"|"OPTION"|"OR"|"ORDER"|"OUTER"|"OVER"|"PERCENT"|"PIVOT"|"PLAN"|"PRECISION"|"PRIMARY"|"PRINT"|"PROC"|"PROCEDURE"|"PUBLIC"|"RAISERROR"|"READ"|"READTEXT"|"RECONFIGURE"|"REFERENCES"|"REPLICATION"|"RESTORE"|"RESTRICT"|"RETURN"|"REVERT"|"REVOKE"|"RIGHT"|"ROLLBACK"|"ROWCOUNT"|"ROWGUIDCOL"|"RULE"|"SAVE"|"SCHEMA"|"SECURITYAUDIT"|"SELECT"|"SEMANTICKEYPHRASETABLE"|"SEMANTICSIMILARITYDETAILSTABLE"|"SEMANTICSIMILARITYTABLE"|"SESSION_USER"|"SET"|"SETUSER"|"SHUTDOWN"|"SOME"|"STATISTICS"|"SYSTEM_USER"|"TABLE"|"TABLESAMPLE"|"TEXTSIZE"|"THEN"|"TO"|"TOP"|"TRAN"|"TRANSACTION"|"TRIGGER"|"TRUNCATE"|"TRY_CONVERT"|"TSEQUAL"|"UNION"|"UNIQUE"|"UNPIVOT"|"UPDATE"|"UPDATETEXT"|"USE"|"USER"|"VALUES"|"VARYING"|"VIEW"|"WAITFOR"|"WHEN"|"WHERE"|"WHILE"|"WITH"|"WITHIN GROUP"|"WRITETEXT"|"ABSOLUTE"|"ACTION"|"ADA"|"ALLOCATE"|"ARE"|"ASSERTION"|"AT"|"AVG"|"BIT_LENGTH"|"BOTH"|"CASCADED"|"CAST"|"CATALOG"|"CHAR_LENGTH"|"CHARACTER"|"CHARACTER_LENGTH"|"COLLATION"|"CONNECT"|"CONNECTION"|"CONSTRAINTS"|"CORRESPONDING"|"COUNT"|"DAY"|"DEC"|"DEFERRABLE"|"DEFERRED"|"DESCRIBE"|"DESCRIPTOR"|"DIAGNOSTICS"|"DISCONNECT"|"DOMAIN"|"END-EXEC"|"EXTRACT"|"FALSE"|"FIRST"|"FORTRAN"|"FOUND"|"GET"|"GLOBAL"|"GO"|"HOUR"|"IMMEDIATE"|"INCLUDE"|"INDICATOR"|"INITIALLY"|"INPUT"|"INSENSITIVE"|"INTEGER"|"INTERVAL"|"ISOLATION"|"LANGUAGE"|"LAST"|"LEADING"|"LEVEL"|"LOCAL"|"LOWER"|"MATCH"|"MAX"|"MIN"|"MINUTE"|"MODULE"|"MONTH"|"NAMES"|"NATURAL"|"NEXT"|"NO"|"NONE"|"OCTET_LENGTH"|"ONLY"|"OUTPUT"|"OVERLAPS"|"PAD"|"PARTIAL"|"PASCAL"|"POSITION"|"PREPARE"|"PRESERVE"|"PRIOR"|"PRIVILEGES"|"RELATIVE"|"ROWS"|"SCROLL"|"SECOND"|"SECTION"|"SESSION"|"SIZE"|"SPACE"|"SQL"|"SQLCA"|"SQLCODE"|"SQLERROR"|"SQLSTATE"|"SQLWARNING"|"SUBSTRING"|"SUM"|"TEMPORARY"|"TIMESTAMP"|"TIMEZONE_HOUR"|"TIMEZONE_MINUTE"|"TRAILING"|"TRANSLATE"|"TRANSLATION"|"TRIM"|"TRUE"|"UNKNOWN"|"UPPER"|"USAGE"|"USING"|"VALUE"|"WHENEVER"|"WORK"|"WRITE"|"YEAR"|"ZONE"
operadores="+"|"-"|"*"|"/"|"%"|"<"|"<="|">"|">="|"="|"=="|"!="|"&&"|"||"|"!"|";"|","|"."|"["|"]"|"("|")"|"{"|"}"|"[]"|"()"|"{}"|"@"|"#"|"##"

identificador = [:letter:] (([:letter:] | [:digit:] | "_")*)

numero = [0-9]

entero = ({numero}+)
flotan = {entero} "." ({numero}*) ((("E+" | "E-") {entero})?)

varchar = "'" [^\r\n\u0027]* "'"
%{
    public String lexeme;
    public int lin;
    public int col;
    public int len;
%}
%%

{coment} {/*Ignore*/}
{espacio} {/*Ignore*/}

{tipodato} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return TipoDato;}
{reservadas} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Reservada;}
{operadores} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Operador;}

{identificador} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Identificador;}

{flotan} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Flotante;}
{entero} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Entero;}
{varchar} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Varchar;}

 . {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return ERROR;}