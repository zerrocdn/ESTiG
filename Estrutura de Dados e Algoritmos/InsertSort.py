import datetime

dt = datetime.datetime.now()
print(dt)
def insertionsort(A):
	for j in xrange(1, len(A)):
		key = A[j]
		i = j - 1
		while i > -1 and A[i] > key:
			A[i-1] = A[i]
			i = i - 1
		A[i + 1] = key
A = [5, 2, 4, 6, 1, 3]

insertionsort(A)

for x in A:
	print x 

dte = datetime.datetime.now()
print(dte)
print(dte - dt)