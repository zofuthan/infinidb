-- $Id: q06-tpch17.sql 2657 2007-06-12 16:08:15Z rdempsey $
-- 6th query in 100 GB stream0 (tpch17).

SELECT 
	SUM(L_EXTENDEDPRICE)/7.0 AS AVG_YEARLY
FROM 
	LINEITEM,
	PART
WHERE 
	P_PARTKEY = L_PARTKEY AND
	P_BRAND = 'Brand#22' AND
	P_CONTAINER = 'JUMBO PACK' AND
	L_QUANTITY < ( 
		SELECT 
			0.2 * AVG(L_QUANTITY)
		FROM
			LINEITEM
		WHERE
			L_PARTKEY = P_PARTKEY
	);

