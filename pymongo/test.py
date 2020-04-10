import re
import pandas as pd
import numpy as np



a = re.match("((([0-2][0-9]|3[0-1])(-|/)((0[0-9]|1[0-2])|[a-zA-Z]+)(-|/)[0-9]{4})|([0-9]{4}(-|/)(0[0-9]|1[0-2])(-|/)([0-2][0-9]|3[0-1])))$","24-02-1960")
print(a)

# init =[[1,0.1,0.01,0.001,0.0001,0.00001],
#        [10,1,0.1,0.01,0.001,0.0001],
#        [100,10,1,0.1,0.01,0.001],
#        [1000,100,10,1,0.1,0.01],
#        [10000,1000,100,10,1,0.1],
#        [100000,10000,1000,100,10,1],
#        ["KX","HX","DAX","DX","CX","MX"]]
#
# table_C = pd.DataFrame(init,columns=["KILOGRAMMES","HECTOGRAMMES","DECAGRAMMES","DECIGRAMMES","CENTIGRAMMES","MILLIGRAMMES"],index=["KILOGRAMMES","HECTOGRAMMES","DECAGRAMMES","DECIGRAMMES","CENTIGRAMMES","MILLIGRAMMES","NAME"])
# table_C = table_C.replace('X','G',regex=True)
#
# print(table_C)
#
# table_C = pd.DataFrame(init,columns=["KILOLITRES","HECTOLITRES","DECALITRES","DECILITRES","CENTILITRES","MILLILITRES"],index=["KILOLITRES","HECTOLITRES","DECALITRES","DECILITRES","CENTILITRES","MILLILITRES","NAME"])
# table_C = table_C.replace('X','L',regex=True)
#
#
#
# print(table_C)
#
#
# table_C = pd.DataFrame(init,columns=["KILOMETRES","HECTOMETRES","DECAMETRES","DECIMETRES","CENTIMETRES","MILLIMETRES"],index=["KILOMETRES","HECTOMETRES","DECAMETRES","DECIMETRES","CENTIMETRES","MILLIMETRES","NAME"])
# table_C = table_C.replace('X','M',regex=True)
#
# print(table_C)


# def ftc(chaine) :
#     test = 0
#     x = chaine.replace(",",".")
#     x = x.replace(" ", "")
#     if '°CELCIUS' in chaine :
#         x = x.split("°CELCIUS")[0]
#         return str(x) + '°C'
#     if 'CELCIUS' in chaine :
#         x = x.split("CELCIUS")[0]
#         return str(x) + '°C'
#     if '°F' in chaine :
#         x = x.split("°F")[0]
#         test=1
#     if 'FAHRENHEIT' in chaine :
#         x = x.split("FAHRENHEIT")[0]
#         test = 1
#     if test == 1:
#         x = (float(x) - 32) * 5/9
#         return str(round(x,3)) + '°C'
#     else:
#         return str(chaine)
