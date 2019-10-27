package lexgen;
import java_cup.runtime.Symbol;
%%
%class LexerCup
%unicode
%type java_cup.runtime.Symbol
%cup
%full
%line
%column
%char

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
    private Symbol symbol(int type, Object value)
    {
        return new Symbol(type, yyline, yycolumn, value);
    }
    private Symbol symbol(int type)
    {
        return new Symbol(type, yyline, yycolumn);
    }
%}
%%

{Cursor} { return new Symbol(sym.CURSOR, yychar, yyline, yytext());}
{Hierarchyid} { return new Symbol(sym.HIERARCHYID, yychar, yyline, yytext());}
{Rowversion} { return new Symbol(sym.ROWVERSION, yychar, yyline, yytext());}
{Sql_variant} { return new Symbol(sym.SQL_VARIANT, yychar, yyline, yytext());}
{Uniqueidentifier} { return new Symbol(sym.UNIQUEIDENTIFIER, yychar, yyline, yytext());}
{Xml} { return new Symbol(sym.XML, yychar, yyline, yytext());}
{Bigint} { return new Symbol(sym.BIGINT, yychar, yyline, yytext());}
{Int} { return new Symbol(sym.INT, yychar, yyline, yytext());}
{Smallint} { return new Symbol(sym.SMALLINT, yychar, yyline, yytext());}
{Tinyint} { return new Symbol(sym.TINYINT, yychar, yyline, yytext());}
{Bit} { return new Symbol(sym.BIT, yychar, yyline, yytext());}
{Decimal} { return new Symbol(sym.DECIMAL, yychar, yyline, yytext());}
{Money} { return new Symbol(sym.MONEY, yychar, yyline, yytext());}
{Numeric} { return new Symbol(sym.NUMERIC, yychar, yyline, yytext());}
{Smallmoney} { return new Symbol(sym.SMALLMONEY, yychar, yyline, yytext());}
{Float} { return new Symbol(sym.FLOAT, yychar, yyline, yytext());}
{Real} { return new Symbol(sym.REAL, yychar, yyline, yytext());}
{Date} { return new Symbol(sym.DATE, yychar, yyline, yytext());}
{Datetime} { return new Symbol(sym.DATETIME, yychar, yyline, yytext());}
{Datetime2} { return new Symbol(sym.DATETIME2, yychar, yyline, yytext());}
{Datetimeoffset} { return new Symbol(sym.DATETIMEOFFSET, yychar, yyline, yytext());}
{Smalldatetime} { return new Symbol(sym.SMALLDATETIME, yychar, yyline, yytext());}
{Time} { return new Symbol(sym.TIME, yychar, yyline, yytext());}
{Char} { return new Symbol(sym.CHAR, yychar, yyline, yytext());}
{Text} { return new Symbol(sym.TEXT, yychar, yyline, yytext());}
{Varchar} { return new Symbol(sym.VARCHAR, yychar, yyline, yytext());}
{Nchar} { return new Symbol(sym.NCHAR, yychar, yyline, yytext());}
{Ntext} { return new Symbol(sym.NTEXT, yychar, yyline, yytext());}
{Nvarchar} { return new Symbol(sym.NVARCHAR, yychar, yyline, yytext());}
{Binary} { return new Symbol(sym.BINARY, yychar, yyline, yytext());}
{Image} { return new Symbol(sym.IMAGE, yychar, yyline, yytext());}
{Varbinary} { return new Symbol(sym.VARBINARY, yychar, yyline, yytext());}
{Add} { return new Symbol(sym.ADD, yychar, yyline, yytext());}
{All} { return new Symbol(sym.ALL, yychar, yyline, yytext());}
{Alter} { return new Symbol(sym.ALTER, yychar, yyline, yytext());}
{And} { return new Symbol(sym.AND, yychar, yyline, yytext());}
{Any} { return new Symbol(sym.ANY, yychar, yyline, yytext());}
{As} { return new Symbol(sym.AS, yychar, yyline, yytext());}
{Asc} { return new Symbol(sym.ASC, yychar, yyline, yytext());}
{Authorization} { return new Symbol(sym.AUTHORIZATION, yychar, yyline, yytext());}
{Backup} { return new Symbol(sym.BACKUP, yychar, yyline, yytext());}
{Begin} { return new Symbol(sym.BEGIN, yychar, yyline, yytext());}
{Between} { return new Symbol(sym.BETWEEN, yychar, yyline, yytext());}
{Break} { return new Symbol(sym.BREAK, yychar, yyline, yytext());}
{Browse} { return new Symbol(sym.BROWSE, yychar, yyline, yytext());}
{Bulk} { return new Symbol(sym.BULK, yychar, yyline, yytext());}
{By} { return new Symbol(sym.BY, yychar, yyline, yytext());}
{Cascade} { return new Symbol(sym.CASCADE, yychar, yyline, yytext());}
{Case} { return new Symbol(sym.CASE, yychar, yyline, yytext());}
{Check} { return new Symbol(sym.CHECK, yychar, yyline, yytext());}
{Checkpoint} { return new Symbol(sym.CHECKPOINT, yychar, yyline, yytext());}
{Close} { return new Symbol(sym.CLOSE, yychar, yyline, yytext());}
{Clustered} { return new Symbol(sym.CLUSTERED, yychar, yyline, yytext());}
{Coalesce} { return new Symbol(sym.COALESCE, yychar, yyline, yytext());}
{Collate} { return new Symbol(sym.COLLATE, yychar, yyline, yytext());}
{Column} { return new Symbol(sym.COLUMN, yychar, yyline, yytext());}
{Commit} { return new Symbol(sym.COMMIT, yychar, yyline, yytext());}
{Compute} { return new Symbol(sym.COMPUTE, yychar, yyline, yytext());}
{Constraint} { return new Symbol(sym.CONSTRAINT, yychar, yyline, yytext());}
{Contains} { return new Symbol(sym.CONTAINS, yychar, yyline, yytext());}
{Containstable} { return new Symbol(sym.CONTAINSTABLE, yychar, yyline, yytext());}
{Continue} { return new Symbol(sym.CONTINUE, yychar, yyline, yytext());}
{Convert} { return new Symbol(sym.CONVERT, yychar, yyline, yytext());}
{Create} { return new Symbol(sym.CREATE, yychar, yyline, yytext());}
{Cross} { return new Symbol(sym.CROSS, yychar, yyline, yytext());}
{Current} { return new Symbol(sym.CURRENT, yychar, yyline, yytext());}
{Current_date} { return new Symbol(sym.CURRENT_DATE, yychar, yyline, yytext());}
{Current_time} { return new Symbol(sym.CURRENT_TIME, yychar, yyline, yytext());}
{Current_timestamp} { return new Symbol(sym.CURRENT_TIMESTAMP, yychar, yyline, yytext());}
{Current_user} { return new Symbol(sym.CURRENT_USER, yychar, yyline, yytext());}
{Database} { return new Symbol(sym.DATABASE, yychar, yyline, yytext());}
{Dbcc} { return new Symbol(sym.DBCC, yychar, yyline, yytext());}
{Deallocate} { return new Symbol(sym.DEALLOCATE, yychar, yyline, yytext());}
{Declare} { return new Symbol(sym.DECLARE, yychar, yyline, yytext());}
{Default} { return new Symbol(sym.DEFAULT, yychar, yyline, yytext());}
{Delete} { return new Symbol(sym.DELETE, yychar, yyline, yytext());}
{Deny} { return new Symbol(sym.DENY, yychar, yyline, yytext());}
{Desc} { return new Symbol(sym.DESC, yychar, yyline, yytext());}
{Disk} { return new Symbol(sym.DISK, yychar, yyline, yytext());}
{Distinct} { return new Symbol(sym.DISTINCT, yychar, yyline, yytext());}
{Distributed} { return new Symbol(sym.DISTRIBUTED, yychar, yyline, yytext());}
{Double} { return new Symbol(sym.DOUBLE, yychar, yyline, yytext());}
{Drop} { return new Symbol(sym.DROP, yychar, yyline, yytext());}
{Dump} { return new Symbol(sym.DUMP, yychar, yyline, yytext());}
{Else} { return new Symbol(sym.ELSE, yychar, yyline, yytext());}
{End} { return new Symbol(sym.END, yychar, yyline, yytext());}
{Errlvl} { return new Symbol(sym.ERRLVL, yychar, yyline, yytext());}
{Escape} { return new Symbol(sym.ESCAPE, yychar, yyline, yytext());}
{Except} { return new Symbol(sym.EXCEPT, yychar, yyline, yytext());}
{Exec} { return new Symbol(sym.EXEC, yychar, yyline, yytext());}
{Execute} { return new Symbol(sym.EXECUTE, yychar, yyline, yytext());}
{Exists} { return new Symbol(sym.EXISTS, yychar, yyline, yytext());}
{Exit} { return new Symbol(sym.EXIT, yychar, yyline, yytext());}
{External} { return new Symbol(sym.EXTERNAL, yychar, yyline, yytext());}
{Fetch} { return new Symbol(sym.FETCH, yychar, yyline, yytext());}
{File} { return new Symbol(sym.FILE, yychar, yyline, yytext());}
{Fillfactor} { return new Symbol(sym.FILLFACTOR, yychar, yyline, yytext());}
{For} { return new Symbol(sym.FOR, yychar, yyline, yytext());}
{Foreign} { return new Symbol(sym.FOREIGN, yychar, yyline, yytext());}
{Freetext} { return new Symbol(sym.FREETEXT, yychar, yyline, yytext());}
{Freetexttable} { return new Symbol(sym.FREETEXTTABLE, yychar, yyline, yytext());}
{From} { return new Symbol(sym.FROM, yychar, yyline, yytext());}
{Full} { return new Symbol(sym.FULL, yychar, yyline, yytext());}
{Function} { return new Symbol(sym.FUNCTION, yychar, yyline, yytext());}
{Goto} { return new Symbol(sym.GOTO, yychar, yyline, yytext());}
{Grant} { return new Symbol(sym.GRANT, yychar, yyline, yytext());}
{Group} { return new Symbol(sym.GROUP, yychar, yyline, yytext());}
{Having} { return new Symbol(sym.HAVING, yychar, yyline, yytext());}
{Holdlock} { return new Symbol(sym.HOLDLOCK, yychar, yyline, yytext());}
{Identity} { return new Symbol(sym.IDENTITY, yychar, yyline, yytext());}
{Identity_insert} { return new Symbol(sym.IDENTITY_INSERT, yychar, yyline, yytext());}
{Identitycol} { return new Symbol(sym.IDENTITYCOL, yychar, yyline, yytext());}
{If} { return new Symbol(sym.IF, yychar, yyline, yytext());}
{In} { return new Symbol(sym.IN, yychar, yyline, yytext());}
{Index} { return new Symbol(sym.INDEX, yychar, yyline, yytext());}
{Inner} { return new Symbol(sym.INNER, yychar, yyline, yytext());}
{Insert} { return new Symbol(sym.INSERT, yychar, yyline, yytext());}
{Intersect} { return new Symbol(sym.INTERSECT, yychar, yyline, yytext());}
{Into} { return new Symbol(sym.INTO, yychar, yyline, yytext());}
{Is} { return new Symbol(sym.IS, yychar, yyline, yytext());}
{Join} { return new Symbol(sym.JOIN, yychar, yyline, yytext());}
{Key} { return new Symbol(sym.KEY, yychar, yyline, yytext());}
{Kill} { return new Symbol(sym.KILL, yychar, yyline, yytext());}
{Left} { return new Symbol(sym.LEFT, yychar, yyline, yytext());}
{Like} { return new Symbol(sym.LIKE, yychar, yyline, yytext());}
{Lineno} { return new Symbol(sym.LINENO, yychar, yyline, yytext());}
{Load} { return new Symbol(sym.LOAD, yychar, yyline, yytext());}
{Merge} { return new Symbol(sym.MERGE, yychar, yyline, yytext());}
{National} { return new Symbol(sym.NATIONAL, yychar, yyline, yytext());}
{Nocheck} { return new Symbol(sym.NOCHECK, yychar, yyline, yytext());}
{Nonclustered} { return new Symbol(sym.NONCLUSTERED, yychar, yyline, yytext());}
{Not} { return new Symbol(sym.NOT, yychar, yyline, yytext());}
{Null} { return new Symbol(sym.NULL, yychar, yyline, yytext());}
{Nullif} { return new Symbol(sym.NULLIF, yychar, yyline, yytext());}
{Of} { return new Symbol(sym.OF, yychar, yyline, yytext());}
{Off} { return new Symbol(sym.OFF, yychar, yyline, yytext());}
{Offsets} { return new Symbol(sym.OFFSETS, yychar, yyline, yytext());}
{On} { return new Symbol(sym.ON, yychar, yyline, yytext());}
{Open} { return new Symbol(sym.OPEN, yychar, yyline, yytext());}
{Opendatasource} { return new Symbol(sym.OPENDATASOURCE, yychar, yyline, yytext());}
{Openquery} { return new Symbol(sym.OPENQUERY, yychar, yyline, yytext());}
{Openrowset} { return new Symbol(sym.OPENROWSET, yychar, yyline, yytext());}
{Openxml} { return new Symbol(sym.OPENXML, yychar, yyline, yytext());}
{Option} { return new Symbol(sym.OPTION, yychar, yyline, yytext());}
{Or} { return new Symbol(sym.OR, yychar, yyline, yytext());}
{Order} { return new Symbol(sym.ORDER, yychar, yyline, yytext());}
{Outer} { return new Symbol(sym.OUTER, yychar, yyline, yytext());}
{Over} { return new Symbol(sym.OVER, yychar, yyline, yytext());}
{Percent} { return new Symbol(sym.PERCENT, yychar, yyline, yytext());}
{Pivot} { return new Symbol(sym.PIVOT, yychar, yyline, yytext());}
{Plan} { return new Symbol(sym.PLAN, yychar, yyline, yytext());}
{Precision} { return new Symbol(sym.PRECISION, yychar, yyline, yytext());}
{Primary} { return new Symbol(sym.PRIMARY, yychar, yyline, yytext());}
{Print} { return new Symbol(sym.PRINT, yychar, yyline, yytext());}
{Proc} { return new Symbol(sym.PROC, yychar, yyline, yytext());}
{Procedure} { return new Symbol(sym.PROCEDURE, yychar, yyline, yytext());}
{Public} { return new Symbol(sym.PUBLIC, yychar, yyline, yytext());}
{Raiserror} { return new Symbol(sym.RAISERROR, yychar, yyline, yytext());}
{Read} { return new Symbol(sym.READ, yychar, yyline, yytext());}
{Readtext} { return new Symbol(sym.READTEXT, yychar, yyline, yytext());}
{Reconfigure} { return new Symbol(sym.RECONFIGURE, yychar, yyline, yytext());}
{References} { return new Symbol(sym.REFERENCES, yychar, yyline, yytext());}
{Replication} { return new Symbol(sym.REPLICATION, yychar, yyline, yytext());}
{Restore} { return new Symbol(sym.RESTORE, yychar, yyline, yytext());}
{Restrict} { return new Symbol(sym.RESTRICT, yychar, yyline, yytext());}
{Return} { return new Symbol(sym.RETURN, yychar, yyline, yytext());}
{Revert} { return new Symbol(sym.REVERT, yychar, yyline, yytext());}
{Revoke} { return new Symbol(sym.REVOKE, yychar, yyline, yytext());}
{Right} { return new Symbol(sym.RIGHT, yychar, yyline, yytext());}
{Rollback} { return new Symbol(sym.ROLLBACK, yychar, yyline, yytext());}
{Rowcount} { return new Symbol(sym.ROWCOUNT, yychar, yyline, yytext());}
{Rowguidcol} { return new Symbol(sym.ROWGUIDCOL, yychar, yyline, yytext());}
{Rule} { return new Symbol(sym.RULE, yychar, yyline, yytext());}
{Save} { return new Symbol(sym.SAVE, yychar, yyline, yytext());}
{Schema} { return new Symbol(sym.SCHEMA, yychar, yyline, yytext());}
{Securityaudit} { return new Symbol(sym.SECURITYAUDIT, yychar, yyline, yytext());}
{Select} { return new Symbol(sym.SELECT, yychar, yyline, yytext());}
{Semantickeyphrasetable} { return new Symbol(sym.SEMANTICKEYPHRASETABLE, yychar, yyline, yytext());}
{Semanticsimilaritydetailstable} { return new Symbol(sym.SEMANTICSIMILARITYDETAILSTABLE, yychar, yyline, yytext());}
{Semanticsimilaritytable} { return new Symbol(sym.SEMANTICSIMILARITYTABLE, yychar, yyline, yytext());}
{Session_user} { return new Symbol(sym.SESSION_USER, yychar, yyline, yytext());}
{Set} { return new Symbol(sym.SET, yychar, yyline, yytext());}
{Setuser} { return new Symbol(sym.SETUSER, yychar, yyline, yytext());}
{Shutdown} { return new Symbol(sym.SHUTDOWN, yychar, yyline, yytext());}
{Some} { return new Symbol(sym.SOME, yychar, yyline, yytext());}
{Statistics} { return new Symbol(sym.STATISTICS, yychar, yyline, yytext());}
{System_user} { return new Symbol(sym.SYSTEM_USER, yychar, yyline, yytext());}
{Table} { return new Symbol(sym.TABLE, yychar, yyline, yytext());}
{Tablesample} { return new Symbol(sym.TABLESAMPLE, yychar, yyline, yytext());}
{Textsize} { return new Symbol(sym.TEXTSIZE, yychar, yyline, yytext());}
{Then} { return new Symbol(sym.THEN, yychar, yyline, yytext());}
{To} { return new Symbol(sym.TO, yychar, yyline, yytext());}
{Top} { return new Symbol(sym.TOP, yychar, yyline, yytext());}
{Tran} { return new Symbol(sym.TRAN, yychar, yyline, yytext());}
{Transaction} { return new Symbol(sym.TRANSACTION, yychar, yyline, yytext());}
{Trigger} { return new Symbol(sym.TRIGGER, yychar, yyline, yytext());}
{Truncate} { return new Symbol(sym.TRUNCATE, yychar, yyline, yytext());}
{Try_convert} { return new Symbol(sym.TRY_CONVERT, yychar, yyline, yytext());}
{Tsequal} { return new Symbol(sym.TSEQUAL, yychar, yyline, yytext());}
{Union} { return new Symbol(sym.UNION, yychar, yyline, yytext());}
{Unique} { return new Symbol(sym.UNIQUE, yychar, yyline, yytext());}
{Unpivot} { return new Symbol(sym.UNPIVOT, yychar, yyline, yytext());}
{Update} { return new Symbol(sym.UPDATE, yychar, yyline, yytext());}
{Updatetext} { return new Symbol(sym.UPDATETEXT, yychar, yyline, yytext());}
{Use} { return new Symbol(sym.USE, yychar, yyline, yytext());}
{User} { return new Symbol(sym.USER, yychar, yyline, yytext());}
{Values} { return new Symbol(sym.VALUES, yychar, yyline, yytext());}
{Varying} { return new Symbol(sym.VARYING, yychar, yyline, yytext());}
{View} { return new Symbol(sym.VIEW, yychar, yyline, yytext());}
{Waitfor} { return new Symbol(sym.WAITFOR, yychar, yyline, yytext());}
{When} { return new Symbol(sym.WHEN, yychar, yyline, yytext());}
{Where} { return new Symbol(sym.WHERE, yychar, yyline, yytext());}
{While} { return new Symbol(sym.WHILE, yychar, yyline, yytext());}
{With} { return new Symbol(sym.WITH, yychar, yyline, yytext());}
{Within_group} { return new Symbol(sym.WITHIN_GROUP, yychar, yyline, yytext());}
{Writetext} { return new Symbol(sym.WRITETEXT, yychar, yyline, yytext());}
{Absolute} { return new Symbol(sym.ABSOLUTE, yychar, yyline, yytext());}
{Action} { return new Symbol(sym.ACTION, yychar, yyline, yytext());}
{Ada} { return new Symbol(sym.ADA, yychar, yyline, yytext());}
{Allocate} { return new Symbol(sym.ALLOCATE, yychar, yyline, yytext());}
{Are} { return new Symbol(sym.ARE, yychar, yyline, yytext());}
{Assertion} { return new Symbol(sym.ASSERTION, yychar, yyline, yytext());}
{At} { return new Symbol(sym.AT, yychar, yyline, yytext());}
{Avg} { return new Symbol(sym.AVG, yychar, yyline, yytext());}
{Bit_length} { return new Symbol(sym.BIT_LENGTH, yychar, yyline, yytext());}
{Both} { return new Symbol(sym.BOTH, yychar, yyline, yytext());}
{Cascaded} { return new Symbol(sym.CASCADED, yychar, yyline, yytext());}
{Cast} { return new Symbol(sym.CAST, yychar, yyline, yytext());}
{Catalog} { return new Symbol(sym.CATALOG, yychar, yyline, yytext());}
{Char_length} { return new Symbol(sym.CHAR_LENGTH, yychar, yyline, yytext());}
{Character} { return new Symbol(sym.CHARACTER, yychar, yyline, yytext());}
{Character_length} { return new Symbol(sym.CHARACTER_LENGTH, yychar, yyline, yytext());}
{Collation} { return new Symbol(sym.COLLATION, yychar, yyline, yytext());}
{Connect} { return new Symbol(sym.CONNECT, yychar, yyline, yytext());}
{Connection} { return new Symbol(sym.CONNECTION, yychar, yyline, yytext());}
{Constraints} { return new Symbol(sym.CONSTRAINTS, yychar, yyline, yytext());}
{Corresponding} { return new Symbol(sym.CORRESPONDING, yychar, yyline, yytext());}
{Count} { return new Symbol(sym.COUNT, yychar, yyline, yytext());}
{Day} { return new Symbol(sym.DAY, yychar, yyline, yytext());}
{Dec} { return new Symbol(sym.DEC, yychar, yyline, yytext());}
{Deferrable} { return new Symbol(sym.DEFERRABLE, yychar, yyline, yytext());}
{Deferred} { return new Symbol(sym.DEFERRED, yychar, yyline, yytext());}
{Describe} { return new Symbol(sym.DESCRIBE, yychar, yyline, yytext());}
{Descriptor} { return new Symbol(sym.DESCRIPTOR, yychar, yyline, yytext());}
{Diagnostics} { return new Symbol(sym.DIAGNOSTICS, yychar, yyline, yytext());}
{Disconnect} { return new Symbol(sym.DISCONNECT, yychar, yyline, yytext());}
{Domain} { return new Symbol(sym.DOMAIN, yychar, yyline, yytext());}
{End_exec} { return new Symbol(sym.END_EXEC, yychar, yyline, yytext());}
{Extract} { return new Symbol(sym.EXTRACT, yychar, yyline, yytext());}
{False} { return new Symbol(sym.FALSE, yychar, yyline, yytext());}
{First} { return new Symbol(sym.FIRST, yychar, yyline, yytext());}
{Fortran} { return new Symbol(sym.FORTRAN, yychar, yyline, yytext());}
{Found} { return new Symbol(sym.FOUND, yychar, yyline, yytext());}
{Get} { return new Symbol(sym.GET, yychar, yyline, yytext());}
{Global} { return new Symbol(sym.GLOBAL, yychar, yyline, yytext());}
{Go} { return new Symbol(sym.GO, yychar, yyline, yytext());}
{Hour} { return new Symbol(sym.HOUR, yychar, yyline, yytext());}
{Immediate} { return new Symbol(sym.IMMEDIATE, yychar, yyline, yytext());}
{Include} { return new Symbol(sym.INCLUDE, yychar, yyline, yytext());}
{Indicator} { return new Symbol(sym.INDICATOR, yychar, yyline, yytext());}
{Initially} { return new Symbol(sym.INITIALLY, yychar, yyline, yytext());}
{Input} { return new Symbol(sym.INPUT, yychar, yyline, yytext());}
{Insensitive} { return new Symbol(sym.INSENSITIVE, yychar, yyline, yytext());}
{Integer} { return new Symbol(sym.INTEGER, yychar, yyline, yytext());}
{Interval} { return new Symbol(sym.INTERVAL, yychar, yyline, yytext());}
{Isolation} { return new Symbol(sym.ISOLATION, yychar, yyline, yytext());}
{Language} { return new Symbol(sym.LANGUAGE, yychar, yyline, yytext());}
{Last} { return new Symbol(sym.LAST, yychar, yyline, yytext());}
{Leading} { return new Symbol(sym.LEADING, yychar, yyline, yytext());}
{Level} { return new Symbol(sym.LEVEL, yychar, yyline, yytext());}
{Local} { return new Symbol(sym.LOCAL, yychar, yyline, yytext());}
{Lower} { return new Symbol(sym.LOWER, yychar, yyline, yytext());}
{Match} { return new Symbol(sym.MATCH, yychar, yyline, yytext());}
{Max} { return new Symbol(sym.MAX, yychar, yyline, yytext());}
{Min} { return new Symbol(sym.MIN, yychar, yyline, yytext());}
{Minute} { return new Symbol(sym.MINUTE, yychar, yyline, yytext());}
{Module} { return new Symbol(sym.MODULE, yychar, yyline, yytext());}
{Month} { return new Symbol(sym.MONTH, yychar, yyline, yytext());}
{Names} { return new Symbol(sym.NAMES, yychar, yyline, yytext());}
{Natural} { return new Symbol(sym.NATURAL, yychar, yyline, yytext());}
{Next} { return new Symbol(sym.NEXT, yychar, yyline, yytext());}
{No} { return new Symbol(sym.NO, yychar, yyline, yytext());}
{None} { return new Symbol(sym.NONE, yychar, yyline, yytext());}
{Octet_length} { return new Symbol(sym.OCTET_LENGTH, yychar, yyline, yytext());}
{Only} { return new Symbol(sym.ONLY, yychar, yyline, yytext());}
{Output} { return new Symbol(sym.OUTPUT, yychar, yyline, yytext());}
{Overlaps} { return new Symbol(sym.OVERLAPS, yychar, yyline, yytext());}
{Pad} { return new Symbol(sym.PAD, yychar, yyline, yytext());}
{Partial} { return new Symbol(sym.PARTIAL, yychar, yyline, yytext());}
{Pascal} { return new Symbol(sym.PASCAL, yychar, yyline, yytext());}
{Position} { return new Symbol(sym.POSITION, yychar, yyline, yytext());}
{Prepare} { return new Symbol(sym.PREPARE, yychar, yyline, yytext());}
{Preserve} { return new Symbol(sym.PRESERVE, yychar, yyline, yytext());}
{Prior} { return new Symbol(sym.PRIOR, yychar, yyline, yytext());}
{Privileges} { return new Symbol(sym.PRIVILEGES, yychar, yyline, yytext());}
{Relative} { return new Symbol(sym.RELATIVE, yychar, yyline, yytext());}
{Rows} { return new Symbol(sym.ROWS, yychar, yyline, yytext());}
{Scroll} { return new Symbol(sym.SCROLL, yychar, yyline, yytext());}
{Second} { return new Symbol(sym.SECOND, yychar, yyline, yytext());}
{Section} { return new Symbol(sym.SECTION, yychar, yyline, yytext());}
{Session} { return new Symbol(sym.SESSION, yychar, yyline, yytext());}
{Size} { return new Symbol(sym.SIZE, yychar, yyline, yytext());}
{Space} { return new Symbol(sym.SPACE, yychar, yyline, yytext());}
{Sql} { return new Symbol(sym.SQL, yychar, yyline, yytext());}
{Sqlca} { return new Symbol(sym.SQLCA, yychar, yyline, yytext());}
{Sqlcode} { return new Symbol(sym.SQLCODE, yychar, yyline, yytext());}
{Sqlerror} { return new Symbol(sym.SQLERROR, yychar, yyline, yytext());}
{Sqlstate} { return new Symbol(sym.SQLSTATE, yychar, yyline, yytext());}
{Sqlwarning} { return new Symbol(sym.SQLWARNING, yychar, yyline, yytext());}
{Substring} { return new Symbol(sym.SUBSTRING, yychar, yyline, yytext());}
{Sum} { return new Symbol(sym.SUM, yychar, yyline, yytext());}
{Temporary} { return new Symbol(sym.TEMPORARY, yychar, yyline, yytext());}
{Timestamp} { return new Symbol(sym.TIMESTAMP, yychar, yyline, yytext());}
{Timezone_hour} { return new Symbol(sym.TIMEZONE_HOUR, yychar, yyline, yytext());}
{Timezone_minute} { return new Symbol(sym.TIMEZONE_MINUTE, yychar, yyline, yytext());}
{Trailing} { return new Symbol(sym.TRAILING, yychar, yyline, yytext());}
{Translate} { return new Symbol(sym.TRANSLATE, yychar, yyline, yytext());}
{Translation} { return new Symbol(sym.TRANSLATION, yychar, yyline, yytext());}
{Trim} { return new Symbol(sym.TRIM, yychar, yyline, yytext());}
{True} { return new Symbol(sym.TRUE, yychar, yyline, yytext());}
{Unknown} { return new Symbol(sym.UNKNOWN, yychar, yyline, yytext());}
{Upper} { return new Symbol(sym.UPPER, yychar, yyline, yytext());}
{Usage} { return new Symbol(sym.USAGE, yychar, yyline, yytext());}
{Using} { return new Symbol(sym.USING, yychar, yyline, yytext());}
{Value} { return new Symbol(sym.VALUE, yychar, yyline, yytext());}
{Whenever} { return new Symbol(sym.WHENEVER, yychar, yyline, yytext());}
{Work} { return new Symbol(sym.WORK, yychar, yyline, yytext());}
{Write} { return new Symbol(sym.WRITE, yychar, yyline, yytext());}
{Year} { return new Symbol(sym.YEAR, yychar, yyline, yytext());}
{Zone} { return new Symbol(sym.ZONE, yychar, yyline, yytext());}
{Out} { return new Symbol(sym.OUT, yychar, yyline, yytext());}
{Readonly} { return new Symbol(sym.READONLY, yychar, yyline, yytext());}
{Encryption} { return new Symbol(sym.ENCRYPTION, yychar, yyline, yytext());}
{Returns} { return new Symbol(sym.RETURNS, yychar, yyline, yytext());}
{Schemabinding} { return new Symbol(sym.SCHEMABINDING, yychar, yyline, yytext());}
{Called} { return new Symbol(sym.CALLED, yychar, yyline, yytext());}
{Inline} { return new Symbol(sym.INLINE, yychar, yyline, yytext());}
{Caller} { return new Symbol(sym.CALLER, yychar, yyline, yytext());}
{Self} { return new Symbol(sym.SELF, yychar, yyline, yytext());}
{Owner} { return new Symbol(sym.OWNER, yychar, yyline, yytext());}
{Recompile} { return new Symbol(sym.RECOMPILE, yychar, yyline, yytext());}
{Mark} { return new Symbol(sym.MARK, yychar, yyline, yytext());}
{Forward_only} { return new Symbol(sym.FORWARD_ONLY, yychar, yyline, yytext());}
{Static} { return new Symbol(sym.STATIC, yychar, yyline, yytext());}
{Keyset} { return new Symbol(sym.KEYSET, yychar, yyline, yytext());}
{Dynamic} { return new Symbol(sym.DYNAMIC, yychar, yyline, yytext());}
{Fast_forward} { return new Symbol(sym.FAST_FORWARD, yychar, yyline, yytext());}
{Read_only} { return new Symbol(sym.READ_ONLY, yychar, yyline, yytext());}
{Scroll_locks} { return new Symbol(sym.SCROLL_LOCKS, yychar, yyline, yytext());}
{Optimistic} { return new Symbol(sym.OPTIMISTIC, yychar, yyline, yytext());}
{Type_warning} { return new Symbol(sym.TYPE_WARNING, yychar, yyline, yytext());}
{Corchetes} { return new Symbol(sym.CORCHETES, yychar, yyline, yytext());}
{Parentesis} { return new Symbol(sym.PARENTESIS, yychar, yyline, yytext());}
{Llaves} { return new Symbol(sym.LLAVES, yychar, yyline, yytext());}
{Arroba} { return new Symbol(sym.ARROBA, yychar, yyline, yytext());}
{Numeral} { return new Symbol(sym.NUMERAL, yychar, yyline, yytext());}
{Numeral2} { return new Symbol(sym.NUMERAL2, yychar, yyline, yytext());}
{Menor} { return new Symbol(sym.MENOR, yychar, yyline, yytext());}
{MenorIgual} { return new Symbol(sym.MENORIGUAL, yychar, yyline, yytext());}
{Mayor} { return new Symbol(sym.MAYOR, yychar, yyline, yytext());}
{MayorIgual} { return new Symbol(sym.MAYORIGUAL, yychar, yyline, yytext());}
{Igual} { return new Symbol(sym.IGUAL, yychar, yyline, yytext());}
{Igual2} { return new Symbol(sym.IGUAL2, yychar, yyline, yytext());}
{Diferente} { return new Symbol(sym.DIFERENTE, yychar, yyline, yytext());}
{And} { return new Symbol(sym.AND, yychar, yyline, yytext());}
{Or} { return new Symbol(sym.OR, yychar, yyline, yytext());}
{Sumar} { return new Symbol(sym.SUMAR, yychar, yyline, yytext());}
{Restar} { return new Symbol(sym.RESTAR, yychar, yyline, yytext());}
{Multiplicar} { return new Symbol(sym.MULTIPLICAR, yychar, yyline, yytext());}
{Dividir} { return new Symbol(sym.DIVIDIR, yychar, yyline, yytext());}
{Modulo} { return new Symbol(sym.MODULO, yychar, yyline, yytext());}
{CorcheteAbrir} { return new Symbol(sym.CORCHETEABRIR, yychar, yyline, yytext());}
{CorcheteCerrar} { return new Symbol(sym.CORCHETECERRAR, yychar, yyline, yytext());}
{ParentesisAbrir} { return new Symbol(sym.PARENTESISABRIR, yychar, yyline, yytext());}
{ParentesisCerrar} { return new Symbol(sym.PARENTESISCERRAR, yychar, yyline, yytext());}
{LlaveAbrir} { return new Symbol(sym.LLAVEABRIR, yychar, yyline, yytext());}
{LlaveCerrar} { return new Symbol(sym.LLAVECERRAR, yychar, yyline, yytext());}
{punto} { return new Symbol(sym.Punto, yychar, yyline, yytext());}
{coma} { return new Symbol(sym.Coma, yychar, yyline, yytext());}
{pyc} { return new Symbol(sym.PYC, yychar, yyline, yytext());}

{identificador} { return new Symbol(sym.Identificador, yychar, yyline, yytext());}

{flotan} { return new Symbol(sym.Flotante, yychar, yyline, yytext());}
{entero} { return new Symbol(sym.Entero, yychar, yyline, yytext());}
{cadena} { return new Symbol(sym.Cadena, yychar, yyline, yytext());}

{coment} {/*Ignore*/}
{espacio} {/*Ignore*/}

{flotanErr} { return new Symbol(sym.FlotanteError, yychar, yyline, yytext());}
{identificadorErr} { return new Symbol(sym.IdentificadorError, yychar, yyline, yytext());}
{cadenaErr} { return new Symbol(sym.CadenaError, yychar, yyline, yytext());}
"/*"({ichar}*) { return new Symbol(sym.MalComentario, yychar, yyline, yytext());}

 . { return new Symbol(sym.ERROR, yychar, yyline, yytext());}
