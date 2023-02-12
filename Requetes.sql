-- ----------
-- auteur : Marielle Vallée, Idris Douma, Sabrina Salem
-- SAE : Création Base de Données
-- -----------------------------

-- Q1:  Listez les titres des vidéos de catégorie 'Thriller'

select titre from boubacan.video where categorie = 'Thriller' ; 

/*          titre           
--------------------------
 The Silence of the Lambs
 Riverdale
(2 lignes)*/

-- Q2: Listez les id et titres des vidéos dans lequel a joué un acteur dont le prénom est John 

select distinct idVideo, titre from boubacan.video inner join boubacan.aJoueDans using(idVideo) natural join boubacan.acteur inner join boubacan.personalite on idPers = idActeur where prenom ='John';

/*idvideo |         titre         
---------+-----------------------
      15 | 
      15 | American Horror Story
       7 | 
       7 | Up
(4 lignes)*/

/*Répétition de l'idVideo car 2 fois présent dans 2 tables différentes. Malgré l'inner join par rapport à la clé étrangère, il le répète quand même*/


-- Q3: Listez les réalisateurs qui ont fait plus de 2 vidéos

select distinct realisateur.idRea,count(idVideo) from boubacan.video inner join boubacan.realisateur on realisateur = idRea inner join boubacan.personalite on idRea = idPers group by (idRea) having count(idVideo) > 2;

/* idrea | count 
-------+-------
     4 |     2
    10 |     2
(2 lignes)*/


-- Q4: Listez les acteurs qui sont aussi des réalisateurs

select idPers,nom,prenom from boubacan.acteur inner join boubacan.personalite on idPers=idActeur INTERSECT select idPers,nom,prenom from boubacan.realisateur inner join boubacan.personalite on idPers=idRea;

/*idpers |   nom   |  prenom  
--------+---------+----------
      5 | Malek   | Rami
      1 | Jonhson | Dwayne
      7 | McAfee  | John
      3 | Sy      | Omar
      2 | Zemmour | Eric
      6 | Mars    | Bruno
      8 | Corbato | Fernando
      4 | Dupont  | Xavier
(8 lignes)*/


-- Q5: Afficher le titre, la catégorie et le réalisateur des series qui ont plus de  29 épisodes

select video.titre, video.categorie, video.realisateur from boubacan.video inner join boubacan.serie using (idVideo) where nbEpisode > 29;
/*         titre         | categorie | realisateur 
-----------------------+-----------+-------------
 Mr Robot              | Drama     |          10
 Gravity falls         | Animation |          10
 Your lie in April     | Animation |          11
 Breaking Bad          | Action    |          12
 American Horror Story | Horror    |          13
                       |           |            
                       |           |            
                       |           |            
                       |           |            
                       |           |            
(10 lignes)*/








