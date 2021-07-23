const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const orderSchema = new Schema({
  nama: String,
  no_telp: String,
  alamat: String,
  kode_rumah_sakit: String,
});

const Order = mongoose.model("Order", orderSchema);
module.exports = Order;
