// import React, { useEffect, useState } from "react";
// function NewStudent() {
//   const [studentName, setStudentName] = useState("");
//   const [studentGender, setStudentGender] = useState("");
//   const [studentCPF, setStudentCPF] = useState("");
//   const [studentBirth, setStudentBirth] = useState("");
//   const [studentPayment, setStudentPayment] = useState("");

//   function saveData() {
//     let data = {
//       studentName,
//       studentGender,
//       studentCPF,
//       studentBirth,
//       studentPayment,
//     };
//     // console.warn(data);
//     fetch("http://localhost:3000/api/v1/students", {
//       method: "POST",
//       headers: {
//         Accept: "application/json",
//         "Content-Type": "application/json",
//       },
//       body: JSON.stringify(data),
//     }).then((resp) => {
//       // console.warn("resp",resp);;
//       resp.json().then((result) => {
//         console.warn("result", result);
//       });
//     });
//   }
//   return (
//     <div className="NewStudent">
//       <h1>POST API Example </h1>
//       <input
//         type="text"
//         name="name"
//         value={studentName}
//         onChange={(e) => {
//           setStudentName(e.target.value);
//         }}
//       />{" "}
//       <br /> <br />
//       <input
//         type="text"
//         name="Gender"
//         value={studentGender}
//         onChange={(e) => {
//           setStudentGender(e.target.value);
//         }}
//       />{" "}
//       <br /> <br />
//       <input
//         type="text"
//         name="CPF"
//         value={studentCPF}
//         onChange={(e) => {
//           setStudentCPF(e.target.value);
//         }}
//       />{" "}
//       <br /> <br />
//       <input
//         type="text"
//         name="Birth"
//         value={studentBirth}
//         onChange={(e) => {
//           setStudentBirth(e.target.value);
//         }}
//       />{" "}
//       <br /> <br />
//       <input
//         type="text"
//         name="Payment"
//         value={studentPayment}
//         onChange={(e) => {
//           setStudentPayment(e.target.value);
//         }}
//       />{" "}
//       <br /> <br />
//       <button type="button" onClick={saveData}>
//         Save New User
//       </button>
//     </div>
//   );
// }
// export default NewStudent;

import React from "react";

function newStudent() {
  return (
    <div>
      About
    </div>
  );
}

export default newStudent;