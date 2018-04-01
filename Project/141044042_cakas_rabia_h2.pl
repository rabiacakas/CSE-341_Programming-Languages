/*--------------------------------------------------------*
*														  *
*	   		RABIA ÇAKAS 141044042		 				  *
*	 	  PROGRAMMING LANGUAGES_HW2						  *	  
*														  *
*---------------------------------------------------------*/

%facts: flight routes-costs
flight(istanbul, izmir, 3).
flight(istanbul, trabzon, 3).
flight(istanbul, ankara, 5).

flight(izmir, istanbul, 3).
flight(trabzon, istanbul, 3).
flight(ankara, istanbul, 5).

flight(izmir, ankara, 6).
flight(izmir, antalya, 1).

flight(ankara, izmir, 6).
flight(antalya,izmir, 1).

flight(trabzon, ankara, 2).
flight(ankara, konya, 8).

flight(ankara, trabzon, 2).
flight(konya, ankara, 8).

flight(antalya, diyarbakır, 5).
flight(konya, diyarbakır, 1).
flight(konya, kars, 5).
flight(kars, gaziantep, 3).

flight(edirne, edremit, 5).
flight(edremit, erzincan, 7).

flight(diyarbakır, antalya, 5).
flight(diyarbakır, konya, 1).
flight(kars, konya, 5).
flight(gaziantep, kars, 3).

flight(edremit, edirne, 5).
flight(erzincan, edirne, 7).

% bir sehirden yola baslayip hedef sehre ulasma cost unu verir
route(A, B, C):- flight(A, B, C), flight(B, A, C).
route(A, B, X+Y):- flight(A, D, X), flight(D, B, Y), not(D==B).
route(B, A, X+Y):- flight(B, D, X), flight(D, A, Y), not(D==A).

/*--------------------------------------------------------*
*					PART 3								  *
*---------------------------------------------------------*/

% Karakterlerin basina warning style_check(-singleton) dan kurtulmak icin _ eklendi.

when(a, 10).
when(b, 12).
when(c, 11).
when(d, 16).
when(e, 17).

where(a, 101).
where(b, 104).
where(c, 102).
where(d, 103).
where(e, 103).

enrolled(1, a).
enrolled(1, b).
enrolled(2, a).
enrolled(3, b).
enrolled(4, c).
enrolled(5, d).
enrolled(6, d).
enrolled(6, a).

% 3.0 Add at least 5 more attandees enrolled to two/more sessions.
%-----------------------------------------------------------------%
enrolled(7, a).
enrolled(8, b).
enrolled(9, d).
enrolled(10, d).
enrolled(11, b).

/*----------------------------------------------------------------*
* 						3.1										  *
* schedule(S:attandees, P:room, T:start_time)					  *
* enrolled(S:attandees, N:name)									  *
* where(N:name, P:room)											  *
* when(N:name, T:start_time)									  *
*-----------------------------------------------------------------*/
schedule(S,P,T):- enrolled(S,N),where(N,P),when(N,T).

/*----------------------------------------------------------------*
*						3.2										  *
* usage(P:room, T:start_time)									  *
* where(N:name, P:room)											  *
* when(N:name, T:start_time)									  *
*-----------------------------------------------------------------*/
usage(P,T):- where(N,P), when(N,T).

/*----------------------------------------------------------------*
* 						3.3										  *
* conflict(X:attandees, Y:attandees)							  *
* where(X:name, P:room)											  *
* when(N:name, T:start_time)									  *
*-----------------------------------------------------------------*/
conflictRoom(X,Y):- where(X,P), where(Y,T), P==T.
conflictTime(X,Y):-  when(X,P), when(Y,T), P==T.

conflict(X,Y):- (conflictRoom(X,Y) ; conflictTime(X,Y)).

/*----------------------------------------------------------------*
*						3.4										  *
* meet(X:attandees, Y:attandees)								  *
* where(N:name, P:room)											  *
* when(N:name, T:start_time)									  *
*-----------------------------------------------------------------*/
meet(X,Y):- enrolled(X,N1),where(N1,P1),
            enrolled(Y,N2),where(N2,P2),
            when(N1,T1), when(N2,T2),
            N1==N2, P1==P2, T1==T2.


/*---------------------------------------------------------------------------------------------------*
*									PART 4															 *
*																									 *		
* Ref: https://www.cs.uni-potsdam.de/wv/lehre/Material/Prolog/Eclipse-Doc/bips/lib/lists/union-3.html*
*																									 *
*----------------------------------------------------------------------------------------------------*/

union(L, S, U).
union([Head|L1tail], L2, L3) :-
        memberchk(Head, L2),
        !,
        union(L1tail, L2, L3).
union([Head|L1tail], L2, [Head|L3tail]) :-
        union(L1tail, L2, L3tail).


intersection(L1, L2, I).
intersection([Head|L1tail], L2, L3) :-
        memberchk(Head, L2),
        !,
        L3 = [Head|L3tail],
        intersection(L1tail, L2, L3tail).
intersection([_|L1tail], L2, L3) :-
        intersection(L1tail, L2, L3).


flatten(L, F) :-
        flatten(L, F, []).

flatten([], Res, Res) :- !.
flatten([Head|Tail], Res, Cont) :-
        !,
        flatten(Head, Res, Cont1),
        flatten(Tail, Cont1, Cont).
flatten(Term, [Term|Cont], Cont).