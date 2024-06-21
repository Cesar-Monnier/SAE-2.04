/*Exercice 1*/
/*Q2 5.a*/
    select count(n10) from import;
/*Q2 5.b*/
    select count(distinct n4) from import;
    select count(n4) from import;
/*Q2 5.c*/
    select count(n10) from import where n4 like '%Université de Lille%';
    /*q2 5.d*/
    select n4, count(n10) from import group by n4 having n4 = 'Institut universitaire de technologie de Lille - Université de Lille';
/*Q2 5.e*/
    select n3 from import where n10='BUT - Informatique' AND n9 ='Villeneuve-d''Ascq';
/*Q2 52f*/

/*Exercice 2*/
/*Q2*/
    select pg_size_pretty(pg_relation_size('import'));
/*Q3*/
    select pg_size_pretty(pg_relation_size('etablissement'));
    select pg_size_pretty(pg_relation_size('région'));
    select pg_size_pretty(pg_relation_size('filière'));
    select pg_size_pretty(pg_relation_size('neobachelier'));
    select pg_size_pretty(pg_relation_size('admission'));
    select pg_size_pretty(pg_relation_size('bourse'));
/*Exercice 3*/
/*Q1*/
    select n56, cast(n57 as INTEGER)+ CAST(n58 as INTEGER)+ CAST(n59 as INTEGER) as somme from import;
/*Q2*/
    select n56, cast(n57 as INTEGER)+ CAST(n58 as INTEGER)+ CAST(n59 as INTEGER) as somme from import 
    where cast(n56 as INTEGER) <> cast(n57 as INTEGER)+ CAST(n58 as INTEGER)+ CAST(n59 as INTEGER);
/*Q3*/    
    select n74, round(((cast(n51 as float)/(cast(n47 as float))))*100) as somme from import where cast(n47 as float) <> 0  group by n74,n47,n51;
/*Q4*/
    select round(cast(n74 as float)), round(((cast(n51 as float)/(cast(n47 as float))))*100) as somme 
    from import 
    where cast(n47 as float) <> 0 and round(cast(n74 as float)) <> round(((cast(n51 as float)/(cast(n47 as float))))*100) 
    group by n74,n47,n51;
/*Q5*/
    select n76, round(((cast(n53 as float)/(cast(n47 as float))))*100) as somme 
    from import 
    where cast(n47 as float) <> 0  group by n76,n47,n53;

    select round(cast(n76 as float)), round(((cast(n53 as float)/(cast(n47 as float))))*100) as somme 
    from import 
    where cast(n47 as float) <> 0 and round(cast(n76 as float)) <> round(((cast(n53 as float)/(cast(n47 as float))))*100) 
    group by n76,n47,n53;
/*Q6*/
    select round(cast(n76 as float)), round((propavproprin/effaccept)*100) 
    from import join admission on cast(n76 as float) = pouradmis 
    where effaccept <>0 
    group by n76, propavproprin, effaccept;
/*Q7*/
    select round(cast(n81 as float)) as n81, round(((cast(n55 as float))/(cast(n57 as float)+cast(n58 as float)+cast(n59 as float)))*100) as somme
    from import
    where cast(n57 as float) <> 0 and cast(n58 as float) <> 0 and cast(n59 as float) <> 0 
    group by n81,n55,n57,n58,n59; 
