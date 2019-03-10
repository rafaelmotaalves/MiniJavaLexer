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
		System.out.println("Token de tipo " + type + " encontrado na linha: " + yyline +  " e coluna " +  yycolumn + " : " + yytext());
	}
%}

letter = [A-Za-z]
digit = [0-9]
alphanumeric = ({letter}|{digit})
whitespace = [\s\n\t\r\f]

single_line_comment = [//](.*)
multi_line_comment = ([/][*])(.|{whitespace})*([*][/])

identifier = ({letter}|[_]){alphanumeric}*
integer = ([1-9][0-9]*)|0
operator = "&&"|"<"|">"|"=="|"!="|"+"|"-"|"*"|"!"
separator = ";"|"."|","|"="|"("|")"|"["|"]"|"{"|"}"
%%
    
/* Insira as regras l�xicas no espa�o acima */     
boolean { printTokenInfo("BOOLEAN"); }
class	{ printTokenInfo("CLASS"); }
public	{ printTokenInfo("PUBLIC"); }
extends	{ printTokenInfo("EXTENDS"); }
static 	{ printTokenInfo("STATIC"); }
void	{ printTokenInfo("VOID"); }
main 	{ printTokenInfo("MAIN"); }
String	{ printTokenInfo("STRING"); }
int		{ printTokenInfo("INT"); }
while	{ printTokenInfo("WHILE"); }
if		{ printTokenInfo("IF"); }
else	{ printTokenInfo("ELSE"); }
return	{ printTokenInfo("RETURN"); }
length	{ printTokenInfo("LENGTH"); }
true	{ printTokenInfo("TRUE"); }
false	{ printTokenInfo("FALSE"); }
this	{ printTokenInfo("THIS"); }
new 	{ printTokenInfo("NEW"); }
System.out.println { printTokenInfo("SYSTEM.OUT.PRINTLN"); } 
{operator} 	{ printTokenInfo("OPERATOR"); }
{separator} { printTokenInfo("SEPARATOR"); }
{integer} { printTokenInfo("INTEGER"); }
{identifier} { printTokenInfo("ID"); }

{single_line_comment} { /* Ignorar coment�rio */}
{multi_line_comment} { /* Ignorar coment�rio */ }
{whitespace} { /* Ignorar whitespace */}
. { throw new RuntimeException("Caractere ilegal! " + yytext() + " na linha: " + yyline + ", coluna: " + yycolumn); }
