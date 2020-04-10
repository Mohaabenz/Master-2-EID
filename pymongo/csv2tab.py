import csv
import re
import numpy as np
import pymongo
import pprint as pp
from pymongo import MongoClient
import pandas as pd
from collections import Counter
import time
import distance
import soundex



#####   Connection vers la base MongoDB  #####
def connection_db(client,port):
    Client = MongoClient(client,port)
    db = Client.csv2tab
    db_names = db.list_collection_names()
    return Client,db,db_names

Client,db,db_names = connection_db('localhost',27017)

#####   Recupere les table des regex et dictionnaire dans des DataFrames   ######
def create_regex(db):
    SYNTACTYPE = pd.DataFrame(list(db.SYNTACTYPE.find()))
    Tab_NUM = pd.DataFrame(list(db.Tab_NUM.find()))
    Tab_AlphaNum = pd.DataFrame(list(db.Tab_AlphaNum.find()))
    Tab_DATE = pd.DataFrame(list(db.Tab_DATE.find()))
    DDVS = pd.DataFrame(list(db.DDVS.find()))
    DDVS2 = pd.DataFrame(list(db.DDVS2.find()))
    Tab_STRING = pd.DataFrame(list(db.Tab_STRING.find()))
    return SYNTACTYPE,Tab_NUM,Tab_AlphaNum,Tab_DATE,DDVS,DDVS2,Tab_STRING

SYNTACTYPE,Tab_NUM,Tab_AlphaNum,Tab_DATE,DDVS,DDVS2,Tab_STRING = create_regex(db)

#####   Recupere csv à partir du path et delimiter ######
def open_csv(path,delim):
    n = 0
    for i in path:
        if n == 0: # Si un seul csv
            table = pd.read_csv(i,delim,header=None)
        else: # si Plusieurs
            table2 = pd.read_csv(i,delim,header=None)
            table = pd.concat([table,table2])
        n = 1
    names_columns = []
    nbline,nbcol = table.shape # nombre de ligne et colonnes
    for i in range(1,nbcol+1):
        col = "COL"+str(i)
        names_columns.append(col)
    table = pd.DataFrame(data=table.values,columns=names_columns)
    return table,names_columns,nbcol,nbline

####    Retourne CATEGORY ou SEMANTIQUE... Maximum ####
def max_cat(liste):
    occurence_count = Counter(liste)
    maxi = occurence_count.most_common(1)[0][0]
    return str(maxi)

####  Convertie FAHRENHEIT en CELCIUS ####
def ftc(chaine) :
    test = 0
    x = chaine.replace(",",".")
    x = x.replace(" ", "")
    if '°CELCIUS' in chaine :
        x = x.split("°CELCIUS")[0]
        return str(x) + '°C'
    if 'CELCIUS' in chaine :
        x = x.split("CELCIUS")[0]
        return str(x) + '°C'
    if '°F' in chaine :
        x = x.split("°F")[0]
        test=1
    if 'FAHRENHEIT' in chaine :
        x = x.split("FAHRENHEIT")[0]
        test = 1
    if test == 1:
        x = (float(x) - 32) * 5/9
        return str(round(x,3)) + '°C'
    else:
        return str(chaine)


