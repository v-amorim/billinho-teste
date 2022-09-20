import "./App.css";
import axios from "axios";
import Students from "./components/students";
import { useEffect, useState } from "react";

const API_URL = "http://localhost:3000/api/v1/students";

function getAPIData() {
  return axios.get(API_URL).then((response) => response.data);
}

function App() {
  const [students, setStudents] = useState([]);

  useEffect(() => {
    let mounted = true;
    getAPIData().then((items) => {
      if (mounted) {
        setStudents(items);
      }
    });
    return () => (mounted = false);
  }, []);

  return (
    <div className="App">
      <h1>Hello</h1>
      <Students students={students} />
    </div>
  );
}

export default App;
