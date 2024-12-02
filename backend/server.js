// server.js
const express = require('express');
const mongoose = require('mongoose');
const dotenv = require('dotenv');
const cors = require('cors');
const bodyParser = require('body-parser');

dotenv.config(); // Charge les variables d'environnement depuis .env

const app = express();

// Middleware
app.use(cors());
app.use(bodyParser.json());  // Pour traiter le JSON des requêtes

// Connexion à MongoDB
mongoose.connect(process.env.MONGO_URI)
  .then(() => console.log('MongoDB connected'))
  .catch((err) => console.error('MongoDB connection error:', err));

// Routes
const eventRoutes = require('./routes/eventRoutes');
app.use('/api/events', eventRoutes);

const familyRoutes = require('./routes/familyRoutes');
app.use('/api/families', familyRoutes);

// Lancer le serveur
const PORT = process.env.PORT || 5000;
app.listen(PORT, () => console.log(`Server running on http://localhost:${PORT}`));
