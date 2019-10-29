package lexgen;
import static lexgen.Token.*;
%%
%class Lexer
%unicode
%type Token
%line
%column

nlinea = \r|\n|\r\n
ichar = [^\r\n]
espacio = {nlinea} | [ \t\f]
numero = [0-9]
entero = (("+"|"-")?) ({numero}+)
flotan = {entero} "." ({numero}*) ((("E"|"e") {entero})?)
flotanErr = {entero} "." {identificador}
mlcoment = "/*" ~"*/"
ulcoment = "--" ({ichar}*) {nlinea}?
coment = {mlcoment} | {ulcoment}

Igual = "="
Suma = "+"
Resta = "-"
Multiplicacion = "*"
Division = "/"
Porcentaje = "%"
Menor = "<"
MenorIgual = "<="
Mayor = ">"
MayorIgual = ">="
Igual2 = "=="
NoIgual = "!="
And = "&&" | "AND"
Or = "||" | "OR"
Not2 = "!"
PyC = ";"
Coma = ","
Punto = "."
Arroba = "@"
Numeral = "#"
Numeral2 = "##"
Corchetes = "[]"
Llaves = "{}"
Parentesis = "()"
AbreCorchetes = "["
AbreLlaves = "{"
AbreParentesis = "("
CierraCorchetes = "]"
CierraLlaves = "}"
CierraParentesis = ")"

