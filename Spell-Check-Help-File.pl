:-['SentenceToListOfLettersOrWords.pl'].

/*--------------------------------------------------------------
SPELL CHECKER HELP FILE
--------------------------------------------------------------*/

/*--------------------------------------------------------------
spell_check/0 reads a sentence from the keyboard and transforms
it into a list (words) of lists (letters for each word).
--------------------------------------------------------------*/

spell_check(Sentence):- 
	string_to_listofwords(Sentence,ListofWords),
	write(ListofWords),nl,
	check(ListofWords),!.

/*--------------------------------------------------------------
check/1 calls check_word in order to check spelling for each 
word in a sentence.
--------------------------------------------------------------*/

check([]).
check([WordLetters|Rest]):-
	check_word(WordLetters),
	check(Rest).

/*--------------------------------------------------------------
check_word/1 checks various types of errors in a word and prints
out the appropriate message. 
--------------------------------------------------------------*/

check_word(WL):- 
	missing_letter(WL,X),		% as defined in Lab 6.6
	wordtolist(W,WL),
	writelist([W,' has a missing letter ', X,nl]).



/*--------------------------------------------------------------
  Put the rest of the errors here	
--------------------------------------------------------------*/

% missing_letter(WL,X):- ...


/*--------------------------------------------------------------
  Converts a word (atom) to a list of letters and vice-versa.
  ?- wordtolist(prolog, WordLetters).
  WordLetters = [p,r,o,l,o,g]
  ?- wordtolist(Word, [p,r,o,l,o,g]).
  Word = prolog
--------------------------------------------------------------*/

wordtolist(W,L):- var(W),!, ltow(W,L).
wordtolist(W,L):- var(L),!, wtol(W,L).

wtol(W,L):- name(W,ASCII),asciitoletter(ASCII,L).

ltow(W,L):- asciitoletter(ASCII,L), name(W,ASCII).

asciitoletter([],[]).
asciitoletter([ASCIIH|ASCIIT],[H|T]):-
	name(H,[ASCIIH]),!,
	asciitoletter(ASCIIT,T).