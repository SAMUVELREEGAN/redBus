// src/pages/LoginPage.jsx
import React, { useState } from "react";
import { Form, Button, Card, Container, Row, Col, Alert } from "react-bootstrap";
import { useNavigate } from "react-router-dom";
import api from '../../api/axios'

const LoginPage = () => {
  const navigate = useNavigate();
  const [isLogin, setIsLogin] = useState(true);
  const [formData, setFormData] = useState({
    ownerUserName: "",
    ownerPassword: "",
    ownerEmail: "",
    ownerPhoneNumber: "",
  });
  const [message, setMessage] = useState(null);
  const [variant, setVariant] = useState("info"); // alert variant

  const handleChange = (e) => {
    setFormData((s) => ({ ...s, [e.target.name]: e.target.value }));
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    setMessage(null);

    try {
      if (isLogin) {
        // LOGIN: fetch owners and compare (because backend uses ViewSet)
        const res = await api.get("busowner/");
        const owners = res.data;

        const found = owners.find(
          (o) =>
            o.ownerUserName === formData.ownerUserName &&
            o.ownerPassword === formData.ownerPassword
        );

        if (found) {
          localStorage.setItem("busOwner", JSON.stringify(found));
          setVariant("success");
          setMessage(`Welcome, ${found.ownerUserName}! Redirecting...`);

          // redirect quickly
          setTimeout(() => navigate("/busmodelhome"), 700);
        } else {
          setVariant("danger");
          setMessage("Invalid username or password.");
        }
      } else {
        // SIGNUP: create new owner using POST to busowner/ (ViewSet create)
        await api.post("busowner/", {
          ownerUserName: formData.ownerUserName,
          ownerPassword: formData.ownerPassword,
          ownerEmail: formData.ownerEmail,
          ownerPhoneNumber: formData.ownerPhoneNumber,
        });

        setVariant("success");
        setMessage("Signup successful. Please log in.");
        setIsLogin(true);
        // clear password/email/phone for safety (leave username)
        setFormData((s) => ({ ...s, ownerPassword: "", ownerEmail: "", ownerPhoneNumber: "" }));
      }
    } catch (err) {
      console.error(err);
      setVariant("danger");
      setMessage("Something went wrong — try again.");
    }
  };

  return (
    <Container className="d-flex align-items-center justify-content-center" style={{ minHeight: "100vh" }}>
      <Row className="w-100">
        <Col xs={12} md={6} lg={4} className="mx-auto">
          <Card>
            <Card.Body>
              <Card.Title className="text-center mb-3">
                {isLogin ? "Bus Owner Login" : "Bus Owner Signup"}
              </Card.Title>

              {message && <Alert variant={variant}>{message}</Alert>}

              <Form onSubmit={handleSubmit}>
                <Form.Group className="mb-2" controlId="ownerUserName">
                  <Form.Label>Username</Form.Label>
                  <Form.Control
                    type="text"
                    name="ownerUserName"
                    value={formData.ownerUserName}
                    onChange={handleChange}
                    placeholder="Enter username"
                    required
                  />
                </Form.Group>

                <Form.Group className="mb-2" controlId="ownerPassword">
                  <Form.Label>Password</Form.Label>
                  <Form.Control
                    type="password"
                    name="ownerPassword"
                    value={formData.ownerPassword}
                    onChange={handleChange}
                    placeholder="Enter password"
                    required
                  />
                </Form.Group>

                {!isLogin && (
                  <>
                    <Form.Group className="mb-2" controlId="ownerEmail">
                      <Form.Label>Email</Form.Label>
                      <Form.Control
                        type="email"
                        name="ownerEmail"
                        value={formData.ownerEmail}
                        onChange={handleChange}
                        placeholder="Enter email"
                        required
                      />
                    </Form.Group>

                    <Form.Group className="mb-2" controlId="ownerPhoneNumber">
                      <Form.Label>Phone Number</Form.Label>
                      <Form.Control
                        type="text"
                        name="ownerPhoneNumber"
                        value={formData.ownerPhoneNumber}
                        onChange={handleChange}
                        placeholder="Enter phone"
                        required
                      />
                    </Form.Group>
                  </>
                )}

                <div className="d-grid gap-2 mt-3">
                  <Button variant={isLogin ? "primary" : "success"} type="submit">
                    {isLogin ? "Login" : "Signup"}
                  </Button>
                </div>
              </Form>

              <hr />

              <div className="text-center">
                <Button variant="link" onClick={() => { setIsLogin(!isLogin); setMessage(null); }}>
                  {isLogin ? "New user? Create an account" : "Already have an account? Login"}
                </Button>
              </div>
            </Card.Body>
          </Card>

          <div className="text-center mt-3 text-muted small">
            Endpoint: <code>http://127.0.0.1:8000/busowner/</code>
          </div>
        </Col>
      </Row>
    </Container>
  );
};

export default LoginPage;
