#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Oct 28 10:44:34 2019

@author: mohben
"""
import numpy as np

def haar_2D_directnon(x):
    n= len(x)
    v = np.copy(x)
    w = np.zeros((n,n))
    m = n
    while (0 < m):
        m = m//2
        for i in range(m):
            for j in range(m):
                w[i,j]    = (v[2*i,2*j] + v[2*i-1,2*j] + v[2*i,2*j-1] + v[2*i-1,2*j-1]) / 4.
                w[i,j+m]  = v[2*i-1,2*j] - w[i,j]
                w[i+m,j]  = v[2*i,2*j-1] - w[i,j]
                w[i+m,j+m] = v[2*i,2*j] - w[i,j]
        for i in range(2*m):
            for j in range(2*m):
                v[i,j] = w[i,j]        
    return v

def haar_2D_inversenon(x):
    n= len(x)
    v = np.copy(x)
    w = np.zeros((n,n))
    m = 1
    while (m*2 <= n):
        for i in range(m):
            for j in range(m):
                w[2*i,2*j-1] = v[i+m,j] + v[i,j]
                w[2*i-1,2*j] = v[i,j+m] + v[i,j]
                w[2*i,2*j] = v[i+m,j+m] + v[i,j]          
                w[2*i-1,2*j-1] = 4. * v[i,j] - (w[2*i-1,2*j] + w[2*i,2*j-1] + w[2*i,2*j])
        for i in range(2*m):
            for j in range(2*m):
                v[i,j] = w[i,j]
        m = 2*m
    return v

tab = (np.array([[1,2,3,4,5,6,7,8],
                 [1,2,3,4,5,6,7,8],
                 [1,2,3,4,5,6,7,8],
                 [1,2,3,4,5,6,7,8],
                 [1,2,3,4,5,6,7,8],
                 [1,2,3,4,5,6,7,8],
                 [1,2,3,4,5,6,7,8],
                 [1,2,3,4,5,6,7,8]],float))

haar = haar_2D_directnon(tab)
haari = haar_2D_inversenon(haar)
print(haari)
