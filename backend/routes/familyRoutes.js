const express = require('express');
const Family = require('../models/family'); // Importer le modèle Family
const router = express.Router();

// Ajouter une famille
router.post('/', async (req, res) => {
  const { name, contact, address, description, image } = req.body;

  const family = new Family({
    name,
    contact,
    address,
    description,
    image,
  });

  try {
    await family.save();
    res.status(201).json({ message: 'Family added successfully!' });
  } catch (err) {
    res.status(400).json({ message: 'Failed to add family', error: err });
  }
});

// Récupérer les familles
router.get('/families', async (req, res) => {
    try {
      const families = await Family.find();
      res.status(200).json(families);
    } catch (error) {
      res.status(500).json({ message: 'Error retrieving families', error });
    }
  });
  
  // Supprimer une Family
  router.delete('/:id', async (req, res) => {
    try {
      await Family.findByIdAndDelete(req.params.id);
      res.status(200).json({ message: 'f deleted successfully' });
    } catch (error) {
      res.status(500).json({ message: 'Error deleting f', error });
    }
  });

module.exports = router;