##### Homogeinisation des dates en DD/MM/YYYY #####
def homo_date(chaine) :
    x = chaine.replace("-","/")
    x = x.upper()

    x = x.replace("LUNDI","")
    x = x.replace("MARDI","")
    x = x.replace("MERCREDI","")
    x = x.replace("JEUDI","")
    x = x.replace("VENDREDI","")
    x = x.replace("SAMEDI","")
    x = x.replace("DIMANCHE","")
    x = x.replace("MONDAY","")
    x = x.replace("TUESDAY","")
    x = x.replace("WEDNESDAY","")
    x = x.replace("THURSDAY","")
    x = x.replace("FRIDAY","")
    x = x.replace("SATURDAY","")
    x = x.replace("SUNDAY","")

    if ("JANVIER" in x ) or ("JANUARY" in x ) or ("/JANV/" in x ) or ("/JAN/" in x ) :
        x = x.replace("JANVIER","01")
        x = x.replace("JANUARY","01")
        x = x.replace("/JANV/","/01/")
        x = x.replace("/JAN/","/01/")
        return x

    if ("FEVRIER" in x ) or ("FÉVRIER" in x ) or ("FEBRUARY" in x ) or ("/FÉV/" in x ) or ("/FEV/" in x ) or ("/FEB/" in x ):
        x = x.replace("FEVRIER","02")
        x = x.replace("FÉVRIER","02")
        x = x.replace("FEBRUARY","02")
        x = x.replace("/FÉV/","/02/")
        x = x.replace("/FEV/","/02/")
        x = x.replace("/FEB/","/02/")
        return x

    if ("MARS" in x ) or ("MARCH" in x ) or ("/MAR/" in x ):
        x = x.replace("MARS","03")
        x = x.replace("MARCH","03")
        x = x.replace("/MAR/","/03/")
        return x

    if ("AVRIL" in x ) or ("APRIL" in x ) or ("/AVR/" in x ) or ("/APR/" in x ):
        x = x.replace("AVRIL","04")
        x = x.replace("APRIL","04")
        x = x.replace("/AVR/","/04/")
        x = x.replace("/APR/","/04/")
        return x

    if ("/MAI/" in x ) or ("/MAY/" in x ):
        x = x.replace("/MAI/","/05/")
        x = x.replace("/MAY/","/05/")
        return x

    if ("JUIN" in x ) or ("JUNE" in x ) :
        x = x.replace("JUIN","06")
        x = x.replace("JUNE","06")
        return x

    if ("JUILLET" in x ) or ("JULY" in x ) :
        x = x.replace("JUILLET","07")
        x = x.replace("JULY","07")
        return x

    if ("AOÛT" in x ) or ("AUGUST" in x ) :
        x = x.replace("AOÛT","08")
        x = x.replace("AUGUST","08")
        return x

    if ("SEPTEMBRE" in x ) or ("SEPTEMBER" in x ) or ("/SEPT/" in x ):
        x = x.replace("SEPTEMBRE","09")
        x = x.replace("SEPTEMBER","09")
        x = x.replace("/SEPT/","/09/")
        return x

    if ("OCTOBRE" in x ) or ("OCTOBER" in x ) or ("/OCT/" in x ):
        x = x.replace("OCTOBRE","10")
        x = x.replace("OCTOBER","10")
        x = x.replace("/OCT/","/10/")
        return x

    if ("NOVEMBRE" in x ) or ("NOVEMBER" in x ) or ("/NOV/" in x ):
        x = x.replace("NOVEMBRE","11")
        x = x.replace("NOVEMBER","11")
        x = x.replace("/NOV/","/11/")
        return x

    if ("DECEMBRE" in x ) or ("DÉCEMBRE" in x ) or ("DECEMBER" in x ) or ("/DEC/" in x ) or ("/DÉC/" in x ):
        x = x.replace("DECEMBRE","12")
        x = x.replace("DÉCEMBRE","12")
        x = x.replace("DECEMBER","12")
        x = x.replace("/DEC/","/12/")
        x = x.replace("/DÉC/","/12/")
        return x

    return x

