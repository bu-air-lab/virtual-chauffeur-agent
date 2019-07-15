step(0..n).
number(0..3).

1{
	drive(X,Y,I):location(X),location(Y),X!=Y;
	onboard(P,X,I):passenger(P),location(X);
	offboard(P,X,I):passenger(P), location(X);
	waitforpassenger(P,I): passenger(P);
	greetpassenger(P,I): passenger(P);
	authenticatepassenger(P,I): passenger(P);
	opendoor(P,I): passenger(P);
	loadluggage(P,I) : passenger(P) ;
	closedoor(P,I): passenger(P)
}1 :- step(I), I>=0, I<n.

#show waitforpassenger/2.
#show onboard/3.
#show drive/3.
#show authenticatepassenger/2.
#show greetpassenger/2.
#show opendoor/2.
#show loadluggage/2.
#show closedoor/2.
#show offboard/3.
%#show car_at/2.
%#show passenger_at/3.
%#show carisfull/2.



