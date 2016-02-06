%{
package main
import "fmt"
%}

%union {
    n int
}

%token NUM
%token ADD SUB MUL DIV
%token CR
%%

input
        : /* empty */
        | input line
;

line
        : CR
        | exp CR  { fmt.Println($1.n); }
;

exp
        : term
        | exp ADD term { $$.n = $1.n + $3.n; }
        | exp SUB term { $$.n = $1.n - $3.n; }
;

term
        : primary
        | term MUL primary { $$.n = $1.n * $3.n; }
        | term DIV primary { $$.n = $1.n / $3.n; }
;

primary
        : NUM { $$.n = $1.n; }
        | SUB primary { $$.n = -$2.n; }
;
%%
