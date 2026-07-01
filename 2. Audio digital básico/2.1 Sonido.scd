/*
2.1 Sonido

¿Qué es el Sonido?

El sonido resulta de la perturbación mecánica de un objeto en un medio elástico (medios con la capacidad de experimentar deformaciones reversibles frente a la acción de fuerzas externas, recuperando su configuración original al cesar su acción).
*/

"https://www.youtube.com/watch?v=XOCGb5ZGEV8".openOS;

(thisProcess.nowExecutingPath.dirname +/+ "media/direcciones.gif").openOS;

//Estas perturbaciones generan vibraciones conocidas como ondas mecánicas (perturbaciones que avanzan o se propagan en un medio material).

(thisProcess.nowExecutingPath.dirname +/+ "media/comp-rare.gif").openOS;
(thisProcess.nowExecutingPath.dirname +/+ "media/comp-rare-sin.gif").openOS;

//Los humanos percibimos el sonido debido al cambio de presión del aire al interior de nuestros oídos, causando que nuestro típano vibre.

(thisProcess.nowExecutingPath.dirname +/+ "media/escucha.gif").openOS;

//Si la presión varía deacuerdo a un patrón repetitivo, hablamos de una forma de onda periódica.
{SinOsc.ar(220,mul: 0.3)}.scope;

//Si no hay un patrón discernible, hablamos de ruido.
{WhiteNoise.ar(0.2)}.scope;

//Enmedio de estos extremos existe un inmenso expectro de sonidos casi periódicos/ruidosos.

//Una ciclo perteneciente a una forma de onda periódica es llamada periodo.

(thisProcess.nowExecutingPath.dirname +/+ "media/periodo.png").openOS;

//El número de ciclos por segundo de una onda periódica definen su frecuencia fundamental. Los ciclos por segundo se miden en Hertz (1Hz = 1 ciclo por segundo) y se perciben como la altura de un sonido (que tan grave o agudo es).

{SinOsc.ar(100)}.scope;




The amplitude of the waveform is the amount of air pressure change; we can measure amplitude as the vertical distance from the zero pressure point to the highest (or lowest) points of a given waveform segment.

The starting point of a periodic waveform on the y or amplitude axis is its initial phase. For example, a typical sine wave starts at the amplitude point 0 and completes its cycle at 0. If we displace the starting point by π/2 radians or 90° on the horizontal axis then the sinusoidal wave starts and ends at 1 on the amplitude axis. By convention this is called a cosine wave. In effect, a cosine is equivalent to a sine wave that is phase shifted by 90° (figure 2.3).




//Las ondas mecánicas pueden ser representadas como señales eléctricas o datos digitales que después pueden reproducir ondas mecánicas.





/*
Fuentes:

https://www.flippingphysics.com/sound.html
https://jvaraujo.art/programacioncreativa/capitulo-7/06-generar-sonidos/

/*