Absolute = "ABSOLUTE"
Action = "ACTION"
Ada = "ADA"
Add = "ADD"
All = "ALL"
Allocate = "ALLOCATE"
Alter = "ALTER"
Any = "ANY"
Are = "ARE"
Arying = "ARYING"
As = "AS"
Asc = "ASC"
Assertion = "ASSERTION"
At = "AT"
Authorization = "AUTHORIZATION"
Avg = "AVG"
Backup = "BACKUP"
Begin = "BEGIN"
Between = "BETWEEN"
Bit = "BIT"
Bit_length = "BIT_LENGTH"
Both = "BOTH"
Break = "BREAK"
Browse = "BROWSE"
Bulk = "BULK"
By = "BY"
Called = "CALLED"
Caller = "CALLER"
Cascade = "CASCADE"
Cascaded = "CASCADED"
Case = "CASE"
Cast = "CAST"
Catalog = "CATALOG"
Char = "CHAR"
Char_length = "CHAR_LENGTH"
Charact = "CHARACTER"
Character_length = "CHARACTER_LENGTH"
Check = "CHECK"
Checkpoint = "CHECKPOINT"
Close = "CLOSE"
Clustered = "CLUSTERED"
Coalesce = "COALESCE"
Collate = "COLLATE"
Collation = "COLLATION"
Column = "COLUMN"
Commit = "COMMIT"
Compute = "COMPUTE"
Connect = "CONNECT"
Connection = "CONNECTION"
Constraint = "CONSTRAINT"
Constraints = "CONSTRAINTS"
Contains = "CONTAINS"
Containstable = "CONTAINSTABLE"
Continue = "CONTINUE"
Convert = "CONVERT"
Corresponding = "CORRESPONDING"
Count = "COUNT"
Create = "CREATE"
Cross = "CROSS"
Current = "CURRENT"
Current_date = "CURRENT_DATE"
Current_time = "CURRENT_TIME"
Current_timestamp = "CURRENT_TIMESTAMP"
Current_user = "CURRENT_USER"
Cursor = "CURSOR"
Database = "DATABASE"
Date = "DATE"
Day = "DAY"
Dbcc = "DBCC"
Deallocate = "DEALLOCATE"
Dec = "DEC"
Decimal = "DECIMAL"
Declare = "DECLARE"
Default = "DEFAULT"
Deferrable = "DEFERRABLE"
Deferred = "DEFERRED"
Delete = "DELETE"
Deny = "DENY"
Desc = "DESC"
Describe = "DESCRIBE"
Descriptor = "DESCRIPTOR"
Diagnostics = "DIAGNOSTICS"
Disconnect = "DISCONNECT"
Disk = "DISK"
Distinct = "DISTINCT"
Distributed = "DISTRIBUTED"
Domain = "DOMAIN"
Double = "DOUBLE"
Drop = "DROP"
Dump = "DUMP"
Dynamic = "DYNAMIC"
Else = "ELSE"
Encryption = "ENCRYPTION"
End = "END"
End_exec = "END-EXEC"
Errlvl = "ERRLVL"
Escape = "ESCAPE"
Except = "EXCEPT"
Exception = "EXCEPTION"
Exec = "EXEC"
Execute = "EXECUTE"
Exists = "EXISTS"
Exit = "EXIT"
External = "EXTERNAL"
Extract = "EXTRACT"
False = "FALSE"
Fast_forward = "FAST_FORWARD"
Fetch = "FETCH"
File = "FILE"
Filegrowth = "FILEGROWTH"
Filename = "FILENAME"
Fillfactor = "FILLFACTOR"
First = "FIRST"
Float = "FLOAT"
For = "FOR"
Foreign = "FOREIGN"
Fortran = "FORTRAN"
Forward_only = "FORWARD_ONLY"
Found = "FOUND"
Freetext = "FREETEXT"
Freetexttable = "FREETEXTTABLE"
From = "FROM"
Full = "FULL"
Function = "FUNCTION"
Gb = "GB"
Get = "GET"
Global = "GLOBAL"
Go = "GO"
Goto = "GOTO"
Grant = "GRANT"
Group = "GROUP"
Having = "HAVING"
Holdlock = "HOLDLOCK"
Hour = "HOUR"
Identity = "IDENTITY"
Identity_insert = "IDENTITY_INSERT"
Identitycol = "IDENTITYCOL"
If = "IF"
Immediate = "IMMEDIATE"
In = "IN"
Include = "INCLUDE"
Index = "INDEX"
Indicator = "INDICATOR"
Initially = "INITIALLY"
Inline = "INLINE"
Inner = "INNER"
Input = "INPUT"
Insensitive = "INSENSITIVE"
Insert = "INSERT"
Int = "INT"
Integer = "INTEGER"
Intersect = "INTERSECT"
Interval = "INTERVAL"
Into = "INTO"
Is = "IS"
Isolation = "ISOLATION"
Join = "JOIN"
Kb = "KB"
Key = "KEY"
Keyset = "KEYSET"
Kill = "KILL"
Language = "LANGUAGE"
Last = "LAST"
Leading = "LEADING"
Left = "LEFT"
Level = "LEVEL"
Like = "LIKE"
Lineno = "LINENO"
Load = "LOAD"
Local = "LOCAL"
Lower = "LOWER"
Mark = "MARK"
Match = "MATCH"
Max = "MAX"
Maxsize = "MAXSIZE"
Mb = "MB"
Merge = "MERGE"
Min = "MIN"
Minute = "MINUTE"
Modular = "MODULAR"
Module = "MODULE"
Month = "MONTH"
Name = "NAME"
Names = "NAMES"
National = "NATIONAL"
Natural = "NATURAL"
Nchar = "NCHAR"
Next = "NEXT"
No = "NO"
Nocheck = "NOCHECK"
Nonclustered = "NONCLUSTERED"
None = "NONE"
Not = "NOT"
Null = "NULL"
Nullif = "NULLIF"
Numeric = "NUMERIC"
Octet_length = "OCTET_LENGTH"
Of = "OF"
Off = "OFF"
Offsets = "OFFSETS"
On = "ON"
Only = "ONLY"
Open = "OPEN"
Opendatasource = "OPENDATASOURCE"
Openquery = "OPENQUERY"
Openrowset = "OPENROWSET"
Openxml = "OPENXML"
Optimistic = "OPTIMISTIC"
Option = "OPTION"
Order = "ORDER"
Out = "OUT"
Outer = "OUTER"
Output = "OUTPUT"
Over = "OVER"
Overlaps = "OVERLAPS"
Owner = "OWNER"
Pad = "PAD"
Partial = "PARTIAL"
Pascal = "PASCAL"
Percent = "PERCENT"
Pivot = "PIVOT"
Plan = "PLAN"
Position = "POSITION"
Precision = "PRECISION"
Prepare = "PREPARE"
Preserve = "PRESERVE"
Primary = "PRIMARY"
Print = "PRINT"
Prior = "PRIOR"
Privileges = "PRIVILEGES"
Proc = "PROC"
Procedure = "PROCEDURE"
Public = "PUBLIC"
Raiserror = "RAISERROR"
Read = "READ"
Read_only = "READ_ONLY"
Readonly = "READONLY"
Readtext = "READTEXT"
Real = "REAL"
Recompile = "RECOMPILE"
Reconfigure = "RECONFIGURE"
References = "REFERENCES"
Relative = "RELATIVE"
Replication = "REPLICATION"
Restore = "RESTORE"
Restrict = "RESTRICT"
Return = "RETURN"
Returns = "RETURNS"
Revert = "REVERT"
Revoke = "REVOKE"
Right = "RIGHT"
Rollback = "ROLLBACK"
Rowcount = "ROWCOUNT"
Rowguidcol = "ROWGUIDCOL"
Rows = "ROWS"
Rule = "RULE"
Save = "SAVE"
Schema = "SCHEMA"
Schemabinding = "SCHEMABINDING"
Scroll = "SCROLL"
Scroll_locks = "SCROLL_LOCKS"
Second = "SECOND"
Section = "SECTION"
Securityaudit = "SECURITYAUDIT"
Select = "SELECT"
Self = "SELF"
Semantickeyphrasetable = "SEMANTICKEYPHRASETABLE"
Semanticsimilaritydetailstable = "SEMANTICSIMILARITYDETAILSTABLE"
Semanticsimilaritytable = "SEMANTICSIMILARITYTABLE"
Session = "SESSION"
Session_user = "SESSION_USER"
Set = "SET"
Setuser = "SETUSER"
Shutdown = "SHUTDOWN"
Size = "SIZE"
Smallint = "SMALLINT"
Some = "SOME"
Space = "SPACE"
Sql = "SQL"
Sqlca = "SQLCA"
Sqlcode = "SQLCODE"
Sqlerror = "SQLERROR"
Sqlstate = "SQLSTATE"
Sqlwarning = "SQLWARNING"
Static = "STATIC"
Statistics = "STATISTICS"
Substring = "SUBSTRING"
Sum = "SUM"
System_user = "SYSTEM_USER"
Table = "TABLE"
Tablesample = "TABLESAMPLE"
Tb = "TB"
Temporary = "TEMPORARY"
Textsize = "TEXTSIZE"
Then = "THEN"
Time = "TIME"
Timestamp = "TIMESTAMP"
Timezone_hour = "TIMEZONE_HOUR"
Timezone_minute = "TIMEZONE_MINUTE"
To = "TO"
Top = "TOP"
Trailing = "TRAILING"
Tran = "TRAN"
Transaction = "TRANSACTION"
Translate = "TRANSLATE"
Translation = "TRANSLATION"
Trigger = "TRIGGER"
Trim = "TRIM"
True = "TRUE"
Truncate = "TRUNCATE"
Try_convert = "TRY_CONVERT"
Tsequal = "TSEQUAL"
Type_warning = "TYPE_WARNING"
Union = "UNION"
Unique = "UNIQUE"
Unknown = "UNKNOWN"
Unlimited = "UNLIMITED"
Unpivot = "UNPIVOT"
Update = "UPDATE"
Updatetext = "UPDATETEXT"
Upper = "UPPER"
Usage = "USAGE"
Use = "USE"
User = "USER"
Using = "USING"
Value = "VALUE"
Values = "VALUES"
Varchar = "VARCHAR"
Varying = "VARYING"
View = "VIEW"
Waitfor = "WAITFOR"
When = "WHEN"
Whenever = "WHENEVER"
Where = "WHERE"
While = "WHILE"
With = "WITH"
Within_group = "WITHIN_GROUP"
Work = "WORK"
Write = "WRITE"
Writetext = "WRITETEXT"
Year = "YEAR"
Zone = "ZONE"


