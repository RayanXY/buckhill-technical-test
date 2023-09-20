import express from 'express';
import { readFileSync } from 'fs';
import pkg from 'handlebars';
const { compile } = pkg;
import axios from 'axios';

const app = express();
const port = 3000;

app.get('/', (req, res) => {
  const source = readFileSync('views/layouts/email-template.hbs', 'utf8');
  const template = compile(source);

  const data = {
    title: 'This will be an email template',
    name: 'Rayan Santos',
    message: 'See ya!'
  };

  const html = template(data);
  res.send(html);
});

app.listen(port, () => {
  console.log(`Server is running at http://localhost:${port}`);
});
