const mongoose = require('mongoose');
const Item = require('./item');

// Définition du schéma de donation
const donationSchema = new mongoose.Schema({
  type: { 
    type: String, 
    required: true, 
    enum: ['clothing', 'furniture', 'books', 'other'], // Limité à ces 4 valeurs
  },
  category: { 
    type: String, 
    enum: ['men', 'women', 'girl', 'boy', 'baby'], // Limité à ces 5 valeurs ou null
    required: false,
    default: null, 
  },
  item: Item , 
  description: { 
    type: String, 
    required: true, 
  },
  condition: { 
    type: String, 
    required: true, 
  },
  size: { 
    type: String, 
    required: true, 
  },
  photo: { 
    type: String,  
  },
  
  
});

module.exports = mongoose.model('Donation', donationSchema);