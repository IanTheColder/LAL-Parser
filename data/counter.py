with open('ptb_train_3.3.0.sd.clean','r') as f:
	counter = 0
	for line in f:
		if line.split()==[]:
			continue
		if line.split()[0]=='1':
			counter+=1
print(counter)
