
const express = require('express');
const router = express.Router();
const Donation = require('../models/donation');

// GET : Obtenir tous les dons
router.get('/', async (req, res) => {
  try {
    const donations = await Donation.find();
    res.status(200).json(donations);
  } catch (error) {
    res.status(500).json({ message: 'Erreur lors de la récupération des dons', error: error.message });
  }
});


// POST : Ajouter un don
router.post('/', async (req, res) => {
  const { type, category, item, description, condition, size } = req.body;

  try {
    const newDonation = new Donation({
      type,
      category,
      item,
      description,
      condition,
      size,
      
    });
    await newDonation.save();
    res.status(201).json({ message: 'Don ajouté avec succès', donation: newDonation });
  } catch (error) {
    res.status(400).json({ message: 'Erreur lors de l\'ajout du don', error: error.message });
  }
});


// DELETE : Supprimer un don par ID
router.delete('/:id', async (req, res) => {
  const { id } = req.params;

  try {
    await Donation.findByIdAndDelete(id);
    res.status(200).json({ message: 'Don supprimé avec succès' });
  } catch (error) {
    res.status(404).json({ message: 'Erreur : Don non trouvé ou problème lors de la suppression', error: error.message });
  }
});

module.exports = router;
