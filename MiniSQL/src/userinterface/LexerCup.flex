package userinterface;
import java_cup.runtime.Symbol;

%%
%class LexerCup
%unicode
%type java_cup.runtime.Symbol
%cup
%full
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
    private Symbol symbol(int type, Object value){   
        return new Symbol(type, yyline, yycolumn, value);
    }

   private Symbol symbol(int type){   
        return new Symbol(type, yyline, yycolumn);
    }
%}

%%

{Bigint} {return new Symbol(sym.BIGINT,yycolumn,yyline,yytext());}
{Binary} {return new Symbol(sym.BINARY,yycolumn,yyline,yytext());}
{Datetime} {return new Symbol(sym.DATETIME,yycolumn,yyline,yytext());}
{Datetime2} {return new Symbol(sym.DATETIME2,yycolumn,yyline,yytext());}
{Datetimeoffset} {return new Symbol(sym.DATETIMEOFFSET,yycolumn,yyline,yytext());}
{Hierarchyid} {return new Symbol(sym.HIERARCHYID,yycolumn,yyline,yytext());}
{Image} {return new Symbol(sym.IMAGE,yycolumn,yyline,yytext());}
{Money} {return new Symbol(sym.MONEY,yycolumn,yyline,yytext());}
{Ntext} {return new Symbol(sym.NTEXT,yycolumn,yyline,yytext());}
{Nvarchar} {return new Symbol(sym.NVARCHAR,yycolumn,yyline,yytext());}
{Rowversion} {return new Symbol(sym.ROWVERSION,yycolumn,yyline,yytext());}
{Smalldatetime} {return new Symbol(sym.SMALLDATETIME,yycolumn,yyline,yytext());}
{Smallmoney} {return new Symbol(sym.SMALLMONEY,yycolumn,yyline,yytext());}
{Sql_variant} {return new Symbol(sym.SQL_VARIANT,yycolumn,yyline,yytext());}
{Text} {return new Symbol(sym.TEXT,yycolumn,yyline,yytext());}
{Tinyint} {return new Symbol(sym.TINYINT,yycolumn,yyline,yytext());}
{Uniqueidentifier} {return new Symbol(sym.UNIQUEIDENTIFIER,yycolumn,yyline,yytext());}
{Varbinary} {return new Symbol(sym.VARBINARY,yycolumn,yyline,yytext());}
{Xml} {return new Symbol(sym.XML,yycolumn,yyline,yytext());}

