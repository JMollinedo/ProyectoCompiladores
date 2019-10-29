package userinterface;
import static userinterface.Token.*;
%%
%class Lexer
%unicode
%type Token
%line
%column
%char

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
Bigint = "BIGINT"
Binary = "BINARY"
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
Datetime = "DATETIME"
Datetime2 = "DATETIME2"
Datetimeoffset = "DATETIMEOFFSET"
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
Hierarchyid = "HIERARCHYID"
Holdlock = "HOLDLOCK"
Hour = "HOUR"
Identity = "IDENTITY"
Identity_insert = "IDENTITY_INSERT"
Identitycol = "IDENTITYCOL"
If = "IF"
Image = "IMAGE"
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
Money = "MONEY"
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
Ntext = "NTEXT"
Numeric = "NUMERIC"
Nvarchar = "NVARCHAR"
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
Rowversion = "ROWVERSION"
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
Smalldatetime = "SMALLDATETIME"
Smallint = "SMALLINT"
Smallmoney = "SMALLMONEY"
Some = "SOME"
Space = "SPACE"
Sql = "SQL"
Sqlca = "SQLCA"
Sqlcode = "SQLCODE"
Sqlerror = "SQLERROR"
Sqlstate = "SQLSTATE"
Sql_variant = "SQL_VARIANT"
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
Text = "TEXT"
Textsize = "TEXTSIZE"
Then = "THEN"
Time = "TIME"
Timestamp = "TIMESTAMP"
Timezone_hour = "TIMEZONE_HOUR"
Timezone_minute = "TIMEZONE_MINUTE"
Tinyint = "TINYINT"
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
Uniqueidentifier = "UNIQUEIDENTIFIER"
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
Varbinary = "VARBINARY"
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
Xml = "XML"
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
    public int cha;
%}
%%

{Bigint} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Bigint;}
{Binary} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Binary;}
{Datetime} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Datetime;}
{Datetime2} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Datetime2;}
{Datetimeoffset} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Datetimeoffset;}
{Hierarchyid} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Hierarchyid;}
{Image} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Image;}
{Money} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Money;}
{Ntext} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Ntext;}
{Nvarchar} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Nvarchar;}
{Rowversion} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Rowversion;}
{Smalldatetime} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Smalldatetime;}
{Smallmoney} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Smallmoney;}
{Sql_variant} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Sql_variant;}
{Text} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Text;}
{Tinyint} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Tinyint;}
{Uniqueidentifier} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Uniqueidentifier;}
{Varbinary} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Varbinary;}
{Xml} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Xml;}