identificador = [:letter:] (([:letter:] | [:digit:] | "_")*)
identificadorErr = ([:digit:] | "_") (([:letter:] | [:digit:] | "_")*)
cadena = "'" [^\r\n\u0027]* "'"
cadenaErr = "'" [^\r\n\u0027]*

%{
    public String lexeme;
    public int lin;
    public int col;
    public int len;
%}
%%

{Igual} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Igual;}
{Suma} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Suma;}
{Resta} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Resta;}
{Multiplicacion} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Multiplicacion;}
{Division} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Division;}
{Porcentaje} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Porcentaje;}
{Menor} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Menor;}
{MenorIgual} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return MenorIgual;}
{Mayor} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Mayor;}
{MayorIgual} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return MayorIgual;}
{Igual2} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Igual2;}
{NoIgual} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return NoIgual;}
{And} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return And;}
{Or} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Or;}
{Not2} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Not2;}
{PyC} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return PyC;}
{Coma} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Coma;}
{Punto} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Punto;}
{Arroba} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Arroba;}
{Numeral} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Numeral;}
{Numeral2} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Numeral2;}
{Corchetes} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Corchetes;}
{Llaves} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Llaves;}
{Parentesis} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Parentesis;}
{AbreCorchetes} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return AbreCorchetes;}
{AbreLlaves} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return AbreLlaves;}
{AbreParentesis} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return AbreParentesis;}
{CierraCorchetes} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return CierraCorchetes;}
{CierraLlaves} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return CierraLlaves;}
{CierraParentesis} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return CierraParentesis;}
{Absolute} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Absolute;}
{Action} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Action;}
{Ada} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Ada;}
{Add} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Add;}
{All} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return All;}
{Allocate} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Allocate;}
{Alter} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Alter;}
{Any} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Any;}
{Are} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Are;}
{Arying} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Arying;}
{As} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return As;}
{Asc} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Asc;}
{Assertion} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Assertion;}
{At} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return At;}
{Authorization} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Authorization;}
{Avg} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Avg;}
{Backup} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Backup;}
{Begin} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Begin;}
{Between} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Between;}
{Bit} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Bit;}
{Bit_length} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Bit_length;}
{Both} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Both;}
{Break} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Break;}
{Browse} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Browse;}
{Bulk} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Bulk;}
{By} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return By;}
{Called} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Called;}
{Caller} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Caller;}
{Cascade} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Cascade;}
{Cascaded} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Cascaded;}
{Case} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Case;}
{Cast} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Cast;}
{Catalog} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Catalog;}
{Char} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Char;}
{Char_length} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Char_length;}
{Charact} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Charact;}
{Character_length} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Character_length;}
{Check} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Check;}
{Checkpoint} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Checkpoint;}
{Close} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Close;}
{Clustered} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Clustered;}
{Coalesce} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Coalesce;}
{Collate} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Collate;}
{Collation} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Collation;}
{Column} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Column;}
{Commit} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Commit;}
{Compute} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Compute;}
{Connect} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Connect;}
{Connection} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Connection;}
{Constraint} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Constraint;}
{Constraints} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Constraints;}
{Contains} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Contains;}
{Containstable} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Containstable;}
{Continue} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Continue;}
{Convert} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Convert;}
{Corresponding} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Corresponding;}
{Count} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Count;}
{Create} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Create;}
{Cross} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Cross;}
{Current} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Current;}
{Current_date} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Current_date;}
{Current_time} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Current_time;}
{Current_timestamp} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Current_timestamp;}
{Current_user} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Current_user;}
{Cursor} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Cursor;}
{Database} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Database;}
{Date} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Date;}
{Day} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Day;}
{Dbcc} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Dbcc;}
{Deallocate} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Deallocate;}
{Dec} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Dec;}
{Decimal} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Decimal;}
{Declare} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Declare;}
{Default} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Default;}
{Deferrable} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Deferrable;}
{Deferred} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Deferred;}
{Delete} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Delete;}
{Deny} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Deny;}
{Desc} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Desc;}
{Describe} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Describe;}
{Descriptor} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Descriptor;}
{Diagnostics} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Diagnostics;}
{Disconnect} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Disconnect;}
{Disk} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Disk;}
{Distinct} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Distinct;}
{Distributed} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Distributed;}
{Domain} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Domain;}
{Double} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Double;}
{Drop} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Drop;}
{Dump} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Dump;}
{Dynamic} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Dynamic;}
{Else} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Else;}
{Encryption} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Encryption;}
{End} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return End;}
{End_exec} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return End_exec;}
{Errlvl} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Errlvl;}
{Escape} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Escape;}
{Except} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Except;}
{Exception} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Exception;}
{Exec} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Exec;}
{Execute} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Execute;}
{Exists} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Exists;}
{Exit} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Exit;}
{External} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return External;}
{Extract} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Extract;}
{False} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return False;}
{Fast_forward} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Fast_forward;}
{Fetch} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Fetch;}
{File} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return File;}
{Filegrowth} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Filegrowth;}
{Filename} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Filename;}
{Fillfactor} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Fillfactor;}
{First} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return First;}
{Float} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Float;}
{For} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return For;}
{Foreign} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Foreign;}
{Fortran} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Fortran;}
{Forward_only} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Forward_only;}
{Found} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Found;}
{Freetext} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Freetext;}
{Freetexttable} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Freetexttable;}
{From} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return From;}
{Full} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Full;}
{Function} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Function;}
{Gb} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Gb;}
{Get} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Get;}
{Global} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Global;}
{Go} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Go;}
{Goto} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Goto;}
{Grant} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Grant;}
{Group} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Group;}
{Having} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Having;}
{Holdlock} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Holdlock;}
{Hour} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Hour;}
{Identity} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Identity;}
{Identity_insert} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Identity_insert;}
{Identitycol} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Identitycol;}
{If} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return If;}
{Immediate} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Immediate;}
{In} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return In;}
{Include} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Include;}
{Index} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Index;}
{Indicator} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Indicator;}
{Initially} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Initially;}
{Inline} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Inline;}
{Inner} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Inner;}
{Input} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Input;}
{Insensitive} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Insensitive;}
{Insert} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Insert;}
{Int} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Int;}
{Integer} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Integer;}
{Intersect} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Intersect;}
{Interval} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Interval;}
{Into} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Into;}
{Is} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Is;}
{Isolation} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Isolation;}
{Join} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Join;}
{Kb} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Kb;}
{Key} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Key;}
{Keyset} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Keyset;}
{Kill} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Kill;}
{Language} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Language;}
{Last} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Last;}
{Leading} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Leading;}
{Left} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Left;}
{Level} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Level;}
{Like} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Like;}
{Lineno} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Lineno;}
{Load} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Load;}
{Local} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Local;}
{Lower} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Lower;}
{Mark} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Mark;}
{Match} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Match;}
{Max} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Max;}
{Maxsize} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Maxsize;}
{Mb} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Mb;}
{Merge} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Merge;}
{Min} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Min;}
{Minute} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Minute;}
{Modular} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Modular;}
{Module} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Module;}
{Month} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Month;}
{Name} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Name;}
{Names} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Names;}
{National} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return National;}
{Natural} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Natural;}
{Nchar} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Nchar;}
{Next} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Next;}
{No} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return No;}
{Nocheck} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Nocheck;}
{Nonclustered} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Nonclustered;}
{None} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return None;}
{Not} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Not;}
{Null} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Null;}
{Nullif} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Nullif;}
{Numeric} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Numeric;}
{Octet_length} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Octet_length;}
{Of} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Of;}
{Off} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Off;}
{Offsets} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Offsets;}
{On} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return On;}
{Only} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Only;}
{Open} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Open;}
{Opendatasource} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Opendatasource;}
{Openquery} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Openquery;}
{Openrowset} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Openrowset;}
{Openxml} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Openxml;}
{Optimistic} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Optimistic;}
{Option} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Option;}
{Order} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Order;}
{Out} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Out;}
{Outer} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Outer;}
{Output} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Output;}
{Over} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Over;}
{Overlaps} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Overlaps;}
{Owner} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Owner;}
{Pad} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Pad;}
{Partial} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Partial;}
{Pascal} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Pascal;}
{Percent} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Percent;}
{Pivot} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Pivot;}
{Plan} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Plan;}
{Position} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Position;}
{Precision} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Precision;}
{Prepare} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Prepare;}
{Preserve} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Preserve;}
{Primary} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Primary;}
{Print} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Print;}
{Prior} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Prior;}
{Privileges} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Privileges;}
{Proc} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Proc;}
{Procedure} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Procedure;}
{Public} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Public;}
{Raiserror} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Raiserror;}
{Read} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Read;}
{Read_only} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Read_only;}
{Readonly} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Readonly;}
{Readtext} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Readtext;}
{Real} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Real;}
{Recompile} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Recompile;}
{Reconfigure} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Reconfigure;}
{References} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return References;}
{Relative} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Relative;}
{Replication} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Replication;}
{Restore} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Restore;}
{Restrict} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Restrict;}
{Return} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Return;}
{Returns} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Returns;}
{Revert} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Revert;}
{Revoke} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Revoke;}
{Right} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Right;}
{Rollback} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Rollback;}
{Rowcount} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Rowcount;}
{Rowguidcol} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Rowguidcol;}
{Rows} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Rows;}
{Rule} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Rule;}
{Save} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Save;}
{Schema} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Schema;}
{Schemabinding} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Schemabinding;}
{Scroll} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Scroll;}
{Scroll_locks} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Scroll_locks;}
{Second} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Second;}
{Section} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Section;}
{Securityaudit} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Securityaudit;}
{Select} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Select;}
{Self} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Self;}
{Semantickeyphrasetable} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Semantickeyphrasetable;}
{Semanticsimilaritydetailstable} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Semanticsimilaritydetailstable;}
{Semanticsimilaritytable} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Semanticsimilaritytable;}
{Session} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Session;}
{Session_user} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Session_user;}
{Set} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Set;}
{Setuser} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Setuser;}
{Shutdown} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Shutdown;}
{Size} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Size;}
{Smallint} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Smallint;}
{Some} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Some;}
{Space} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Space;}
{Sql} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Sql;}
{Sqlca} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Sqlca;}
{Sqlcode} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Sqlcode;}
{Sqlerror} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Sqlerror;}
{Sqlstate} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Sqlstate;}
{Sqlwarning} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Sqlwarning;}
{Static} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Static;}
{Statistics} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Statistics;}
{Substring} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Substring;}
{Sum} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Sum;}
{System_user} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return System_user;}
{Table} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Table;}
{Tablesample} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Tablesample;}
{Tb} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Tb;}
{Temporary} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Temporary;}
{Textsize} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Textsize;}
{Then} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Then;}
{Time} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Time;}
{Timestamp} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Timestamp;}
{Timezone_hour} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Timezone_hour;}
{Timezone_minute} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Timezone_minute;}
{To} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return To;}
{Top} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Top;}
{Trailing} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Trailing;}
{Tran} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Tran;}
{Transaction} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Transaction;}
{Translate} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Translate;}
{Translation} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Translation;}
{Trigger} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Trigger;}
{Trim} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Trim;}
{True} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return True;}
{Truncate} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Truncate;}
{Try_convert} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Try_convert;}
{Tsequal} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Tsequal;}
{Type_warning} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Type_warning;}
{Union} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Union;}
{Unique} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Unique;}
{Unknown} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Unknown;}
{Unlimited} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Unlimited;}
{Unpivot} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Unpivot;}
{Update} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Update;}
{Updatetext} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Updatetext;}
{Upper} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Upper;}
{Usage} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Usage;}
{Use} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Use;}
{User} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return User;}
{Using} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Using;}
{Value} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Value;}
{Values} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Values;}
{Varchar} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Varchar;}
{Varying} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Varying;}
{View} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return View;}
{Waitfor} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Waitfor;}
{When} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return When;}
{Whenever} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Whenever;}
{Where} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Where;}
{While} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return While;}
{With} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return With;}
{Within_group} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Within_group;}
{Work} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Work;}
{Write} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Write;}
{Writetext} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Writetext;}
{Year} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Year;}
{Zone} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Zone;}

{identificador} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Identificador;}
{flotan} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Flotante;}
{entero} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Entero;}
{cadena} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Cadena;}
{coment} {/*Ignore*/}
{espacio} {/*Ignore*/}
{flotanErr} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return FlotanteError;}
{identificadorErr} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return IdentificadorError;}
{cadenaErr} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return CadenaError;}
"/*"({ichar}*) {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return MalComentario;}

 . {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return ERROR;}