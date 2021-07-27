const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const userSchema = new Schema({
  userid: String,
  nama: String,
  alamat: String,
});

const User = mongoose.model("User", userSchema);
exports.model = User;
exports.schema = userSchema;
