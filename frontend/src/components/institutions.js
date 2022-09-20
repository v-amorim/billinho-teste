import React from "react";

function Institutions(props) {
  return (
    <div>
      <h1>These Institutions are from the API</h1>
      {props.institutions.map((institution) => {
        return (
          <div key={institution.name}>
            <h2>Nome: {institution.name}</h2>
            <p>CNPJ: {institution.cnpj}</p>
            <p>Tipo: {institution.i_type}</p>
          </div>
        );
      })}
    </div>
  );
}

export default Institutions;
