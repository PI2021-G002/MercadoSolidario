create or replace view vw_analise_previsao as
select
    concat( mc.categoria," ",ps.quantidade, ps.unidade) as produto_solidario,
    ps.id as id,
    ifnull(date_format(ma.data,"%d-%m-%Y"),'-') as data,
    ifnull(sum(mi.quantidade),0) as quantidade
from
    (mercado_produtosolidario ps 
    left join mercado_itensatendimento mi on  mi.id_codigo_id = ps.id
    left join mercado_atendimento ma on mi.id_atendimento_id = ma.id),
    mercado_categoria mc
where
    ps.id_categoria_id = mc.id
group by
    ps.id
   ,ma.data
order by
    produto_solidario
   ,ma.data;