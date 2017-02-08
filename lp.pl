% sum-up-numbers-simple.
% Function to find the sum of the numbers in a simple list.

sum-up-numbers-simple([],0).   %sum of the numbers in empty list is 0.

sum-up-numbers-simple([X|Y],N) :-	%checks if the item is a number, if not a number simply add 0 to the accumulator.
									\+(number(X)),  
									sum-up-numbers-simple(Y, N1),
									N is 0 + N1. 

sum-up-numbers-simple([X|Y],N) :-  %recursive case for a non-empty list.
								\+(is_list(X)),  %check if the item is list or not
								number(X),       %check if the item is a number
								sum-up-numbers-simple(Y, N1),              
								N is X + N1. 


% sum-up-numbers-general.
% Function to find the sum of the numbers in a general list.

sum-up-numbers-general([],0).   %sum of the numbers in empty list is 0.

sum-up-numbers-general([X|Y],N) :-	%checks if the item is a number, if not a number simply add 0 to the accumulator.
									\+(is_list(X)),
									\+(number(X)),  
									sum-up-numbers-general(Y, N1),
									N is 0 + N1. 

sum-up-numbers-general([X|Y],N) :-	%checks if the item is a list, if a list simply make recursive call passing the list to the function
									\+(number(X)),
									is_list(X),  
									sum-up-numbers-general(X, N2),
									sum-up-numbers-general(Y, N1),
									N is N2 + N1.
									

sum-up-numbers-general([X|Y],N) :-  %recursive case for a non-empty list.
								\+(is_list(X)),  %check if the item is list or not
								number(X),       %check if the item is a number
								sum-up-numbers-general(Y, N1),              
								N is X + N1. 


%min-above-min([], [], [])	:- %recursive case for non-empty list.

%min-above-min

find-min([X], X). %base case

find-min([X1,X2|Y], N):-    % if second element is a number but not the first one
	\+(number(X1)),
	number(X2),
	find-min([X2|Y], N).

find-min([X1,X2|Y], N):-   %  if first element is a number but not the second one
	number(X1),
	\+(number(X2)),
	find-min([X1|Y], N).

find-min([X1,X2|Y], N):-    % if both the element are not numbers
	\+(number(X1)),
	\+(number(X2)),
	find-min(Y, N).

find-min([X1,X2|Y], N):-    % if bothe first and second element are numbers
	number(X1),
	number(X2),
	X1 > X2,            % check if the second item is smaller than the first one
	find-min([X2|Y], N).

find-min([X1,X2|Y], N):-
	number(X1),
	number(X2),
	X1 =< X2,         %check if the first element is the smaller one
	find-min([X1|Y], N).

% delete-min : function to delete an item from the list

delete-min(E,[],[]). %base case
delete-min(E,[X|Rest],Result) :- X=E, delete-min(E,Rest,Result). % if the element to be deleted is equal to the first item
delete-min(E,[X|Rest],[X|Result]) :- delete-min(E,Rest,Result). % Else 
	

min-above-min([],[],[]).

min-above-min(L1, L2, Min):-
	find-min(L1, Min1),
	find-min(L2, Min2),
	Min1 > Min2,
	Min is Min1.


% Number 4: 
% Helper Function to convert nested list to a simple list.

make-simple([], []).    % Base Case 

make-simple([First_G1|Rest_G1], S1):-   % If element is not a nested list
	\+(is_list(First_G1)),
	make-simple(Rest_G1, S11),
	append([First_G1], S11, S1).

make-simple([First_G1|Rest_G1], S1):-   % If element is a nested list.
	is_list(First_G1),
	make-simple(First_G1, S12),
	make-simple(Rest_G1, S11),
	append(S12, S11, S1).

common-unique-elements(A, B, C):-
	make-simple(A, Simple1),    % Convert a nested list into a simple list
	make-simple(B, Simple2),    
	common-getter(Simple1, Simple2 , C).    % Call the predicate to get common of the lists
	

common-getter([],_,[]).    % Base Case : if a list is empty NULL is common

common-getter([X|Y], Z , L):- % If an item is a member of second list append it
	member(X, Z),
	common-getter(Y, Z , L1),
	append([X], L1, L).

common-getter([X|Y], Z , L):-  % If an item is not a member do not append anything.
	not(member(X, Z)),
	common-getter(Y, Z , L).
	


