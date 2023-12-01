const contrato = "0xff1D128D134eb39668714d50Dec87c7330083151";
const abi = fetch(
  "https://copper-ready-guanaco-464.mypinata.cloud/ipfs/QmQ6iEZrFJQv7pdBoqP2tPaZXaLEQCzDG2ULs8TKXeaRKc?_gl=1*1sijfqw*_ga*MTM1ODQ0MTgxMi4xNjk2NzkyMjEz*_ga_5RMPXG14TE*MTcwMTQwNzYyOC4zNi4xLjE3MDE0MDc4MDcuMzIuMC4w"
);

const juego = "Piedra, Papel, y Tijera!!!!   :D";
const opcion = "Selecciona una opcion:";
let eleccion;

const Wrapper = styled.div`
  --section-gap: 42px;
  padding-top: 52px;
`;

//Definir container de los titulos
const Container1 = styled.div`
  display: flex;
  max-width: 1060px;
  margin: 0 auto;
  gap: var(--section-gap);
  flex-direction: column;
  align-items: center;
  justify-content: center;
  text-align: center;
  padding: var(--section-gap) 24px;
`;

//Definier container de botones
const Container2 = styled.div`
  display: flex;
  max-width: 1060px;
  margin: 0 auto;
  gap: var(--section-gap);
  flex-direction: row;
  align-items: center;
  justify-content: center;
  text-align: center;
  padding: var(--section-gap) 24px;
`;

console.log(abi.body.result);

const setEleccion = (_eleccion) => {
  eleccion = _eleccion;
};

return (
  <div>
    <Web3Connect
      className="ConnectButton"
      connectLabel="Conecta tu wallet"
    ></Web3Connect>
    <Wrapper>
      <Container1>
        <h1>{juego}</h1>
        <h3>{opcion}</h3>
        <p>{eleccion}</p>
      </Container1>
      <Container2>
        <button onclick={setEleccion("Piedra")}>Papel</button>
        <button onclick={setEleccion("Piedra")}>Tijera</button>
      </Container2>
    </Wrapper>
  </div>
);
