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
    </div>
  );
}

export default Students;
