# Proyecto Compiladores
URL - Compiladores - 2019

## ¿Cómo empezar?
*Debe tener NetBeans y JDK8 para poder compilar.*
1. Descargue el repositorio como *.zip* o haga *fork* de este. 
2. Utilizando NetBeans, genere el programa *.jar* del proyecto **LexGen**. Este archivo *.jar* funciona como una librería que es utilizada para procesar archivos.
3. En el proyecto de NetBeans de **MiniSQL**, verifique la referencia al archivo .jar generado en el paso anterior.
4. Puede correr el proyecto ‘MiniSQL’ desde NetBeans o generar el programa .jar de este proyecto y ejecutarlo de forma independiente del IDE.
## ¿Cómo Utilizar?
En la interfaz, podrá cargar el contenido de archivos *.sql* que se mostraran el recuadro izquierdo utilizando la codificación *UTF8*. Podrá editar el texto sin alterar el archivo original. Al ejecutar el análisis léxico, el resultado se mostrará en el recuadro derecho. Si desea guardar los resultados, se pueden generar archivo .out al realizar el análisis, este mismo procedimiento almacena en la misma carpeta un archivo .sql con el contenido del recuadro izquierdo.
## Funcionamiento Interno
Utiliza *jFlex* en el proyecto **LexGen** para generar un autómata que pueda validar un archivo *.sql.* Considera errores comunes al momento de escribir código, mostrando un token de Error en los resultados y diferencia aspectos básicos del lenguaje .sql mostrando un token específico para estos.
* No terminar la declaración del valor de una cadena de texto
* No marcar el fin de un comentario multilínea
* Tener identificadores con un carácter inicial distinto a una letra
* Tener identificadores de más de 31 caracteres.
* Identifica [Tipos de Datos](https://docs.microsoft.com/en-us/sql/t-sql/data-types/data-types-transact-sql?view=sql-server-2017)
* Identifica [Palabras Reservadas](https://docs.microsoft.com/en-us/sql/t-sql/language-elements/reserved-keywords-transact-sql?view=sql-server-2017)
* Identifica Declaración del valor de constantes numéricas.
* Identifica Operadores
## Autor
* Javier Mollinedo