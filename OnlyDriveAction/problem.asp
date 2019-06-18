% car_at(Y,Z) means car is at location Y at time Z
% passenger_at(Y,Z) means the passenger is at location Y at time Z


%%%%% Init state: car at location 0
car_at(p1,0).


%%%%%%%%%%%% goal: car must be at location 3 and the car being empty  %%%%%%%%%%%%%%%%%%%%% 
:- not car_at(p3,n). 