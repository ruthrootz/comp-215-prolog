% name: Ruth Oldja
% date: 12/7/2022
% purpose: methods to handle basic array operations

% if a list is empty, just return the result List
append1([], List, List).
% grab the head of the list and add it to the result R, then run append1 with the tail
append1([X | Tail], List, [X | Result]) :- append1(Tail, List, Result).

% if the search term and the head of the list match, exit
member1(X, [X | _]).
% the head doesn't match the search term, so run member1 again
member1(X, [_ | List]) :- member1(X, List).

% if the search term and the head of the list match, return the tail
rest_list(X, [X | Tail], Tail).
% the head doesn't match the search term, so run rest_list again
rest_list(X, [_ | Tail], Output) :- rest_list(X, Tail, Output).

% list is empty, nothing else to do
flatten1([], []).
% list head is itself a list
flatten1([[X | Tail1] | Tail2], Result) :- flatten1([X | [Tail1 | Tail2]], Result).
% list head is an empty list
flatten1([[] | Tail], Result) :- flatten1(Tail, Result).
flatten1([[] | Tail], Result) :- flatten1(Tail, Result).
% list head is a non-list element
	% take X off list, add it to R, then run flatten1 again
flatten1([X | Tail], [X | Result]) :- flatten1(Tail, Result).

% nothing left to zip, return empty list
zip([], [], []).
% next two facts: one of the lists is empty, return empty list
zip([], _, []).
zip(_, [], []).
% take the head of each list and add them to result, then run zip with the tails
zip([X | Tail1], [Y | Tail2], [ X-Y | Result]) :- zip(Tail1, Tail2, Result).
