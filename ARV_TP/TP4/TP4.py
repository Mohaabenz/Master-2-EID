#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Oct 11 09:40:02 2019

@author: mohben
"""
from scipy.ndimage import gaussian_filter
import numpy as np
import math
from PIL import Image
from matplotlib import pyplot as plt
import random


def haar_1d_directe(u):
    v = np.copy(u)
    s = (2.0)
    m = len(u)
    w = np.zeros((m))
    while 1 < m :
        m = (m//2)
        w[0:m] = (v[0:2*m-1:2] + v[1:2*m:2]) / s
        w[m:2*m] = (v[0:2*m-1:2] - v[1:2*m:2]) / s
        v[0:2*m] = w[0:2*m]
    return v

def haar_1d_inverse(u):
    v = np.copy(u)
    n = len(u)
    w = np.zeros((n))
    m = 1
    while (m*2 <= n):
        w[0:2*m-1:2] = v[0:m] + v[m:2*m]
        w[1:2*m:2]  = v[0:m] - v[m:2*m]
        v[0:2*m] = w[0:2*m]
        m=2*m        
    return v

tab = (np.array([126,126,126,126,127,126,124,124,120,121,118,113,110,112,118,123] ,float))
print(haar_1d_inverse(haar_1d_directe(tab)),'\n')

image = Image.open('lena.png').convert('L')
image1 = np.array(image,float)
image2 = np.resize(image1,(512,512))
print(image2,'\n')
plt.imshow(image2, interpolation='nearest')
plt.show()

def transforme_2D_direct(A, Lmin):
    N = len(A)
    work = np.zeros((N,N))
    Lmax = int(math.log2(N))
    for l in range(Lmax,Lmin,-1):
        for i in range(N):
            work[i,:] = haar_1d_directe(A[i,:])
        A = np.copy(work)
        for j  in range(N):
            work[:,j] = haar_1d_directe(A[:,j])
        A = np.copy(work)
        N = N//2
    return A
   
#print('Direct(Image)\n')
#t1 = transforme_2D_direct(image2,1)
#print(t1,'\n')
#plt.imshow(t1, interpolation='nearest')
#plt.show()

def transforme_2D_inverse(A, Lmin):
    N = len(A)
    n = (2**Lmin)
    work = np.copy(A)
    Lmax = int(math.log2(N))
    for l in range(Lmin,Lmax+1):
        for j in range(n):
            work[:,j] = haar_1d_inverse(A[:,j])
        A = np.copy(work)
        for i in range(n):
            work[i,:] = haar_1d_inverse(A[i,:])
        A = np.copy(work)
        n = n*2
    return A

#print('Inverse(Image)\n')
#t2 = transforme_2D_inverse(t1,2)
#print(t2)
#plt.imshow(t2, interpolation='nearest')
#plt.show()


def seuillage(x,sigma):
    N = len(x)
    s = (((np.sqrt(math.log2(N))))*sigma)
    print('SEUIL',s)
    work = np.copy(x)
    for i in range(N):
        for j in range(N):
            if np.abs(x[i][j]) <= s:
                work[i][j] = 0
    return work

#bruit = gaussian_filter(image2, sigma=2.5)

def bruitage(x, sigma):
    N = len(x)
    work = np.copy(x)
    for i in range(N):
        for j in range(N):
            work[i][j] = random.gauss(0,sigma) + work[i][j]
            if work[i][j]>255:
                work[i][j]=255
            elif work[i][j]<0:
                work[i][j]=0
    return work


print('BRUITAAAAAAAA')
bruit = bruitage(image2, 5)
bruit = np.array(bruit,float)
print(bruit, '\n')
plt.imshow(bruit)
plt.show()

bruit2 = transforme_2D_direct(bruit,1)
print(bruit2,'\n')
plt.imshow(bruit2)
plt.show()

print('Seuillage(Transformer(Image+Bruit))\n')

t3 = seuillage(bruit2,0.5)
print('SEUILLAGE\n',t3)
plt.imshow(t3)
plt.show()


t4 = transforme_2D_inverse(t3,2)
print(t4)
plt.imshow(t4)
plt.show()

def erreur(a,b):
    n = len(a)
    s = 0
    for i in range(n):
        for j in range(n):
            s = s + np.square(np.absolute(a[i][j]-b[i][j]))
    s = np.sqrt(s)
    return s/(n*n)

er = erreur(image2, bruit)
print(er)
er1 = erreur(image2, t4)
print(er1)


#print('*******************************Exercice 6*******************************')
#
#def quadHaar_1d_directe(x):
#    n = len(x)
#    v = np.copy(x)
#    res = np.zeros((n))
#    m = n
#    while 1 < m :
#      m = (m//2)
#      w = np.zeros((m))
#      w[0:m] = (v[0:2*m-1:2] + v[1:2*m:2]) / 2
#      w2 = np.copy(w)
#      if m == 1:
#        w[0] = w[0] - v[0]
#        res[m:m*2] = w[0:m]
#      else :
#        w[1:m-1] = (w2[1:m-1] - (w2[0:m-2] - w2[2:m])/8)
#        w[0] = (w2[0] - (w2[m-1] - w2[1])/8) 
#        w[m-1] = (w2[m-1] - (w2[m-2] - w2[0])/8) 
#        w[0:m] = w[0:m] - v[0:m*2:2]
#        res[m:m*2] = w[0:m]
#        v = np.copy(w2)
#    res[0] = w2[0] 
#    return res
#
#def quadHaar_1d_inverse(x):
#    n = 1
#    i = 1
#    v = np.copy([x[0]]) 
#    while(n <= len(x)/2):
#        w = np.zeros((n))        
#        w2 = np.zeros((n))
#        res = np.zeros((n))
#        if n == 1 :
#            w[0] = v[0]
#        else :             
#            w[1:n-1] = v[1:n-1] - (v[0:n-2] - v[2:n])/8
#            w[0] = v[0] - (v[(n-1)] - v[1])/8
#            w[n-1] = (v[n-1] - (v[(n-2)] - v[0])/8)  
#        res[0:n] = w[0:n] - x[i:i+n]
#        w2[0:n] = 2*v[0:n]-res[0:n]
#        res = fusion_alt(res,w2)
#        i = i + n
#        v = np.copy(res)
#        n = len(res)
#    return res
#
#def fusion_alt(v1,v2):
#    n = len(v1)
#    w = np.zeros((2*n))
#    for i in range(n):
#        w[0:2*n-1:2] = v1[0:n]
#        w[1:2*n:2] = v2[0:n]
#    return w
#
#
#
#
#
#def transforme_2D_Qdirect(A, Lmin):
#    N = len(A)
#    work = np.zeros((N,N))
#    Lmax = int(math.log2(N))
#    for l in range(Lmax,Lmin,-1):
#        for i in range(N):
#            work[i,:] = quadHaar_1d_directe(A[i,:])
#        A = np.copy(work)
#        for j  in range(N):
#            work[:,j] = quadHaar_1d_directe(A[:,j])
#        A = np.copy(work)
#        N = N//2
#    return A
#   
#def transforme_2D_Qinverse(A, Lmin):
#    N = len(A)
#    n = (2**Lmin)
#    work = np.copy(A)
#    Lmax = int(math.log2(N))
#    for l in range(Lmin,Lmax+1):
#        for j in range(n):
#            work[:,j] = quadHaar_1d_inverse(A[:,j])
#        A = np.copy(work)
#        for i in range(n):
#            work[i,:] = quadHaar_1d_inverse(A[i,:])
#        A = np.copy(work)
#        n = n*2
#    return A
#
#
#
#print('QuadDirect(Image)\n')
#q1 = transforme_2D_direct(image2,1)
#print(q1,'\n')
#plt.imshow(q1, interpolation='nearest')
#plt.show()
#
#
#print('QuadInverse(Image)\n')
#q2 = transforme_2D_inverse(q1,2)
#print(q2)
#plt.imshow(q2, interpolation='nearest')
#plt.show()
#
#
#
#bruit3 = transforme_2D_Qdirect(bruit,1)
#print(bruit2,'\n')
#plt.imshow(bruit2, interpolation='nearest')
#plt.show()
#
#print('Seuillage(Transformer(Image+Bruit))\n')
#
#q3 = seuillage(bruit3)
#print('SEUILLAGE\n',q3)
#plt.imshow(q3, interpolation='nearest')
#plt.show()
#
#
#q4 = transforme_2D_inverse(q3,2)
#print(q4)
#plt.imshow(q4, interpolation='nearest')
#plt.show()
#
#
#
#
#
#
#