/*Q8*/
    select round(pouradbour) as pouradbour, round((effadbour/(cast(agen as float)+cast(atech as float)+cast(apro as float)))*100) as somme
    from admission
    where cast(agen as float) <> 0 and cast(atech as float) <> 0 and cast(apro as float) <> 0
    group by pouradbour,agen,apro,atech,effadbour;

    select round((cast(effcandidates as float)/cast(effnéo as float))*100) as pourcentage_candidate where filière as f join région as r join neobachelier as n f.fno = n.fno where r.régions ='Bretagne' and r.région = 'Normandie'and f.formation is in('Formation d''ingénieur Bac + 5 - Cycle Préparatoire Intégré - Spécialité Généraliste, BTP, Informatique, Systèmes embarqués','D.E Infirmier
','Formation d''ingénieur Bac + 5 - bac STI2D
', 'Licence - Portail Informatique','Licence - Portail Portail Biologie Environnement Chimie du vivant
','Formation d''ingénieur Bac + 5 - Bac STL (Spécialité SPCL)
','Licence - Parcours d''Accès Spécifique Santé (PASS)
','Licence - Portail Physique
','Licence - Portail Mathématiques
','Licence - Parcours d''Accès Spécifique Santé (PASS)
','Formation d''ingénieur Bac + 5 - Double diplôme
','Formation d''ingénieur Bac + 5 - Autres Séries (Bac STL, STI2D, STAV, PSC0, bacs internationaux)
','Année préparatoire - Classe de mise à niveau pour les préparations aux cursus scientifiques
','CPGE - ECG -  - Mathématiques appliquées + ESH
','CPGE - ECG -  - Mathématiques appliquées + HGG
','CPGE - ECG
','Licence - Parcours d''Accès Spécifique Santé (PASS)
','Formation d''ingénieur Bac + 5 - Cycle préparatoire intégré - option Santé
','Licence - Parcours d''Accès Spécifique Santé (PASS)
','Licence - Portail Physique
','Licence - Portail MPMEI : Mathématiques, Physique, Mathématiques-Economie, Informatique
','Licence - Portail Physique, chimie
','Licence - Mathématiques et informatique appliquées aux sciences humaines et sociales - Parcours Préparatoire au Professorat des Ecoles (PPPE)
','CUPGE - Parcours mathématiques-physique
','BTS - Production - Cybersécurité, Informatique et réseaux, ELectronique - Option A : Informatique et réseaux
','Formation d''ingénieur Bac + 5 - Bacs technologiques
','Formation d''ingénieur Bac + 5 - Bac Série générale avec la spécialité Maths en Terminale + une spécialité non scientifique
','Formation d''ingénieur Bac + 5 - Bac général
','Licence - Portail Licence Sciences de la Vie et de la Terre / Licence Sciences de la Terre / Licence Sciences de la Vie
','Certificat de capacité d''Orthoptiste
','BTS - Maritime - Maintenance des systèmes électro-navals - réservé aux Mises à Niveau
','Mention complémentaire - Cybersécurité
','Formation d''ingénieur Bac + 5 - Bacs généraux - 2 Sciences
','BTS - Production - Cybersécurité, Informatique et réseaux, ELectronique - Option A : Informatique et réseaux
','Licence - Sciences de la terre
','BUT - Science et génie des matériaux (Statut d''apprenti possible sur tout ou partie des années, au-delà de la première)
','BTS - Production - Cybersécurité, Informatique et réseaux, ELectronique - Option B : Electronique et réseaux
','BUT - Mesures physiques
','BUT - Génie biologique parcours sciences de l''environnement et écotechnologies
','CPGE - MPSI','CPGE - PCSI
','BUT - Génie biologique parcours sciences de l''aliment et biotechnologie (Statut d''apprenti possible sur tout ou partie des années, au-delà de la première)
','BUT - Chimie
','BUT - Génie civil - Construction durable
','BUT - Génie industriel et maintenance (Statut d''apprenti possible sur tout ou partie des années, au-delà de la première)
','BUT - Génie électrique et informatique industrielle
','BUT - Génie mécanique et productique
','BTS - Production - Métiers du géomètre-topographe et de la modélisation numérique
','BTS - Production - Fluide, énergie, domotique - option B froid et conditionnement d''air
','BTS - Production - Environnement nucléaire
','BTS - Production - Cybersécurité, Informatique et réseaux, ELectronique - Option A : Informatique et réseaux
','Mention complémentaire - Mécatronique navale
','Licence - Mécanique
','BTS - Production - Electrotechnique - parcours Marine Nationale/Maistrance-Défense
','BTS - Production - Maintenance des systèmes - option B Systèmes énergétiques et fluidiques
','BTS - Production - Architectures en Métal : conception et Réalisation
','BTS - Production - Europlastics et composites à référentiel commun européen - option Conception d''Outillage
','BTS - Production - Cybersécurité, Informatique et réseaux, ELectronique - Option A : Informatique et réseaux
','BTS - Production - Cybersécurité, Informatique et réseaux, ELectronique - Option A : Informatique et réseaux - parcours Marine Nationale/Maistrance-Défense
','BTS - Production - Cybersécurité, Informatique et réseaux, ELectronique - Option A : Informatique et réseaux
','BTS - Production - Maintenance des véhicules option voitures particulières
','BTS - Production - Electrotechnique
','BTS - Production - Conception et industrialisation en microtechniques
','BUT - Informatique
','BTS - Production - Cybersécurité, Informatique et réseaux, ELectronique - Option B : Electronique et réseaux
','BTS - Production - Cybersécurité, Informatique et réseaux, ELectronique - Option B : Electronique et réseaux - parcours Marine Nationale/Maistrance-Défense
','BTS - Production - Cybersécurité, Informatique et réseaux, ELectronique - Option B : Electronique et réseaux (Statut d''apprenti possible sur tout ou partie des années, au-delà de la première)
','BTS - Production - Electrotechnique
','BTS - Production - Electrotechnique - parcours Marine Nationale/Maistrance-Défense
','BTS - Production - Fluide, énergie, domotique - option A génie climatique et fluidique
','BTS - Production - Fluide, énergie, domotique - option A génie climatique et fluidique - parcours Marine Nationale / Maistrance-défense
','BTS - Production - Fluide, énergie, domotique - option B froid et conditionnement d''air
','BTS - Production - Fluide, énergie, domotique - option B froid et conditionnement d''air - parcours Marine Nationale / Maistrance-défense
','BTS - Production - Métiers de la chimie
','BTS - Production - Métiers de la mesure
','BTS - Production - Métiers du géomètre-topographe et de la modélisation numérique (Statut d''apprenti sur tout ou partie des années, au-delà de la première)
','BUT - Chimie
','BUT - Génie biologique Parcours agronomie
','BUT - Génie biologique parcours biologie médicale et biotechnologie
','BUT - Génie biologique parcours biologie médicale et biotechnologie (Statut d''apprenti possible sur tout ou partie des années, au-delà de la première)
','BUT - Génie biologique Parcours diététique et nutrition
','BUT - Génie biologique parcours sciences de l''aliment et biotechnologie
','BUT - Génie biologique parcours sciences de l''aliment et biotechnologie (Statut d''apprenti possible sur tout ou partie des années, au-delà de la première)
','BUT - Génie biologique parcours sciences de l''environnement et écotechnologies
','BUT - Génie chimique génie des procédés
','BUT - Génie chimique génie des procédés (Statut d''apprenti possible sur tout ou partie des années, au-delà de la première)
','BUT - Génie électrique et informatique industrielle
','BUT - Génie mécanique et productique
','BUT - Génie mécanique et productique (Statut d''apprenti possible sur tout ou partie des années, au-delà de la première)
','BUT - Informatique
','BUT - Informatique (Statut d''apprenti possible sur tout ou partie des années, au-delà de la première)
','BUT - Mesures physiques
','BUT - Mesures physiques (Statut d''apprenti possible sur tout ou partie des années, au-delà de la première)
','BUT - Métiers de la Transition et de l''Efficacité Énergétiques
','BUT - Métiers de la Transition et de l''Efficacité Énergétiques (Statut d''apprenti possible sur tout ou partie des années, au-delà de la première)
','BUT - Réseaux et télécommunications
','BUT - Réseaux et télécommunications (Statut d''apprenti possible sur tout ou partie des années, au-delà de la première)
','BUT - Science des données
','BUT - Science des données (Statut d''apprenti possible sur tout ou partie des années, au-delà de la première)
','BUT - Science et génie des matériaux (Statut d''apprenti possible sur tout ou partie des années, au-delà de la première)
','C.M.I - Cursus Master en Ingénierie - Mathématiques - Parcours Science des données','Certificat de capacité d''Orthophoniste
','Classe préparatoire aux études supérieures - Scientifique
','CPGE - ECG -  - Mathématiques appliquées + ESH
','CPGE - ECG -  - Mathématiques appliquées + HGG
','CPGE - ECG -  - Mathématiques approfondies + ESH
','CPGE - ECG -  - Mathématiques approfondies + HGG
','CPGE - ECT - Option technologique
','CPGE - MP2I
','CPGE - MPSI
','CPGE - PCSI
','CPGE - PTSI
','CPGE - TB
','CPGE - TSI
','CUPGE - Cycle universitaire préparatoire aux grandes écoles - Parcours Informatique, Mathématiques
','CUPGE - Cycle universitaire préparatoire aux grandes écoles - Physique
','CUPGE - Parcours Informatique / Mathématiques
','CUPGE - Parcours mathématiques-physique
','Cycle pluridisciplinaire d''Études Supérieures - Sciences - Environnement - Société
','Cycle pluridisciplinaire d''Études Supérieures - Sciences et société - Parcours: Sciences - Sciences économiques, juridiques, politiques et sociales
','D.E Audioprothésiste
','D.E manipulateur/trice en électroradiologie médicale
','D.E Psychomotricien
','Diplôme d''Etablissement - Cadre technique génie de l''environnement marin
','Diplôme d''Etablissement - Diplômes Officier Chef de Quart Passerelle International et Capitaine 3000 (OCQPI) - Bac +3
','Diplôme d''Université -  Préparation aux études scientifiques
','Double licence - Economie / Mathématiques - Double licence - Economie - Mathématiques
','DTS Imagerie médicale et radiologie thérapeutique
','DTS Imagerie médicale et radiologie thérapeutique (Statut d''apprenti possible sur tout ou partie des années, au-delà de la première)
','Formation Bac+6 - Bac STAV
','Formation Bac + 3 - Bachelors - Bacs séries générale, STI2D, STAV, STL, ST2S, bacs pros identifiés et Bac+1 (Statut d''apprenti sur tout ou partie des années, au-delà de la première)
','Formation d''ingénieur Bac + 5
','Formation d''ingénieur Bac + 5 - Agroalimentaire - 5 ans à Rennes
','Formation d''ingénieur Bac + 5 - Autres Séries (Bac STL, STI2D, STAV, PSC0, bacs internationaux)
','Formation d''ingénieur Bac + 5 - Autres Séries (Bac STL, STI2D, STAV, PSC0, bacs internationaux)
','Formation d''ingénieur Bac + 5 - Bac +1
','Formation d''ingénieur Bac + 5 - Bac général
','Formation d''ingénieur Bac + 5 - bac général profil mixte
','Formation d''ingénieur Bac + 5 - Bac Série générale
','Formation d''ingénieur Bac + 5 - Bac Série générale avec 2 spécialités scientifiques mais sans la spécialité Maths en Terminale
','Formation d''ingénieur Bac + 5 - Bac Série générale avec la spécialité Maths en Terminale + une spécialité non scientifique
','Formation d''ingénieur Bac + 5 - Bac série générale avec la spécialité Maths en Terminale + une spécialité scientifique
','Formation d''ingénieur Bac + 5 - Bac Série STI2D
','Formation d''ingénieur Bac + 5 - bac STI2D
','Formation d''ingénieur Bac + 5 - Bac STL (Spécialité SPCL)
','Formation d''ingénieur Bac + 5 - Bacs généraux - 1 Science
','Formation d''ingénieur Bac + 5 - Bacs généraux - 2 Sciences
','Formation d''ingénieur Bac + 5 - Bacs technologiques
','Formation d''ingénieur Bac + 5 - Cycle préparatoire intégré - option Santé
','Formation d''ingénieur Bac + 5 - Double diplôme
','Formation d''ingénieur Bac + 5 - Série générale
','Licence - Information et communication
','Licence - Informatique
','Licence - Mathématiques
','Licence - Mathématiques - Parcours DEFI Mathématiques
','Licence - Mathématiques - Parcours Mathématiques Renforcées et Concours
','Licence - Mathématiques et informatique appliquées aux sciences humaines et sociales
','Licence - Mathématiques et informatique appliquées aux sciences humaines et sociales - Parcours Préparatoire au Professorat des Ecoles (PPPE)
','Licence - Mécanique
','Licence - Physique, chimie - Parcours DEFI Physique-Chimie
','Licence - Portail Chimie
','Licence - Portail Informatique
','Licence - Portail Informatique - informatique, sciences et technologies du numérique parcours Défi
','Licence - Portail Informatique - Licence Informatique / Licence Electronique-Energie-Electrique-Automatique
','Licence - Portail Informatique / Mathématiques
','Licence - Portail Informatique, sciences et technologies du numérique
','Licence - Portail ISI - Informatique et Sciences pour l''ingénieur en Electronique, Signal, Télécommunications, Réseaux, Génie Mécanique, Image et Son
','Licence - Portail Licence Chimie / Licence Physique-Chimie
','Licence - Portail Licence Mécanique / Licence Physique / Licence Physique-Chimie
','Licence - Portail Licence Sciences de la Vie et de la Terre / Licence Sciences de la Terre / Licence Sciences de la Vie
','Licence - Portail Mathématiques
','Licence - Portail Mécanique - Mécanique / Génie civil
','Licence - Portail MPMEI : Mathématiques, Physique, Mathématiques-Economie, Informatique
','Licence - Portail Physique
','Licence - Portail Physique, chimie
','Licence - Portail Physique, Chimie, Sciences de la Terre et Mécanique (PCSTM)
','Licence - Portail Portail : Chimie, Sciences de la Vie (CSV)
','Licence - Portail Portail Biologie Environnement Chimie du vivant
Licence - Portail Portail Biologie Environnement Chimie du vivant
','Licence - Portail Portail Mathématiques et applications
','Licence - Portail Psychologie
','Licence - Portail Sciences de la vie
','Licence - Portail Sciences de la vie - Licence Sciences de la vie
','Licence - Portail Sciences de la vie et de la terre - Bio générale, Bio cellulaire moléculaire, Sciences de l''environnement, Bio Biotech, Bio Biosanté, TACB
','Licence - Portail Sciences des systèmes communicants - Sciences numériques, informatique embarqué et objets communicants
','Licence - Portail Sciences pour la santé
','Licence - Psychologie
','Licence - Psychologie - Entièrement en distanciel
','Licence - Sciences de la terre
','Licence - Sciences de la vie - Parcours Sciences de la vie section internationale
','Licence - Sciences de la vie et de la terre
','Licence - Sciences de la vie et de la terre - Parcours Biologie
','Licence - Sciences et technologies
','Licence - Sciences pour l''ingénieur
',)