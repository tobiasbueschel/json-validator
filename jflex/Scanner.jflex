package Example;

import java_cup.runtime.SymbolFactory;
%%
%cup
%class Scanner
%{
	public Scanner(java.io.InputStream r, SymbolFactory sf){
		this(r);
		this.sf=sf;
	}
	private SymbolFactory sf;
%}
%eofval{
    return sf.newSymbol("EOF",sym.EOF);
%eofval}

/* Macro Definitions (Abbreviations) */
WhiteSpace = [ \t\r\n\f]
Number = -?([1-9]+|0)\.?[0-9]* /* checks for positive and negative integers and decimal numbers */
Boolean = (true|false)
String = \"{Char}*\" /* A string always starts with " and ends with " */
Char = [^\n\r\"] /* any character except for newline, carriage return or " */

%%
/* object start/end symbols */
"{" { return sf.newSymbol("Left Curly Bracket",sym.LCBRACKET); }
"}" { return sf.newSymbol("Right Curly Bracket",sym.RCBRACKET); }

/* array start/end symbols */
"[" { return sf.newSymbol("Left Square Bracket",sym.LSQBRACKET); }
"]" { return sf.newSymbol("Right Square Bracket",sym.RSQBRACKET); }

":" { return sf.newSymbol("Comma",sym.COLON); }
"," { return sf.newSymbol("Comma",sym.COMMA); }

"null" { return sf.newSymbol("Null",sym.NULL); } /* catches null pointers */
{Boolean} { return sf.newSymbol("Boolean",sym.BOOLEAN); } /* catches true or false boolean */

/* string and number literals */
{Number} { return sf.newSymbol("Number",sym.NUMBER); }
{String} { return sf.newSymbol("String",sym.STRING); }

{WhiteSpace} { /* ignore white space. */ }
. { System.err.println("Illegal character: "+yytext()); } /* catches anything else */
