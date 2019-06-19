


%%%%%% Driving from X to Y changes  the car location from X to Y in the following timestep %%%%%%%%%%

car_at(Y,I+1) :- car_at(X,I) , drive(X,Y,I), step(I), I>=0,  X!=Y, location(X),location(Y),I<n.
-car_at(X,I+1) :- car_at(X,I) , drive(X,Y,I), step(I), X!=Y, location(X),location(Y),I>=0,I<n.


%%%%%%%% inertial %%%%%%%%%%%%%%%%

car_at(X,I+1):- car_at(X,I), not -car_at(X,I+1), step(I), I>=0, I<n, location(X).
-car_at(X,I+1):- -car_at(X,I), not car_at(X,I+1), step(I), I>=0, I<n, location(X).












