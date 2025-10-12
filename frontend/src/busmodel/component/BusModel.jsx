import React, { useEffect, useState } from "react";
import { Table, Button, Modal, Form, Container, Row, Col, Alert } from "react-bootstrap";
import api from '../../api/axios'

const BusModel = () => {
  const [buses, setBuses] = useState([]);
  const [showModal, setShowModal] = useState(false);
  const [editingBus, setEditingBus] = useState(null);
  const [formData, setFormData] = useState({
    bus_name: "",
    start_location: "",
    end_location: "",
    start_time: "",
    end_time: "",
    bus_number: "",
    amenities: "",
    bus_features: "",
    owner: 1,
  });
  const [message, setMessage] = useState(null);
  const [variant, setVariant] = useState("info");

  // Load all buses
  const fetchBuses = async () => {
  try {
    const owner = JSON.parse(localStorage.getItem("busOwner"));
    const res = await api.get("busmodel/");
    // filter buses that belong to this owner
    const ownerBuses = res.data.filter((bus) => bus.owner === owner.id);
    setBuses(ownerBuses);
  } catch (err) {
    console.error(err);
    setMessage("Failed to load buses.");
    setVariant("danger");
  }
};


  useEffect(() => {
    fetchBuses();
  }, []);

  // Handle form change
  const handleChange = (e) => {
    setFormData((s) => ({ ...s, [e.target.name]: e.target.value }));
  };

  // Add or update bus
  const handleSave = async (e) => {
    e.preventDefault();
    try {
      const payload = {
        ...formData,
        amenities: formData.amenities.split(",").map((a) => a.trim()),
        bus_features: formData.bus_features.split(",").map((f) => f.trim()),
      };

      if (editingBus) {
        await api.put(`busmodel/${editingBus.id}/`, payload);
        setMessage("Bus updated successfully ✅");
        setVariant("success");
      } else {
        await api.post("busmodel/", payload);
        setMessage("New bus added successfully ✅");
        setVariant("success");
      }

      setShowModal(false);
      setEditingBus(null);
      setFormData({
        bus_name: "",
        start_location: "",
        end_location: "",
        start_time: "",
        end_time: "",
        bus_number: "",
        amenities: "",
        bus_features: "",
        owner: 1,
      });
      fetchBuses();
    } catch (err) {
      console.error(err);
      setMessage("Error saving bus ❌");
      setVariant("danger");
    }
  };

  // Edit bus
  const handleEdit = (bus) => {
    setEditingBus(bus);
    setFormData({
      ...bus,
      amenities: bus.amenities.join(", "),
      bus_features: bus.bus_features.join(", "),
    });
    setShowModal(true);
  };

  // Delete bus
  const handleDelete = async (id) => {
    if (!window.confirm("Are you sure you want to delete this bus?")) return;
    try {
      await api.delete(`busmodel/${id}/`);
      setMessage("Bus deleted successfully 🗑️");
      setVariant("warning");
      fetchBuses();
    } catch (err) {
      console.error(err);
      setMessage("Failed to delete bus ❌");
      setVariant("danger");
    }
  };

  return (
    <Container className="py-4">
      <Row className="mb-3">
        <Col>
          <h2>Bus Management 🚍</h2>
        </Col>
        <Col className="text-end">
          <Button onClick={() => setShowModal(true)}>➕ Add Bus</Button>
        </Col>
      </Row>

      {message && <Alert variant={variant}>{message}</Alert>}

      {/* === BUS TABLE === */}
      <Table bordered hover responsive>
        <thead>
          <tr>
            <th>ID</th>
            <th>Bus Name</th>
            <th>Start</th>
            <th>End</th>
            <th>Start Time</th>
            <th>End Time</th>
            <th>Bus Number</th>
            <th>Amenities</th>
            <th>Features</th>
            <th>Owner</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          {buses.map((bus) => (
            <tr key={bus.id}>
              <td>{bus.id}</td>
              <td>{bus.bus_name}</td>
              <td>{bus.start_location}</td>
              <td>{bus.end_location}</td>
              <td>{bus.start_time}</td>
              <td>{bus.end_time}</td>
              <td>{bus.bus_number}</td>
              <td>{bus.amenities.join(", ")}</td>
              <td>{bus.bus_features.join(", ")}</td>
              <td>{bus.owner}</td>
              <td>
                <Button
                  size="sm"
                  variant="outline-primary"
                  className="me-2"
                  onClick={() => handleEdit(bus)}
                >
                  Edit
                </Button>
                <Button
                  size="sm"
                  variant="outline-danger"
                  onClick={() => handleDelete(bus.id)}
                >
                  Delete
                </Button>
              </td>
            </tr>
          ))}
        </tbody>
      </Table>

      {/* === MODAL FORM === */}
      <Modal show={showModal} onHide={() => setShowModal(false)} centered>
        <Modal.Header closeButton>
          <Modal.Title>{editingBus ? "Edit Bus" : "Add New Bus"}</Modal.Title>
        </Modal.Header>
        <Modal.Body>
          <Form onSubmit={handleSave}>
            <Form.Group className="mb-2">
              <Form.Label>Bus Name</Form.Label>
              <Form.Control
                type="text"
                name="bus_name"
                value={formData.bus_name}
                onChange={handleChange}
                required
              />
            </Form.Group>

            <Form.Group className="mb-2">
              <Form.Label>Start Location</Form.Label>
              <Form.Control
                type="text"
                name="start_location"
                value={formData.start_location}
                onChange={handleChange}
                required
              />
            </Form.Group>

            <Form.Group className="mb-2">
              <Form.Label>End Location</Form.Label>
              <Form.Control
                type="text"
                name="end_location"
                value={formData.end_location}
                onChange={handleChange}
                required
              />
            </Form.Group>

            <Row>
              <Col>
                <Form.Group className="mb-2">
                  <Form.Label>Start Time</Form.Label>
                  <Form.Control
                    type="text"
                    name="start_time"
                    value={formData.start_time}
                    onChange={handleChange}
                    required
                  />
                </Form.Group>
              </Col>
              <Col>
                <Form.Group className="mb-2">
                  <Form.Label>End Time</Form.Label>
                  <Form.Control
                    type="text"
                    name="end_time"
                    value={formData.end_time}
                    onChange={handleChange}
                    required
                  />
                </Form.Group>
              </Col>
            </Row>

            <Form.Group className="mb-2">
              <Form.Label>Bus Number</Form.Label>
              <Form.Control
                type="text"
                name="bus_number"
                value={formData.bus_number}
                onChange={handleChange}
                required
              />
            </Form.Group>

            <Form.Group className="mb-2">
              <Form.Label>Amenities (comma separated)</Form.Label>
              <Form.Control
                type="text"
                name="amenities"
                value={formData.amenities}
                onChange={handleChange}
              />
            </Form.Group>

            <Form.Group className="mb-2">
              <Form.Label>Bus Features (comma separated)</Form.Label>
              <Form.Control
                type="text"
                name="bus_features"
                value={formData.bus_features}
                onChange={handleChange}
              />
            </Form.Group>

            <div className="d-grid mt-3">
              <Button type="submit" variant="success">
                {editingBus ? "Update Bus" : "Add Bus"}
              </Button>
            </div>
          </Form>
        </Modal.Body>
      </Modal>
    </Container>
  );
};

export default BusModel;
