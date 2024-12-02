const mongoose = require('mongoose');


const associationSchema = new mongoose.Schema({
  userId: { type: mongoose.Schema.Types.ObjectId, ref: 'User' },
  description: { type: String },
});

const Association = mongoose.model('Association', associationSchema);
module.exports = Association;
