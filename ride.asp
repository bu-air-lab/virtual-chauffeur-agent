


%%%%%%%%%%%%%waitforpassenger%%%%%%%%%%%%%%%%

serviceconfirmed(P,I+1) :- waitforpassenger(P,I), -serviceconfirmed(P,I), step(I),passenger(P),I>=0,I<n.
-serviceconfirmed(P,I+1) :- waitforpassenger(P,I), serviceconfirmed(P,I), step(I),passenger(P),I>=0,I<n.


%%%%%% Driving from X to Y changes the car location from X to Y in the following timestep %%%%%%%%%%

car_at(Y,I+1) :- car_at(X,I) , drive(X,Y,I), step(I), I>=0,  X!=Y, location(X),location(Y),I<n.
-car_at(X,I+1) :- car_at(X,I) , drive(X,Y,I), step(I), X!=Y, location(X),location(Y),I>=0,I<n.



%%%%%%%%%% Onboarding makes the car full at the next time step, precondition: car not full, passenger and car at the same place, serviceconfirmed %%%%%%%%%%

carisfull(I+1) :- car_at(X,I), passenger_at(P,X,I), onboard(P,X,I), step(I), -carisfull(I),serviceconfirmed(P,I), location(X),passenger(P),I>=0,I<n.




%%%%%%%%%%%%%%%%%%% Offboarding makes the car not full, precondition: car being full, (maybe) both passenger and car at the same location

-carisfull(I+1):- car_at(X,I),passenger_at(P,X,I),serviceconfirmed(P,I),carisfull(I), offboard(P,X,I), step(I), passenger(P), I>=0, carisfull(I), I<n, location(X).




%%%%%%%%%%%%%%%%%% Once the car is full, passenger and car locations change the same %%%%%%%%%%%%%%

passenger_at(P,Y,I+1):- drive(X,Y,I), car_at(X,I),passenger_at(P,X,I), carisfull(I),location(X),location(Y), passenger(P), step(I), I>=0, I<n, X!=Y.
-passenger_at(P,X,I+1):- drive(X,Y,I), car_at(X,I),passenger_at(P,X,I), carisfull(I),location(X),location(Y), passenger(P), step(I), I>=0, I<n, X!=Y.




%%%%%%%% inertial %%%%%%%%%%%%%%%%

car_at(X,I+1):- car_at(X,I), not -car_at(X,I+1), step(I), I>=0, I<n, location(X).
-car_at(X,I+1):- -car_at(X,I), not car_at(X,I+1), step(I), I>=0, I<n, location(X).

passenger_at(P,X,I+1):- passenger_at(P,X,I), not -passenger_at(P,X,I+1), step(I), I>=0, I<n, location(X),passenger(P).
-passenger_at(P,X,I+1):- -passenger_at(P,X,I), not passenger_at(P,X,I+1), step(I), I>=0, I<n, location(X), passenger(P).

carisfull(I+1):- carisfull(I), not -carisfull(I+1), step(I), I>=0, I<n.
-carisfull(I+1):- -carisfull(I), not carisfull(I+1), step(I), I>=0, I<n.

serviceconfirmed(P,I+1):- serviceconfirmed(P,I), not -serviceconfirmed(P,I+1), passenger(P), step(I), I>=0, I<n.
-serviceconfirmed(P,I+1):- -serviceconfirmed(P,I), not serviceconfirmed(P,I+1), passenger(P), step(I), I>=0, I<n.












