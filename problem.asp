% car_at(Y,Z) means car is at location Y at time Z
% passenger_at(Y,Z) means the passenger is at location Y at time Z


%%%%% Init state: car at location 0, car is empty
car_at(p1,0).
passenger_at(p2,0).
-carisfull(0).


%%%%%%%%%%%% goal: Both car and passneger be at location 3 and the car being empty  %%%%%%%%%%%%%%%%%%%%%
%:- not car_at(p3,n), not passenger_at(p3,n), not -carisfull(n). 
 :- not passenger_at(p3,n).
 %:- not -carisfull(n). 