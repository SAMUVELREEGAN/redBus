import './App.css';
import { BrowserRouter, Routes, Route } from "react-router-dom";
import LoginPage from './busmodel/Pages/LoginPage';
import HomePage from './busmodel/Pages/HomePage';

function App() {
  return (
    <div className="App">
        <BrowserRouter>
      <Routes>
        <Route path="/busowner" element={<LoginPage />} />
        <Route path="/busmodelhome" element={<HomePage />} />
      </Routes>
    </BrowserRouter>
    </div>
  );
}

export default App;
