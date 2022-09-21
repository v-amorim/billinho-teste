import React from "react";

function Students(props) {
  return (
    <div>
      <h1>These students are from the API</h1>
      {props.students.map((student) => {
        return (
          <div key={student.name}>
            <h2>Nome: {student.name}</h2>
            <p>Genero: {student.gender}</p>
            <p>CPF: {student.cpf}</p>
            <p>Nascimento: {student.birth}</p>
            <p>Metodo de pagamento: {student.payment}</p>
          </div>
        );
      })}
      {/* <table>
        <thead>
          <tr>
            <th>Nome</th>
            <th>Genero</th>
            <th>CPF</th>
            <th>Nascimento</th>
            <th>Metodo de Pagamento</th>
            <th colspan="1"></th>
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
                  <td>{student.birth}</td>
                  <td>{student.payment}</td>
                </tr>
              </tbody>
            </table> */}
    </div>
  );
}

export default Students;