##### Homogeinisation des mesures #####
def homo_mesure(chaine,subsem,MAX_SS,MAX_S) :
    x = chaine.replace(",",".")
    x = x.replace(" ", "")
    x = x.replace(str(subsem).split()[0][0].upper(),"")
    init =[[1, 0.1,0.01,0.001,0.0001,0.00001,0.000001],
           [0.1, 1, 10, 100, 1000, 10000, 100000],
           [0.01, 0.1, 1, 10, 100, 1000, 10000],
           [0.001, 0.01, 0.1, 1, 10, 100, 1000],
           [0.0001, 0.001, 0.01, 0.1, 1, 10, 100,],
           [0.00001, 0.0001, 0.001, 0.01, 0.1, 1, 10],
           [0.000001, 0.00001, 0.0001, 0.001, 0.01, 0.1, 1],
           ["KX","HX","DAX","X","DX","CX","MX"]]
    if MAX_S == 'POIDS' :
        x = x.replace("G","")
        table_C = pd.DataFrame(init,columns=["KILOGRAMMES","HECTOGRAMMES","DECAGRAMMES","GRAMMES","DECIGRAMMES","CENTIGRAMMES","MILLIGRAMMES"],index=["KILOGRAMMES","HECTOGRAMMES","DECAGRAMMES","GRAMMES","DECIGRAMMES","CENTIGRAMMES","MILLIGRAMMES","NAME"])
        table_C = table_C.replace('X','G',regex=True)
        x = float(x) * table_C.loc[str(subsem),str(MAX_SS)]
        # print(x)
        return str(round(x,3)) +' '+ table_C.loc["NAME",str(MAX_SS)]
    if MAX_S == 'LITRE' :
        x = x.replace("L","")
        table_C = pd.DataFrame(init,columns=["KILOLITRES","HECTOLITRES","DECALITRES","LITRES","DECILITRES","CENTILITRES","MILLILITRES"],index=["KILOLITRES","HECTOLITRES","DECALITRES","LITRES","DECILITRES","CENTILITRES","MILLILITRES","NAME"])
        table_C = table_C.replace('X','L',regex=True)
        x = float(x) * table_C.loc[str(subsem),str(MAX_SS)]
        # print(x)
        return str(round(x,3)) +' '+ table_C.loc["NAME",str(MAX_SS)]
    if MAX_S == 'MESURE' :
        x = x.replace("M","")
        table_C = pd.DataFrame(init,columns=["KILOMETRES","HECTOMETRES","DECAMETRES","METRES","DECIMETRES","CENTIMETRES","MILLIMETRES"],index=["KILOMETRES","HECTOMETRES","DECAMETRES","METRES","DECIMETRES","CENTIMETRES","MILLIMETRES","NAME"])
        table_C = table_C.replace('X','M',regex=True)
        x = float(x) * table_C.loc[str(subsem),str(MAX_SS)]
        # print(x)
        return str(round(x,3)) +' '+ table_C.loc["NAME",str(MAX_SS)]
    else:
        return str(chaine)

#### Detecte la CATEGORY et la SUBCATEGORY #####
def CAT_TYPE_value(val, TYPE):
    cat = ''
    subcat = ''
    TYPE = TYPE.copy()
    for (i,c,sc) in zip(TYPE["REGULAREXPR"],TYPE["CATEGORY"],TYPE["SUBCATEGORY"]):
        if re.match(i,val) :
            return str(c),str(sc)
    return 'UNDEFINED','UNDEFINED'

#### Detecte la SEMANTIQUE et la SUBSEMANTIQUE ####
def SEM_TYPE_value(val, TYPE):
    sem = ''
    subsem = ''
    TYPE = TYPE.copy()
    for (i,c,sc) in zip(TYPE["REGULAREXPR"],TYPE["SEMANTIQUE"],TYPE["SUBSEMANTIQUE"]):
        if re.match(i,val) :
            if sem == '':
                sem = c
            else:
                sem = sem + ';' + c
            if subsem == '':
                subsem = sc
            else:
                subsem = subsem + ';' + sc
    return str(sem),str(subsem)

#### Detecte si la valeur est dans le Dictionnaire DDVS ####
def DDVS_value(val, TYPE):
    sem = ''
    subsem = ''
    TYPE = TYPE.copy()
    for (e,f,c) in zip(TYPE["ENGLISH"],TYPE["FRENCH"],TYPE["CATEGORY"]):
        if re.match(e,val) or re.match(f,val):
            if sem == '':
                sem = c
            else:
                sem = sem + ';' + c
            if re.match(f,val):
                if subsem == '':
                    subsem = sem + '_FR'
                else:
                    subsem = subsem + ';' + sem + '_FR'
            if re.match(e,val):
                if subsem == '':
                    subsem = sem + '_AM'
                else:
                    subsem = subsem + ';' + sem + '_AM'
    if sem == '':
        sem,subsem = 'UNDEFINED','UNDEFINED'
    return str(sem),str(subsem)

