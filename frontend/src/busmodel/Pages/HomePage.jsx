import React from "react";
import { Container, Card } from "react-bootstrap";
import BusModel from "../component/BusModel";

const HomePage = () => {
  const owner = JSON.parse(localStorage.getItem("busOwner"));

  return (
    <Container className="py-4">
      <Card className="p-4 shadow-sm border-0">
        <h2 className="mb-3 text-center">Welcome to Bus Model Home 🚍</h2>
        <p className="text-center text-muted">
          Logged in as: <strong>{owner?.ownerUserName}</strong>
        </p>
      </Card>

      <div className="mt-4">
        <BusModel />
      </div>

   
    </Container>
  );
};

export default HomePage;
