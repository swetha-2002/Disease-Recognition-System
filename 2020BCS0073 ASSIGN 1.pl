go:-
diagnosis(Disease),
write('I think the disease can be '),
write(Disease),
nl,
write('Take care '),
undo.

diagnosis(cold)     :- cold, !.
diagnosis(flu)      :- flu, !.
diagnosis(typhoid)  :- typhoid, !.
diagnosis(measles)  :- measles, !.
diagnosis(malaria)  :- malaria, !.
diagnosis(covid)  :- covid, !.
diagnosis(chickenpox)     :- chickenpox, !.
diagnosis(unknown). /* no diagnosis*/

covid:-
has(fever),
has(headache),
has(body_ache),
has(runny_nose),  
has(sneezing),    
write('Advices and medications:'),
nl,
write('Citrizen'),
nl,
write('Vitamin C and D'),
nl,
write('Dolo 650mg'),
nl,
write('Consult Dr. Samhitha'),
nl.   

cold :-
has(headache),
has(runny_nose),
has(sneezing),
has(sore_throat),
write('Advices and medications:'),
nl,
write('Citrizen'),
nl,
write('Naproxgen'),
nl,
write('Dolo 650mg'),
nl,
write('Consult Dr.Samhitha'),
nl.

flu :-
has(fever),
has(headache),
has(chills),
has(body_ache),
write('Advices and medications:'),
nl,
write('Citrizen'),
nl,
write('Naproxgen'),
nl,
write('Dolo 650mg'),
nl,
write('Consult Dr. Samhitha'),
nl.    

typhoid :-
has(headache),
has(abdominal_pain),
has(poor_appetite),
has(fever),
write('Advices and medications:'),
nl,
write('Citrizen'),
nl,
write('Naproxgen'),
nl,
write('Dolo 650mg'),
nl,
write('Consult Dr.Samhitha'),
nl. 

chickenpox :-
has(fever),
has(body_ache),
has(rash),
write('Advices and medications:'),
nl,
write('Dolo 650mg'),
nl,
write('Consult Dr.Samhitha'),
nl. 

measles :-
has(fever),
has(runny_nose),
has(rash),
has(conjunctivitis),
write('Advices and medications:'),
nl,
write('Citrizen'),
nl,
write('Naproxgen'),
nl,
write('Dolo 650mg'),
nl,
write('Ribivirin'),
nl,
write('Consult Dr.Samhitha'),
nl.    

malaria :-
has(fever),
has(sweating),
has(headache),
has(nausea),
has(vomiting),
has(diarrhea),
write('Dolo 650mg'),
nl,
write('Naproxgen'),
nl,
write('Bismol'),
nl,
write('vomitstop'),
nl,
write('Consult Dr.Samhitha'),
nl.    

/* how to ask questions */
ask(Question) :-
write('Does the patient have following symptom:'),
write(Question),
write('? '),
read(Response),
nl,
( (Response == yes ; Response == y)
->
assert(yes(Question)) ;
assert(no(Question)), fail).
:- dynamic yes/1,no/1.
/*How to verify something */
has(S) :-
 (yes(S)
  ->
   true ;	
 (no(S)
  ->
   fail ;
 ask(S))).
/* undo all yes/no assertions */
undo :- retract(yes(_)),fail.
undo :- retract(no(_)),fail.
undo. 
