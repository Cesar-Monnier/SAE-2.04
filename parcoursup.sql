Create table import (n1 TEXT,n2 TEXT,n3 TEXT,n4 TEXT,n5 TEXT,n6 TEXT,n7 TEXT,n8 TEXT,n9 TEXT,n10 TEXT,n11 TEXT,n12 TEXT,n13 TEXT,n14 TEXT,n15 TEXT,n16 TEXT,n17 TEXT,
n18 TEXT,n19 TEXT,n20 TEXT,n21 TEXT,n22 TEXT,n23 TEXT,n24 TEXT,n25 TEXT,n26 TEXT,n27 TEXT,n28 TEXT,n29 TEXT,n30 TEXT,n31 TEXT,n32 TEXT,n33 TEXT,n34 TEXT,n35 TEXT,
n36 TEXT,n37 TEXT,n38 TEXT,n39 TEXT,n40 TEXT,n41 TEXT,n42 TEXT,n43 TEXT,n44 TEXT,n45 TEXT,n46 TEXT,n47 TEXT,n48 TEXT,n49 TEXT,n50 TEXT,n51 TEXT,n52 TEXT,n53 TEXT,
n54 TEXT,n55 TEXT,n56 TEXT,n57 TEXT,n58 TEXT,n59 TEXT,n60 TEXT,n61 TEXT,n62 TEXT,n63 TEXT,n64 TEXT,n65 TEXT,n66 TEXT,n67 TEXT,n68 TEXT,n69 TEXT,n70 TEXT,n71 TEXT,
n72 TEXT,n73 TEXT,n74 TEXT,n75 TEXT,n76 TEXT,n77 TEXT,n78 TEXT,n79 TEXT,n80 TEXT,n81 TEXT,n82 TEXT,n83 TEXT,n84 TEXT,n85 TEXT,n86 TEXT,n87 TEXT,n88 TEXT,n89 TEXT,
n90 TEXT,n91 TEXT,n92 TEXT,n93 TEXT,n94 TEXT,n95 TEXT,n96 TEXT,n97 TEXT,n98 TEXT,n99 TEXT,n100 TEXT,n101 TEXT,n102 TEXT,n103 TEXT,n104 TEXT,n105 TEXT,n106 TEXT,
n107 TEXT,n108 TEXT,n109 TEXT,n110 TEXT,n111 TEXT,n112 TEXT,n113 TEXT,n114 TEXT,n115 TEXT,n116 TEXT,n117 TEXT,n118 TEXT);

\copy import from /media/cesar.monnie.etu/cesar_monnier/SAES2BDD/fr-esr-parcoursup2.csv with (format csv, delimiter ';', HEADER);

Create table etablissement (eno serial, rno Integer, statut varchar(33), codeUAI varchar(8), établissement varchar(136),académie varchar(21), 
constraint pk_etablissement primary key (eno), constraint fk_région foreign key(rno) references région(rno) on update cascade on delete set null);

Create table région (rno serial, codedep varchar(3), département varchar(23), régions varchar(27), académie varchar(21), commune varchar(29),GPS varchar(21),
constraint pk_region primary key (rno));

create table filière (fno serial, eno Integer,formation varchar(294), sélectivité varchar(24), capacité Integer, totalcandidat Integer, codaff Integer, tauxaccès float, 
constraint pk_filière primary key(fno), constraint fk_etablissement foreign key(eno) references etablissement(eno) on update cascade on delete set null);

