% name: Ruth Oldja
% date: 12/7/2022
% purpose: methods to handle basic array operations

% if a list is empty, just return the result List
append1([], List, List).
% grab the head of the list and add it to the result R, then call append1 with the tail
append1([X | Tail], List, [X | R]) :- append1(Tail, List, R).

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
flatten1([[X | Tail1] | Tail2], R) :- flatten1([X | [Tail1 | Tail2]], R).
% list head is an empty list
flatten1([[] | Tail], R) :- flatten1(Tail, R).
flatten1([[] | Tail], R) :- flatten1(Tail, R).
% list head is a non-list element
	% take X off list, add it to R, then call flatten1 again
flatten1([X | Tail], [X | R]) :- flatten1(Tail, R).

% 
zip([], [], []).
zip([], _, []).
zip(_, [], []).
zip([X | Tail1], [Y | Tail2], [ X-Y | R]) :- zip(Tail1, Tail2, R).
