% sum-up-numbers-simple.
% Function to find the sum of the numbers in a simple list.

sum-up-numbers-simple([],0).   %sum of the numbers in empty list is 0.
sum-up-numbers-simple([X|Y],N) :-  %recursive case for a non-empty list.
								sum-up-numbers-simple(Y, N1),              
								N is X + N1. 

