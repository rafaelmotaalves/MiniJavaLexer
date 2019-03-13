package br.ufpe.cin.if688.jflex;

%%

/* N�o altere as configura��es a seguir */

%line
%column
%unicode
//%debug
%public
%standalone
%class MiniJava
%eofclose

/* Insira as regras l�xicas abaixo */

%{

	private void printTokenInfo(String type) {
		System.out.println("token gerado foi um " + type + ": '" + yytext() + "' na linha: " + yyline + ", coluna: " + yycolumn);
	}
%}

letter = [A-Za-z]
digit = [0-9]
alphanumeric = ({letter}|{digit})
whitespace = [\s\n\t\r\f]

single_line_comment = [/][/]([\s\S]*?)\n
multi_line_comment = ([/][*])([\s\S]*)([*][/])

identifier = ({letter}|[_])({alphanumeric}|[_])*
integer = ([1-9][0-9]*)|0
operator = "&&"|"<"|">"|"=="|"!="|"+"|"-"|"*"|"!"
separator = ";"|"."|","|"="|"("|")"|"["|"]"|"{"|"}"
%%
    
/* Insira as regras l�xicas no espa�o acima */     
boolean { printTokenInfo("reservado"); }
class	{ printTokenInfo("reservado"); }
public	{ printTokenInfo("reservado"); }
extends	{ printTokenInfo("reservado"); }
static 	{ printTokenInfo("reservado"); }
void	{ printTokenInfo("reservado"); }
main 	{ printTokenInfo("reservado"); }
String	{ printTokenInfo("reservado"); }
int		{ printTokenInfo("reservado"); }
while	{ printTokenInfo("reservado"); }
if		{ printTokenInfo("reservado"); }
else	{ printTokenInfo("reservado"); }
return	{ printTokenInfo("reservado"); }
length	{ printTokenInfo("reservado"); }
true	{ printTokenInfo("reservado"); }
false	{ printTokenInfo("reservado"); }
this	{ printTokenInfo("reservado"); }
new 	{ printTokenInfo("reservado"); }
System.out.println { printTokenInfo("reservado"); } 
{operator} 	{ printTokenInfo("operador"); }
{separator} { printTokenInfo("delimitador"); }
{integer} { printTokenInfo("integer"); }
{identifier} { printTokenInfo("id"); }

{single_line_comment} { /* Ignorar comentario */}
{multi_line_comment} { /* Ignorar comentario */ }
{whitespace} { /* Ignorar whitespace */}
. { throw new RuntimeException("Caractere ilegal! " + yytext() + " na linha: " + yyline + ", coluna: " + yycolumn); }
