const mongoose = require('mongoose');

const familySchema = new mongoose.Schema({
  name: { type: String, required: true },
  contact: { type: String, required: true },
  address: { type: String, required: true },
  description: { type: String, required: false },
  image: { type: String } // Photo (optionnelle, encodée en base64)
});

module.exports = mongoose.model('Family', familySchema);