#### Detecte si la valeur est dans le Dictionnaire DDVS2 ####
def DDVS2_value(val, TYPE):
    sem = ''
    subsem = ''
    TYPE = TYPE.copy()
    for (e,f,c) in zip(TYPE["ENGLISH"],TYPE["FRENCH"],TYPE["CATEGORY"]):
        if re.match(e,val) or re.match(f,val):
            if sem == '':
                sem = c
            else:
                sem = sem + ';' + c
            if re.match(f,val):
                if subsem == '':
                    subsem = sem
                else:
                    subsem = subsem + ';' + sem
            if re.match(e,val):
                if subsem == '':
                    subsem = sem
                else:
                    subsem = subsem + ';' + sem
    if sem == '':
        sem,subsem = 'UNDEFINED','UNDEFINED'
    return str(sem),str(subsem)

###### Appel des fonction de detection ####
def CAT_SEM_Syntax(val):
    cat,subcat,sem,subsem = '','','',''
    cat,subcat = CAT_TYPE_value(val, SYNTACTYPE)
    if subcat == 'ALPHABETIQUE':
        sem,subsem = SEM_TYPE_value(val,Tab_STRING)
        if sem == '':
            sem,subsem = DDVS_value(val,DDVS)
    elif subcat == 'DATE':
        sem,subsem = SEM_TYPE_value(val,Tab_DATE)
    elif subcat == 'ALPHANUMERIQUE':
        sem,subsem = SEM_TYPE_value(val,Tab_AlphaNum)
        if sem == '':
            sem,subsem = DDVS2_value(val,DDVS2)
    elif subcat == 'NUMBER':
        sem,subsem = SEM_TYPE_value(val,Tab_NUM)
    else:
        sem,subsem = 'UNDEFINED','UNDEFINED'
    return str(cat),str(subcat),str(sem),str(subsem)

########## Recupere les CATEGORY, SUBCATEGORY, SEMANTIQUE, SUBSEMANTIQUE Maximum ##########
def MAX_SEM_SUB(DR_CSVFILE,debut,fin,MAX_SEM,MAX_SUBSEM,MAX_SUBCAT):
    MAX_C = max_cat(MAX_SUBCAT)
    MAX_S = max_cat(MAX_SEM)
    MAX_SS = max_cat(MAX_SUBSEM)
    cat,sem,subsem = [],[],[]
    for i in range(debut,fin):
        subcat = str(DR_CSVFILE.loc[i,'SUBSYNTACTICTYPE']).split(';')[0]
        sem = str(DR_CSVFILE.loc[i,'SEMANTICCATEGORY']).split(';')[0]
        subsem = str(DR_CSVFILE.loc[i,'SEMANTICSUBCATEGORY']).split(';')[0]
        if MAX_C in subcat:
            DR_CSVFILE.loc[i,'NEWVALUES'] = str(DR_CSVFILE.loc[i,'OLDVALUES'])
        else:
            DR_CSVFILE.loc[i,'OBSERVATION'] = str(DR_CSVFILE.loc[i,'OLDVALUES'])+'<!>ANO'
        if MAX_S in sem:
            DR_CSVFILE.loc[i,'MAX_SEM'] = MAX_S
        else:
            DR_CSVFILE.loc[i,'OBSERVATION_CAT'] = str(DR_CSVFILE.loc[i,'OLDVALUES'])+'<!>ANO'
        if MAX_SS in subsem:
            DR_CSVFILE.loc[i,'MAX_SUBSEM'] = MAX_SS
            DR_CSVFILE.loc[i,'NEWVALUES_ANNO'] = str(DR_CSVFILE.loc[i,'OLDVALUES'])
        else:
            DR_CSVFILE.loc[i,'OBSERVATION_SUB_CAT'] = str(DR_CSVFILE.loc[i,'OLDVALUES'])+'<!>ANO'
            DR_CSVFILE.loc[i,'NEWVALUES_ANNO'] = DR_CSVFILE.loc[i,'OBSERVATION_SUB_CAT']
        if 'MESURE' in sem or 'POIDS' in sem:
            DR_CSVFILE.loc[i,'NEWVALUES_ANNO'] = homo_mesure(str(DR_CSVFILE.loc[i,'OLDVALUES']),subsem,MAX_SS,MAX_S)
        elif 'TEMPERATURE' in sem:
            DR_CSVFILE.loc[i,'NEWVALUES_ANNO'] = ftc(str(DR_CSVFILE.loc[i,'OLDVALUES']))
        elif 'DATE' in sem:
            DR_CSVFILE.loc[i,'NEWVALUES_ANNO'] = homo_date(str(DR_CSVFILE.loc[i,'OLDVALUES']))
        if str(DR_CSVFILE.loc[i,'OLDVALUES']) == 'NAN':
            DR_CSVFILE.loc[i,'OBSERVATION'] = '<!>NULL'
            DR_CSVFILE.loc[i,'OBSERVATION_CAT'] = '<!>NULL'
            DR_CSVFILE.loc[i,'OBSERVATION_SUB_CAT'] = '<!>NULL'
    return DR_CSVFILE

