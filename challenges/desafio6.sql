SELECT 
	IF(MIN(plans.valor_plano)=0, '0.00','0')  AS faturamento_minimo,
	CONVERT(MAX(plans.valor_plano),CHAR) AS faturamento_maximo,
    CONVERT(ROUND(AVG(plans.valor_plano),2), CHAR) AS faturamento_medio,
	CONVERT(ROUND(SUM(plans.valor_plano),2), CHAR) AS faturamento_total
FROM SpotifyClone.planos AS plans
INNER JOIN SpotifyClone.usuarios AS users ON plans.id_plano = users.id_plano;
