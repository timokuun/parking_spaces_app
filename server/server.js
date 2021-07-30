const data = require("./data.js");
const express = require("express");
// const bodyParser =
const app = express();

const user1 = require("./data.js").user1;
const arrayObj = require("./data.js").arrayObj;

const port = 3000;

app.get("/", (req, res) => {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "X-Requested-With, Content-Type, Authentication");
  return res.status(200).json(arrayObj);
});

app.get("/active-spots", (req, res) => {
  setTimeout(() => {
    return res.status(200).json(user1.active_spots);
  }, 2000);
  // return res.status(200).json(user1.active_spots);
});

app.get("/:id", (req, res) => {
  var id = parseInt(req.params.id);
  var spot = arrayObj.data.filter((spot) => spot.id === id)[0];
  console.log(spot);
  return res.status(200).json(spot);
});

console.log(`listening at ${port}`);
app.listen(port);
