/*
Envolventes

Hasta ahora hemos creado sonidos que mantienen su duración indefinidamente y sólo se detienen de manera manual, pero ¿qué pasa si quisieramos un sonido corto que se detuviera automáticamente después de 0.3 segundos?

La respuesta es utilizar una envolvente.

Una envolvente es una señal de forma y duración personalizable. Usualmente se constituye de varios segmentos conectados de inicio a fin. Su uso más común es automatizar valores de amplitud, pero puede servirnos para automatizar casi cualquier parámetro.

A la hora de controlar amplitud, una envolvente comunmente:
1. Inicia en 0
2. Sube de manera más o menos gradual a algun valor
3. Se mantiene en dicho valor por un momento
4. Regresa a 0
*/

Env.linen(1,3,1).plot;

/*
El primer segmento de esta envolvente es por convención llamado ataque (attack). El segundo se conoce como sostenimiento (sustain). El tercero se conoce como relajación (release).

Existen muchas variaciones más o menos estandarizadas de envolventes de amplitud. Siendo ADSR (attack, decay, sustain y release) la más común. Esta envolvente agrega un segmento de decaimiento (decay) entre el ataque y el sostenimiento.
*/

Env.new([0,1,0.65,0.65,0],[0.2,0.1,0.8,0.1]).plot;

//Es importante señalar que ASR y ADSR son solo convenciones de envolventes de amplitud que asemejan comportamiento de sonidos no sintéticos. Sin embargo, en el mundo electrónico, una envolvente es una señal automatizada y personalizable que puede ser usada para controlar cualquier aspecto de un algoritmo de señal.

//Envolventes de amplitud asociadas a un piano y un violín:
(
var ventana, img;
ventana = Window("Envolventes de violín y piano", Rect(200, 300, 1367.25, 420.75));
img = Image.open(thisProcess.nowExecutingPath.dirname +/+ "/media/env_piano_violin.png");

UserView(ventana,ventana.view.bounds).drawFunc_({img.drawInRect(Rect(0, 0, 1367.25, 420.75)) });

ventana.front;
);

//Envolvente aleatoria
(
var num = rrand(4, 15);
Env.new(
    Array.fill(num, { rrand(100, 800) }).postln,
    Array.fill(num - 1, { rrand(0.3, 8) }),
	Array.fill(num - 1, { rrand(-10, 10) })
).plot;
)

/*
Pero entonces, ¿Cómo incorporamos envolventes a nuestras definciones de síntesis?

Existen difeerentes clases que nos permiten incorporar envolventes para controlar parámetros de generadores de unidades. Algunas de ellas son: */

Line
XLine
Linen
EnvGen


//Probemos Line, XLine, Linen como envolventes de amplitud para el siguiente sintetizador:

(
SynthDef.new(
	\miPrimerSinte,
	{
		arg freq = 440, amp = 0.4;
		var sig;
		sig = Pulse.ar(freq,0.4,amp); //Argumentos de frecuencia y amplitud
		Out.ar(0,sig) //Especificación de la salida
		}
).add;
)




 Line generates a signal that
travels linearly from one value to another over a duration in seconds. XLine is similar but
features an exponentially curved trajectory.


The UGens Line and XLine provide simple envelope shapes. Line generates a signal that
travels linearly from one value to another over a duration in seconds. XLine is similar but
features an exponentially curved trajectory. Like the exprand and exprange methods,
the start and end values for XLine must have the same sign and neither can be zero. Code
Example 2.14 and Figure 2.8 depict the usage and visual results of using these UGens as am-
plitude envelopes. Note that XLine cannot end at zero, but it can get close enough that the
difference is unnoticeable.

Line and XLine include an argument, named doneAction, which appears in UGens that
have an inherently finite duration. In SC, a doneAction represents an action that the audio
server takes when the UGen that contains the doneAction has finished. These actions can be
specified by integer, and a complete list of available actions and their meanings appears in the
help file for the Done UGen. Most of the descriptions in this table may look completely mean-
ingless to you, but if so, don’t worry. In practice, we rarely employ a doneAction other than
zero (do nothing) or two (free the enclosing synth). The default doneAction is zero, and while
taking no action sounds harmless, it carries consequences. To demonstrate, evaluate either of
the two code examples in Code Example 2.14 many times in a row. As you do, you’ll notice
your CPU usage will gradually creep upwards.
Why does this happen? Because a doneAction of zero tells the server to do nothing when
the envelope is complete, the envelope remains active on the server and continues to output
its final value indefinitely. These zero or near-zero values are multiplied by the sine oscillator,
which results in a silent or near-silent signal. The server is indifferent to whether a sound pro-
cess is silent; it only knows that it was instructed to do nothing when the envelope finished.
If you evaluate this code over and over, you’ll create more and more non-terminating sound
processes. Eventually, the server will become overwhelmed, and additional sounds will start
glitching (if you’ve followed these instructions and ramped up your CPU numbers, now is a
good time to press [cmd]+[period] to remove these “ghost” sounds).
From a practical perspective, when our envelope reaches its end, we consider the sound to
be totally finished. So, it makes sense to specify 2 for the doneAction. When running the code
in Code Example 2.15, the server automatically frees the sound when the envelope is done.
Evaluate this code as many times as you like, and although it won’t sound any different, you’ll
notice that CPU usage will not creep upwards as it did before.

Knowing which doneAction to specify is an important skill, essential for automating the
cleanup of stale sounds and optimizing usage of the audio server’s resources.



Intérprete vs sclang
OSC y byte code
Material de herramientas de sc (NodeTreeView, FreqScope, etc)




*/


s.makeGui