const mongoose = require('mongoose');

const itemSchema = new mongoose.Schema({
  id_giver: { type: mongoose.Schema.Types.ObjectId, ref: 'Giver' },
  name: { type: String, required: true },
  description: { type: String },
  condition: { type: String },
  size: { type: String },
  type: { type: String },
  photo: { type: String },
  
});

const Item = mongoose.model('Item', itemSchema);
module.exports = Item;
