% car_at(Y,Z) means car is at location Y at time Z
% passenger_at(P,Y,Z) means the passenger is at location Y at time Z


%%%%% Init state: car at location 0, car is empty
car_at(broadway,0).
passenger_at(bob,timessq,0).
passenger_at(carol,timessq,0).


-passincar(bob,0).
-passincar(carol,0).
-serviceconfirmed(bob,0).
-serviceconfirmed(carol,0).


%%%%%%%%%%%% goal: Both car and passneger be at jfk %%%%%%%%%%%%%%%%%%%%%
 :- not passenger_at(bob,jfk,n).
 :- not passenger_at(carol,jfk,n).

 :- not -passincar(bob,n).
 :- not -passincar(carol,n).

 