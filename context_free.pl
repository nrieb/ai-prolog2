utterance(X) :- compoundsentence(X, []).

compoundsentence(Start, End) :-
	sentence(Start, Rest),
	(
	 (Rest = [Conjunction | More], conjunction(Conjunction), sentence(More, End));
	 (Rest = End)
	).

sentence(Start, End) :-
	compoundnounphrase(Start, Rest), verbphrase(Rest, End).


compoundnounphrase(Start, End) :-
	nounphrase(Start, Rest),
	(
	 (Rest = [Conjunction | More], conjunction(Conjunction), compoundnounphrase(More, End));
	 (Rest = End)
	).

nounphrase(Start, End) :-
	(adjectivephrase(Start, [Noun | End]); Start = [Noun | End]),
	noun(Noun).
nounphrase([Article | Rest], End) :-
	article(Article),
	(adjectivephrase(Rest, [Noun | End]); Rest = [Noun | End]),
	noun(Noun).

adjectivephrase([Adjective | End], End) :-
	adjective(Adjective).
adjectivephrase([Adjective, Conjunction | Rest], End) :-
	adjective(Adjective), conjunction(Conjunction), adjectivephrase(Rest, End).

verbphrase([Verb | Rest], End) :-
	verb(Verb),
	(
	 adverbphrase(Rest, End);
	 ((compoundnounphrase(Rest, More); Rest = More), (adverbphrase(More, End); More = End))
	).
verbphrase(Start, End) :-
	adverbphrase(Start, [Verb | Rest]), verb(Verb),
	(compoundnounphrase(Rest, End); Rest = End).

adverbphrase([Adverb | End], End) :-
	adverb(Adverb).
adverbphrase([Adverb, Conjunction | Rest], End) :-
	adverb(Adverb), conjunction(Conjunction), adverbphrase(Rest, End).

article(a).
article(the).

noun(man).
noun(dog).
noun(cat).
noun(food).
noun(he).
noun(music).
noun(soup).
noun(hat).
noun(years).
noun(robot).

adjective(soft).
adjective(delicious).
adjective(blue).
adjective(green).
adjective(slow).
adjective(tall).
adjective(five).

verb(ate).
verb(likes).
verb(bites).
verb(barked).
verb(ran).
verb(played).
verb(is).
verb(slept).

adverb(loudly).
adverb(swiftly).
adverb(quickly).
adverb(gracefully).
adverb(slowly).

conjunction(and).
conjunction(but).

preposition(on).
preposition(for).
preposition(under).
preposition(above).