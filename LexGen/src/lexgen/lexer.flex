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

mlcoment = "/*" ~"*/"
ulcoment = "--" ({ichar}*) {nlinea}?
coment = {mlcoment} | {ulcoment}

Cursor = "CURSOR"
Hierarchyid = "HIERARCHYID"
Rowversion = "ROWVERSION"
Sql_variant = "SQL_VARIANT"
Uniqueidentifier = "UNIQUEIDENTIFIER"
Xml = "XML"
Bigint = "BIGINT"
Int = "INT"
Smallint = "SMALLINT"
Tinyint = "TINYINT"
Bit = "BIT"
Decimal = "DECIMAL"
Money = "MONEY"
Numeric = "NUMERIC"
Smallmoney = "SMALLMONEY"
Float = "FLOAT"
Real = "REAL"
Date = "DATE"
Datetime = "DATETIME"
Datetime2 = "DATETIME2"
Datetimeoffset = "DATETIMEOFFSET"
Smalldatetime = "SMALLDATETIME"
Time = "TIME"
Char = "CHAR"
Text = "TEXT"
Varchar = "VARCHAR"
Nchar = "NCHAR"
Ntext = "NTEXT"
Nvarchar = "NVARCHAR"
Binary = "BINARY"
Image = "IMAGE"
Varbinary = "VARBINARY"
Add = "ADD"
All = "ALL"
Alter = "ALTER"
And = "AND"
Any = "ANY"
As = "AS"
Asc = "ASC"
Authorization = "AUTHORIZATION"
Backup = "BACKUP"
Begin = "BEGIN"
Between = "BETWEEN"
Break = "BREAK"
Browse = "BROWSE"
Bulk = "BULK"
By = "BY"
Cascade = "CASCADE"
Case = "CASE"
Check = "CHECK"
Checkpoint = "CHECKPOINT"
Close = "CLOSE"
Clustered = "CLUSTERED"
Coalesce = "COALESCE"
Collate = "COLLATE"
Column = "COLUMN"
Commit = "COMMIT"
Compute = "COMPUTE"
Constraint = "CONSTRAINT"
Contains = "CONTAINS"
Containstable = "CONTAINSTABLE"
Continue = "CONTINUE"
Convert = "CONVERT"
Create = "CREATE"
Cross = "CROSS"
Current = "CURRENT"
Current_date = "CURRENT_DATE"
Current_time = "CURRENT_TIME"
Current_timestamp = "CURRENT_TIMESTAMP"
Current_user = "CURRENT_USER"
Database = "DATABASE"
Dbcc = "DBCC"
Deallocate = "DEALLOCATE"
Declare = "DECLARE"
Default = "DEFAULT"
Delete = "DELETE"
Deny = "DENY"
Desc = "DESC"
Disk = "DISK"
Distinct = "DISTINCT"
Distributed = "DISTRIBUTED"
Double = "DOUBLE"
Drop = "DROP"
Dump = "DUMP"
Else = "ELSE"
End = "END"
Errlvl = "ERRLVL"
Escape = "ESCAPE"
Except = "EXCEPT"
Exec = "EXEC"
Execute = "EXECUTE"
Exists = "EXISTS"
Exit = "EXIT"
External = "EXTERNAL"
Fetch = "FETCH"
File = "FILE"
Fillfactor = "FILLFACTOR"
For = "FOR"
Foreign = "FOREIGN"
Freetext = "FREETEXT"
Freetexttable = "FREETEXTTABLE"
From = "FROM"
Full = "FULL"
Function = "FUNCTION"
Goto = "GOTO"
Grant = "GRANT"
Group = "GROUP"
Having = "HAVING"
Holdlock = "HOLDLOCK"
Identity = "IDENTITY"
Identity_insert = "IDENTITY_INSERT"
Identitycol = "IDENTITYCOL"
If = "IF"
In = "IN"
Index = "INDEX"
Inner = "INNER"
Insert = "INSERT"
Intersect = "INTERSECT"
Into = "INTO"
Is = "IS"
Join = "JOIN"
Key = "KEY"
Kill = "KILL"
Left = "LEFT"
Like = "LIKE"
Lineno = "LINENO"
Load = "LOAD"
Merge = "MERGE"
National = "NATIONAL"
Nocheck = "NOCHECK"
Nonclustered = "NONCLUSTERED"
Not = "NOT"
Null = "NULL"
Nullif = "NULLIF"
Of = "OF"
Off = "OFF"
Offsets = "OFFSETS"
On = "ON"
Open = "OPEN"
Opendatasource = "OPENDATASOURCE"
Openquery = "OPENQUERY"
Openrowset = "OPENROWSET"
Openxml = "OPENXML"
Option = "OPTION"
Or = "OR"
Order = "ORDER"
Outer = "OUTER"
Over = "OVER"
Percent = "PERCENT"
Pivot = "PIVOT"
Plan = "PLAN"
Precision = "PRECISION"
Primary = "PRIMARY"
Print = "PRINT"
Proc = "PROC"
Procedure = "PROCEDURE"
Public = "PUBLIC"
Raiserror = "RAISERROR"
Read = "READ"
Readtext = "READTEXT"
Reconfigure = "RECONFIGURE"
References = "REFERENCES"
Replication = "REPLICATION"
Restore = "RESTORE"
Restrict = "RESTRICT"
Return = "RETURN"
Revert = "REVERT"
Revoke = "REVOKE"
Right = "RIGHT"
Rollback = "ROLLBACK"
Rowcount = "ROWCOUNT"
Rowguidcol = "ROWGUIDCOL"
Rule = "RULE"
Save = "SAVE"
Schema = "SCHEMA"
Securityaudit = "SECURITYAUDIT"
Select = "SELECT"
Semantickeyphrasetable = "SEMANTICKEYPHRASETABLE"
Semanticsimilaritydetailstable = "SEMANTICSIMILARITYDETAILSTABLE"
Semanticsimilaritytable = "SEMANTICSIMILARITYTABLE"
Session_user = "SESSION_USER"
Set = "SET"
Setuser = "SETUSER"
Shutdown = "SHUTDOWN"
Some = "SOME"
Statistics = "STATISTICS"
System_user = "SYSTEM_USER"
Table = "TABLE"
Tablesample = "TABLESAMPLE"
Textsize = "TEXTSIZE"
Then = "THEN"
To = "TO"
Top = "TOP"
Tran = "TRAN"
Transaction = "TRANSACTION"
Trigger = "TRIGGER"
Truncate = "TRUNCATE"
Try_convert = "TRY_CONVERT"
Tsequal = "TSEQUAL"
Union = "UNION"
Unique = "UNIQUE"
Unpivot = "UNPIVOT"
Update = "UPDATE"
Updatetext = "UPDATETEXT"
Use = "USE"
User = "USER"
Values = "VALUES"
Varying = "VARYING"
View = "VIEW"
Waitfor = "WAITFOR"
When = "WHEN"
Where = "WHERE"
While = "WHILE"
With = "WITH"
Within_group = "WITHIN_GROUP"
Writetext = "WRITETEXT"
Absolute = "ABSOLUTE"
Action = "ACTION"
Ada = "ADA"
Allocate = "ALLOCATE"
Are = "ARE"
Assertion = "ASSERTION"
At = "AT"
Avg = "AVG"
Bit_length = "BIT_LENGTH"
Both = "BOTH"
Cascaded = "CASCADED"
Cast = "CAST"
Catalog = "CATALOG"
Char_length = "CHAR_LENGTH"
Character = "CHARACTER"
Character_length = "CHARACTER_LENGTH"
Collation = "COLLATION"
Connect = "CONNECT"
Connection = "CONNECTION"
Constraints = "CONSTRAINTS"
Corresponding = "CORRESPONDING"
Count = "COUNT"
Day = "DAY"
Dec = "DEC"
Deferrable = "DEFERRABLE"
Deferred = "DEFERRED"
Describe = "DESCRIBE"
Descriptor = "DESCRIPTOR"
Diagnostics = "DIAGNOSTICS"
Disconnect = "DISCONNECT"
Domain = "DOMAIN"
End_exec = "END-EXEC"
Extract = "EXTRACT"
False = "FALSE"
First = "FIRST"
Fortran = "FORTRAN"
Found = "FOUND"
Get = "GET"
Global = "GLOBAL"
Go = "GO"
Hour = "HOUR"
Immediate = "IMMEDIATE"
Include = "INCLUDE"
Indicator = "INDICATOR"
Initially = "INITIALLY"
Input = "INPUT"
Insensitive = "INSENSITIVE"
Integer = "INTEGER"
Interval = "INTERVAL"
Isolation = "ISOLATION"
Language = "LANGUAGE"
Last = "LAST"
Leading = "LEADING"
Level = "LEVEL"
Local = "LOCAL"
Lower = "LOWER"
Match = "MATCH"
Max = "MAX"
Min = "MIN"
Minute = "MINUTE"
Module = "MODULE"
Month = "MONTH"
Names = "NAMES"
Natural = "NATURAL"
Next = "NEXT"
No = "NO"
None = "NONE"
Octet_length = "OCTET_LENGTH"
Only = "ONLY"
Output = "OUTPUT"
Overlaps = "OVERLAPS"
Pad = "PAD"
Partial = "PARTIAL"
Pascal = "PASCAL"
Position = "POSITION"
Prepare = "PREPARE"
Preserve = "PRESERVE"
Prior = "PRIOR"
Privileges = "PRIVILEGES"
Relative = "RELATIVE"
Rows = "ROWS"
Scroll = "SCROLL"
Second = "SECOND"
Section = "SECTION"
Session = "SESSION"
Size = "SIZE"
Space = "SPACE"
Sql = "SQL"
Sqlca = "SQLCA"
Sqlcode = "SQLCODE"
Sqlerror = "SQLERROR"
Sqlstate = "SQLSTATE"
Sqlwarning = "SQLWARNING"
Substring = "SUBSTRING"
Sum = "SUM"
Temporary = "TEMPORARY"
Timestamp = "TIMESTAMP"
Timezone_hour = "TIMEZONE_HOUR"
Timezone_minute = "TIMEZONE_MINUTE"
Trailing = "TRAILING"
Translate = "TRANSLATE"
Translation = "TRANSLATION"
Trim = "TRIM"
True = "TRUE"
Unknown = "UNKNOWN"
Upper = "UPPER"
Usage = "USAGE"
Using = "USING"
Value = "VALUE"
Whenever = "WHENEVER"
Work = "WORK"
Write = "WRITE"
Year = "YEAR"
Zone = "ZONE"
Out = "OUT"
Readonly = "READONLY"
Encryption = "ENCRYPTION"
Returns = "RETURNS"
Schemabinding = "SCHEMABINDING"
Called = "CALLED"
Inline = "INLINE"
Caller = "CALLER"
Self = "SELF"
Owner = "OWNER"
Recompile = "RECOMPILE"
Mark = "MARK"
Forward_only = "FORWARD_ONLY"
Static = "STATIC"
Keyset = "KEYSET"
Dynamic = "DYNAMIC"
Fast_forward = "FAST_FORWARD"
Read_only = "READ_ONLY"
Scroll_locks = "SCROLL_LOCKS"
Optimistic = "OPTIMISTIC"
Type_warning = "TYPE_WARNING"
Corchetes = "[]"
Parentesis = "()"
Llaves = "{}"
Arroba = "@"
Numeral = "#"
Numeral2 = "##"
Menor = "<"
MenorIgual = "<="
Mayor = ">"
MayorIgual = ">="
Igual = "="
Igual2 = "=="
Diferente = "!="
And = "&&"
Or = "||"
Sumar = "+"
Restar = "-"
Multiplicar = "*"
Dividir = "/"
Modulo = "%"
CorcheteAbrir = "["
CorcheteCerrar = "]"
ParentesisAbrir = "("
ParentesisCerrar = ")"
LlaveAbrir = "{"
LlaveCerrar = "}"
punto = "."
coma = ","
pyc = ";"

