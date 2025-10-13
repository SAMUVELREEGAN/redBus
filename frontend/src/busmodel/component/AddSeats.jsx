import React, { useState, useEffect } from "react";
import { useParams, useNavigate } from "react-router-dom";
import axios from "axios";
import { Container, Form, Button, Row, Col, Card } from "react-bootstrap";

// Component to manually add seat numbers for a section
const AddSeatNumber = ({ section, deck, side, type, count, onSeatsChange }) => {
  const [seatNumbers, setSeatNumbers] = useState([]);

  // Initialize / update seatNumbers whenever count changes
  useEffect(() => {
    setSeatNumbers((prevSeats) => {
      const newSeats = Array(count).fill("");
      for (let i = 0; i < Math.min(prevSeats.length, count); i++) {
        newSeats[i] = prevSeats[i];
      }
      return newSeats;
    });
  }, [count]);

  const handleChange = (index, value) => {
    const newSeats = [...seatNumbers];
    newSeats[index] = value;
    setSeatNumbers(newSeats);

    // Send seat objects to parent
    onSeatsChange(
      newSeats.map((num) => ({
        seat_number: num,
        deck,
        side,
        type,
        is_booked: false,
      }))
    );
  };

  return (
    <Card className="p-3 mb-3 shadow-sm">
      <h6>{section} - Add Seat Numbers</h6>
      {seatNumbers.map((seat, idx) => (
        <Row className="mb-2" key={idx}>
          <Col md={6}>
            <Form.Control
              type="text"
              placeholder={`Seat ${idx + 1} number`}
              value={seat}
              onChange={(e) => handleChange(idx, e.target.value)}
            />
          </Col>
        </Row>
      ))}
    </Card>
  );
};

const AddSeats = () => {
  const { busId } = useParams();
  const navigate = useNavigate();

  const [formData, setFormData] = useState({
    lower_deck_left_sleeper_sit: false,
    lower_deck_left_sleeper_sit_row: 0,
    lower_deck_left_sleeper_sit_count: 0,

    lower_deck_left_seater: false,
    lower_deck_left_seater_row: 0,
    lower_deck_left_seater_count: 0,

    lower_deck_right_sleeper_sit: false,
    lower_deck_right_sleeper_sit_row: 0,
    lower_deck_right_sleeper_sit_count: 0,

    lower_deck_right_seater: false,
    lower_deck_right_seater_row: 0,
    lower_deck_right_seater_count: 0,

    upper_deck_left_sleeper_sit: false,
    upper_deck_left_sleeper_sit_row: 0,
    upper_deck_left_sleeper_sit_count: 0,

    upper_deck_left_seater: false,
    upper_deck_left_seater_row: 0,
    upper_deck_left_seater_count: 0,

    upper_deck_right_sleeper_sit: false,
    upper_deck_right_sleeper_sit_row: 0,
    upper_deck_right_sleeper_sit_count: 0,

    upper_deck_right_seater: false,
    upper_deck_right_seater_row: 0,
    upper_deck_right_seater_count: 0,

    end_center_seater: false,
    busId: busId,
  });

  // Collect all manually entered seat numbers
  const [allSeats, setAllSeats] = useState({}); // key = section

  // Handle checkbox/input changes
  const handleChange = (e) => {
    const { name, type, checked, value } = e.target;
    setFormData({
      ...formData,
      [name]: type === "checkbox" ? checked : value,
    });
  };

  // Update seat numbers from child
  const handleSeatsChange = (section, seats) => {
    setAllSeats((prev) => ({
      ...prev,
      [section]: seats,
    }));
  };

  // Submit
  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      // Save formData (seat layout config)
      await axios.post("http://127.0.0.1:8000/seatmodel/", formData);

      // Save manually entered seat numbers
      const seatArrays = Object.values(allSeats).flat();
      if (seatArrays.length > 0) {
        await Promise.all(
          seatArrays.map((seat) =>
            axios.post("http://127.0.0.1:8000/busseat/", { ...seat, busId })
          )
        );
      }

      alert("✅ Seat configuration and seat numbers created successfully!");
      navigate(`/viewseats/${busId}`);
    } catch (error) {
      console.error(error);
      alert("❌ Error creating seat configuration");
    }
  };

  // Render a section (checkbox + row + count)
  const renderSection = (label, fieldPrefix) => {
    const enabled = formData[fieldPrefix];
    const count = parseInt(formData[`${fieldPrefix}_count`] || 0);

    return (
      <Card className="p-3 mb-3 shadow-sm">
        <Row className="align-items-center">
          <Col md={4}>
            <Form.Check
              type="checkbox"
              label={label}
              name={fieldPrefix}
              checked={enabled}
              onChange={handleChange}
            />
          </Col>
          <Col md={3}>
            <Form.Group>
              <Form.Label>Row</Form.Label>
              <Form.Control
                type="number"
                name={`${fieldPrefix}_row`}
                value={formData[`${fieldPrefix}_row`]}
                disabled={!enabled}
                onChange={handleChange}
              />
            </Form.Group>
          </Col>
          <Col md={3}>
            <Form.Group>
              <Form.Label>Count</Form.Label>
              <Form.Control
                type="number"
                name={`${fieldPrefix}_count`}
                value={formData[`${fieldPrefix}_count`] || ""}
                disabled={!enabled}
                onChange={handleChange}
              />
            </Form.Group>
          </Col>
        </Row>

        {/* Show seat number inputs if count > 0 */}
        {enabled && count > 0 && (
          <AddSeatNumber
            section={fieldPrefix}
            deck={label.includes("Lower Deck") ? "lower" : "upper"}
            side={label.includes("Left") ? "left" : "right"}
            type={label.includes("Sleeper") ? "sleeper_sit" : "seater"}
            count={count}
            onSeatsChange={(seats) => handleSeatsChange(fieldPrefix, seats)}
          />
        )}
      </Card>
    );
  };

  return (
    <Container className="mt-4 mb-5">
      <h3 className="text-center mb-4">🚌 Seat Setup for Bus #{busId}</h3>
      <Form onSubmit={handleSubmit}>
        <h5>Lower Deck</h5>
        {renderSection("Lower Deck - Left Sleeper Sit", "lower_deck_left_sleeper_sit")}
        {renderSection("Lower Deck - Left Seater", "lower_deck_left_seater")}
        {renderSection("Lower Deck - Right Sleeper Sit", "lower_deck_right_sleeper_sit")}
        {renderSection("Lower Deck - Right Seater", "lower_deck_right_seater")}

        <hr />
        <h5>Upper Deck</h5>
        {renderSection("Upper Deck - Left Sleeper Sit", "upper_deck_left_sleeper_sit")}
        {renderSection("Upper Deck - Left Seater", "upper_deck_left_seater")}
        {renderSection("Upper Deck - Right Sleeper Sit", "upper_deck_right_sleeper_sit")}
        {renderSection("Upper Deck - Right Seater", "upper_deck_right_seater")}

        <hr />
        <Form.Check
          type="checkbox"
          label="End Center Seater"
          name="end_center_seater"
          checked={formData.end_center_seater}
          onChange={handleChange}
        />

        <div className="text-center mt-4">
          <Button type="submit" variant="primary" size="lg">
            Save Seat Layout & Seat Numbers
          </Button>
        </div>
      </Form>
    </Container>
  );
};

export default AddSeats;
