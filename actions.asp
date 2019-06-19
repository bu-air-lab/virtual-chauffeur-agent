step(0..n).


0{
	drive(X,Y,I):location(X),location(Y),X!=Y;
	onboard(P,X,I):passenger(P),location(X);
	offboard(P,X,I):passenger(P), location(X)
}1 :- step(I), I>=0, I<n.

#show onboard/3.
#show drive/3.
#show offboard/3.
%#show car_at/2.
%#show passenger_at/3.
#show carisfull/1.



