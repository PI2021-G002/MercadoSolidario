create or replace view vw_estoque_produto_solidario as
select 
  concat( mc.categoria," ",ps.quantidade, ps.unidade) as produto_solidario,
  ps.id as id,
  IFNULL(sum(es.quantidade) - sum(es.quantidade_saida),0) as em_estoque,
  ps.essencial 
from 
  (mercado_produtosolidario ps left join mercado_estoque es on es.id_produto_id = ps.id),
  mercado_categoria mc 
where 
  ps.id_categoria_id = mc.id 
group by
  ps.id
order by
  produto_solidario;