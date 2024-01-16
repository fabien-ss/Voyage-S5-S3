drop table entree_stock;
drop table sortie_stock;

drop view v_stock_entree;
drop view v_stock_sortie;
drop view v_etat_stock;

create table entree_stock
	(
		idActivite int references  activite(idActivite),
		quantite int not null,
		dateEntree date default now()
	);

create table sortie_stock
	(
		idActivite int references  activite(idActivite),
		quantite int not null,
		dateSortie date default now()
	);

create or replace view v_stock_entree as 
	select idActivite,sum(quantite) as quantite, dateEntree
	from entree_stock
	group by idActivite, dateEntree;

create or replace view v_stock_sortie as 
	select idActivite,sum(quantite) as quantite, dateSortie
	from sortie_stock
	group by idActivite, dateSortie;

create or replace view v_etat_stock as 
	select v_stock_entree.idActivite, coalesce(v_stock_entree.quantite-v_stock_sortie.quantite, v_stock_entree.quantite) as quantite,
	activite.nom
	from v_stock_entree left join v_stock_sortie
	on v_stock_entree.idActivite=v_stock_sortie.idActivite
    join activite on activite.idactivite = v_stock_entree.idActivite
;

create or replace view v_final_etat_stock as
select activite.idactivite, coalesce(v_etat_stock.quantite, 0), activite.nom from activite left join v_etat_stock on v_etat_stock.idactivite = activite.idactivite;

select activite.idactivite, coalesce(v_etat_stock.quantite, 0) quantite, activite.nom nom from activite  left join v_etat_stock on v_etat_stock.idactivite = activite.idactivite where  lower(activite.nom) like '%e%';

select  from activite;

