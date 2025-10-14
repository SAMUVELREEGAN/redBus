import React, { useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import api from "../../api/axios";
import { Container, Card } from "react-bootstrap";
import "./ViewSeats.css";

const ViewSeats = () => {
  const { busId } = useParams();
  const [seats, setSeats] = useState([]);
  const [seatConfig, setSeatConfig] = useState([]);

  // Fetch bus seats
  const fetchSeats = async () => {
    try {
      const res = await api.get(`/busseat/?busId=${busId}`);
      setSeats(res.data);
    } catch (err) {
      console.error("Error fetching seats:", err);
    }
  };

  // Fetch seat model (to get row count)
  const fetchSeatConfig = async () => {
    try {
      const res = await api.get(`/seatmodel/?busId=${busId}`);
      setSeatConfig(res.data[0] || {});
    } catch (err) {
      console.error("Error fetching seat config:", err);
    }
  };

  useEffect(() => {
    fetchSeats();
    fetchSeatConfig();
  }, [busId]);

  const filterSeats = (deck, side, type) =>
    seats
      .filter((s) => s.deck === deck && s.side === side && s.type === type)
      .sort((a, b) => a.seat_number.localeCompare(b.seat_number));

  // ✅ Updated seat box to show price under seat number
  const renderSeatBox = (seat) => (
    <div
      key={seat.id}
      className={`seat-box ${seat.type === "seater" ? "seater" : "sleeper"} ${
        seat.is_booked ? "booked" : ""
      }`}
    >
      <div className="seat-content">
        <span className="seat-label">{seat.seat_number}</span>
        {seat.price && <span className="seat-price">₹{seat.price}</span>}
      </div>
    </div>
  );

  const renderDeck = (deck) => (
    <Card className="p-4 mb-5 shadow-sm seat-layout-card" key={deck}>
      <h5 className="deck-title">{deck.charAt(0).toUpperCase() + deck.slice(1)} Deck</h5>
      <div className="deck-layout">
        {["left", "right"].map((side) => (
          <div key={side} className="deck-side">
            <h6 className="text-center text-capitalize mb-2">{side} side</h6>

            {/* SEATER */}
            <div
              className={`seat-grid ${
                seatConfig?.[`${deck}_deck_${side}_seater_row`] === 2
                  ? "two-column"
                  : "one-column"
              }`}
            >
              {filterSeats(deck, side, "seater").map(renderSeatBox)}
            </div>

            {/* SLEEPER */}
            <div
              className={`seat-grid mt-3 ${
                seatConfig?.[`${deck}_deck_${side}_sleeper_sit_row`] === 2
                  ? "two-column"
                  : "one-column"
              }`}
            >
              {filterSeats(deck, side, "sleeper_sit").map(renderSeatBox)}
            </div>
          </div>
        ))}
      </div>
    </Card>
  );

  return (
    <Container className="mt-4 mb-5">
      <h3 className="text-center mb-4">🚌 Seat Layout for Bus #{busId}</h3>
      {seats.length === 0 ? (
        <p className="text-center text-muted">No seats found for this bus.</p>
      ) : (
        <>
          {renderDeck("lower")}
          {renderDeck("upper")}
        </>
      )}
    </Container>
  );
};

export default ViewSeats;