###### Remplissage de la table DR_CSVFILE_TAB #######
def DR_CSVFILE_TAB(DR_CSVFILE_TABCOL,MAX_CAT,MAX_SUBCAT,MAX_SEM,MAX_SUBSEM,nbnul,nbline,minval,maxval,maxword,j,valist):
    DR_CSVFILE_TABCOL.loc[j,"M100"] = nbnul
    DR_CSVFILE_TABCOL.loc[j,"M101"] = nbline - nbnul
    DR_CSVFILE_TABCOL.loc[j,"M102"] = minval
    DR_CSVFILE_TABCOL.loc[j,"M103"] = maxval
    DR_CSVFILE_TABCOL.loc[j,"M104"] = maxword
    DR_CSVFILE_TABCOL.loc[j,"M105"] = MAX_CAT.count('STRING')
    DR_CSVFILE_TABCOL.loc[j,"M106"] = MAX_CAT.count('NUMBER')
    DR_CSVFILE_TABCOL.loc[j,"M107"] = MAX_CAT.count('DATE')
    DR_CSVFILE_TABCOL.loc[j,"M108"] = MAX_CAT.count('BOOLEAN')
    DR_CSVFILE_TABCOL.loc[j,"M109"] = nbnul
    DR_CSVFILE_TABCOL.loc[j,"M110"] = len(set(valist))
    DR_CSVFILE_TABCOL.loc[j,"M111"] = max_cat(MAX_CAT)
    DR_CSVFILE_TABCOL.loc[j,"M111b"] = max_cat(MAX_SUBCAT)
    DR_CSVFILE_TABCOL.loc[j,"M112"] = int(MAX_CAT.count(DR_CSVFILE_TABCOL.loc[j,"M111"]))
    DR_CSVFILE_TABCOL.loc[j,"M113"] = int(len(MAX_CAT)-DR_CSVFILE_TABCOL.loc[j,"M112"])
    DR_CSVFILE_TABCOL.loc[j,"M114"] = max_cat(MAX_SEM)
    DR_CSVFILE_TABCOL.loc[j,"M115"] = int(MAX_SEM.count(DR_CSVFILE_TABCOL.loc[j,"M114"]))
    DR_CSVFILE_TABCOL.loc[j,"M116"] = int(len(MAX_SEM)-DR_CSVFILE_TABCOL.loc[j,"M115"])
    DR_CSVFILE_TABCOL.loc[j,"M117"] = max_cat(MAX_SUBSEM)
    DR_CSVFILE_TABCOL.loc[j,"M118"] = int(MAX_SUBSEM.count(DR_CSVFILE_TABCOL.loc[j,"M117"]))
    DR_CSVFILE_TABCOL.loc[j,"M119"] = int(len(MAX_SUBSEM)-DR_CSVFILE_TABCOL.loc[j,"M118"])
    DR_CSVFILE_TABCOL.loc[j,"NEWNAME"] = str(DR_CSVFILE_TABCOL.loc[j,"OLDNAME"]+'_'+DR_CSVFILE_TABCOL.loc[j,"M117"])
    return DR_CSVFILE_TABCOL

