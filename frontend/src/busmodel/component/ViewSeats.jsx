import React, { useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import api from "../../api/axios";
import { Button, Card, Container, Row, Col } from "react-bootstrap";

const ViewSeats = () => {
  const { busId } = useParams();
  const [seats, setSeats] = useState([]);

  const fetchSeats = async () => {
    try {
      const res = await api.get(`seatmodel/?busId=${busId}`);
      setSeats(res.data);
    } catch (err) {
      console.error("Error fetching seats:", err);
    }
  };

  const handleDelete = async (seatId) => {
    if (!window.confirm("Are you sure you want to delete this seat config?")) return;
    try {
      await api.delete(`seatmodel/${seatId}/`);
      fetchSeats();
    } catch (err) {
      console.error("Error deleting seat:", err);
    }
  };

  useEffect(() => {
    fetchSeats();
  }, [busId]);

  return (
    <Container className="mt-4">
      <h3 className="text-center mb-4">Seat Layout for Bus #{busId}</h3>
      <Row>
        {seats.length === 0 ? (
          <p>No seat data available for this bus.</p>
        ) : (
          seats.map((seat) => (
            <Col md={6} key={seat.id} className="mb-4">
              <Card className="p-3 shadow-sm">
                <h5>Seat Configuration ID: {seat.id}</h5>
                <hr />
                <p>Lower Deck Left Seater Count: {seat.lower_deck_left_seater_count}</p>
                <p>Upper Deck Left Sleeper Count: {seat.upper_deck_left_sleeper_sit_count}</p>
                <Button
                  variant="danger"
                  onClick={() => handleDelete(seat.id)}
                >
                  Delete
                </Button>
              </Card>
            </Col>
          ))
        )}
      </Row>
    </Container>
  );
};

export default ViewSeats;
