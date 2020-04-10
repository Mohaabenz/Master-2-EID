from pymongo import MongoClient
import pandas as pd
import distance
import soundex

# Importation et préparation des données (Table finale, table des mesures)
client = MongoClient("mongodb://localhost:27017")
db = client.csv2tab
mesureTableMongoDB = db.table_mesures.find()
finalTableMongoDB = db.table_finale.find()
tableMesures = pd.DataFrame(mesureTableMongoDB)
tableFinale = pd.DataFrame(finalTableMongoDB)
# supression de la colonne "_id"
tableMesures = tableMesures.loc[:, tableMesures.columns != "_id"]
tableFinale = tableFinale.loc[:, tableFinale.columns != "_id"]

# Fonction de la dépendance fonctionnelles
def dependanceFonctionnelles(tabMesure, tableFinale):
    db.dependanceFonctionnelles.drop()
    alreadyCalculated=list()
    for columnName1 in list(tableFinale.columns):
        for columnName2 in list(tableFinale.columns):
            if columnName1!=columnName2 and columnName2 not in alreadyCalculated and columnName1!='' and columnName2 !='':
                # ce if c'est pour éviter de calculer dépendance entre deux colonnes qui ne sont pas de la même type
                if ((tableMesures[tableMesures.Newname == columnName1].M111).values[0])==((tableMesures[tableMesures.Newname == columnName2].M111).values[0]):
                    # Similarité avec le nombre des valeurs différentes
                    similar = (tableFinale[columnName1] == tableFinale[columnName2]).sum()
                    # On calcule la similarité entre deux colonnes qui ont la même catégorie avec l'algorithme de "jaccard"
                    if ((tableMesures[tableMesures.Newname == columnName1].M114).values[0]) == ((tableMesures[tableMesures.Newname == columnName2].M114).values[0]):
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
                            if (((tableFinale[columnName1]>tableFinale[columnName2]).sum())>0.5):
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
                    elif (similar/len(tableFinale))*100 > 10.0:
                        dependance={
                            "col1": columnName1,
                            "Type": "Df",
                            "col2": columnName2,
                            "Pourcentage": str(round((similar/len(tableFinale))*100, 2))+"%"
                        }
                    else:
                        break
                    db.dependanceFonctionnelles.insert_one(dependance)
                    print(dependance)
        alreadyCalculated.append(columnName1)

dependanceFonctionnelles(tableMesures, tableFinale)