###### Remplissage de la table DR_CSVFILE_ ########
def DR_CSVFILE_(CSVTOTABLE,nbcol,nbline,names_columns):
    debut,fin = 0,0
    names_c = ["REFERENCE","OLDVALUES","SYNTACTICTYPE","SUBSYNTACTICTYPE","COLUMNWIDHT","NUMBEROFWORDS","OBSERVATION", "NEWVALUES", "SEMANTICCATEGORY","MAX_SEM","SEMANTICSUBCATEGORY","MAX_SUBSEM","OBSERVATION_CAT","OBSERVATION_SUB_CAT","NEWVALUES_ANNO"]
    names_c2 = ["REFERENCE","OLDNAME","NEWNAME","M000","M100","M101","M102","M103","M104","M105","M106","M107","M108","M109","M110","M111","M111b","M112","M113","M114","M115","M116","M117","M118","M119"]
    init_d = np.zeros((nbcol*nbline,len(names_c)),int)
    init_d2 = np.zeros((nbcol,len(names_c2)),int)
    DR_CSVFILE = pd.DataFrame(init_d,columns=names_c)
    DR_CSVFILE_TABCOL = pd.DataFrame(init_d2,columns=names_c2)
    DR_CSVFILE_TABCOL.loc[:nbcol,"OLDNAME"] = names_columns[:nbcol]
    DR_CSVFILE_TABCOL.loc[:nbcol,"M000"] = nbline
    for j in range(nbcol):
        debut = fin
        fin = fin + nbline
        if fin <= nbcol*nbline:
            MAX_SEM, MAX_SUBSEM, MAX_SUBCAT, MAX_CAT, valist = [],[],[],[],[]
            nbnul,minval,maxval,maxword = 0,1000,0,0
            v = 0
            for i in range(debut,fin):
                val = str(CSVTOTABLE.values[v,j]).upper()
                valist.append(val)
                cat,subcat,sem,subsem = CAT_SEM_Syntax(val)
                DR_CSVFILE.loc[i,'REFERENCE'] = names_columns[j]
                DR_CSVFILE.loc[i,'OLDVALUES'] = val
                DR_CSVFILE.loc[i,'SYNTACTICTYPE'] = str(cat)
                DR_CSVFILE.loc[i,'SUBSYNTACTICTYPE'] = str(subcat)
                DR_CSVFILE.loc[i,'SEMANTICCATEGORY'] = str(sem)
                DR_CSVFILE.loc[i,'SEMANTICSUBCATEGORY'] = str(subsem)
                if val != 'NAN':
                    if minval > len(val):
                        minval=len(val)
                    if maxval < len(val):
                        maxval=len(val)
                    DR_CSVFILE.loc[i,'COLUMNWIDHT'] = len(val)
                    DR_CSVFILE.loc[i,'NUMBEROFWORDS'] = (val.count(" "))+1
                    if maxword < (val.count(" "))+1:
                        maxword = (val.count(" "))+1
                    MAX_SEM.append(sem.split(';')[0])
                    MAX_SUBCAT.append(subcat.split(';')[0])
                    MAX_SUBSEM.append(subsem.split(';')[0])
                    MAX_CAT.append(cat.split(';')[0])
                else:
                    nbnul += 1
                    DR_CSVFILE.loc[i,'SYNTACTICTYPE'] = 'NULL'
                    DR_CSVFILE.loc[i,'SUBSYNTACTICTYPE'] = 'NULL'
                    DR_CSVFILE.loc[i,'NEWVALUES'] = 'NAN'
                    DR_CSVFILE.loc[i,'SEMANTICCATEGORY'] = 'NULL'
                    DR_CSVFILE.loc[i,'MAX_SEM'] = 'NULL'
                    DR_CSVFILE.loc[i,'SEMANTICSUBCATEGORY'] = 'NULL'
                    DR_CSVFILE.loc[i,'MAX_SUBSEM'] = 'NULL'
                v += 1
            DR_CSVFILE = MAX_SEM_SUB(DR_CSVFILE,debut,fin,MAX_SEM,MAX_SUBSEM,MAX_SUBCAT)
            DR_CSVFILE_TABCOL = DR_CSVFILE_TAB(DR_CSVFILE_TABCOL,MAX_CAT,MAX_SUBCAT,MAX_SEM,MAX_SUBSEM,nbnul,nbline,minval,maxval,maxword,j,valist)
    return DR_CSVFILE,DR_CSVFILE_TABCOL

