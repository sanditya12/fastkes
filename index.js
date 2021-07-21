require("dotenv").config();

const express = require("express");
const mongoose = require("mongoose");

const { model: Hospital } = require("./models/hospital");
const { model: User } = require("./models/user");
const Order = require("./models/order");

const app = express();
app.use(express.json());

mongoose
  .connect(process.env.MONGODB_KEY, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
    useFindAndModify: false,
  })
  .then((result) => {
    console.log("database connected");
  })
  .catch((err) => console.log(err));

app.get("/", (req, res) => {
  res.json({
    success: true,
  });
});

app.get("/hospitals", (req, res) => {
  Hospital.find({}).then((hospitals) => {
    res.json(hospitals);
  });
});

app.get("/orders", (req, res) => {
  Order.find({}).then((orders) => {
    res.json(orders);
  });
});

app.post("/addOrder", (req, res) => {
  const { nama, alamat, kode_rumah_sakit } = req.body;
  const newOrder = new Order({
    nama: nama,
    alamat: alamat,
    kode_rumah_sakit: kode_rumah_sakit,
  });
  newOrder.save((err, book) => {
    if (err) return;
    console.error(err);
    res.json({ ...newOrder._doc, added: true });
  });
});

app.post("/deleteOrder", (req, res) => {
  const { orderId } = req.body;
  Order.findByIdAndRemove(orderId, function (err, deletedOrder) {
    if (err) return;
    res.json({ ...deletedOrder._doc, deleted: true });
  });
});

const port = 3000;
app.listen(port, () => {
  console.log(`Server started at http://localhost:${port}`);
});
