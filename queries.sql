-- 1. Tasa de fraude total
SELECT 
    ROUND(SUM(es_fraude) * 1.0 / COUNT(*), 6) AS tasa_fraude_total,
    COUNT(*) AS total_transacciones,
    SUM(es_fraude) AS total_fraudes
FROM transacciones;


-- 2. Impacto económico del fraude
SELECT 
    ROUND(SUM(monto), 2) AS monto_total,
    ROUND(SUM(CASE WHEN es_fraude = 1 THEN monto ELSE 0 END), 2) AS monto_fraudulento
FROM transacciones;


-- 3. Fraude por medio de pago
SELECT 
    medio_pago,
    COUNT(*) AS total_transacciones,
    SUM(es_fraude) AS total_fraudes,
    ROUND(SUM(es_fraude) * 1.0 / COUNT(*), 6) AS tasa_fraude
FROM transacciones
GROUP BY medio_pago;


-- 4. Usuarios nuevos vs viejos
SELECT 
    CASE 
        WHEN t.fecha <= f.primer_fecha + 24 THEN 'nuevo'
        ELSE 'viejo'
    END AS tipo_usuario,
    COUNT(*) AS total_transacciones,
    SUM(t.es_fraude) AS total_fraudes,
    ROUND(SUM(t.es_fraude) * 1.0 / COUNT(*), 6) AS tasa_fraude
FROM transacciones t
JOIN (
    SELECT id_usuario, MIN(fecha) AS primer_fecha
    FROM transacciones
    GROUP BY id_usuario
) f
ON t.id_usuario = f.id_usuario
GROUP BY tipo_usuario;


-- 5. Medio de pago + tipo de usuario
SELECT
    t.medio_pago,
    CASE
        WHEN t.fecha <= f.primer_fecha + 24 THEN 'nuevo'
        ELSE 'viejo'
    END AS tipo_usuario,
    COUNT(*) AS total_transacciones,
    SUM(t.es_fraude) AS total_fraudes,
    ROUND(SUM(t.es_fraude) * 1.0 / COUNT(*), 6) AS tasa_fraude
FROM transacciones t
JOIN (
    SELECT id_usuario, MIN(fecha) AS primer_fecha
    FROM transacciones
    GROUP BY id_usuario
) f
ON t.id_usuario = f.id_usuario
GROUP BY t.medio_pago, tipo_usuario;


-- 6. Actividad sospechosa
SELECT
    t.id_usuario,
    COUNT(*) AS total_transacciones,
    ROUND(SUM(t.monto), 2) AS monto_total,
    SUM(t.es_fraude) AS total_fraudes,
    ROUND(SUM(t.es_fraude) * 1.0 / COUNT(*), 6) AS tasa_fraude
FROM transacciones t
WHERE t.fecha >= (SELECT MAX(fecha) FROM transacciones) - 24
GROUP BY t.id_usuario
HAVING COUNT(*) >= 10
   OR SUM(t.monto) >= 50000
ORDER BY total_fraudes DESC;