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

input: /* empty */
        | input line
;

line:   CR
        | exp CR  { fmt.Println($1.n); }
;

exp:    NUM             { $$.n = $1.n; }
        | exp exp ADD   { $$.n = $1.n + $2.n; }
        | exp exp SUB   { $$.n = $1.n - $2.n; }
        | exp exp MUL   { $$.n = $1.n * $2.n; }
        | exp exp DIV   { $$.n = $1.n / $2.n; }
        | exp 'n'       { $$.n = -$1.n; }
;
%%
