


%%%%%%%%%%%%%waitforpassenger%%%%%%%%%%%%%%%%

serviceconfirmed(P,I+1) :- waitforpassenger(P,I), -serviceconfirmed(P,I), step(I),passenger(P),I>=0,I<n.
-serviceconfirmed(P,I+1) :- waitforpassenger(P,I), serviceconfirmed(P,I), step(I),passenger(P),I>=0,I<n.


%%%%%% Driving from X to Y changes the car location from X to Y in the following timestep %%%%%%%%%%

car_at(Y,I+1) :- car_at(X,I) , drive(X,Y,I), step(I), I>=0,  X!=Y, location(X),location(Y),I<n.
-car_at(X,I+1) :- car_at(X,I) , drive(X,Y,I), step(I), X!=Y, location(X),location(Y),I>=0,I<n.



%%%%%%%%%% Onboarding makes the car full at the next time step, precondition: car not full, passenger and car at the same place, serviceconfirmed %%%%%%%%%%

passincar(P,I+1) :- car_at(X,I), passenger_at(P,X,I),-passincar(P,I), onboard(P,X,I), step(I),serviceconfirmed(P,I), location(X),passenger(P),I>=0,I<n.



%%%%%%%%%%%%%%%%%%% Offboarding makes the car not full, precondition: car being full, (maybe) both passenger and car at the same location

-passincar(P,I+1):- car_at(X,I),passenger_at(P,X,I),serviceconfirmed(P,I), offboard(P,X,I),passincar(P,I), step(I), passenger(P), I>=0, I<n, location(X).




%%%%%%%%%%%%%%%%%% Once the car is full, passenger and car locations change the same %%%%%%%%%%%%%%

passenger_at(P,Y,I+1):- drive(X,Y,I), car_at(X,I),passenger_at(P,X,I), passincar(P,I),location(X),location(Y), passenger(P), step(I), I>=0, I<n, X!=Y.
-passenger_at(P,X,I+1):- drive(X,Y,I), car_at(X,I),passenger_at(P,X,I), passincar(P,I),location(X),location(Y), passenger(P), step(I), I>=0, I<n, X!=Y.




%%%%%%%% inertial %%%%%%%%%%%%%%%%

car_at(X,I+1):- car_at(X,I), not -car_at(X,I+1), step(I), I>=0, I<n, location(X).
-car_at(X,I+1):- -car_at(X,I), not car_at(X,I+1), step(I), I>=0, I<n, location(X).

passenger_at(P,X,I+1):- passenger_at(P,X,I), not -passenger_at(P,X,I+1), step(I), I>=0, I<n, location(X),passenger(P).
-passenger_at(P,X,I+1):- -passenger_at(P,X,I), not passenger_at(P,X,I+1), step(I), I>=0, I<n, location(X), passenger(P).

%carisfull(I+1,N):- carisfull(I,N), not -carisfull(I+1,N), step(I), I>=0, I<n, number(N), N>=0, N<3.
%-carisfull(I+1,N):- -carisfull(I,N), not carisfull(I+1,N), step(I), I>=0, I<n, number(N), N>=0, N<3.

%carisfull(I,N+1):- carisfull(I,N), not -carisfull(I,N+1), step(I), I>=0, I<n, number(N), N>=0, N<3.
%-carisfull(I,N+1):- -carisfull(I,N), not carisfull(I,N+1), step(I), I>=0, I<n, number(N), N>=0, N<3.


serviceconfirmed(P,I+1):- serviceconfirmed(P,I), not -serviceconfirmed(P,I+1), passenger(P), step(I), I>=0, I<n.
-serviceconfirmed(P,I+1):- -serviceconfirmed(P,I), not serviceconfirmed(P,I+1), passenger(P), step(I), I>=0, I<n.

passincar(P,I+1):- passincar(P,I), not -passincar(P,I+1), step(I), I>=0, I<n, location(X),passenger(P).
-passincar(P,I+1):- -passincar(P,I), not passincar(P,I+1), step(I), I>=0, I<n, location(X), passenger(P).










