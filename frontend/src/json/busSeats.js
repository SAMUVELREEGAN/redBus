const busSeats = [
    {
  "busId": 1,
  "seats": [
    // ==== LOWER DECK - LEFT SLEEPER SIT ====
    { "seatNumber": "L1", "deck": "lower", "side": "left", "type": "sleeper_sit", "isBooked": false },
    { "seatNumber": "L2", "deck": "lower", "side": "left", "type": "sleeper_sit", "isBooked": true },
    { "seatNumber": "L3", "deck": "lower", "side": "left", "type": "sleeper_sit", "isBooked": false },
    { "seatNumber": "L4", "deck": "lower", "side": "left", "type": "sleeper_sit", "isBooked": true },
    { "seatNumber": "L5", "deck": "lower", "side": "left", "type": "sleeper_sit", "isBooked": false },

    // ==== LOWER DECK - LEFT SEATER ====
    { "seatNumber": "L6", "deck": "lower", "side": "left", "type": "seater", "isBooked": false },
    { "seatNumber": "L7", "deck": "lower", "side": "left", "type": "seater", "isBooked": true },
    { "seatNumber": "L8", "deck": "lower", "side": "left", "type": "seater", "isBooked": false },
    { "seatNumber": "L9", "deck": "lower", "side": "left", "type": "seater", "isBooked": false },
    { "seatNumber": "L10", "deck": "lower", "side": "left", "type": "seater", "isBooked": true },
    { "seatNumber": "L11", "deck": "lower", "side": "left", "type": "seater", "isBooked": false },
    { "seatNumber": "L12", "deck": "lower", "side": "left", "type": "seater", "isBooked": false },

    // ==== LOWER DECK - RIGHT SLEEPER SIT ====
    { "seatNumber": "L13", "deck": "lower", "side": "right", "type": "sleeper_sit", "isBooked": true },
    { "seatNumber": "L14", "deck": "lower", "side": "right", "type": "sleeper_sit", "isBooked": false },
    { "seatNumber": "L15", "deck": "lower", "side": "right", "type": "sleeper_sit", "isBooked": true },
    { "seatNumber": "L16", "deck": "lower", "side": "right", "type": "sleeper_sit", "isBooked": false },
    { "seatNumber": "L17", "deck": "lower", "side": "right", "type": "sleeper_sit", "isBooked": false },
    { "seatNumber": "L18", "deck": "lower", "side": "right", "type": "sleeper_sit", "isBooked": true },
    { "seatNumber": "L19", "deck": "lower", "side": "right", "type": "sleeper_sit", "isBooked": false },
    { "seatNumber": "L20", "deck": "lower", "side": "right", "type": "sleeper_sit", "isBooked": true },
    { "seatNumber": "L21", "deck": "lower", "side": "right", "type": "sleeper_sit", "isBooked": false },
    { "seatNumber": "L22", "deck": "lower", "side": "right", "type": "sleeper_sit", "isBooked": false },
    { "seatNumber": "L23", "deck": "lower", "side": "right", "type": "sleeper_sit", "isBooked": true },
    { "seatNumber": "L24", "deck": "lower", "side": "right", "type": "sleeper_sit", "isBooked": false },

    // ==== UPPER DECK - LEFT SLEEPER SIT ====
    { "seatNumber": "U1", "deck": "upper", "side": "left", "type": "sleeper_sit", "isBooked": false },
    { "seatNumber": "U2", "deck": "upper", "side": "left", "type": "sleeper_sit", "isBooked": true },
    { "seatNumber": "U3", "deck": "upper", "side": "left", "type": "sleeper_sit", "isBooked": false },
    { "seatNumber": "U4", "deck": "upper", "side": "left", "type": "sleeper_sit", "isBooked": false },
    { "seatNumber": "U5", "deck": "upper", "side": "left", "type": "sleeper_sit", "isBooked": true },

    // ==== UPPER DECK - LEFT SEATER ====
    { "seatNumber": "U6", "deck": "upper", "side": "left", "type": "seater", "isBooked": false },
    { "seatNumber": "U7", "deck": "upper", "side": "left", "type": "seater", "isBooked": true },
    { "seatNumber": "U8", "deck": "upper", "side": "left", "type": "seater", "isBooked": false },
    { "seatNumber": "U9", "deck": "upper", "side": "left", "type": "seater", "isBooked": false },
    { "seatNumber": "U10", "deck": "upper", "side": "left", "type": "seater", "isBooked": true },
    { "seatNumber": "U11", "deck": "upper", "side": "left", "type": "seater", "isBooked": false },
    { "seatNumber": "U12", "deck": "upper", "side": "left", "type": "seater", "isBooked": true },

    // ==== UPPER DECK - RIGHT SLEEPER SIT ====
    { "seatNumber": "U13", "deck": "upper", "side": "right", "type": "sleeper_sit", "isBooked": true },
    { "seatNumber": "U14", "deck": "upper", "side": "right", "type": "sleeper_sit", "isBooked": false },
    { "seatNumber": "U15", "deck": "upper", "side": "right", "type": "sleeper_sit", "isBooked": true },
    { "seatNumber": "U16", "deck": "upper", "side": "right", "type": "sleeper_sit", "isBooked": false },
    { "seatNumber": "U17", "deck": "upper", "side": "right", "type": "sleeper_sit", "isBooked": true },
    { "seatNumber": "U18", "deck": "upper", "side": "right", "type": "sleeper_sit", "isBooked": false },
    { "seatNumber": "U19", "deck": "upper", "side": "right", "type": "sleeper_sit", "isBooked": true },
    { "seatNumber": "U20", "deck": "upper", "side": "right", "type": "sleeper_sit", "isBooked": false },
    { "seatNumber": "U21", "deck": "upper", "side": "right", "type": "sleeper_sit", "isBooked": false },
    { "seatNumber": "U22", "deck": "upper", "side": "right", "type": "sleeper_sit", "isBooked": true },
    { "seatNumber": "U23", "deck": "upper", "side": "right", "type": "sleeper_sit", "isBooked": false },
    { "seatNumber": "U24", "deck": "upper", "side": "right", "type": "sleeper_sit", "isBooked": true },

    // ==== CENTER SEATS ====
    { "seatNumber": "C1", "deck": "end_center", "side": "center", "type": "seater", "isBooked": false },
    { "seatNumber": "C2", "deck": "end_center", "side": "center", "type": "seater", "isBooked": true },
    { "seatNumber": "C3", "deck": "end_center", "side": "center", "type": "seater", "isBooked": false }
  ]
}

]