{Absolute} {return new Symbol(sym.ABSOLUTE,yycolumn,yyline,yytext());}
{Action} {return new Symbol(sym.ACTION,yycolumn,yyline,yytext());}
{Ada} {return new Symbol(sym.ADA,yycolumn,yyline,yytext());}
{Add} {return new Symbol(sym.ADD,yycolumn,yyline,yytext());}
{All} {return new Symbol(sym.ALL,yycolumn,yyline,yytext());}
{Allocate} {return new Symbol(sym.ALLOCATE,yycolumn,yyline,yytext());}
{Alter} {return new Symbol(sym.ALTER,yycolumn,yyline,yytext());}
{Any} {return new Symbol(sym.ANY,yycolumn,yyline,yytext());}
{Are} {return new Symbol(sym.ARE,yycolumn,yyline,yytext());}
{Arying} {return new Symbol(sym.ARYING,yycolumn,yyline,yytext());}
{As} {return new Symbol(sym.AS,yycolumn,yyline,yytext());}
{Asc} {return new Symbol(sym.ASC,yycolumn,yyline,yytext());}
{Assertion} {return new Symbol(sym.ASSERTION,yycolumn,yyline,yytext());}
{At} {return new Symbol(sym.AT,yycolumn,yyline,yytext());}
{Authorization} {return new Symbol(sym.AUTHORIZATION,yycolumn,yyline,yytext());}
{Avg} {return new Symbol(sym.AVG,yycolumn,yyline,yytext());}
{Backup} {return new Symbol(sym.BACKUP,yycolumn,yyline,yytext());}
{Begin} {return new Symbol(sym.BEGIN,yycolumn,yyline,yytext());}
{Between} {return new Symbol(sym.BETWEEN,yycolumn,yyline,yytext());}
{Bit} {return new Symbol(sym.BIT,yycolumn,yyline,yytext());}
{Bit_length} {return new Symbol(sym.BIT_LENGTH,yycolumn,yyline,yytext());}
{Both} {return new Symbol(sym.BOTH,yycolumn,yyline,yytext());}
{Break} {return new Symbol(sym.BREAK,yycolumn,yyline,yytext());}
{Browse} {return new Symbol(sym.BROWSE,yycolumn,yyline,yytext());}
{Bulk} {return new Symbol(sym.BULK,yycolumn,yyline,yytext());}
{By} {return new Symbol(sym.BY,yycolumn,yyline,yytext());}
{Called} {return new Symbol(sym.CALLED,yycolumn,yyline,yytext());}
{Caller} {return new Symbol(sym.CALLER,yycolumn,yyline,yytext());}
{Cascade} {return new Symbol(sym.CASCADE,yycolumn,yyline,yytext());}
{Cascaded} {return new Symbol(sym.CASCADED,yycolumn,yyline,yytext());}
{Case} {return new Symbol(sym.CASE,yycolumn,yyline,yytext());}
{Cast} {return new Symbol(sym.CAST,yycolumn,yyline,yytext());}
{Catalog} {return new Symbol(sym.CATALOG,yycolumn,yyline,yytext());}
{Char} {return new Symbol(sym.CHAR,yycolumn,yyline,yytext());}
{Char_length} {return new Symbol(sym.CHAR_LENGTH,yycolumn,yyline,yytext());}
{Charact} {return new Symbol(sym.CHARACT,yycolumn,yyline,yytext());}
{Character_length} {return new Symbol(sym.CHARACTER_LENGTH,yycolumn,yyline,yytext());}
{Check} {return new Symbol(sym.CHECK,yycolumn,yyline,yytext());}
{Checkpoint} {return new Symbol(sym.CHECKPOINT,yycolumn,yyline,yytext());}
{Close} {return new Symbol(sym.CLOSE,yycolumn,yyline,yytext());}
{Clustered} {return new Symbol(sym.CLUSTERED,yycolumn,yyline,yytext());}
{Coalesce} {return new Symbol(sym.COALESCE,yycolumn,yyline,yytext());}
{Collate} {return new Symbol(sym.COLLATE,yycolumn,yyline,yytext());}
{Collation} {return new Symbol(sym.COLLATION,yycolumn,yyline,yytext());}
{Column} {return new Symbol(sym.COLUMN,yycolumn,yyline,yytext());}
{Commit} {return new Symbol(sym.COMMIT,yycolumn,yyline,yytext());}
{Compute} {return new Symbol(sym.COMPUTE,yycolumn,yyline,yytext());}
{Connect} {return new Symbol(sym.CONNECT,yycolumn,yyline,yytext());}
{Connection} {return new Symbol(sym.CONNECTION,yycolumn,yyline,yytext());}
{Constraint} {return new Symbol(sym.CONSTRAINT,yycolumn,yyline,yytext());}
{Constraints} {return new Symbol(sym.CONSTRAINTS,yycolumn,yyline,yytext());}
{Contains} {return new Symbol(sym.CONTAINS,yycolumn,yyline,yytext());}
{Containstable} {return new Symbol(sym.CONTAINSTABLE,yycolumn,yyline,yytext());}
{Continue} {return new Symbol(sym.CONTINUE,yycolumn,yyline,yytext());}
{Convert} {return new Symbol(sym.CONVERT,yycolumn,yyline,yytext());}
{Corresponding} {return new Symbol(sym.CORRESPONDING,yycolumn,yyline,yytext());}
{Count} {return new Symbol(sym.COUNT,yycolumn,yyline,yytext());}
{Create} {return new Symbol(sym.CREATE,yycolumn,yyline,yytext());}
{Cross} {return new Symbol(sym.CROSS,yycolumn,yyline,yytext());}
{Current} {return new Symbol(sym.CURRENT,yycolumn,yyline,yytext());}
{Current_date} {return new Symbol(sym.CURRENT_DATE,yycolumn,yyline,yytext());}
{Current_time} {return new Symbol(sym.CURRENT_TIME,yycolumn,yyline,yytext());}
{Current_timestamp} {return new Symbol(sym.CURRENT_TIMESTAMP,yycolumn,yyline,yytext());}
{Current_user} {return new Symbol(sym.CURRENT_USER,yycolumn,yyline,yytext());}
{Cursor} {return new Symbol(sym.CURSOR,yycolumn,yyline,yytext());}
{Database} {return new Symbol(sym.DATABASE,yycolumn,yyline,yytext());}
{Date} {return new Symbol(sym.DATE,yycolumn,yyline,yytext());}
{Day} {return new Symbol(sym.DAY,yycolumn,yyline,yytext());}
{Dbcc} {return new Symbol(sym.DBCC,yycolumn,yyline,yytext());}
{Deallocate} {return new Symbol(sym.DEALLOCATE,yycolumn,yyline,yytext());}
{Dec} {return new Symbol(sym.DEC,yycolumn,yyline,yytext());}
{Decimal} {return new Symbol(sym.DECIMAL,yycolumn,yyline,yytext());}
{Declare} {return new Symbol(sym.DECLARE,yycolumn,yyline,yytext());}
{Default} {return new Symbol(sym.DEFAULT,yycolumn,yyline,yytext());}
{Deferrable} {return new Symbol(sym.DEFERRABLE,yycolumn,yyline,yytext());}
{Deferred} {return new Symbol(sym.DEFERRED,yycolumn,yyline,yytext());}
{Delete} {return new Symbol(sym.DELETE,yycolumn,yyline,yytext());}
{Deny} {return new Symbol(sym.DENY,yycolumn,yyline,yytext());}
{Desc} {return new Symbol(sym.DESC,yycolumn,yyline,yytext());}
{Describe} {return new Symbol(sym.DESCRIBE,yycolumn,yyline,yytext());}
{Descriptor} {return new Symbol(sym.DESCRIPTOR,yycolumn,yyline,yytext());}
{Diagnostics} {return new Symbol(sym.DIAGNOSTICS,yycolumn,yyline,yytext());}
{Disconnect} {return new Symbol(sym.DISCONNECT,yycolumn,yyline,yytext());}
{Disk} {return new Symbol(sym.DISK,yycolumn,yyline,yytext());}
{Distinct} {return new Symbol(sym.DISTINCT,yycolumn,yyline,yytext());}
{Distributed} {return new Symbol(sym.DISTRIBUTED,yycolumn,yyline,yytext());}
{Domain} {return new Symbol(sym.DOMAIN,yycolumn,yyline,yytext());}
{Double} {return new Symbol(sym.DOUBLE,yycolumn,yyline,yytext());}
{Drop} {return new Symbol(sym.DROP,yycolumn,yyline,yytext());}
{Dump} {return new Symbol(sym.DUMP,yycolumn,yyline,yytext());}
{Dynamic} {return new Symbol(sym.DYNAMIC,yycolumn,yyline,yytext());}
{Else} {return new Symbol(sym.ELSE,yycolumn,yyline,yytext());}
{Encryption} {return new Symbol(sym.ENCRYPTION,yycolumn,yyline,yytext());}
{End} {return new Symbol(sym.END,yycolumn,yyline,yytext());}
{End_exec} {return new Symbol(sym.END_EXEC,yycolumn,yyline,yytext());}
{Errlvl} {return new Symbol(sym.ERRLVL,yycolumn,yyline,yytext());}
{Escape} {return new Symbol(sym.ESCAPE,yycolumn,yyline,yytext());}
{Except} {return new Symbol(sym.EXCEPT,yycolumn,yyline,yytext());}
{Exception} {return new Symbol(sym.EXCEPTION,yycolumn,yyline,yytext());}
{Exec} {return new Symbol(sym.EXEC,yycolumn,yyline,yytext());}
{Execute} {return new Symbol(sym.EXECUTE,yycolumn,yyline,yytext());}
{Exists} {return new Symbol(sym.EXISTS,yycolumn,yyline,yytext());}
{Exit} {return new Symbol(sym.EXIT,yycolumn,yyline,yytext());}
{External} {return new Symbol(sym.EXTERNAL,yycolumn,yyline,yytext());}
{Extract} {return new Symbol(sym.EXTRACT,yycolumn,yyline,yytext());}
{False} {return new Symbol(sym.FALSE,yycolumn,yyline,yytext());}
{Fast_forward} {return new Symbol(sym.FAST_FORWARD,yycolumn,yyline,yytext());}
{Fetch} {return new Symbol(sym.FETCH,yycolumn,yyline,yytext());}
{File} {return new Symbol(sym.FILE,yycolumn,yyline,yytext());}
{Filegrowth} {return new Symbol(sym.FILEGROWTH,yycolumn,yyline,yytext());}
{Filename} {return new Symbol(sym.FILENAME,yycolumn,yyline,yytext());}
{Fillfactor} {return new Symbol(sym.FILLFACTOR,yycolumn,yyline,yytext());}
{First} {return new Symbol(sym.FIRST,yycolumn,yyline,yytext());}
{Float} {return new Symbol(sym.FLOAT,yycolumn,yyline,yytext());}
{For} {return new Symbol(sym.FOR,yycolumn,yyline,yytext());}
{Foreign} {return new Symbol(sym.FOREIGN,yycolumn,yyline,yytext());}
{Fortran} {return new Symbol(sym.FORTRAN,yycolumn,yyline,yytext());}
{Forward_only} {return new Symbol(sym.FORWARD_ONLY,yycolumn,yyline,yytext());}
{Found} {return new Symbol(sym.FOUND,yycolumn,yyline,yytext());}
{Freetext} {return new Symbol(sym.FREETEXT,yycolumn,yyline,yytext());}
{Freetexttable} {return new Symbol(sym.FREETEXTTABLE,yycolumn,yyline,yytext());}
{From} {return new Symbol(sym.FROM,yycolumn,yyline,yytext());}
{Full} {return new Symbol(sym.FULL,yycolumn,yyline,yytext());}
{Function} {return new Symbol(sym.FUNCTION,yycolumn,yyline,yytext());}
{Gb} {return new Symbol(sym.GB,yycolumn,yyline,yytext());}
{Get} {return new Symbol(sym.GET,yycolumn,yyline,yytext());}
{Global} {return new Symbol(sym.GLOBAL,yycolumn,yyline,yytext());}
{Go} {return new Symbol(sym.GO,yycolumn,yyline,yytext());}
{Goto} {return new Symbol(sym.GOTO,yycolumn,yyline,yytext());}
{Grant} {return new Symbol(sym.GRANT,yycolumn,yyline,yytext());}
{Group} {return new Symbol(sym.GROUP,yycolumn,yyline,yytext());}
{Having} {return new Symbol(sym.HAVING,yycolumn,yyline,yytext());}
{Holdlock} {return new Symbol(sym.HOLDLOCK,yycolumn,yyline,yytext());}
{Hour} {return new Symbol(sym.HOUR,yycolumn,yyline,yytext());}
{Identity} {return new Symbol(sym.IDENTITY,yycolumn,yyline,yytext());}
{Identity_insert} {return new Symbol(sym.IDENTITY_INSERT,yycolumn,yyline,yytext());}
{Identitycol} {return new Symbol(sym.IDENTITYCOL,yycolumn,yyline,yytext());}
{If} {return new Symbol(sym.IF,yycolumn,yyline,yytext());}
{Immediate} {return new Symbol(sym.IMMEDIATE,yycolumn,yyline,yytext());}
{In} {return new Symbol(sym.IN,yycolumn,yyline,yytext());}
{In} {return new Symbol(sym.IN,yycolumn,yyline,yytext());}
{Include} {return new Symbol(sym.INCLUDE,yycolumn,yyline,yytext());}
{Index} {return new Symbol(sym.INDEX,yycolumn,yyline,yytext());}
{Indicator} {return new Symbol(sym.INDICATOR,yycolumn,yyline,yytext());}
{Initially} {return new Symbol(sym.INITIALLY,yycolumn,yyline,yytext());}
{Inline} {return new Symbol(sym.INLINE,yycolumn,yyline,yytext());}
{Inner} {return new Symbol(sym.INNER,yycolumn,yyline,yytext());}
{Input} {return new Symbol(sym.INPUT,yycolumn,yyline,yytext());}
{Insensitive} {return new Symbol(sym.INSENSITIVE,yycolumn,yyline,yytext());}
{Insert} {return new Symbol(sym.INSERT,yycolumn,yyline,yytext());}
{Int} {return new Symbol(sym.INT,yycolumn,yyline,yytext());}
{Integer} {return new Symbol(sym.INTEGER,yycolumn,yyline,yytext());}
{Intersect} {return new Symbol(sym.INTERSECT,yycolumn,yyline,yytext());}
{Interval} {return new Symbol(sym.INTERVAL,yycolumn,yyline,yytext());}
{Into} {return new Symbol(sym.INTO,yycolumn,yyline,yytext());}
{Is} {return new Symbol(sym.IS,yycolumn,yyline,yytext());}
{Isolation} {return new Symbol(sym.ISOLATION,yycolumn,yyline,yytext());}
{Join} {return new Symbol(sym.JOIN,yycolumn,yyline,yytext());}
{Kb} {return new Symbol(sym.KB,yycolumn,yyline,yytext());}
{Key} {return new Symbol(sym.KEY,yycolumn,yyline,yytext());}
{Keyset} {return new Symbol(sym.KEYSET,yycolumn,yyline,yytext());}
{Kill} {return new Symbol(sym.KILL,yycolumn,yyline,yytext());}
{Language} {return new Symbol(sym.LANGUAGE,yycolumn,yyline,yytext());}
{Last} {return new Symbol(sym.LAST,yycolumn,yyline,yytext());}
{Leading} {return new Symbol(sym.LEADING,yycolumn,yyline,yytext());}
{Left} {return new Symbol(sym.LEFT,yycolumn,yyline,yytext());}
{Level} {return new Symbol(sym.LEVEL,yycolumn,yyline,yytext());}
{Like} {return new Symbol(sym.LIKE,yycolumn,yyline,yytext());}
{Lineno} {return new Symbol(sym.LINENO,yycolumn,yyline,yytext());}
{Load} {return new Symbol(sym.LOAD,yycolumn,yyline,yytext());}
{Local} {return new Symbol(sym.LOCAL,yycolumn,yyline,yytext());}
{Lower} {return new Symbol(sym.LOWER,yycolumn,yyline,yytext());}
{Mark} {return new Symbol(sym.MARK,yycolumn,yyline,yytext());}
{Match} {return new Symbol(sym.MATCH,yycolumn,yyline,yytext());}
{Max} {return new Symbol(sym.MAX,yycolumn,yyline,yytext());}
{Maxsize} {return new Symbol(sym.MAXSIZE,yycolumn,yyline,yytext());}
{Mb} {return new Symbol(sym.MB,yycolumn,yyline,yytext());}
{Merge} {return new Symbol(sym.MERGE,yycolumn,yyline,yytext());}
{Min} {return new Symbol(sym.MIN,yycolumn,yyline,yytext());}
{Minute} {return new Symbol(sym.MINUTE,yycolumn,yyline,yytext());}
{Modular} {return new Symbol(sym.MODULAR,yycolumn,yyline,yytext());}
{Module} {return new Symbol(sym.MODULE,yycolumn,yyline,yytext());}
{Month} {return new Symbol(sym.MONTH,yycolumn,yyline,yytext());}
{Name} {return new Symbol(sym.NAME,yycolumn,yyline,yytext());}
{Names} {return new Symbol(sym.NAMES,yycolumn,yyline,yytext());}
{National} {return new Symbol(sym.NATIONAL,yycolumn,yyline,yytext());}
{Natural} {return new Symbol(sym.NATURAL,yycolumn,yyline,yytext());}
{Nchar} {return new Symbol(sym.NCHAR,yycolumn,yyline,yytext());}
{Next} {return new Symbol(sym.NEXT,yycolumn,yyline,yytext());}
{No} {return new Symbol(sym.NO,yycolumn,yyline,yytext());}
{Nocheck} {return new Symbol(sym.NOCHECK,yycolumn,yyline,yytext());}
{Nonclustered} {return new Symbol(sym.NONCLUSTERED,yycolumn,yyline,yytext());}
{None} {return new Symbol(sym.NONE,yycolumn,yyline,yytext());}
{Not} {return new Symbol(sym.NOT,yycolumn,yyline,yytext());}
{Null} {return new Symbol(sym.NULL,yycolumn,yyline,yytext());}
{Nullif} {return new Symbol(sym.NULLIF,yycolumn,yyline,yytext());}
{Numeric} {return new Symbol(sym.NUMERIC,yycolumn,yyline,yytext());}
{Octet_length} {return new Symbol(sym.OCTET_LENGTH,yycolumn,yyline,yytext());}
{Of} {return new Symbol(sym.OF,yycolumn,yyline,yytext());}
{Off} {return new Symbol(sym.OFF,yycolumn,yyline,yytext());}
{Offsets} {return new Symbol(sym.OFFSETS,yycolumn,yyline,yytext());}
{On} {return new Symbol(sym.ON,yycolumn,yyline,yytext());}
{On} {return new Symbol(sym.ON,yycolumn,yyline,yytext());}
{Only} {return new Symbol(sym.ONLY,yycolumn,yyline,yytext());}
{Open} {return new Symbol(sym.OPEN,yycolumn,yyline,yytext());}
{Opendatasource} {return new Symbol(sym.OPENDATASOURCE,yycolumn,yyline,yytext());}
{Openquery} {return new Symbol(sym.OPENQUERY,yycolumn,yyline,yytext());}
{Openrowset} {return new Symbol(sym.OPENROWSET,yycolumn,yyline,yytext());}
{Openxml} {return new Symbol(sym.OPENXML,yycolumn,yyline,yytext());}
{Optimistic} {return new Symbol(sym.OPTIMISTIC,yycolumn,yyline,yytext());}
{Option} {return new Symbol(sym.OPTION,yycolumn,yyline,yytext());}
{Order} {return new Symbol(sym.ORDER,yycolumn,yyline,yytext());}
{Out} {return new Symbol(sym.OUT,yycolumn,yyline,yytext());}
{Outer} {return new Symbol(sym.OUTER,yycolumn,yyline,yytext());}
{Output} {return new Symbol(sym.OUTPUT,yycolumn,yyline,yytext());}
{Over} {return new Symbol(sym.OVER,yycolumn,yyline,yytext());}
{Overlaps} {return new Symbol(sym.OVERLAPS,yycolumn,yyline,yytext());}
{Owner} {return new Symbol(sym.OWNER,yycolumn,yyline,yytext());}
{Pad} {return new Symbol(sym.PAD,yycolumn,yyline,yytext());}
{Partial} {return new Symbol(sym.PARTIAL,yycolumn,yyline,yytext());}
{Pascal} {return new Symbol(sym.PASCAL,yycolumn,yyline,yytext());}
{Percent} {return new Symbol(sym.PERCENT,yycolumn,yyline,yytext());}
{Pivot} {return new Symbol(sym.PIVOT,yycolumn,yyline,yytext());}
{Plan} {return new Symbol(sym.PLAN,yycolumn,yyline,yytext());}
{Position} {return new Symbol(sym.POSITION,yycolumn,yyline,yytext());}
{Precision} {return new Symbol(sym.PRECISION,yycolumn,yyline,yytext());}
{Prepare} {return new Symbol(sym.PREPARE,yycolumn,yyline,yytext());}
{Preserve} {return new Symbol(sym.PRESERVE,yycolumn,yyline,yytext());}
{Primary} {return new Symbol(sym.PRIMARY,yycolumn,yyline,yytext());}
{Print} {return new Symbol(sym.PRINT,yycolumn,yyline,yytext());}
{Prior} {return new Symbol(sym.PRIOR,yycolumn,yyline,yytext());}
{Privileges} {return new Symbol(sym.PRIVILEGES,yycolumn,yyline,yytext());}
{Proc} {return new Symbol(sym.PROC,yycolumn,yyline,yytext());}
{Procedure} {return new Symbol(sym.PROCEDURE,yycolumn,yyline,yytext());}
{Public} {return new Symbol(sym.PUBLIC,yycolumn,yyline,yytext());}
{Raiserror} {return new Symbol(sym.RAISERROR,yycolumn,yyline,yytext());}
{Read} {return new Symbol(sym.READ,yycolumn,yyline,yytext());}
{Read_only} {return new Symbol(sym.READ_ONLY,yycolumn,yyline,yytext());}
{Readonly} {return new Symbol(sym.READONLY,yycolumn,yyline,yytext());}
{Readtext} {return new Symbol(sym.READTEXT,yycolumn,yyline,yytext());}
{Real} {return new Symbol(sym.REAL,yycolumn,yyline,yytext());}
{Recompile} {return new Symbol(sym.RECOMPILE,yycolumn,yyline,yytext());}
{Reconfigure} {return new Symbol(sym.RECONFIGURE,yycolumn,yyline,yytext());}
{References} {return new Symbol(sym.REFERENCES,yycolumn,yyline,yytext());}
{Relative} {return new Symbol(sym.RELATIVE,yycolumn,yyline,yytext());}
{Replication} {return new Symbol(sym.REPLICATION,yycolumn,yyline,yytext());}
{Restore} {return new Symbol(sym.RESTORE,yycolumn,yyline,yytext());}
{Restrict} {return new Symbol(sym.RESTRICT,yycolumn,yyline,yytext());}
{Return} {return new Symbol(sym.RETURN,yycolumn,yyline,yytext());}
{Returns} {return new Symbol(sym.RETURNS,yycolumn,yyline,yytext());}
{Revert} {return new Symbol(sym.REVERT,yycolumn,yyline,yytext());}
{Revoke} {return new Symbol(sym.REVOKE,yycolumn,yyline,yytext());}
{Right} {return new Symbol(sym.RIGHT,yycolumn,yyline,yytext());}
{Rollback} {return new Symbol(sym.ROLLBACK,yycolumn,yyline,yytext());}
{Rowcount} {return new Symbol(sym.ROWCOUNT,yycolumn,yyline,yytext());}
{Rowguidcol} {return new Symbol(sym.ROWGUIDCOL,yycolumn,yyline,yytext());}
{Rows} {return new Symbol(sym.ROWS,yycolumn,yyline,yytext());}
{Rule} {return new Symbol(sym.RULE,yycolumn,yyline,yytext());}
{Save} {return new Symbol(sym.SAVE,yycolumn,yyline,yytext());}
{Schema} {return new Symbol(sym.SCHEMA,yycolumn,yyline,yytext());}
{Schemabinding} {return new Symbol(sym.SCHEMABINDING,yycolumn,yyline,yytext());}
{Scroll} {return new Symbol(sym.SCROLL,yycolumn,yyline,yytext());}
{Scroll_locks} {return new Symbol(sym.SCROLL_LOCKS,yycolumn,yyline,yytext());}
{Second} {return new Symbol(sym.SECOND,yycolumn,yyline,yytext());}
{Section} {return new Symbol(sym.SECTION,yycolumn,yyline,yytext());}
{Securityaudit} {return new Symbol(sym.SECURITYAUDIT,yycolumn,yyline,yytext());}
{Select} {return new Symbol(sym.SELECT,yycolumn,yyline,yytext());}
{Self} {return new Symbol(sym.SELF,yycolumn,yyline,yytext());}
{Semantickeyphrasetable} {return new Symbol(sym.SEMANTICKEYPHRASETABLE,yycolumn,yyline,yytext());}
{Semanticsimilaritydetailstable} {return new Symbol(sym.SEMANTICSIMILARITYDETAILSTABLE,yycolumn,yyline,yytext());}
{Semanticsimilaritytable} {return new Symbol(sym.SEMANTICSIMILARITYTABLE,yycolumn,yyline,yytext());}
{Session} {return new Symbol(sym.SESSION,yycolumn,yyline,yytext());}
{Session_user} {return new Symbol(sym.SESSION_USER,yycolumn,yyline,yytext());}
{Set} {return new Symbol(sym.SET,yycolumn,yyline,yytext());}
{Setuser} {return new Symbol(sym.SETUSER,yycolumn,yyline,yytext());}
{Shutdown} {return new Symbol(sym.SHUTDOWN,yycolumn,yyline,yytext());}
{Size} {return new Symbol(sym.SIZE,yycolumn,yyline,yytext());}
{Smallint} {return new Symbol(sym.SMALLINT,yycolumn,yyline,yytext());}
{Some} {return new Symbol(sym.SOME,yycolumn,yyline,yytext());}
{Space} {return new Symbol(sym.SPACE,yycolumn,yyline,yytext());}
{Sql} {return new Symbol(sym.SQL,yycolumn,yyline,yytext());}
{Sqlca} {return new Symbol(sym.SQLCA,yycolumn,yyline,yytext());}
{Sqlcode} {return new Symbol(sym.SQLCODE,yycolumn,yyline,yytext());}
{Sqlerror} {return new Symbol(sym.SQLERROR,yycolumn,yyline,yytext());}
{Sqlstate} {return new Symbol(sym.SQLSTATE,yycolumn,yyline,yytext());}
{Sqlwarning} {return new Symbol(sym.SQLWARNING,yycolumn,yyline,yytext());}
{Static} {return new Symbol(sym.STATIC,yycolumn,yyline,yytext());}
{Statistics} {return new Symbol(sym.STATISTICS,yycolumn,yyline,yytext());}
{Substring} {return new Symbol(sym.SUBSTRING,yycolumn,yyline,yytext());}
{Sum} {return new Symbol(sym.SUM,yycolumn,yyline,yytext());}
{System_user} {return new Symbol(sym.SYSTEM_USER,yycolumn,yyline,yytext());}
{Table} {return new Symbol(sym.TABLE,yycolumn,yyline,yytext());}
{Tablesample} {return new Symbol(sym.TABLESAMPLE,yycolumn,yyline,yytext());}
{Tb} {return new Symbol(sym.TB,yycolumn,yyline,yytext());}
{Temporary} {return new Symbol(sym.TEMPORARY,yycolumn,yyline,yytext());}
{Textsize} {return new Symbol(sym.TEXTSIZE,yycolumn,yyline,yytext());}
{Then} {return new Symbol(sym.THEN,yycolumn,yyline,yytext());}
{Time} {return new Symbol(sym.TIME,yycolumn,yyline,yytext());}
{Timestamp} {return new Symbol(sym.TIMESTAMP,yycolumn,yyline,yytext());}
{Timezone_hour} {return new Symbol(sym.TIMEZONE_HOUR,yycolumn,yyline,yytext());}
{Timezone_minute} {return new Symbol(sym.TIMEZONE_MINUTE,yycolumn,yyline,yytext());}
{To} {return new Symbol(sym.TO,yycolumn,yyline,yytext());}
{Top} {return new Symbol(sym.TOP,yycolumn,yyline,yytext());}
{Trailing} {return new Symbol(sym.TRAILING,yycolumn,yyline,yytext());}
{Tran} {return new Symbol(sym.TRAN,yycolumn,yyline,yytext());}
{Transaction} {return new Symbol(sym.TRANSACTION,yycolumn,yyline,yytext());}
{Translate} {return new Symbol(sym.TRANSLATE,yycolumn,yyline,yytext());}
{Translation} {return new Symbol(sym.TRANSLATION,yycolumn,yyline,yytext());}
{Trigger} {return new Symbol(sym.TRIGGER,yycolumn,yyline,yytext());}
{Trim} {return new Symbol(sym.TRIM,yycolumn,yyline,yytext());}
{True} {return new Symbol(sym.TRUE,yycolumn,yyline,yytext());}
{Truncate} {return new Symbol(sym.TRUNCATE,yycolumn,yyline,yytext());}
{Try_convert} {return new Symbol(sym.TRY_CONVERT,yycolumn,yyline,yytext());}
{Tsequal} {return new Symbol(sym.TSEQUAL,yycolumn,yyline,yytext());}
{Type_warning} {return new Symbol(sym.TYPE_WARNING,yycolumn,yyline,yytext());}
{Union} {return new Symbol(sym.UNION,yycolumn,yyline,yytext());}
{Unique} {return new Symbol(sym.UNIQUE,yycolumn,yyline,yytext());}
{Unknown} {return new Symbol(sym.UNKNOWN,yycolumn,yyline,yytext());}
{Unlimited} {return new Symbol(sym.UNLIMITED,yycolumn,yyline,yytext());}
{Unpivot} {return new Symbol(sym.UNPIVOT,yycolumn,yyline,yytext());}
{Update} {return new Symbol(sym.UPDATE,yycolumn,yyline,yytext());}
{Updatetext} {return new Symbol(sym.UPDATETEXT,yycolumn,yyline,yytext());}
{Upper} {return new Symbol(sym.UPPER,yycolumn,yyline,yytext());}
{Usage} {return new Symbol(sym.USAGE,yycolumn,yyline,yytext());}
{Use} {return new Symbol(sym.USE,yycolumn,yyline,yytext());}
{User} {return new Symbol(sym.USER,yycolumn,yyline,yytext());}
{Using} {return new Symbol(sym.USING,yycolumn,yyline,yytext());}
{Value} {return new Symbol(sym.VALUE,yycolumn,yyline,yytext());}
{Values} {return new Symbol(sym.VALUES,yycolumn,yyline,yytext());}
{Varchar} {return new Symbol(sym.VARCHAR,yycolumn,yyline,yytext());}
{Varying} {return new Symbol(sym.VARYING,yycolumn,yyline,yytext());}
{View} {return new Symbol(sym.VIEW,yycolumn,yyline,yytext());}
{Waitfor} {return new Symbol(sym.WAITFOR,yycolumn,yyline,yytext());}
{When} {return new Symbol(sym.WHEN,yycolumn,yyline,yytext());}
{Whenever} {return new Symbol(sym.WHENEVER,yycolumn,yyline,yytext());}
{Where} {return new Symbol(sym.WHERE,yycolumn,yyline,yytext());}
{While} {return new Symbol(sym.WHILE,yycolumn,yyline,yytext());}
{With} {return new Symbol(sym.WITH,yycolumn,yyline,yytext());}
{Within_group} {return new Symbol(sym.WITHIN_GROUP,yycolumn,yyline,yytext());}
{Work} {return new Symbol(sym.WORK,yycolumn,yyline,yytext());}
{Write} {return new Symbol(sym.WRITE,yycolumn,yyline,yytext());}
{Writetext} {return new Symbol(sym.WRITETEXT,yycolumn,yyline,yytext());}
{Year} {return new Symbol(sym.YEAR,yycolumn,yyline,yytext());}
{Zone} {return new Symbol(sym.ZONE,yycolumn,yyline,yytext());}

