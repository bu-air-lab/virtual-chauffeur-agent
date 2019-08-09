import os
import subprocess	
import sys
import time

class VCA:


	def __init__(self):

		if os.path.exists("/tmp/domainVCA"):
			subprocess.check_output('rm -rf /tmp/domainVCA/', shell=True)

		self.passengers=[]
		self.pickupLocations={}
		self.dropoffLocations={}
		self.fluents = ['passincar','serviceconfirmed','doorisopen','isgreeted','authenticated','luggageloaded']
		self.user_input()
		self.ToASP()
		

	def user_input(self):

		try:

			num_passengers =int(raw_input('Enter the number of passengers:  '))
		except ValueError:
			print ('The entered number is not valid')
			sys.exit(0)	       # change it later, so that user can try again


		print 'Please enter their names [bob,carol,kate] : '
		
		for i in range(int(num_passengers)):
			new = raw_input(str(i+1)+': ')
			assert new.lower() in ['bob','kate','carol'],"Please choose from the mentioned names"
			self.passengers.append(new.lower())   
		#print 'Current locations are: '
		#print 'harlem, brooklyn, jfk,timessq, ...\n'

		print self.passengers
		print 'Enter the dropoff/pickup location for each passenger [harlem, brooklyn, jfk,timessq]: \n'
		for passenger in self.passengers:
			loc = raw_input('pickup location for '+passenger+': ')

			assert loc.lower() in ['harlem', 'brooklyn', 'jfk','timessq'],"Please choose from the mentioned locations"
			self.pickupLocations[passenger] = loc.lower()


			loc = raw_input('Dropoff location for '+passenger+': ')
			assert loc.lower() in ['harlem', 'brooklyn', 'jfk','timessq'],"Please choose from the mentioned locations"
			self.dropoffLocations[passenger] = loc.lower()

		#print self.pickupLocations
		#print self.dropoffLocations


	def ToASP(self):
		
		#os.mkdir('/home/saeid/domain') # change it to unique
		os.mkdir('/tmp/domainVCA') # change it to unique

		subprocess.check_output('cp ./actions.asp ./ride.asp ./domain3/facts.asp /tmp/domainVCA/', shell=True)
		subprocess.check_output('touch /tmp/domainVCA/problem.asp', shell=True)

		file = open('/tmp/domainVCA/problem.asp','a') 
 
		file.write('car_at(broadway,0).\n') 

		for passenger in self.passengers:
			file.write('passenger_at('+passenger+','+self.pickupLocations[passenger]+',0).\n')
			file.write(':- not passenger_at('+passenger+','+self.dropoffLocations[passenger]+',n).\n')

			for fluent in self.fluents:
				file.write('-'+fluent+'('+passenger+',0).\n')
 
		file.close()

		time.sleep(1)
		
		n=5 
		actions={}
		while True:
		
			cmd=['clingo','/tmp/domainVCA/problem.asp','/tmp/domainVCA/facts.asp','/tmp/domainVCA/actions.asp','/tmp/domainVCA/ride.asp','-c','n='+str(n)]
			p = subprocess.Popen(cmd,stdout=subprocess.PIPE)
			out, err = p.communicate()


			if 'UNSATISFIABLE\n' not in out:
				#print out.split('\n')[4].split(' ')
				for action in out.split('\n')[4].split(' '):
					actions[int(action.split(')')[0].split(',')[-1])]= action
					
				#print n
				print actions
				subprocess.check_output('rm -rf /tmp/domainVCA/', shell=True)

				break
			n+=1	

		#create facts


def main():

	VCA()


if __name__ == '__main__':
	main()
