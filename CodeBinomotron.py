import random

import mysql.connector
mydb = mysql.connector.connect(
  host="localhost",
  port="3307",                               #Liaison de la base php my admin
  user="root",                               #Interface, bdd, mdp, utilisateur
  password="example",
  database = "Binomotron")

cursor = mydb.cursor()

choix=input("Affichez votre choix :\n1, Produisez votre groupe:\n2, Indiquez votre mail :\n3, Afficher la liste des projets\n" )
#Afficher les termes entre parenthése avec possibilité de choix selon le chiffre indiqué
if choix == "1":                                    #1er choix

  query = "SELECT nom, prenom FROM etudiants"   #une instruction a une bdd pour obtenir des infos 
  cursor.execute(query)                         #exécuter une requête sql sur bdd
  liste_etudiants = cursor.fetchall()           #récupére tous les résultats d'une requête exécutée précédemment

#Mélange des noms prénoms pour assurer l'aléatoire de la selection
  random.shuffle(liste_etudiants)

  x= int(input("Entrez la taille du groupe"))    #chaîne contenant le nombre de caractères
  while len(liste_etudiants) >= x :
    reunion =[]
    for i in liste_etudiants[:x]:                #Variable 
      reunion.append(liste_etudiants.pop())      #Action de retirer l'etudiant selectioné 
    print(reunion)

  print(liste_etudiants)

if choix == "2":                                            #2éme possibilité 
  x=input("entrez le nom d'un etudiant :").upper()
  query= "select adresse_mail from etudiants where nom = %s"
  cursor.execute(query,(x,))                                  #exécuter une requête sql sur bdd
  mail = cursor.fetchone()[0]                                 #récupére tous les résultats d'une requête exécutée précédemment
  
  print(mail)

if choix == "3":                                              #3éme possibilité
    
    query = "Select libelle_du_projet FROM projets"           #une instruction a une bdd pour obtenir des infos
    cursor.execute(query)                                     #exécuter une requête sql sur bdd
    projets = cursor.fetchall()                               #récupére tous les résultats d'une requête exécutée précédemment
    
  
    print(projets)

cursor.close()
mydb.close() 