create table neobachelier (nno serial, bno Integer, fno Integer,effnéo Integer, néopro Integer, néogen Integer, néotech Integer, autre Integer,effcandidates Integer,
 genc Integer, techc Integer, procl Integer, autrec Integer, constraint pk_néo primary key (nno), 
 constraint fk_filière foreign key(fno) references filière(fno) on update cascade on delete set null, 
 constraint fk_bourse foreign key(bno) references bourse(bno) on update cascade on delete set null);

 create table  admission (ano serial, nno Integer,fno Integer, bno Integer,atotal Integer,agen Integer, apro Integer, atech Integer, aautre Integer, genmention Integer, 
 techmention Integer, promention Integer, aetabgen float,aetabtech float, aetabpro float, aetabautre float, acandidate Integer, effaccept float, propavproprin float, 
 pouradmis float, effadbour float, pouradbour float,constraint fk_filière foreign key(fno) references filière, constraint pk_ad primary key(ano), 
 constraint fk_bourse foreign key(bno) references bourse(bno) on update cascade on delete set null, 
 constraint fk_neo foreign key(nno) references admission on update cascade on delete set null);

 create table bourse (bno serial ,bourgen Integer,bourtech Integer, bourpro Integer, bourgenc Integer, bourtechc Integer, bourproc Integer, 
constraint pk_bourse primary key(bno)); 

insert into etablissement (statut, codeUAI, établissement, académie, rno) select distinct i.n2, i.n3, i.n4, i.n8, r.rno 
from import as i join région as r on i.n9 = r.académie;

insert into région (codedep, département, région, académie, commune, GPS) select distinct n5, n6, n7, n8, n9, n17 from import; 

INSERT INTO neobachelier (effnéo, néopro, néogen, néotech, autre, effcandidates, genc, techc, procl, autrec,fno,bno) 
SELECT DISTINCT
    CAST(i.n21 AS INTEGER), 
    CAST(i.n27 AS INTEGER), 
    CAST(i.n23 AS INTEGER), 
    CAST(i.n25 AS INTEGER), 
    CAST(i.n29 AS INTEGER), 
    CAST(i.n20 AS INTEGER), 
    CAST(i.n31 AS INTEGER), 
    CAST(i.n32 AS INTEGER), 
    CAST(i.n33 AS INTEGER), 
    CAST(i.n34 AS INTEGER),
    f.fno,
    b.bno
FROM 
    (import as i join filière as f on f.formation = i.n110) join bourse as b on b.bourgen =i.n24;

    INSERT INTO filière (formation, sélectivité, capacité, totalcandidat, codaff, tauxaccès,eno) 
SELECT DISTINCT
    i.n10, 
    i.n11, 
    CAST(i.n18 AS INTEGER), 
    CAST(i.n19 AS INTEGER), 
    CAST(i.n110 AS INTEGER), 
    CAST(i.n113 AS float),
    e.eno  
FROM 
    import as i join etablissement as e
    on e.statut = n2;

    INSERT INTO admission (atotal,agen, apro, atech, aautre, genmention, techmention, promention, aetabgen, aetabtech, aetabpro, 
    aetabautre,acandidate, effaccept, propavproprin, pouradmis,effadbour,pouradbour,nno,fno,bno) 
SELECT DISTINCT
    CAST(i.n49 AS INTEGER), 
    CAST(i.n57 AS INTEGER), 
    CAST(i.n59 AS INTEGER), 
    CAST(i.n58 AS INTEGER),
    CAST(i.n60 AS INTEGER),
    CAST(i.n67 AS INTEGER),
    CAST(i.n68 AS INTEGER),
    CAST(i.n69 AS INTEGER),
    CAST(i.n95 AS float),
    CAST(i.n97 AS float),
    CAST(i.n99 AS float),
    CAST(i.n101 AS float),
    CAST(i.n48 AS INTEGER),
    CAST(i.n47 as float),
    CAST(i.n53 as float),
    CAST(i.n76 as float),
    CAST(i.n55 as float),
    CAST(i.n81 as float)
FROM 
    ((import as i join neobachelier as n on n.effnéo = i.n21) join filière as f on f.formation = i.n10) join bourse as b on b.bourgen =i.n24 ;

        INSERT INTO bourse (bourgen, bourtech, bourpro, bourgenc, bourtechc, bourproc) 
SELECT DISTINCT
    CAST(n24 AS INTEGER), 
    CAST(n26 AS INTEGER), 
    CAST(n28 AS INTEGER), 
    CAST(n40 AS INTEGER),
    CAST(n42 AS INTEGER),
    CAST(n44 AS INTEGER)
FROM 
    import;