############ CRéation de la table Final ###############
def TABLE_FINAL(DR_CSVFILE_COL,DR_CSVFILE_TABCOL,nbcol,nbline):
    debut = 0
    fin = 0
    init_d = np.zeros((nbline,nbcol),int)
    names_c = DR_CSVFILE_TABCOL["NEWNAME"].values
    CSV_FINAL = pd.DataFrame(init_d)
    for i in range(nbcol):
        debut = fin
        fin = fin + nbline
        CSV_FINAL.loc[:,i] = DR_CSVFILE_COL.values[debut:fin,14]
    CSV_FINAL.columns = names_c
    return CSV_FINAL

# Supprime les Table de MongoDB
def Drop_collection(nbcol,nbline):
    collection = db["CSV_FINAL"]
    collection.drop()
    collection = db["DR_CSVFILE_TABCOL"]
    collection.drop()
    collection = db["DR_CSVFILE_COL"]
    collection.drop()
    for i in range(40):
        dr = 'DR_CSVFILE_COL_'+str(i+1)
        collection = db[str(dr)]
        collection.drop()

# Création et insetion vers MongoDB
def DATA_TO_MONGO(DR_CSVFILE_COL,DR_CSVFILE_TABCOL,CSV_FINAL,nbcol,nbline):
    debut = 0
    fin = 0
    for i in range(nbcol):
        debut = fin
        fin = fin + nbline
        dr = 'DR_CSVFILE_COL_'+str(i+1)
        collection = db[str(dr)]
        data_dict = DR_CSVFILE_COL.loc[debut:fin,:]
        data_dict = data_dict.to_dict("records")
        collection.insert_many(data_dict)
    collection = db["DR_CSVFILE_TABCOL"]
    data_dict = DR_CSVFILE_TABCOL.to_dict("records")
    collection.insert_many(data_dict)
    collection = db["CSV_FINAL"]
    data_dict = CSV_FINAL.to_dict("records")
    collection.insert_many(data_dict)

