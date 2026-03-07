Fraud Detection & Monitoring System

 Este proyecto consiste en el análisis de transacciones financieras para la detección de patrones de fraude, 
utilizando SQL y automatización mediante Power Automate.
Se desarrolló un enfoque analítico para identificar comportamientos sospechosos, segmentar usuarios según su nivel de 
riesgo y generar alertas automáticas para la detección temprana de fraude.

 Objetivos:
- Analizar grandes volúmenes de transacciones.
- Detectar patrones de fraude.
- Identificar segmentos de alto riesgo.
- Generar insights accionables.
- Automatizar alertas de fraude.

 Dataset:
El análisis se realizó sobre un dataset de transacciones que incluye id_usuario, fecha (step), monto, medio_pago
y es_fraude (0 o 1).

 Análisis Realizados:
- Tasa de fraude total
Se calculó el porcentaje de transacciones fraudulentas sobre el total.
Resultado aproximado: 0.13%.

- Impacto económico del fraude
Se evaluó el monto total asociado a fraude para medir su impacto en el negocio.

- Fraude por medio de pago
Se analizaron las transacciones por tipo de medio de pago.
Hallazgo:
El fraude se concentra principalmente en TRANSFER y CASH_OUT

- Usuarios nuevos vs usuarios antiguos
Se clasificaron los usuarios según su antigüedad (primeras 24 horas desde su primera transacción).
Hallazgos:
Los usuarios nuevos concentran el mayor volumen de fraude
Los usuarios antiguos presentan menor volumen pero tasas comparables

- Análisis combinado (medio de pago + tipo de usuario)
Se identificaron los segmentos de mayor riesgo.
Hallazgo clave:
TRANSFER + usuarios nuevos → mayor impacto económico
CASH_OUT + usuarios nuevos → alto volumen de fraude

- Actividad sospechosa
Se detectaron usuarios con comportamientos anómalos:
Transacciones de alto monto.
Baja cantidad de operaciones.
Alta tasa de fraude.
Hallazgo:
Se identificó un patrón de fraude tipo “one-shot”, donde el fraude ocurre en una única transacción de alto valor.

 Automatización con Power Automate: se implementó un flujo automatizado para el monitoreo de fraude
Funcionalidades:
- Lectura automática de reportes generados en Excel (OneDrive).
- Evaluación de umbrales de riesgo: alta tasa de fraude y alto monto fraudulento.
- Envío automático de alertas por email.
- Monitoreo continuo de segmentos de alto riesgo.
Esto permite una detección temprana de fraude sin intervención manual.

 Conclusiones:
- El fraude se concentra en usuarios nuevos utilizando medios como TRANSFER y CASH_OUT
- Existen múltiples patrones de fraude: fraude por volumen y fraude de alto monto.
- La combinación de análisis y automatización permite mejorar la detección y respuesta ante fraude.

 Recomendaciones:
- Implementar controles adicionales en usuarios nuevos.
- Limitar montos en primeras transacciones.
- Aplicar validaciones más estrictas en TRANSFER y CASH_OUT.
- Monitorear transacciones de alto valor.
- Continuar automatizando procesos de detección.

 Tecnologías utilizadas:
- SQL (SQLite).
- Excel.
- Power Automate.