import numpy as np
import math
import copy

def Householder_explicit(M):
    A = copy.deepcopy(M)
    print "Dit is de matrix waar we van vertrekken."
    print A
    print "-----------------------------------------"
    n = int(A.shape[0])
    m = int(A.shape[1])

    for k in range(0,n):
        x = A[k:m,k]
        s = np.sign(x[0])
        x_2norm = np.linalg.norm(x)
        e_k = np.zeros(m-k-1)
        e_k[0] = 1.0
        v = s*x_2norm*e_k + x
        #v = x_2norm*e_k - x
        v_normal = v/np.linalg.norm(v)
        print "Dit is de x-vector."
        print x
        print "Dit is de 2-norm van de x-vector."
        print x_2norm
        print "Dit is de ek-vector."
        print e_k
        print "Dit is de v-vector."
        print v
        print "Dit is de genormaliseerde v-vector."
        print v_normal
        print "Op dit deel van de matrix gaan we werken"
        print A[k:m,k:n]
        A[k:m,k:n] = A[k:m,k:n] - 2*v_normal*(v_normal.conj().T*A[k:m,k:n])
        print "Dit is de resulterende matrix"
        print A
        print "--------------------------------------"
    return A




a = np.array([[1, 2],[3, 4]])

print a

b = np.array([[5, 4],[6, 5]])

print b

c = a*b

print c

v = np.matrix([[6], [5]])

print v

w = a*v

print w

m = np.array([[7.0,  4.1,  3.8,  5.90],
              [8.0, -6.33, 6.0, -9.99],
              [1.0,  2.55, 3.9, -4.75]])

print m
print m.ndim
print m.shape
