select 
ONr,
(select count(bud.BudNr) from bud where Bud.Onr = Oppdrag.Onr) as AntallBud
from oppdrag