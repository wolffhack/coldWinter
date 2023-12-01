// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract PiedraPapelTijera {
    address public owner;
    address public jugador;
    address public ganador;
    bool public juegoEnCurso;

    enum Opcion { Ninguna, Piedra, Papel, Tijera }

    struct Jugador {
        Opcion eleccion;
        bool haJugado;
    }

    Jugador public jugadorUno;
    Jugador public jugadorDos;

    event JuegoTerminado(address ganador, Opcion eleccionGanadora);

    modifier soloOwner() {
        require(msg.sender == owner, "Solo el propietario puede llamar a esta funcion");
        _;
    }

    modifier soloJugador() {
        require(msg.sender == jugador1 || msg.sender == jugador2, "Solo los jugadores pueden llamar a esta funcion");
        _;
    }

    modifier juegoNoEnCurso() {
        require(!juegoEnCurso, "El juego ya esta en curso");
        _;
    }

    modifier juegoEnCursoActual() {
        require(juegoEnCurso, "El juego no esta en curso");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function unirseAlJuego() external juegoNoEnCurso {
        require(jugador1 == address(0) || jugador2 == address(0), "El juego ya tiene dos jugadores");
        if (jugador1 == address(0)) {
            jugador1 = msg.sender;
        } else {
            jugador2 = msg.sender;
            juegoEnCurso = true;
        }
    }

    function hacerEleccion(Opcion eleccion) external soloJugador juegoEnCursoActual {
        if (msg.sender == jugador1) {
            jugadorUno.eleccion = eleccion;
            jugadorUno.haJugado = true;
        } else {
            jugadorDos.eleccion = eleccion;
            jugadorDos.haJugado = true;
        }

        if (jugadorUno.haJugado && jugadorDos.haJugado) {
            determinarGanador();
        }
    }

    function generarEleccionContrato() private view returns (Opcion) {
        uint256 eleccionRandom = uint256(keccak256(abi.encodePacked(block.timestamp, block.prevrandao, jugador1, jugador2))) % 3;
        return Opcion(eleccionRandom + 1);
    }

    function determinarGanador() private {
        if (jugadorUno.eleccion != Opcion.Ninguna && jugadorDos.eleccion != Opcion.Ninguna) {
            if (jugadorUno.eleccion == jugadorDos.eleccion) {
                emit JuegoTerminado(address(0), Opcion.Ninguna); // Empate
            } else if (
                (jugadorUno.eleccion == Opcion.Piedra && jugadorDos.eleccion == Opcion.Tijera) ||
                (jugadorUno.eleccion == Opcion.Papel && jugadorDos.eleccion == Opcion.Piedra) ||
                (jugadorUno.eleccion == Opcion.Tijera && jugadorDos.eleccion == Opcion.Papel)
            ) {
                emit JuegoTerminado(jugador1, jugadorUno.eleccion);
                ganador = jugador1;
            } else {
                emit JuegoTerminado(jugador2, jugadorDos.eleccion);
                ganador = jugador2;
            }

            reiniciarJuego();
        }
    }

    function reiniciarJuego() private {
        jugadorUno.eleccion = Opcion.Ninguna;
        jugadorUno.haJugado = false;
        jugadorDos.eleccion = Opcion.Ninguna;
        jugadorDos.haJugado = false;
        juegoEnCurso = false;
    }
}
