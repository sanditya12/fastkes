const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const hospitalSchema = new Schema({
  kode_rumah_sakit: String,
  nama_rumah_sakit: String,
  jenis_rumah_sakit: String,
  alamat_rumah_sakit: String,
  kelurahan: String,
  kecamatan: String,
  kota_administrasi: String,
  kode_pos: String,
  nomor_telepon: String,
  website: String,
  email: String,
});

const Hospital = mongoose.model("Hospital", hospitalSchema);
exports.model = Hospital;
exports.schema = hospitalSchema;
