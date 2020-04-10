#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Oct  4 09:28:52 2019

@author: mohben
"""


import numpy as np
import matplotlib.pyplot as plt
import math
from PIL import Image


def downsizingQNL(v):
    m = (len(v)//2)
    w = np.zeros((m))
    w[0:m] = (v[0:2*m-1:2] + v[1:2*m:2]) / 2
    return w

def upsizingQNL(v,w2):
    m = len(v)//2
    n = 2*m
    g = np.zeros((m))
    c = np.zeros((m))
    d = np.zeros((m))
    w3 = np.concatenate((w2,w2))
    if m > 1 :
        g[0:m] = np.abs(w3[(m-2)%n:(n-2)%n]-w3[(m-1)%n:(n-1)%n]) + np.abs(w3[(m-1)%n:(n-1)%n]-w3[m:n])
        c[0:m] = np.abs(w3[(m-1)%n:(n-1)%n]-w3[m:n]) + np.abs(w3[0:m]-w3[1:m+1])
        d[0:m] = np.abs(w3[0:m]-w3[1:m+1])+np.abs(w3[1:m+1]-w3[2:m+2])
    w = np.zeros((m))
    for i in range(m) :
        if g[i] < c[i] and g[i] < d[i]:
            w[i] = (w2[i]*(5/8)) + (w2[(i-1)%m]/2) -(w2[(i-2)%m]/8)
        elif d[i] < c[i] and d[i] < g[i]:
            w[i] = (w2[i]*(11/8)) - (w2[(i+1)%m]/2) + (w2[(i+2)%m]/8)
        else:
            w[i] = w2[i] - (w2[(i-1)%m] - w2[(i+1)%m])/8
    w4 = np.zeros((m))
    w4[0:m] = v[0:n:2] - w[0:m]
    return w4


def QNLHaar_1d_directe(x):
    n = len(x)
    v = np.copy(x)
    m = n
    res = np.zeros((0))
    while 1 < m :
      m = (m//2)
      w = downsizingQNL(v)
      w2 = upsizingQNL(v,w)
      res = np.concatenate((w2,res))
      v = np.copy(w)
    res = np.concatenate((v,res))
    return res

print("EXERCICE 1 direct\n")

tab = (np.array([1,2,3,4,5,6,7,8],float))

haar = QNLHaar_1d_directe(tab)
print(haar)
print("\n\n")


def QNLHaar_1d_inverse(x):
    n=1
    i=1
    v = np.copy([x[0]]) 
    while n <= len(x)/2:
        m = 2*n
        w = np.zeros((n))
        w2 = np.concatenate((v,v))
        w3 = np.zeros((m))
        g = np.zeros((n)) 
        c = np.zeros((n)) 
        d = np.zeros((n))
        if n > 1 :
            g[0:n] = np.abs(w2[(n-2)%m:(m-2)%m]-w2[(n-1)%m:(m-1)%m]) + np.abs(w2[(n-1)%m:(m-1)%m]-w2[0:n])
            c[0:n] = np.abs(w2[(n-1)%m:(m-1)%m]-w2[0:n]) + np.abs(w2[0:n]-w2[1:n+1])
            d[0:n] = np.abs(w2[0:n]-w2[1:n+1])+np.abs(w2[1:n+1]-w2[2:n+2])
        for i in range(n):
            if g[i] < c[i] and g[i] < d[i]:
                w[i] = (v[i]*(5/8)) + (v[(i-1)%n]/2) -(v[(i-2)%n]/8)
            elif d[i] < c[i] and d[i] < g[i]:
                w[i] = (v[i]*(11/8)) - (v[(i+1)%n]/2) + (v[(i+2)%n]/8)
            else : 
                w[i] = v[i] - (v[(i-1)%n] - v[(i+1)%n])/8
        w3[0:m-1:2] = w[0:n] + x[n:m]
        w3[1:m:2] = 2*v[0:n]-w3[0:m-1:2]
        res=np.zeros((m))
        for i in range(n):
            res[0:m-1:2] = w3[0:m-1:2]
            res[1:m:2] = w3[1:m:2]
        i=i+n
        v = np.copy(res)
        n = len(res)
    return res

print("EXERCICE 1 inverse\n")
haari = QNLHaar_1d_inverse(haar)
print(haari)





image = Image.open('image_test').convert('L')
image1 = np.array(image,float)
image2 = np.resize(image1,(16,16))
print(image2,'\n')


def transforme_2D_direct(A, Lmin):
    N = len(A)
    work = np.zeros((N,N))
    Lmax = int(math.log2(N))
    for l in range(Lmax,Lmin,-1):
        print('l=',l)
        for i in range(N):
            work[i,:] = QNLHaar_1d_directe(A[i,:])
        A = np.copy(work)
        for j  in range(N):
            work[:,j] = QNLHaar_1d_directe(A[:,j])
        A = np.copy(work)
        print(N)        
        N = N//2
    return A
   


t1 = transforme_2D_direct(image2,1)
print(t1,'\n')

def transforme_2D_inverse(A, Lmin):
    N = len(A)
    n = (2**Lmin)
    work = np.zeros((N,N))
    Lmax = int(math.log2(N))
    for l in range(Lmin,Lmax+1):
        print('l=',l)
        for j in range(n):
            work[:,j] = QNLHaar_1d_inverse(A[:,j])
        A = np.copy(work)
        for i in range(n-1):
            work[i,:] = QNLHaar_1d_inverse(A[i,:])
        A = np.copy(work)
        print(n)
        n = n*2
    return A

t2 = transforme_2D_inverse(t1,2)
print(t2)



