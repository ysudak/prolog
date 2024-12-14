/*------------------------------------------------------------------------
  CC2200 Logic Programming
  Help file for the purposes of labs

  string_to_listofletters/2: takes a string and transforms it
  into a list of lower case letters.

  Comments: 
  - It accepts only upper and lower case letters in the string
  - A space is left as a space
  - All other characters are marked as invalid.
------------------------------------------------------------------------*/

string_to_listofletters(String,ListOfLetters):-
	string_codes(String,AsciiList),		% built-in
	asciitoletters(AsciiList,ListOfLetters).
	
asciitoletters([],[]).
asciitoletters([32|AsciiT],[' '|T]):-		% a space
	asciitoletters(AsciiT,T).
asciitoletters([46|AsciiT],['.'|T]):-		% a dot . 
	asciitoletters(AsciiT,T).
asciitoletters([45|AsciiT],['-'|T]):-		% a a dash -
	asciitoletters(AsciiT,T).
asciitoletters([95|AsciiT],['_'|T]):-		% a underscore _
	asciitoletters(AsciiT,T).
asciitoletters([AsciiH|AsciiT],[H|T]):-		% a lower case
	AsciiH>=97, 
	AsciiH=<122,!,
	name(H,[AsciiH]),			% built-in
	asciitoletters(AsciiT,T).
asciitoletters([AsciiH|AsciiT],[H|T]):-		% an upper case
	AsciiH>=65, 
	AsciiH=<90,!,
	LowerAsciiH is AsciiH+32,
	name(H,[LowerAsciiH]),			% built-in	
	asciitoletters(AsciiT,T).
asciitoletters([_|AsciiT],[invalid|T]):-	% all others
	asciitoletters(AsciiT,T).

/*------------------------------------------------------------------------
  string_to_listofwords/2: takes a string and transforms it
  into a list of words which are lists of letters.

  Comments: 
  - It accepts only upper and lower case letters in the string
------------------------------------------------------------------------*/

string_to_listofwords(String,ListOfWords):-
	string_to_listofletters(String,ListOfLetters),
	letters_to_wordlists(ListOfLetters, ListOfWordsTemp),
	get_rid_of_spaces(ListOfWordsTemp,ListOfWords).

letters_to_wordlists(ListOfLetters, [Word|RestListOfWords]):-
	append(Word,[' '|Rest],ListOfLetters),!,
	letters_to_wordlists(Rest,RestListOfWords).	
letters_to_wordlists(X,[X]).

get_rid_of_spaces([],[]).			% get rid of []s
get_rid_of_spaces([[]|T],R):-
	get_rid_of_spaces(T,R).
get_rid_of_spaces([H|T],[H|R]):-
	H\=[],
	get_rid_of_spaces(T,R).