identificador = [:letter:] (([:letter:] | [:digit:] | "_")*)
identificadorErr = ([:digit:] | "_") (([:letter:] | [:digit:] | "_")*)

numero = [0-9]

entero = ({numero}+)
flotan = {entero} "." ({numero}*) ((("E"|"e") (("+"|"-")?) {entero})?)
flotanErr = {entero} "." {identificador}

cadena = "'" [^\r\n\u0027]* "'"
cadenaErr = "'" [^\r\n\u0027]*
%{
    public String lexeme;
    public int lin;
    public int col;
    public int len;
%}
%%

{Cursor} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return CURSOR;}
{Hierarchyid} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return HIERARCHYID;}
{Rowversion} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return ROWVERSION;}
{Sql_variant} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return SQL_VARIANT;}
{Uniqueidentifier} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return UNIQUEIDENTIFIER;}
{Xml} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return XML;}
{Bigint} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return BIGINT;}
{Int} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return INT;}
{Smallint} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return SMALLINT;}
{Tinyint} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return TINYINT;}
{Bit} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return BIT;}
{Decimal} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return DECIMAL;}
{Money} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return MONEY;}
{Numeric} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return NUMERIC;}
{Smallmoney} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return SMALLMONEY;}
{Float} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return FLOAT;}
{Real} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return REAL;}
{Date} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return DATE;}
{Datetime} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return DATETIME;}
{Datetime2} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return DATETIME2;}
{Datetimeoffset} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return DATETIMEOFFSET;}
{Smalldatetime} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return SMALLDATETIME;}
{Time} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return TIME;}
{Char} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return CHAR;}
{Text} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return TEXT;}
{Varchar} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return VARCHAR;}
{Nchar} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return NCHAR;}
{Ntext} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return NTEXT;}
{Nvarchar} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return NVARCHAR;}
{Binary} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return BINARY;}
{Image} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return IMAGE;}
{Varbinary} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return VARBINARY;}
{Add} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return ADD;}
{All} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return ALL;}
{Alter} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return ALTER;}
{And} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return AND;}
{Any} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return ANY;}
{As} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return AS;}
{Asc} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return ASC;}
{Authorization} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return AUTHORIZATION;}
{Backup} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return BACKUP;}
{Begin} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return BEGIN;}
{Between} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return BETWEEN;}
{Break} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return BREAK;}
{Browse} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return BROWSE;}
{Bulk} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return BULK;}
{By} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return BY;}
{Cascade} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return CASCADE;}
{Case} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return CASE;}
{Check} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return CHECK;}
{Checkpoint} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return CHECKPOINT;}
{Close} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return CLOSE;}
{Clustered} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return CLUSTERED;}
{Coalesce} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return COALESCE;}
{Collate} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return COLLATE;}
{Column} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return COLUMN;}
{Commit} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return COMMIT;}
{Compute} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return COMPUTE;}
{Constraint} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return CONSTRAINT;}
{Contains} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return CONTAINS;}
{Containstable} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return CONTAINSTABLE;}
{Continue} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return CONTINUE;}
{Convert} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return CONVERT;}
{Create} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return CREATE;}
{Cross} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return CROSS;}
{Current} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return CURRENT;}
{Current_date} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return CURRENT_DATE;}
{Current_time} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return CURRENT_TIME;}
{Current_timestamp} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return CURRENT_TIMESTAMP;}
{Current_user} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return CURRENT_USER;}
{Database} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return DATABASE;}
{Dbcc} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return DBCC;}
{Deallocate} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return DEALLOCATE;}
{Declare} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return DECLARE;}
{Default} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return DEFAULT;}
{Delete} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return DELETE;}
{Deny} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return DENY;}
{Desc} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return DESC;}
{Disk} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return DISK;}
{Distinct} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return DISTINCT;}
{Distributed} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return DISTRIBUTED;}
{Double} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return DOUBLE;}
{Drop} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return DROP;}
{Dump} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return DUMP;}
{Else} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return ELSE;}
{End} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return END;}
{Errlvl} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return ERRLVL;}
{Escape} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return ESCAPE;}
{Except} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return EXCEPT;}
{Exec} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return EXEC;}
{Execute} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return EXECUTE;}
{Exists} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return EXISTS;}
{Exit} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return EXIT;}
{External} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return EXTERNAL;}
{Fetch} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return FETCH;}
{File} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return FILE;}
{Fillfactor} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return FILLFACTOR;}
{For} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return FOR;}
{Foreign} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return FOREIGN;}
{Freetext} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return FREETEXT;}
{Freetexttable} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return FREETEXTTABLE;}
{From} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return FROM;}
{Full} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return FULL;}
{Function} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return FUNCTION;}
{Goto} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return GOTO;}
{Grant} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return GRANT;}
{Group} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return GROUP;}
{Having} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return HAVING;}
{Holdlock} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return HOLDLOCK;}
{Identity} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return IDENTITY;}
{Identity_insert} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return IDENTITY_INSERT;}
{Identitycol} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return IDENTITYCOL;}
{If} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return IF;}
{In} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return IN;}
{Index} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return INDEX;}
{Inner} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return INNER;}
{Insert} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return INSERT;}
{Intersect} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return INTERSECT;}
{Into} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return INTO;}
{Is} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return IS;}
{Join} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return JOIN;}
{Key} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return KEY;}
{Kill} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return KILL;}
{Left} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return LEFT;}
{Like} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return LIKE;}
{Lineno} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return LINENO;}
{Load} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return LOAD;}
{Merge} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return MERGE;}
{National} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return NATIONAL;}
{Nocheck} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return NOCHECK;}
{Nonclustered} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return NONCLUSTERED;}
{Not} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return NOT;}
{Null} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return NULL;}
{Nullif} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return NULLIF;}
{Of} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return OF;}
{Off} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return OFF;}
{Offsets} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return OFFSETS;}
{On} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return ON;}
{Open} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return OPEN;}
{Opendatasource} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return OPENDATASOURCE;}
{Openquery} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return OPENQUERY;}
{Openrowset} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return OPENROWSET;}
{Openxml} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return OPENXML;}
{Option} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return OPTION;}
{Or} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return OR;}
{Order} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return ORDER;}
{Outer} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return OUTER;}
{Over} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return OVER;}
{Percent} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return PERCENT;}
{Pivot} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return PIVOT;}
{Plan} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return PLAN;}
{Precision} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return PRECISION;}
{Primary} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return PRIMARY;}
{Print} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return PRINT;}
{Proc} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return PROC;}
{Procedure} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return PROCEDURE;}
{Public} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return PUBLIC;}
{Raiserror} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return RAISERROR;}
{Read} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return READ;}
{Readtext} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return READTEXT;}
{Reconfigure} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return RECONFIGURE;}
{References} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return REFERENCES;}
{Replication} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return REPLICATION;}
{Restore} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return RESTORE;}
{Restrict} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return RESTRICT;}
{Return} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return RETURN;}
{Revert} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return REVERT;}
{Revoke} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return REVOKE;}
{Right} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return RIGHT;}
{Rollback} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return ROLLBACK;}
{Rowcount} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return ROWCOUNT;}
{Rowguidcol} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return ROWGUIDCOL;}
{Rule} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return RULE;}
{Save} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return SAVE;}
{Schema} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return SCHEMA;}
{Securityaudit} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return SECURITYAUDIT;}
{Select} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return SELECT;}
{Semantickeyphrasetable} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return SEMANTICKEYPHRASETABLE;}
{Semanticsimilaritydetailstable} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return SEMANTICSIMILARITYDETAILSTABLE;}
{Semanticsimilaritytable} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return SEMANTICSIMILARITYTABLE;}
{Session_user} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return SESSION_USER;}
{Set} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return SET;}
{Setuser} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return SETUSER;}
{Shutdown} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return SHUTDOWN;}
{Some} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return SOME;}
{Statistics} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return STATISTICS;}
{System_user} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return SYSTEM_USER;}
{Table} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return TABLE;}
{Tablesample} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return TABLESAMPLE;}
{Textsize} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return TEXTSIZE;}
{Then} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return THEN;}
{To} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return TO;}
{Top} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return TOP;}
{Tran} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return TRAN;}
{Transaction} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return TRANSACTION;}
{Trigger} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return TRIGGER;}
{Truncate} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return TRUNCATE;}
{Try_convert} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return TRY_CONVERT;}
{Tsequal} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return TSEQUAL;}
{Union} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return UNION;}
{Unique} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return UNIQUE;}
{Unpivot} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return UNPIVOT;}
{Update} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return UPDATE;}
{Updatetext} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return UPDATETEXT;}
{Use} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return USE;}
{User} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return USER;}
{Values} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return VALUES;}
{Varying} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return VARYING;}
{View} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return VIEW;}
{Waitfor} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return WAITFOR;}
{When} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return WHEN;}
{Where} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return WHERE;}
{While} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return WHILE;}
{With} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return WITH;}
{Within_group} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return WITHIN_GROUP;}
{Writetext} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return WRITETEXT;}
{Absolute} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return ABSOLUTE;}
{Action} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return ACTION;}
{Ada} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return ADA;}
{Allocate} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return ALLOCATE;}
{Are} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return ARE;}
{Assertion} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return ASSERTION;}
{At} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return AT;}
{Avg} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return AVG;}
{Bit_length} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return BIT_LENGTH;}
{Both} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return BOTH;}
{Cascaded} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return CASCADED;}
{Cast} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return CAST;}
{Catalog} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return CATALOG;}
{Char_length} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return CHAR_LENGTH;}
{Character} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return CHARACTER;}
{Character_length} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return CHARACTER_LENGTH;}
{Collation} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return COLLATION;}
{Connect} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return CONNECT;}
{Connection} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return CONNECTION;}
{Constraints} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return CONSTRAINTS;}
{Corresponding} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return CORRESPONDING;}
{Count} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return COUNT;}
{Day} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return DAY;}
{Dec} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return DEC;}
{Deferrable} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return DEFERRABLE;}
{Deferred} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return DEFERRED;}
{Describe} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return DESCRIBE;}
{Descriptor} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return DESCRIPTOR;}
{Diagnostics} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return DIAGNOSTICS;}
{Disconnect} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return DISCONNECT;}
{Domain} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return DOMAIN;}
{End_exec} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return END_EXEC;}
{Extract} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return EXTRACT;}
{False} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return FALSE;}
{First} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return FIRST;}
{Fortran} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return FORTRAN;}
{Found} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return FOUND;}
{Get} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return GET;}
{Global} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return GLOBAL;}
{Go} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return GO;}
{Hour} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return HOUR;}
{Immediate} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return IMMEDIATE;}
{Include} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return INCLUDE;}
{Indicator} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return INDICATOR;}
{Initially} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return INITIALLY;}
{Input} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return INPUT;}
{Insensitive} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return INSENSITIVE;}
{Integer} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return INTEGER;}
{Interval} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return INTERVAL;}
{Isolation} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return ISOLATION;}
{Language} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return LANGUAGE;}
{Last} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return LAST;}
{Leading} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return LEADING;}
{Level} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return LEVEL;}
{Local} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return LOCAL;}
{Lower} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return LOWER;}
{Match} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return MATCH;}
{Max} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return MAX;}
{Min} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return MIN;}
{Minute} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return MINUTE;}
{Module} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return MODULE;}
{Month} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return MONTH;}
{Names} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return NAMES;}
{Natural} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return NATURAL;}
{Next} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return NEXT;}
{No} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return NO;}
{None} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return NONE;}
{Octet_length} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return OCTET_LENGTH;}
{Only} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return ONLY;}
{Output} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return OUTPUT;}
{Overlaps} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return OVERLAPS;}
{Pad} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return PAD;}
{Partial} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return PARTIAL;}
{Pascal} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return PASCAL;}
{Position} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return POSITION;}
{Prepare} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return PREPARE;}
{Preserve} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return PRESERVE;}
{Prior} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return PRIOR;}
{Privileges} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return PRIVILEGES;}
{Relative} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return RELATIVE;}
{Rows} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return ROWS;}
{Scroll} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return SCROLL;}
{Second} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return SECOND;}
{Section} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return SECTION;}
{Session} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return SESSION;}
{Size} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return SIZE;}
{Space} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return SPACE;}
{Sql} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return SQL;}
{Sqlca} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return SQLCA;}
{Sqlcode} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return SQLCODE;}
{Sqlerror} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return SQLERROR;}
{Sqlstate} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return SQLSTATE;}
{Sqlwarning} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return SQLWARNING;}
{Substring} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return SUBSTRING;}
{Sum} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return SUM;}
{Temporary} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return TEMPORARY;}
{Timestamp} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return TIMESTAMP;}
{Timezone_hour} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return TIMEZONE_HOUR;}
{Timezone_minute} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return TIMEZONE_MINUTE;}
{Trailing} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return TRAILING;}
{Translate} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return TRANSLATE;}
{Translation} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return TRANSLATION;}
{Trim} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return TRIM;}
{True} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return TRUE;}
{Unknown} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return UNKNOWN;}
{Upper} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return UPPER;}
{Usage} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return USAGE;}
{Using} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return USING;}
{Value} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return VALUE;}
{Whenever} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return WHENEVER;}
{Work} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return WORK;}
{Write} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return WRITE;}
{Year} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return YEAR;}
{Zone} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return ZONE;}
{Out} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return OUT;}
{Readonly} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return READONLY;}
{Encryption} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return ENCRYPTION;}
{Returns} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return RETURNS;}
{Schemabinding} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return SCHEMABINDING;}
{Called} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return CALLED;}
{Inline} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return INLINE;}
{Caller} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return CALLER;}
{Self} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return SELF;}
{Owner} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return OWNER;}
{Recompile} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return RECOMPILE;}
{Mark} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return MARK;}
{Forward_only} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return FORWARD_ONLY;}
{Static} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return STATIC;}
{Keyset} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return KEYSET;}
{Dynamic} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return DYNAMIC;}
{Fast_forward} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return FAST_FORWARD;}
{Read_only} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return READ_ONLY;}
{Scroll_locks} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return SCROLL_LOCKS;}
{Optimistic} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return OPTIMISTIC;}
{Type_warning} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return TYPE_WARNING;}
{Corchetes} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return CORCHETES;}
{Parentesis} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return PARENTESIS;}
{Llaves} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return LLAVES;}
{Arroba} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return ARROBA;}
{Numeral} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return NUMERAL;}
{Numeral2} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return NUMERAL2;}
{Menor} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return MENOR;}
{MenorIgual} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return MENORIGUAL;}
{Mayor} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return MAYOR;}
{MayorIgual} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return MAYORIGUAL;}
{Igual} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return IGUAL;}
{Igual2} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return IGUAL2;}
{Diferente} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return DIFERENTE;}
{And} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return AND;}
{Or} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return OR;}
{Sumar} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return SUMAR;}
{Restar} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return RESTAR;}
{Multiplicar} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return MULTIPLICAR;}
{Dividir} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return DIVIDIR;}
{Modulo} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return MODULO;}
{CorcheteAbrir} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return CORCHETEABRIR;}
{CorcheteCerrar} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return CORCHETECERRAR;}
{ParentesisAbrir} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return PARENTESISABRIR;}
{ParentesisCerrar} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return PARENTESISCERRAR;}
{LlaveAbrir} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return LLAVEABRIR;}
{LlaveCerrar} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return LLAVECERRAR;}
{punto} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Punto;}
{coma} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return Coma;}
{pyc} {lin=yyline; col=yycolumn; len=yylength(); lexeme=yytext(); return PYC;}

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