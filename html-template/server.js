import express from 'express';
import pkg from 'handlebars';
import path from 'path';
const { compile } = pkg;
import { readFileSync } from 'fs';
import axios from 'axios';

// CONSTS
const app = express();
const port = 3000;

const password = 'admin';
const email = 'admin@buckhill.co.uk';
const authUrl = 'http://pet-shop.buckhill.com.hr/api/v1/admin/login';

// "public" folder
app.use(express.static(path.resolve('./public')));
app.use('/public', express.static(path.resolve('./public')));

// "src" folder
app.use(express.static(path.resolve('./src')));
app.use('/src', express.static(path.resolve('./src')));

// Get all orders
const orders = await getAllOrders();

console.log('TYPE', typeof(orders[0].delivery_fee + orders[0].amount));

app.get('/', (req, res) => {
  const source = readFileSync('views/layouts/email-template.hbs', 'utf8');
  const template = compile(source);

  const data = {
    title: 'Email Template',
    order: orders[1],
  };

  const html = template(data);
  res.send(html);
});

app.listen(port, () => {
  console.log(`Server is running at http://localhost:${port}`);
});

// FUNCTIONS
async function authenticate() {
  const requestBody = new URLSearchParams();

  requestBody.append('email', email);
  requestBody.append('password', password);

  try {
    const response = axios.post(authUrl, requestBody, {
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      }
    });
    
    return (await response).data.data.token;
  } catch(error) {
    console.error('Authentication error:', error.response.data);
    throw new Error('Authentication failed');
  }
}

async function getAllOrders() {
  const allOrdersUrl = 'http://pet-shop.buckhill.com.hr/api/v1/orders'
  const token = await authenticate();

  try {
    const response = axios.get(allOrdersUrl, {
      headers: {
        'accept': '*/*',
        'Authorization': `Bearer ${token}`,
      }
    });

    return (await response).data.data;
  } catch(error) {
    console.error('Error:', error);
  }
}

// HELPERS
pkg.registerHelper('upper', function(str) {
  return str.toUpperCase();
});

pkg.registerHelper('date', function(date) {
  return new Date(date).toLocaleDateString();
});

pkg.registerHelper('sum', function(a, b) {
  return a + b;
});

pkg.registerHelper('amountDue', function(amount, deliveryFee, amountPaid) {
  return (amount + deliveryFee) - amountPaid;
});