% name: Ruth Oldja
% date: 12/7/2022
% purpose: methods to handle basic array operations

append1([], List, List).
append1([X | T], List, [X | Y]) :- append1(T, List, Y).

member1(X, [X | _]).
member1(X, [_ | List]) :- member1(X, List).

rest_list(X, [X | Tail], Tail).
rest_list(X, [_ | Tail], Output) :- rest_list(X, Tail, Output).

% case: list is empty, nothing else to do
flatten1([], []).
% case: list head is itself a list
flatten1([[X | T1] | T2], R) :- flatten1([X | [T1 | T2]], R).
% case: list head is an empty list
flatten1([[] | T], R) :- flatten1(T, R).
% case: list head is a non-list element
flatten1([X | T1], [X | T2]) :- flatten1(T1, T2).

