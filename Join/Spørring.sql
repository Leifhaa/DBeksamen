select fornavn, count(*) - 1 as AntallJobberIDIttFylke from bruker
left join Oppdrag
on Bruker.BrukerNr = Oppdrag.BrukerNr
inner join Kommune
on Oppdrag.KNr = Kommune.KNr
inner join Fylke
on Kommune.FNr = Fylke.FNr
where Fnavn = 'Oppland'
group by Fnavn