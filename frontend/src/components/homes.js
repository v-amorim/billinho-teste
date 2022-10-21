import "../App.css";
import axios from "axios";
import Students from "./students";
import Institutions from "./institutions";
import { useEffect, useState } from "react";
import { Link } from "react-router-dom";

const STUDENT_API_URL = "http://localhost:3000/api/v1/students";
const INSTITUTION_API_URL = "http://localhost:3000/api/v1/institutions";

function getStudentAPIData() {
    return axios.get(STUDENT_API_URL).then((response) => response.data);
}

function getInstitutionAPIData() {
    return axios.get(INSTITUTION_API_URL).then((response) => response.data);
}

function Home() {
    const [students, setStudents] = useState([]);
    const [institutions, setInstitutions] = useState([]);

    useEffect(() => {
        let mounted = true;
        getStudentAPIData().then((items) => {
            if (mounted) {
                setStudents(items);
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
            <Students students={students} />
            <Link to="/newStudent"> GO TO NEW STUDENT</Link>
            <Institutions institutions={institutions} />
        </div>
    );
}

export default Home;
