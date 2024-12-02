const express = require('express');
const router = express.Router(); // Créez une instance de Router
const User = require('../models/User');

// Exemple de route
router.get('/', (req, res) => {
    res.send('Hello from User Route!');
});
// Créer un utilisateur
router.post('/', async (req, res) => {
    try {
      const user = new User(req.body);
      await user.save();
      res.status(201).json(user);
    } catch (error) {
      res.status(400).json({ error: error.message });
    }
  });
  
  // Récupérer tous les utilisateurs
  router.get('/', async (req, res) => {
    try {
      const users = await User.find();
      res.status(200).json(users);
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  });
  
  // Supprimer un utilisateur par ID
  router.delete('/:id', async (req, res) => {
    try {
      await User.findByIdAndDelete(req.params.id);
      res.status(200).json({ message: 'Utilisateur supprimé' });
    } catch (error) {
      res.status(400).json({ error: error.message });
    }
  });
  
  module.exports = router;
module.exports = router; // Exportez le routeur
