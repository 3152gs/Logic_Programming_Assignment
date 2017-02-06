% sum-up-numbers-simple.
% Function to find the sum of the numbers in a simple list.

sum-up-numbers-simple([],0).   %sum of the numbers in empty list is 0.

sum-up-numbers-simple([X|Y],N) :-	%checks if the item is anumber, if not a number simply add 0 to the accumulator.
									\+(number(X)),  
									sum-up-numbers-simple(Y, N1),
									N is 0 + N1. 
sum-up-numbers-simple([X|Y],N) :-  %recursive case for a non-empty list.
								\+(is_list(X)),  %check if the item is list or not
								number(X),       %check if the item is a number
								sum-up-numbers-simple(Y, N1),              
								N is X + N1. 
