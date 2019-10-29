/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package userinterface;

/**
 *
 * @author jmoll
 */
public enum Token {
    Bigint,
    Binary,
    Datetime,
    Datetime2,
    Datetimeoffset,
    Hierarchyid,
    Image,
    Money,
    Ntext,
    Nvarchar,
    Rowversion,
    Smalldatetime,
    Smallmoney,
    Sql_variant,
    Text,
    Tinyint,
    Uniqueidentifier,
    Varbinary,
    Xml,
    //Fin de AnalisisSin
    FinSintaxis,
    Igual,
    Suma,
    Resta,
    Multiplicacion,
    Division,
    Porcentaje,
    Menor,
    MenorIgual,
    Mayor,
    MayorIgual,
    Igual2,
    NoIgual,
    And,
    Or,
    Not2,
    PyC,
    Coma,
    Punto,
    Arroba,
    Numeral,
    Numeral2,
    Corchetes,
    Llaves,
    Parentesis,
    AbreCorchetes,
    AbreLlaves,
    AbreParentesis,
    CierraCorchetes,
    CierraLlaves,
    CierraParentesis,
    Absolute,
    Action,
    Ada,
    Add,
    All,
    Allocate,
    Alter,
    Any,
    Are,
    Arying,
    As,
    Asc,
    Assertion,
    At,
    Authorization,
    Avg,
    Backup,
    Begin,
    Between,
    Bit,
    Bit_length,
    Both,
    Break,
    Browse,
    Bulk,
    By,
    Called,
    Caller,
    Cascade,
    Cascaded,
    Case,
    Cast,
    Catalog,
    Char,
    Char_length,
    Charact,
    Character_length,
    Check,
    Checkpoint,
    Close,
    Clustered,
    Coalesce,
    Collate,
    Collation,
    Column,
    Commit,
    Compute,
    Connect,
    Connection,
    Constraint,
    Constraints,
    Contains,
    Containstable,
    Continue,
    Convert,
    Corresponding,
    Count,
    Create,
    Cross,
    Current,
    Current_date,
    Current_time,
    Current_timestamp,
    Current_user,
    Cursor,
    Database,
    Date,
    Day,
    Dbcc,
    Deallocate,
    Dec,
    Decimal,
    Declare,
    Default,
    Deferrable,
    Deferred,
    Delete,
    Deny,
    Desc,
    Describe,
    Descriptor,
    Diagnostics,
    Disconnect,
    Disk,
    Distinct,
    Distributed,
    Domain,
    Double,
    Drop,
    Dump,
    Dynamic,
    Else,
    Encryption,
    End,
    End_exec,
    Errlvl,
    Escape,
    Except,
    Exception,
    Exec,
    Execute,
    Execute_as_clause,
    Exists,
    Exit,
    External,
    Extract,
    False,
    Fast_forward,
    Fetch,
    File,
    Filegrowth,
    Filename,
    Fillfactor,
    First,
    Float,
    For,
    Foreign,
    Fortran,
    Forward_only,
    Found,
    Freetext,
    Freetexttable,
    From,
    Full,
    Function,
    Gb,
    Get,
    Global,
    Go,
    Goto,
    Grant,
    Group,
    Having,
    Holdlock,
    Hour,
    Identity,
    Identity_insert,
    Identitycol,
    If,
    Immediate,
    In,
    Include,
    Index,
    Indicator,
    Initially,
    Inline,
    Inner,
    Input,
    Insensitive,
    Insert,
    Int,
    Integer,
    Intersect,
    Interval,
    Into,
    Is,
    Isolation,
    Join,
    Kb,
    Key,
    Keyset,
    Kill,
    Language,
    Last,
    Leading,
    Left,
    Level,
    Like,
    Lineno,
    Load,
    Local,
    Lower,
    Mark,
    Match,
    Max,
    Maxsize,
    Mb,
    Merge,
    Min,
    Minute,
    Modular,
    Module,
    Month,
    Name,
    Names,
    National,
    Natural,
    Nchar,
    Next,
    No,
    Nocheck,
    Nonclustered,
    None,
    Not,
    Null,
    Nullif,
    Numeric,
    Octet_length,
    Of,
    Off,
    Offsets,
    On,
    Only,
    Open,
    Opendatasource,
    Openquery,
    Openrowset,
    Openxml,
    Optimistic,
    Option,
    Order,
    Out,
    Outer,
    Output,
    Over,
    Overlaps,
    Owner,
    Pad,
    Partial,
    Pascal,
    Percent,
    Pivot,
    Plan,
    Position,
    Precision,
    Prepare,
    Preserve,
    Primary,
    Print,
    Prior,
    Privileges,
    Proc,
    Procedure,
    Public,
    Raiserror,
    Read,
    Read_only,
    Readonly,
    Readtext,
    Real,
    Recompile,
    Reconfigure,
    References,
    Relative,
    Replication,
    Restore,
    Restrict,
    Return,
    Returns,
    Revert,
    Revoke,
    Right,
    Rollback,
    Rowcount,
    Rowguidcol,
    Rows,
    Rule,
    Save,
    Schema,
    Schemabinding,
    Scroll,
    Scroll_locks,
    Second,
    Section,
    Securityaudit,
    Select,
    Self,
    Semantickeyphrasetable,
    Semanticsimilaritydetailstable,
    Semanticsimilaritytable,
    Session,
    Session_user,
    Set,
    Setuser,
    Shutdown,
    Size,
    Smallint,
    Some,
    Space,
    Sql,
    Sqlca,
    Sqlcode,
    Sqlerror,
    Sqlstate,
    Sqlwarning,
    Static,
    Statistics,
    Substring,
    Sum,
    System_user,
    Table,
    Tablesample,
    Tb,
    Temporary,
    Textsize,
    Then,
    Time,
    Timestamp,
    Timezone_hour,
    Timezone_minute,
    To,
    Top,
    Trailing,
    Tran,
    Transaction,
    Translate,
    Translation,
    Trigger,
    Trim,
    True,
    Truncate,
    Try_convert,
    Tsequal,
    Type_warning,
    Union,
    Unique,
    Unknown,
    Unlimited,
    Unpivot,
    Update,
    Updatetext,
    Upper,
    Usage,
    Use,
    User,
    Using,
    Value,
    Values,
    Varchar,
    Varying,
    View,
    Waitfor,
    When,
    Whenever,
    Where,
    While,
    With,
    Within_group,
    Work,
    Write,
    Writetext,
    Year,
    Zone,
    //IDs
    Identificador,
    //Definicion de Datos
    Flotante,
    Entero,
    Cadena,
    //ERRORES
    IdentificadorError,
    FlotanteError,
    CadenaError,
    MalComentario,
    ERROR,
    OVERFLOWIDENTIFIER
}