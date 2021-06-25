const express = require("express");
const app = express();

const port = 3000;

const obj1 = {
  id: 1,
  lat: 32.8801,
  lng: 117.234,
  name: "UCSD",
  description: "This is UCSD",
  price: 12222222.0,
};

const obj2 = {
  id: 2,
  lat: 32.886,
  lng: 117.2426,
  name: "Café Ventanas",
  description: "This is Café Ventanas",
  price: 12222222.0,
};

const obj3 = {
  id: 3,
  lat: 32.8788,
  lng: 117.2425,
  name: "Pines",
  description: "This is Pines",
  price: 12222222.0,
};

const obj4 = {
  id: 4,
  lat: 32.8771,
  lng: 117.2396,
  name: "Soda & Swine",
  description: "This is Soda & Swine",
  price: 12222222.0,
};

const obj5 = {
  id: 5,
  lat: 32.8681,
  lng: 117.2503,
  name: "Scripps Institution of Oceanography",
  description: "This is Scripps Institution of Oceanography",
  price: 12222222.0,
};

const arrayObj = { data: [obj1, obj2, obj3, obj4, obj5] };
// const arrayObj = [obj1, obj2, obj3, obj4, obj5];

app.get("/", (req, res) => {
  return res.status(200).json(arrayObj);
});

console.log(`listening at ${port}`);
app.listen(port);
