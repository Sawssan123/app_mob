const mongoose = require('mongoose');

const userSchema = new mongoose.Schema({
  fullname: { type: String, required: true },
  email: { type: String, required: true, unique: true },
  password: { type: String, required: true },
  phone: { type: String, required: true },
  location: { type: String },
  photo: { type: String }, // URL de l'image
});

const User = mongoose.model('User', userSchema);
module.exports = User;
