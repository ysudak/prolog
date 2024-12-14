:-['Spell-Check-Help-File.pl'].

% Lab 6
morse(a, ".-").
morse(b, "-...").
morse(c, "-.-.").
morse(d, "-..").
morse(e, ".").
morse(f, "..-.").
morse(g, "--.").
morse(h, "....").
morse(i, "..").
morse(j, ".---").
morse(k, "-.-").
morse(l, ".-..").
morse(m, "--").
morse(n, "-.").
morse(o, "---").
morse(p, ".--.").
morse(q, "--.-").
morse(r, ".-.").
morse(s, "...").
morse(t, "-").
morse(u, "..-").
morse(v, "...-").
morse(w, ".--").
morse(x, "-..-").
morse(y, "-.--").
morse(z, "--..").
morse(/, "-..-.").

decrypt([], []).
decrypt([MorseListHead|MorseListTail], [EnglishListHead|EnglishListTail]):-
  morse(EnglishListHead, MorseListHead),
  decrypt(MorseListTail, EnglishListTail).

decryptMorse(MorseList, EnglishList):-
  decrypt(MorseList, EnglishList),
  atom_chars(EnglishSentense, EnglishList),
  write(EnglishSentense), nl.

% ?- decryptMorse(["....", ".", ".-..", ".-..", "---", "-..-.", ".--", "---", ".-.",".-..","-.."], B).
% hello/world
% B = [h, e, l, l, o, /, w, o, r|...].