{coment} {/*Ignore*/}
{espacio} {/*Ignore*/}
"/*"({ichar}*) {return new Symbol(sym.MalComentario,yycolumn, yyline, yytext());}

{flotan} {return new Symbol(sym.Flotante,yycolumn, yyline, yytext());}
{entero} {return new Symbol(sym.Entero,yycolumn, yyline, yytext());}
{cadena} {return new Symbol(sym.Cadena,yycolumn, yyline, yytext());}
{flotanErr} {return new Symbol(sym.FlotanteError,yycolumn, yyline, yytext());}
{cadenaErr} {return new Symbol(sym.CadenaError,yycolumn, yyline, yytext());}

{Igual} {return new Symbol(sym.Igual, yycolumn, yyline, yytext());}
{Suma} {return new Symbol(sym.Suma, yycolumn, yyline, yytext());}
{Resta} {return new Symbol(sym.Resta, yycolumn, yyline, yytext());}
{Multiplicacion} {return new Symbol(sym.Multiplicacion, yycolumn, yyline, yytext());}
{Division} {return new Symbol(sym.Division, yycolumn, yyline, yytext());}
{Porcentaje} {return new Symbol(sym.Porcentaje, yycolumn, yyline, yytext());}
{Menor} {return new Symbol(sym.Menor, yycolumn, yyline, yytext());}
{MenorIgual} {return new Symbol(sym.MenorIgual, yycolumn, yyline, yytext());}
{Mayor} {return new Symbol(sym.Mayor, yycolumn, yyline, yytext());}
{MayorIgual} {return new Symbol(sym.MayorIgual, yycolumn, yyline, yytext());}
{Igual2} {return new Symbol(sym.Igual2, yycolumn, yyline, yytext());}
{NoIgual} {return new Symbol(sym.NoIgual, yycolumn, yyline, yytext());}
{And} {return new Symbol(sym.AND, yycolumn, yyline, yytext());}
{Or} {return new Symbol(sym.OR, yycolumn, yyline, yytext());}
{Not2} {return new Symbol(sym.Not2, yycolumn, yyline, yytext());}
{PyC} {return new Symbol(sym.PyC, yycolumn, yyline, yytext());}
{Coma} {return new Symbol(sym.Coma, yycolumn, yyline, yytext());}
{Punto} {return new Symbol(sym.Punto, yycolumn, yyline, yytext());}
{Arroba} {return new Symbol(sym.Arroba, yycolumn, yyline, yytext());}
{Numeral} {return new Symbol(sym.Numeral, yycolumn, yyline, yytext());}
{Numeral2} {return new Symbol(sym.Numeral2, yycolumn, yyline, yytext());}
{Corchetes} {return new Symbol(sym.Corchetes, yycolumn, yyline, yytext());}
{Llaves} {return new Symbol(sym.Llaves, yycolumn, yyline, yytext());}
{Parentesis} {return new Symbol(sym.Parentesis, yycolumn, yyline, yytext());}
{AbreCorchetes} {return new Symbol(sym.AbreCorchetes, yycolumn, yyline, yytext());}
{AbreLlaves} {return new Symbol(sym.AbreLlaves, yycolumn, yyline, yytext());}
{AbreParentesis} {return new Symbol(sym.AbreParentesis, yycolumn, yyline, yytext());}
{CierraCorchetes} {return new Symbol(sym.CierraCorchetes, yycolumn, yyline, yytext());}
{CierraLlaves} {return new Symbol(sym.CierraLlaves, yycolumn, yyline, yytext());}
{CierraParentesis} {return new Symbol(sym.CierraParentesis, yycolumn, yyline, yytext());}

{identificador} {return new Symbol(sym.Identificador,yycolumn, yyline, yytext());}
{identificadorErr} {return new Symbol(sym.IdentificadorError,yycolumn, yyline, yytext());}

. {return new Symbol(sym.ERROR, yycolumn, yyline, yytext());}