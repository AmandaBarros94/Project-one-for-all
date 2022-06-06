SELECT
  MIN(plans.plan_value) AS faturamento_minimo,
  MAX(plans.plan_value) AS faturamento_maximo,
  ROUND(AVG(plans.plan_value), 2) AS faturamento_medio,
  SUM(plans.plan_value) AS faturamento_total
FROM
  plans
  JOIN user_plan ON user_plan.plan_id = plans.plan_id;