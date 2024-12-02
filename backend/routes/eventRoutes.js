// eventRoutes.js
const express = require('express');
const Event = require('../models/event');

const router = express.Router();

// Ajouter un événement
router.post('/', async (req, res) => {
  const { name, date, address, description, image } = req.body;

  if (!name || !date || !address || !description) {
    return res.status(400).json({ message: 'All fields except image are required' });
  }

  try {
    const event = new Event({ name, date, address, description, image });
    await event.save();
    res.status(201).json({ message: 'Event added successfully', event });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Error saving event', error });
  }
});

// Récupérer les événements
router.get('/events', async (req, res) => {
  try {
    const events = await Event.find();
    res.status(200).json(events);
  } catch (error) {
    res.status(500).json({ message: 'Error retrieving events', error });
  }
});

// Supprimer un événement
router.delete('/:id', async (req, res) => {
  try {
    await Event.findByIdAndDelete(req.params.id);
    res.status(200).json({ message: 'Event deleted successfully' });
  } catch (error) {
    res.status(500).json({ message: 'Error deleting event', error });
  }
});

module.exports = router;
