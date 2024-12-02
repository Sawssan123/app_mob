const mongoose = require('mongoose');
const User = require('./user'); // Modèle parent

const giverSchema = new mongoose.Schema({
  userId: { type: mongoose.Schema.Types.ObjectId, ref: 'User' },
  list_of_items: [{ type: mongoose.Schema.Types.ObjectId, ref: 'Item' }],
});

const Giver = mongoose.model('Giver', giverSchema);
module.exports = Giver;
