utterance(X) :- sentence(X, []).
sentence(Start, End) :-
	nounphrase(Start, Rest, Number), verbphrase(Rest, End, Number).

nounphrase([Noun | End], End, Number) :-
	noun(Noun, Number).
nounphrase([Article, Noun | End], End, Number) :-
	noun(Noun, Number), article(Article, Number).

verbphrase([Verb | End], End, Number) :-
	verb(Verb, Number).
verphrase([Verb | Rest], End, Number) :-
	verb(Verb, Number), nounphrase(Rest, End, _).

article(a, singular).
article(these, plural).
article(the, singular).
article(the, plural).

noun(man, singular).
noun(men, plural).
noun(dog, signular).
noun(dogs, plural).

verb(likes, singular).
verb(like, plural).

verb(bites, singular).
verb(bite, plural).