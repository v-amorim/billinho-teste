import React from "react";

function Students(props) {
  return (
    <div>
      <h1>These students are from the API</h1>
      <table>
        <thead>
          <tr>
            <th>Nome</th>
            <th>Genero</th>
            <th>CPF</th>
            <th>Nascimento</th>
            <th>Metodo de Pagamento</th>
          </tr>
        </thead>
      </table>
      {props.students.map((student) => {
        return (
          <div key={student.name}>
            <table>
              <tbody>
                <tr>
                  <td>{student.name}</td>
                  <td>{student.gender}</td>
                  <td>{student.cpf}</td>
                  <td>{student.birthday}</td>
                  <td>{student.payment_method}</td>
                </tr>
              </tbody>
            </table>
          </div>
        );
      })}
    </div>
  );
}

export default Students;
