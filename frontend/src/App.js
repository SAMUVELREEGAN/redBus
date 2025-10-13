import './App.css';
import { BrowserRouter, Routes, Route } from "react-router-dom";
import LoginPage from './busmodel/Pages/LoginPage';
import HomePage from './busmodel/Pages/HomePage';
import AddSeats from './busmodel/component/AddSeats';
import ViewSeats from './busmodel/component/ViewSeats';

function App() {
  return (
    <div className="App">
        <BrowserRouter>
      <Routes>
        <Route path="/busowner" element={<LoginPage />} />
        <Route path="/busmodelhome" element={<HomePage />} />
        <Route path="/addseats/:busId" element={<AddSeats />} />
        <Route path="/viewseats/:busId" element={<ViewSeats />} />
      </Routes>
    </BrowserRouter>
    </div>
  );
}

export default App;
