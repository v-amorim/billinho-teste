import "./App.css";

import {
  BrowserRouter as Router,
  Routes,
  Route
} from "react-router-dom";

// import Home component
import Home from "./components/homes";

function App() {
  return (
    <div className="App">
      <Router>
        <Routes>
          <Route path="/" element={<Home />} />
        </Routes>
      </Router>
    </div>
  );
}

export default App;
