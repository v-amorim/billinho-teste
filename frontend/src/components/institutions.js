import React from "react";

function Institutions(props) {
  return (
    <div>
      <h1>These Institutions are from the API</h1>
      <table>
        <thead>
          <tr>
            <th>Nome</th>
            <th>CNPJ</th>
            <th>Tipo</th>
          </tr>
        </thead>
      </table>
      {props.institutions.map((institution) => {
        return (
          <div key={institution.name}>
            <table>
              <tbody>
                <tr>
                  <td>{institution.name}</td>
                  <td>{institution.cnpj}</td>
                  <td>{institution.i_type}</td>
                </tr>
              </tbody>
            </table>
          </div>
        );
      })}
    </div>
  );
}

export default Institutions;