### calcule dependance Fonctionnelles
def dependanceFonctionnelles(DR_CSVFILE_TABCOL, CSV_FINAL):
    collection = db["DependanceFonctionnelles"]
    collection.drop()
    alreadyCalculated=list()
    for columnName1 in list(CSV_FINAL.columns):
        for columnName2 in list(CSV_FINAL.columns):
            if columnName1!=columnName2 and columnName2 not in alreadyCalculated and columnName1!='' and columnName2 !='':
                # ce if c'est pour éviter de calculer dépendance entre deux colonnes qui ne sont pas de la même type
                if ((DR_CSVFILE_TABCOL[DR_CSVFILE_TABCOL.NEWNAME == columnName1].M111).values[0])==((DR_CSVFILE_TABCOL[DR_CSVFILE_TABCOL.NEWNAME == columnName2].M111).values[0]):
                    # Similarité avec le nombre des valeurs différentes
                    similar = (CSV_FINAL[columnName1] == CSV_FINAL[columnName2]).sum()
                    # On calcule la similarité entre deux colonnes qui ont la même catégorie avec l'algorithme de "jaccard"
                    if ((DR_CSVFILE_TABCOL[DR_CSVFILE_TABCOL.NEWNAME == columnName1].M114).values[0]) == ((DR_CSVFILE_TABCOL[DR_CSVFILE_TABCOL.NEWNAME == columnName2].M114).values[0]):
                        # Similarité avec l'algo de "jaccard"
                        similarEq = distance.jaccard(columnName1, columnName2)
                        # Egualité
                        if similarEq<0.5:
                            dependance = {
                                "col1": columnName1,
                                "Type": "Eq",
                                "col2": columnName2,
                                "Pourcentage": str(round((1-similarEq)*100, 2))+"%"
                            }
                        else:
                            # Inférieur
                            if (((CSV_FINAL[columnName1]>CSV_FINAL[columnName2]).sum())>0.5):
                                dependance = {
                                    "col1": columnName1,
                                    "Type": "Inf",
                                    "col2": columnName2,
                                    "Pourcentage": ""
                                }
                            # Supperieur
                            else:
                                dependance = {
                                    "col1": columnName1,
                                    "Type": "Sup",
                                    "col2": columnName2,
                                    "Pourcentage": ""
                                }
                    # On considère qu'il y a une dépendance si il y a une similarité entre deux colonnes de catégorie différentes plus de 10%.
                    elif (similar/len(CSV_FINAL))*100 > 10.0:
                        dependance={
                            "col1": columnName1,
                            "Type": "Df",
                            "col2": columnName2,
                            "Pourcentage": str(round((similar/len(CSV_FINAL))*100, 2))+"%"
                        }
                    else:
                        break
                    collection.insert_one(dependance)
                    print(dependance)
        alreadyCalculated.append(columnName1)
############ Main ############
if __name__ == '__main__':
    # Un seul csv
    path = ["csv/csvfile1.csv"]
    # Plusieurs CSV concatener
    # path = ["csv/csvfile1.csv","csv/csvfile2.csv","csv/csvfile3.csv","csv/csvfile4.csv","csv/csvfile5.csv"]
    CSVTOTABLE,names_columns,nbcol,nbline = open_csv(path,';')
    Drop_collection(nbcol,nbline)
    # Debut du decompte du temps
    start_time = time.time()
    DR_CSVFILE_COL,DR_CSVFILE_TABCOL = DR_CSVFILE_(CSVTOTABLE,nbcol,nbline,names_columns)

    ## Decommenter ci-dessous pour afin la totalité des tables
    #pd.set_option('display.max_rows', DR_CSVFILE_COL.shape[0]+1)

    CSV_FINAL = TABLE_FINAL(DR_CSVFILE_COL,DR_CSVFILE_TABCOL,nbcol,nbline)
    DATA_TO_MONGO(DR_CSVFILE_COL,DR_CSVFILE_TABCOL,CSV_FINAL,nbcol,nbline)
    # Affichage du temps d execution
    print("Temps d execution : %s secondes ---" % (time.time() - start_time))
    print('---------------------- CSVTOTABLE ------------------- : \n',CSVTOTABLE)
    print('\nNombre de col: ',nbcol,'\nNombre de ligne: ',nbline)
    print('---------------------- DR_CSVFILE_COL ------------------- : \n',DR_CSVFILE_COL)
    print('---------------------- DR_CSVFILE_TABCOL ------------------- : \n',DR_CSVFILE_TABCOL)
    print('---------------------- CSV_FINAL ------------------- : \n',CSV_FINAL)

    dependanceFonctionnelles(DR_CSVFILE_TABCOL, CSV_FINAL)
