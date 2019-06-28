# Virtual Chaeuffer Agent 
## Prerequisite
Install gringo solver:
```sh
$ sudo apt-get install gringo
```

## Actions:
**drive(X,Y,I)** : Driving from location X to location Y at time I 
**onboard(P,X,I)** : Onboarding passenger P at location X at time I 
**offboard(P,X,I)** : Offboarding passenger P at location X at time I  
**waitforpassenger(P,I)** : Waiting for passenger at time I 

## Fluents:
Fluents are atoms that can change as the result of an action execution. An atom can be true, false or not known.
**serviceconfirmed(P,I)** : if true, service is confirmed for pasenger P at time I
**car_at(Y,I)** : if true, car is at location Y at time I
**carisfull(I,N)**: if true, car is full at time I and can not accept more passengers
**passincar(P,I)**: if true, passenger P is inside the car

## Domains
We made a domain consisting of landmarks in New York city (Times sq, Broadway st, Harlem, Brooklyn, JFK) and three virtual passengers (Bob, Carol and Kate). Given the three various initial locations, the planner outputs a plan consisiting a sequence of actions to complete the ride of each passenger.


### domain1
![](https://github.com/bu-air-lab/virtual-chauffeur-agent/blob/master/domain1.jpg)

The car is initially at Broadway, Bob and Carol are at Times Sq and both want to go to JFK. The seqence of actions can be found by:
```sh
$ clingo *.asp domain1/*.asp -c n=8
```
Note that the actions are not printed in order. The order is found by the timestep (I) value.
### domain2
![](https://github.com/bu-air-lab/virtual-chauffeur-agent/blob/master/domain2.jpg)
The car is initially at Broadway, Bob is at Times Sq, Carol is at Brooklyn and both want to go to JFK. The seqence of actions can be found by:
```sh
$ clingo *.asp domain2/*.asp -c n=9
```
### domain3
![](https://github.com/bu-air-lab/virtual-chauffeur-agent/blob/master/domain3.jpg)
The car is initially at Broadway, Bob is at Times Sq, Carol is at Brooklyn and both want to go to JFK. Also, kate is waiting at JFK and wants to go to harlem. The seqence of actions can be found by:
```sh
$ clingo *.asp domain3/*.asp -c n=12
```
