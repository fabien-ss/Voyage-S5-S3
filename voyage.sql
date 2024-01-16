create table bouquet
	(
		idBouquet serial primary key,
		nom varchar(250)
	);


	insert into bouquet(nom) values('premium'),('vip');

create table activite
	(
		idActivite serial primary key,
		nom varchar(250)
	);

create table AssocBouqAct(
	idActivite int,
	idBouquet int 
);
alter table AssocBouqAct add foreign key(idActivite) references activite(idActivite); 
alter table AssocBouqAct add foreign key(idBouquet) references bouquet(idBouquet); 

create or replace view v_bouquetActivite as 
	select AssocBouqAct.*,bouquet.nom as nomBouquet,activite.nom as nomActivite 
	from bouquet,activite,AssocBouqAct 
	where AssocBouqAct.idActivite=activite.idActivite and AssocBouqAct.idBouquet=bouquet.idBouquet;