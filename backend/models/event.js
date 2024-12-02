const mongoose = require('mongoose');

// Define the Event schema
const eventSchema = new mongoose.Schema({
  name: { type: String, required: true },
  date: { type: Date, required: true },
  address: { type: String, required: true },
  description: { type: String, required: true },
  image: { type: String }, // Store image as a URL or base64 string
});

// Create the Event model
module.exports = mongoose.model('Event', eventSchema);
