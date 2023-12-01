// // SPDX-License-Identifier: MIT
// pragma solidity ^0.8.19;

// contract PiedraPapelTijera {
//     address public owner;
//     address public jugador;
//     address ganador;
//     bool public juegoEnCurso;

//     enum Opcion { Ninguna, Piedra, Papel, Tijera }

//     Opcion public eleccionJugador;
//     Opcion public eleccionContrato;

//     event JuegoTerminado(address ganador, Opcion eleccionGanadora);

//     modifier soloOwner() {
//         require(msg.sender == owner, "Solo el propietario puede llamar a esta funcion");
//         _;
//     }

//     modifier soloJugador() {
//         require(msg.sender == jugador, "Solo el jugador puede llamar a esta funcion");
//         _;
//     }

//     modifier juegoNoEnCurso() {
//         require(!juegoEnCurso, "El juego ya esta en curso");
//         _;
//     }

//     modifier juegoEnCursoActual() {
//         require(juegoEnCurso, "El juego no esta en curso");
//         _;
//     }

//     constructor() {
//         owner = msg.sender;
//     }

//     function unirseAlJuego() external soloOwner juegoNoEnCurso {
//         require(jugador == address(0), "El juego ya tiene un jugador");
//         jugador = msg.sender;
//         juegoEnCurso = true;
//     }

//     function hacerEleccion(Opcion eleccion) external soloJugador juegoEnCursoActual {
//         require(eleccion == Opcion.Piedra || eleccion == Opcion.Papel || eleccion == Opcion.Tijera, "Opcion no valida");

//         eleccionJugador = eleccion;
//         eleccionContrato = generarEleccionContrato();

//         determinarGanador();
//     }

//     function generarEleccionContrato() private view returns (Opcion) {
//         uint256 eleccionRandom = uint256(keccak256(abi.encodePacked(block.timestamp, block.prevrandao, jugador))) % 3;
//         return Opcion(eleccionRandom + 1);
//     }

//     function determinarGanador() private {
//         if (eleccionJugador != Opcion.Ninguna) {
//             if (eleccionJugador == eleccionContrato) {
//                 emit JuegoTerminado(address(0), Opcion.Ninguna); // Empate
//             } else if (
//                 (eleccionJugador == Opcion.Piedra && eleccionContrato == Opcion.Tijera) ||
//                 (eleccionJugador == Opcion.Papel && eleccionContrato == Opcion.Piedra) ||
//                 (eleccionJugador == Opcion.Tijera && eleccionContrato == Opcion.Papel)
//             ) {
//                 emit JuegoTerminado(jugador, eleccionJugador);
//             } else {
//                 emit JuegoTerminado(address(this), eleccionContrato);
//             }

//             reiniciarJuego();
//         }
//     }

//     function reiniciarJuego() private {
//         eleccionJugador = Opcion.Ninguna;
//         eleccionContrato = Opcion.Ninguna;
//     }

    
// }
