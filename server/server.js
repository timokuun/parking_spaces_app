const data = require("./data.js");
const express = require("express");
const app = express();

const user1 = require("./data.js").user1;
const arrayObj = require("./data.js").arrayObj;

const port = 3000;

app.get("/", (req, res) => {
  return res.status(200).json(arrayObj);
});

app.get("/active-spots", (req, res) => {
  setTimeout(() => {
    return res.status(200).json(user1.active_spots);
  }, 2000);
  // return res.status(200).json(user1.active_spots);
});

console.log(`listening at ${port}`);
app.listen(port);
