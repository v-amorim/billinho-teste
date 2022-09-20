import React from "react";

function Students(props) {
  return (
    <div>
      <h1>These students are from the API</h1>
      {props.students.map((student) => {
        return (
          <div key={student.name}>
            <p>{student.cpf}</p>
            <p>{student.birth}</p>
            <p>{student.tell}</p>
            <p>{student.gender}</p>
            <p>{student.payment}</p>
          </div>
        );
      })}
    </div>
  );
}

export default Students;
