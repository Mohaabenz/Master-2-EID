#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Sep 20 08:51:02 2019

@author: mohben
"""

import numpy as np


def haar_1d_directe(n,u):
    v = np.copy(u)
    s = (2.0)
    w = np.zeros((n))
    m = n

    while 1 < m :
        m = (m//2)
        w[0:m] = (v[0:2*m-1:2] + v[1:2*m:2]) / s
        print(v)
        print(w)
        w[m:2*m] = (v[0:2*m-1:2] - v[1:2*m:2]) / s
        print(w)
        v[0:2*m] = w[0:2*m]
        print(v)
        print("\n")
    return v

print("EXERCICE 1\n")

tab = (np.array([1,2,3,4,5,6,7,8],float))

haar = haar_1d_directe(8,tab)
print(haar)
print("\n\n")


def haar_1d_inverse(n,u):
    v = np.copy(u)
    w = np.zeros((n))
    m = 1
    while (m*2 <= n):
        w[0:2*m-1:2] = v[0:m] + v[m:2*m]
        print(v)
        print(w)
        w[1:2*m:2]  = v[0:m] - v[m:2*m]
        print(w)
        v[0:2*m] = w[0:2*m]
        print(v,'\n')
        m=2*m
        
    return v

print("EXERCICE 2\n")

haari = haar_1d_inverse(8,haar)
print(haari)

print("\n\n")

#
#def ex1(n):
#    y = np.zeros((n))
#    for i in range(n):
#        y[i] = i+1
#    #print(y)
#    return y
#
#def ex3(n):
#    x = np.zeros((n))
#    for i in range(int(n/2)):
#        x[i] = np.sin((2*np.pi)*i)
#    for i in range(int((n/2)+1),n) :
#        x[i] = 1/2 + np.sin((2*np.pi)*i) 
#    #print(x)
#    return x
#
#def ex1_ex3(a,b):
#    x = np.zeros(len(a))
#    x = a - b
#    return x
#
#
#print("EXERCICE 3\n")
#
#sous = ex1_ex3(ex1(8),ex3(8))
#
#print(sous)
#print("\n\n")
#
#x = haar_1d_inverse(8,haar_1d_directe(8,sous))
#print(x)
#
#print("\nEXERCICE 4\n")
#
#def haar_1d_directefor(n,u):
#    v = np.copy(u)
#    s = (2.0)
#    w = np.zeros((n))
#    m = n
#
#    while 1 < m :
#        for i in range (int(m/2)):
#            w[i] = (v[2*i] + v[2*i + 1])/s
#            #print(w)
#            w[i + int(m/2)] = (v[2*i] - v[2*i + 1])/s
#            #print(w)
#        for i in range (m):
#            v[i] = w[i]
#            #print(v)
#        m = int(m/2)
#        #print("\n")
#    return v
#
#
#def haar_1d_inversefor(n,u):
#    v = np.copy(u)
#    w = np.zeros((n))
#    m = 1
#    while m < n :
#        for i in range (m):
#            w[2*i] = v[i] + v[i + m]
#            #print(w)
#            w[2*i + 1] = v[i] - v[i + m]
#            #print(w)
#        for i in range (2*m):
#            v[i] = w[i]
#            #print(v)
#        m=2*m
#    return v
#
#tab2 = (np.array([1,2,3,4,5,6,7,8],float))
#
#haarfor = haar_1d_directefor(8,tab2)
#print(haarfor)
#haarifor = haar_1d_inversefor(8,haarfor)
#print(haarifor)
#
#print("\nEXERCICE 5 et 6\n")
#
#def seuillage(x,T):
#    y = np.copy(x)
#    for i in range((len(y))):
#        if (np.absolute(y[i]) <= T):
#            y[i] = 0
#    return y
#
#
#taille = 32
#x = haar_1d_directe(taille,ex1_ex3(ex1(taille),ex3(taille)))
#print(x)
#print("\n")
#
#y128 = seuillage(x,128)
#print(y128)
#print("\n")
#
#y12 = seuillage(x,12)
#print(y12)
#
#print("\nEXERCICE 7\n")
#
#def erreur(a,b):
#    n = len(a)
#    s = 0
#    for i in range(n):
#        s = s + np.square(np.absolute(a[i]-b[i]))
#    s = np.sqrt(s)
#    return s
#
#t128 = erreur(x,haar_1d_inverse(taille,seuillage(x,128)))
#print(t128)
#print("\n")
#
#t12 = erreur(x,haar_1d_inverse(taille,seuillage(x,12)))
#print(t12)
#
#print("\nEXERCICE 8\n")
#
#def ex8(n):
#    for i in range(n):
#        print(i+1)
#        print(erreur(x,haar_1d_inverse(taille,seuillage(x,i+1))))
#
#
#ex8(8)
#
#
#
#
#
