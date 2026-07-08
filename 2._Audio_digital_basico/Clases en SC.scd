//Tipos de datos en supercollider

//NUMEROS

////////////////////////////////////Clase.
SimpleNumber.

//Contiene a su vez las clases

Integer //ENTEROS.

100.class; //el metodo .class pregunta a un objeto por su clase.

Float //DECIMALES.

3.1416.class;

//Objeto que integra tanto numeros enteros y decimales y que soporta todo el ecosistema de operaciones matemáticas.

//Suma
4 + 3; //7

(
var x;

x = {
	arg x = 4, y = 3;
	x + y;
};
x.();
)

//Resta
4 - 3; //1

(
var x;

x = {
	arg x = 4, y = 3;
	x - y;
};
x.();
)

//multiplicación
4 * 3; //12

(
var x;

x = {
	arg x = 4, y = 3;
	x * y;
};
x.();
)

//división
4 / 3; //1.33..

(
var x;

x = {
	arg x = 4, y = 3;
	x / y;
};
x.();
)

//modulo : residuo generado por la división.
4 % 3; //1
4.mod(3); //otra forma de expresarlo.

4 - (floor(4/3) * 3) //Operación desglosada.

(
var x;

x = {
	arg x = 4, y = 3;
	x.mod(y);
};
x.();
)

//div: división sin el residuo.

4.div(3) //1.

(2/3).floor //otra forma de expresarlo.

(
var x;

x = {
	arg x = 4, y = 3;
	x.div(y);
};
x.();
)

//** : Exponencial.
4**3 //4^3 = 4 * 4 * 4 = 64

(
var x;

x = {
	arg x = 4, y = 3;
	x**y;
};
x.();
)

//redondear
4.round(3) //redondea a un multiplo del valor indicado.
1.49.round //por defecto redondea a numeros enteros tomando como referencia 0.5.
1.5.round

4.7.floor //redondea hacia abajo
3.1.roundUp //redondea hacia arriba.
3.1.ceil; //redondea hacia arriba.

//.neg : numero negativo.
4.neg;
-4.neg;

//.abs : numero absoluto.
-3.abs;

//.sign : signo.

3.sign; // 1 = positivo.
-3.sign // -1 = negativo.

//trigonometria.
//.sin;
pi;

(pi/2).sin; //1

2pi.cos //1.

//.sqrt : raiz cuadrada.

16.sqrt; //4

//.pow : potencia.

4.pow(3) //4 * 4 * 4.

//Convertir de un rango de valores a otro. [MAP]

//.linlin "map de rango linear a rango linear"
(
var x = 0; //definimos variable "x"
10.do({ //abrimos una funcion "do"
	x.linlin(0,10,0,100).postln; //linlin transforma linearmente los valores recibidos de 0 en adelante a un rango de 10 a 100.
	x = x + 1; //realizamos un incremento de la variable.
}) //.postln publica en la postwindow los resultados.
)

//.linexp "map de rango linear a rango exponencial"
(
var x = 0; //definimos variable "x"
10.do({ //abrimos una funcion "do"
	x.linexp(0,10,20,2e4).postln; //linexp transforma exponencialmente los valores recibidos.
	x = x + 1; //realizamos un incremento de la variable.
}) //.postln publica en la postwindow los resultados.
)

//CONVERSIONES

//.degrad : convierte un numero de grados a radianes.
180.degrad; //pi

//.raddeg : convierte un numero de radianes a grados.

(pi/2).raddeg;

//midicps : convierte valores de MIDI a ciclos por segundo (Hz).

60.midicps;

//.cpsmidi : convierte de ciclos por segundo a MIDI.

440.cpsmidi;

//.midiname : convierte valores de MIDI a nombre de nota.

60.midiname;

//.midiname : convierte nombre de nota a numero MIDI.

"A3".namemidi;

//.midiratio : Convierte un invervalo en semitonos a una proporción.
12.midiratio; //2.

//.ratiomidi : Convierte una proporción a invervalo en semitonos.
0.5.ratiomidi; //2.

//.ampdb : conviete de amplitud linear a decibeles.
0.5.ampdb;

//.dbamp : conviete de decibeles amplitud linear.
0.dbamp;

//.reciprocal : el reciproco de un numero ie: (1/x).
10.reciprocal;
0.1.reciprocal;

//Numeros RANDOM.

//.coin
coin(0.5) //X% de probabilidad de ser verdadero o falso.

//.rand : numero random de 0 a x.
100.rand; //numeros enteros.
10.0.rand;

//.rand2 : numeros random entre -x y x.
10.rand2;

//.rrand : numeros random en un rango.
1.rrand(50);
rrand(1,50); //también se puede expresar con el metodo antes.

//.exprand : distribución exponencial de numeros aleatorios.
exprand(1,1000);
exprand(0,100); //PRECAUCIÓN. El cero y exp no se llevan bien.


////////////////////////////////////Clase.
String

//Es una colección ordenada de caracteres.

~str = "Esto es un string";
~str.class;

~str.size; //Consideran un tamaño.
~str.at(0); //Cada elemento del string responde a una posición.

~str.do{|i,in| [i,in].postln};

~str.reverse; //se puede revertir.
~str.scramble; //se puede reordenar
~str.drop(4); //se puede modificaar.
~str.choose //se puede elegir un elemento al azar.

~str2 = "Este es otro";

~str + ~str2; //Se pueden "concatenar" mas de un string"
~str ++ ~str2;

"4".asInteger.class; //Podemos transformar elementos de un string a Enteros

4.asString.class; //De igual manera podemos convertir un entero a String.

////////////////////////////////////Clase.
Symbol

//Secuencia no ordenada de caracteres "sin tamaño" que se emplea para identificar y etiquetar (nombrar) procesos dentro de ciertos contextos.

'Esto es un symbol'.class;
\EstoEsUnSymbol.class;

~sym = \symbol;
~sym.size; //no tiene tamaño por mas grande que sea.

~sym + 5; //Los simbolos dan como resultado ellos mismos frente a operaciones.

~sym ++ ~sym //también se pueden "concatenar".

\4.asInteger + 4; //Se pueden convertir a enteros.

4.asSymbol.class; //También se puede convertir un entero a Symbol.

//.kr
//un simbolo seguido de la terminación ".kr" define un argumento de control dentro de una función. Incluye un parametro de valor predeterminado y uno de latencia.

~ktrl = {SinOsc.ar(\freq.kr(440, 1)) * 0.1}.play; //No definimos el argumento freq, pero lo creamos mediante \freq.kr.
~ktrl.set(\freq, 220);
~ktrl.release(1);

////////////////////////////////////Clase.
Array


