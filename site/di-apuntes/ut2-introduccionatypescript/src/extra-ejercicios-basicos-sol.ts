// Ejercicio 1: Comprobación de Número Positivo, Negativo o Cero
function comprobarNumero(numero: number): void {
    if (numero > 0) {
        console.log('El número es positivo.');
    } else if (numero < 0) {
        console.log('El número es negativo.');
    } else {
        console.log('El número es cero.');
    }
}

// Pruebas del Ejercicio 1
comprobarNumero(5);   // El número es positivo.
comprobarNumero(-3);  // El número es negativo.
comprobarNumero(0);   // El número es cero.

// Ejercicio 2: Verificación de Contenido de Texto
function contienePalabra(texto: string, palabra: string): void {
    if (texto.toLowerCase().includes(palabra.toLowerCase())) {
        console.log(`Contiene la palabra '${palabra}'.`);
    } else {
        console.log(`No contiene la palabra '${palabra}'.`);
    }
}

// Pruebas del Ejercicio 2
contienePalabra('Estoy aprendiendo TypeScript', 'typescript'); // Contiene la palabra 'typescript'.
contienePalabra('Me gusta programar', 'typescript');          // No contiene la palabra 'typescript'.

// Ejercicio 3: Verificación de Año Bisiesto
function esAnioBisiesto(anio: number): void {
    if ((anio % 4 === 0 && anio % 100 !== 0) || (anio % 400 === 0)) {
        console.log(`${anio} es un año bisiesto.`);
    } else {
        console.log(`${anio} no es un año bisiesto.`);
    }
}

// Pruebas del Ejercicio 3
esAnioBisiesto(2024); // 2024 es un año bisiesto.
esAnioBisiesto(2023); // 2023 no es un año bisiesto.

// Ejercicio 4: Clasificación de Calificaciones
function clasificarCalificacion(calificacion: number): void {
    if (calificacion >= 90) {
        console.log('Sobresaliente');
    } else if (calificacion >= 75) {
        console.log('Notable');
    } else if (calificacion >= 50) {
        console.log('Aprobado');
    } else {
        console.log('Reprobado');
    }
}

// Pruebas del Ejercicio 4
clasificarCalificacion(95); // Sobresaliente
clasificarCalificacion(80); // Notable
clasificarCalificacion(60); // Aprobado
clasificarCalificacion(40); // Reprobado

// Ejercicio 5: Conversión de Temperatura
function convertirTemperatura(celsius: number): void {
    const fahrenheit = (celsius * 9 / 5) + 32;
    console.log(`${celsius} °C son ${fahrenheit.toFixed(2)} °F.`);

    if (celsius > 30) {
        console.log('Hace calor.');
    } else if (celsius <= 10) {
        console.log('Hace frío.');
    } else {
        console.log('Temperatura moderada.');
    }
}

// Pruebas del Ejercicio 5
convertirTemperatura(35); // Hace calor.
convertirTemperatura(5);  // Hace frío.
convertirTemperatura(20); // Temperatura moderada.

// Ejercicio 6: Juego Automático de Piedra, Papel o Tijera
function generarOpcion(): string {
    const opciones = ['Piedra', 'Papel', 'Tijera'];
    const indiceAleatorio = Math.floor(Math.random() * 3);
    return opciones[indiceAleatorio];
}

function jugarPiedraPapelTijera(): void {
    const jugador1 = generarOpcion();
    const jugador2 = generarOpcion();

    console.log(`Jugador 1 elige: ${jugador1}`);
    console.log(`Jugador 2 elige: ${jugador2}`);

    if (jugador1 === jugador2) {
        console.log('Es un empate.');
    } else if (
        (jugador1 === 'Piedra' && jugador2 === 'Tijera') ||
        (jugador1 === 'Papel' && jugador2 === 'Piedra') ||
        (jugador1 === 'Tijera' && jugador2 === 'Papel')
    ) {
        console.log('Jugador 1 gana.');
    } else {
        console.log('Jugador 2 gana.');
    }
}

// Prueba del Ejercicio 6
jugarPiedraPapelTijera();
