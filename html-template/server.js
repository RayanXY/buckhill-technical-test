import express from 'express';
import pkg from 'handlebars';
import path from 'path';
const { compile } = pkg;
import { readFileSync } from 'fs';
import axios from 'axios';

const app = express();
const port = 3000;

// "public" folder
app.use(express.static(path.resolve('./public')));
app.use('/public', express.static(path.resolve('./public')));

// "src" folder
app.use(express.static(path.resolve('./src')));
app.use('/src', express.static(path.resolve('./src')));

app.get('/', (req, res) => {
  const source = readFileSync('views/layouts/email-template.hbs', 'utf8');
  const template = compile(source);

  const data = {
    title: 'Email Template',
  };

  const html = template(data);
  res.send(html);
});

app.listen(port, () => {
  console.log(`Server is running at http://localhost:${port}`);
});
