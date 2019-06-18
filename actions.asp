step(0..n).


1{
	onboard(I);
	drive(X,Y,I):location(X),location(Y),X!=Y;  
	offboard(I)
}1 :- step(I), I>=0, I<n.


#show onboard/1.
#show drive/3.
#show offboard/1.