{Igual} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Igual;}
{Suma} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Suma;}
{Resta} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Resta;}
{Multiplicacion} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Multiplicacion;}
{Division} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Division;}
{Porcentaje} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Porcentaje;}
{Menor} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Menor;}
{MenorIgual} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return MenorIgual;}
{Mayor} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Mayor;}
{MayorIgual} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return MayorIgual;}
{Igual2} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Igual2;}
{NoIgual} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return NoIgual;}
{And} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return And;}
{Or} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Or;}
{Not2} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Not2;}
{PyC} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return PyC;}
{Coma} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Coma;}
{Punto} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Punto;}
{Arroba} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Arroba;}
{Numeral} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Numeral;}
{Numeral2} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Numeral2;}
{Corchetes} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Corchetes;}
{Llaves} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Llaves;}
{Parentesis} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Parentesis;}
{AbreCorchetes} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return AbreCorchetes;}
{AbreLlaves} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return AbreLlaves;}
{AbreParentesis} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return AbreParentesis;}
{CierraCorchetes} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return CierraCorchetes;}
{CierraLlaves} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return CierraLlaves;}
{CierraParentesis} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return CierraParentesis;}
{Absolute} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Absolute;}
{Action} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Action;}
{Ada} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Ada;}
{Add} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Add;}
{All} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return All;}
{Allocate} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Allocate;}
{Alter} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Alter;}
{Any} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Any;}
{Are} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Are;}
{Arying} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Arying;}
{As} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return As;}
{Asc} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Asc;}
{Assertion} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Assertion;}
{At} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return At;}
{Authorization} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Authorization;}
{Avg} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Avg;}
{Backup} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Backup;}
{Begin} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Begin;}
{Between} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Between;}
{Bit} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Bit;}
{Bit_length} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Bit_length;}
{Both} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Both;}
{Break} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Break;}
{Browse} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Browse;}
{Bulk} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Bulk;}
{By} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return By;}
{Called} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Called;}
{Caller} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Caller;}
{Cascade} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Cascade;}
{Cascaded} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Cascaded;}
{Case} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Case;}
{Cast} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Cast;}
{Catalog} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Catalog;}
{Char} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Char;}
{Char_length} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Char_length;}
{Charact} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Charact;}
{Character_length} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Character_length;}
{Check} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Check;}
{Checkpoint} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Checkpoint;}
{Close} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Close;}
{Clustered} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Clustered;}
{Coalesce} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Coalesce;}
{Collate} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Collate;}
{Collation} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Collation;}
{Column} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Column;}
{Commit} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Commit;}
{Compute} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Compute;}
{Connect} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Connect;}
{Connection} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Connection;}
{Constraint} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Constraint;}
{Constraints} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Constraints;}
{Contains} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Contains;}
{Containstable} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Containstable;}
{Continue} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Continue;}
{Convert} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Convert;}
{Corresponding} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Corresponding;}
{Count} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Count;}
{Create} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Create;}
{Cross} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Cross;}
{Current} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Current;}
{Current_date} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Current_date;}
{Current_time} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Current_time;}
{Current_timestamp} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Current_timestamp;}
{Current_user} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Current_user;}
{Cursor} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Cursor;}
{Database} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Database;}
{Date} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Date;}
{Day} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Day;}
{Dbcc} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Dbcc;}
{Deallocate} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Deallocate;}
{Dec} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Dec;}
{Decimal} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Decimal;}
{Declare} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Declare;}
{Default} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Default;}
{Deferrable} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Deferrable;}
{Deferred} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Deferred;}
{Delete} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Delete;}
{Deny} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Deny;}
{Desc} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Desc;}
{Describe} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Describe;}
{Descriptor} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Descriptor;}
{Diagnostics} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Diagnostics;}
{Disconnect} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Disconnect;}
{Disk} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Disk;}
{Distinct} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Distinct;}
{Distributed} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Distributed;}
{Domain} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Domain;}
{Double} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Double;}
{Drop} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Drop;}
{Dump} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Dump;}
{Dynamic} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Dynamic;}
{Else} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Else;}
{Encryption} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Encryption;}
{End} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return End;}
{End_exec} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return End_exec;}
{Errlvl} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Errlvl;}
{Escape} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Escape;}
{Except} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Except;}
{Exception} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Exception;}
{Exec} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Exec;}
{Execute} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Execute;}
{Exists} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Exists;}
{Exit} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Exit;}
{External} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return External;}
{Extract} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Extract;}
{False} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return False;}
{Fast_forward} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Fast_forward;}
{Fetch} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Fetch;}
{File} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return File;}
{Filegrowth} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Filegrowth;}
{Filename} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Filename;}
{Fillfactor} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Fillfactor;}
{First} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return First;}
{Float} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Float;}
{For} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return For;}
{Foreign} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Foreign;}
{Fortran} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Fortran;}
{Forward_only} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Forward_only;}
{Found} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Found;}
{Freetext} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Freetext;}
{Freetexttable} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Freetexttable;}
{From} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return From;}
{Full} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Full;}
{Function} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Function;}
{Gb} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Gb;}
{Get} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Get;}
{Global} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Global;}
{Go} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Go;}
{Goto} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Goto;}
{Grant} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Grant;}
{Group} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Group;}
{Having} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Having;}
{Holdlock} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Holdlock;}
{Hour} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Hour;}
{Identity} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Identity;}
{Identity_insert} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Identity_insert;}
{Identitycol} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Identitycol;}
{If} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return If;}
{Immediate} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Immediate;}
{In} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return In;}
{Include} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Include;}
{Index} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Index;}
{Indicator} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Indicator;}
{Initially} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Initially;}
{Inline} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Inline;}
{Inner} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Inner;}
{Input} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Input;}
{Insensitive} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Insensitive;}
{Insert} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Insert;}
{Int} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Int;}
{Integer} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Integer;}
{Intersect} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Intersect;}
{Interval} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Interval;}
{Into} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Into;}
{Is} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Is;}
{Isolation} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Isolation;}
{Join} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Join;}
{Kb} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Kb;}
{Key} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Key;}
{Keyset} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Keyset;}
{Kill} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Kill;}
{Language} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Language;}
{Last} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Last;}
{Leading} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Leading;}
{Left} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Left;}
{Level} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Level;}
{Like} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Like;}
{Lineno} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Lineno;}
{Load} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Load;}
{Local} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Local;}
{Lower} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Lower;}
{Mark} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Mark;}
{Match} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Match;}
{Max} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Max;}
{Maxsize} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Maxsize;}
{Mb} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Mb;}
{Merge} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Merge;}
{Min} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Min;}
{Minute} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Minute;}
{Modular} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Modular;}
{Module} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Module;}
{Month} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Month;}
{Name} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Name;}
{Names} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Names;}
{National} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return National;}
{Natural} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Natural;}
{Nchar} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Nchar;}
{Next} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Next;}
{No} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return No;}
{Nocheck} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Nocheck;}
{Nonclustered} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Nonclustered;}
{None} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return None;}
{Not} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Not;}
{Null} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Null;}
{Nullif} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Nullif;}
{Numeric} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Numeric;}
{Octet_length} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Octet_length;}
{Of} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Of;}
{Off} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Off;}
{Offsets} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Offsets;}
{On} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return On;}
{Only} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Only;}
{Open} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Open;}
{Opendatasource} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Opendatasource;}
{Openquery} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Openquery;}
{Openrowset} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Openrowset;}
{Openxml} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Openxml;}
{Optimistic} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Optimistic;}
{Option} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Option;}
{Order} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Order;}
{Out} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Out;}
{Outer} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Outer;}
{Output} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Output;}
{Over} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Over;}
{Overlaps} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Overlaps;}
{Owner} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Owner;}
{Pad} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Pad;}
{Partial} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Partial;}
{Pascal} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Pascal;}
{Percent} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Percent;}
{Pivot} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Pivot;}
{Plan} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Plan;}
{Position} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Position;}
{Precision} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Precision;}
{Prepare} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Prepare;}
{Preserve} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Preserve;}
{Primary} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Primary;}
{Print} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Print;}
{Prior} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Prior;}
{Privileges} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Privileges;}
{Proc} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Proc;}
{Procedure} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Procedure;}
{Public} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Public;}
{Raiserror} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Raiserror;}
{Read} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Read;}
{Read_only} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Read_only;}
{Readonly} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Readonly;}
{Readtext} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Readtext;}
{Real} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Real;}
{Recompile} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Recompile;}
{Reconfigure} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Reconfigure;}
{References} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return References;}
{Relative} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Relative;}
{Replication} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Replication;}
{Restore} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Restore;}
{Restrict} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Restrict;}
{Return} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Return;}
{Returns} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Returns;}
{Revert} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Revert;}
{Revoke} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Revoke;}
{Right} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Right;}
{Rollback} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Rollback;}
{Rowcount} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Rowcount;}
{Rowguidcol} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Rowguidcol;}
{Rows} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Rows;}
{Rule} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Rule;}
{Save} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Save;}
{Schema} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Schema;}
{Schemabinding} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Schemabinding;}
{Scroll} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Scroll;}
{Scroll_locks} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Scroll_locks;}
{Second} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Second;}
{Section} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Section;}
{Securityaudit} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Securityaudit;}
{Select} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Select;}
{Self} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Self;}
{Semantickeyphrasetable} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Semantickeyphrasetable;}
{Semanticsimilaritydetailstable} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Semanticsimilaritydetailstable;}
{Semanticsimilaritytable} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Semanticsimilaritytable;}
{Session} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Session;}
{Session_user} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Session_user;}
{Set} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Set;}
{Setuser} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Setuser;}
{Shutdown} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Shutdown;}
{Size} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Size;}
{Smallint} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Smallint;}
{Some} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Some;}
{Space} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Space;}
{Sql} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Sql;}
{Sqlca} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Sqlca;}
{Sqlcode} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Sqlcode;}
{Sqlerror} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Sqlerror;}
{Sqlstate} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Sqlstate;}
{Sqlwarning} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Sqlwarning;}
{Static} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Static;}
{Statistics} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Statistics;}
{Substring} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Substring;}
{Sum} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Sum;}
{System_user} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return System_user;}
{Table} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Table;}
{Tablesample} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Tablesample;}
{Tb} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Tb;}
{Temporary} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Temporary;}
{Textsize} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Textsize;}
{Then} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Then;}
{Time} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Time;}
{Timestamp} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Timestamp;}
{Timezone_hour} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Timezone_hour;}
{Timezone_minute} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Timezone_minute;}
{To} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return To;}
{Top} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Top;}
{Trailing} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Trailing;}
{Tran} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Tran;}
{Transaction} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Transaction;}
{Translate} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Translate;}
{Translation} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Translation;}
{Trigger} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Trigger;}
{Trim} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Trim;}
{True} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return True;}
{Truncate} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Truncate;}
{Try_convert} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Try_convert;}
{Tsequal} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Tsequal;}
{Type_warning} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Type_warning;}
{Union} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Union;}
{Unique} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Unique;}
{Unknown} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Unknown;}
{Unlimited} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Unlimited;}
{Unpivot} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Unpivot;}
{Update} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Update;}
{Updatetext} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Updatetext;}
{Upper} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Upper;}
{Usage} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Usage;}
{Use} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Use;}
{User} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return User;}
{Using} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Using;}
{Value} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Value;}
{Values} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Values;}
{Varchar} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Varchar;}
{Varying} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Varying;}
{View} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return View;}
{Waitfor} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Waitfor;}
{When} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return When;}
{Whenever} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Whenever;}
{Where} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Where;}
{While} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return While;}
{With} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return With;}
{Within_group} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Within_group;}
{Work} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Work;}
{Write} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Write;}
{Writetext} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Writetext;}
{Year} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Year;}
{Zone} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Zone;}

{identificador} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Identificador;}
{flotan} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Flotante;}
{entero} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Entero;}
{cadena} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Cadena;}
{coment} {/*Ignore*/}
{espacio} {/*Ignore*/}
{flotanErr} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return FlotanteError;}
{identificadorErr} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return IdentificadorError;}
{cadenaErr} {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return CadenaError;}
"/*"({ichar}*) {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return MalComentario;}

 . {cha=yychar; lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return ERROR;}