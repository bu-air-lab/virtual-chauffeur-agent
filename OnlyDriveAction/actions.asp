step(0..n).


1{
	drive(X,Y,I):location(X),location(Y),X!=Y  
}1 :- step(I), I>=0, I<n.

#show drive/3.



