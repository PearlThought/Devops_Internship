const express = require('express');
const mongoose = require('mongoose');

const app = express();
const port = process.env.PORT || 3001;

mongoose.connect('mongodb+srv://pearl:<password>@pearl18.xc1jry9.mongodb.net/?retryWrites=true&w=majority', {
  useNewUrlParser: true,
  useUnifiedTopology: true
});

const db = mongoose.connection;
db.on('error', console.error.bind(console, 'MongoDB connection error:'));
db.once('open', () => {
  console.log('Connected to MongoDB');
});

app.get('/', (req, res) => {
  res.send('Hello, MongoDB is connected task is successful For Aug-25 pearl thought internship task from git ');
});
app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});