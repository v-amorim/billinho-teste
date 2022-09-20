import "./App.css";
import axios from "axios";
import Students from "./components/students";
import Institutions from "./components/institutions";
import { useEffect, useState } from "react";

const STUDENT_API_URL = "http://localhost:3000/api/v1/students";
const INSTITUTION_API_URL = "http://localhost:3000/api/v1/institutions";

function getStudentAPIData() {
  return axios.get(STUDENT_API_URL).then((response) => response.data);
}

function getInstitutionAPIData() {
  return axios.get(INSTITUTION_API_URL).then((response) => response.data);
}

function App() {
  const [students, setStudents] = useState([]);
  const [institutions, setInstitutions] = useState([]);

  useEffect(() => {
    let mounted = true;
    getStudentAPIData().then((items) => {
      if (mounted) {
        setStudents(items);
        setInstitutions(items);
      }
    });
    return () => (mounted = false);
  }, []);

  useEffect(() => {
    let mounted = true;
    getInstitutionAPIData().then((items) => {
      if (mounted) {
        setInstitutions(items);
      }
    });
    return () => (mounted = false);
  }, []);

  return (
    <div className="App">
      <h1>Hello</h1>
      <Students students={students} />
      <Institutions institutions={institutions} />
    </div>
  );
}

export default App;
