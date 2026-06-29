/*
No todo funciona siempre como quisiéramos, ni en la vida ni en SuperCollider... para esas ocasiones es bastante útil hacer un análisis de qué es exactamente lo que no funcionó, implementar estrategias alternativas, e intentarlo una y otra repitiendo este proceso hasta que funcione. 

En la vida es todo más complejo, pero en SuperCollider tenemos los mensajes de error, que nos ayudan a identificar de manera precisa qué es lo que no está funcionando, facilitando la implementación de nuevas estrategias.

Los mensajes de error se despliegan el la Ventana de mensajes de SuperCollider, y usualmente se conforman de tres partes:

1) El texto de error (usualmente en rojo)
2) Una impresión detallada del objeto receptor del método que causó el error y/o de los argumentos usados en este. Esto es útil para saber qué objeto estaba ejecutando la parte del código que falló y los valores recibió.
3) Una impresión detallada del conjunto de llamadas (call stack) hasta el punto donde ocurrió el error. La primera llamada que se postea es la llamada en donde ocurrió el error, las siguientes son las llamadas que llevaron hacia ese error (en orden de la más reciente a la más antigua).

*/

//Ejemplo de error:
SinOsc.instance;