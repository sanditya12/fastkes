// require("dotenv").config();

const express = require("express");
const mongoose = require("mongoose");
const axios = require("axios");

const { model: Hospital } = require("./models/hospital");
const { model: User } = require("./models/user");
const Order = require("./models/order");
const { response } = require("express");

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
    console.log(hospitals);
  });
});

app.get("/allOrders", (req, res) => {
  Order.find({}).then((orders) => {
    res.json(orders);
  });
});

app.post("/showHospitalOrders", (req, res) => {
  const kodeRumahSakit = req.body.kode_rumah_sakit;
  Order.find({ kode_rumah_sakit: kodeRumahSakit }).then((orders) => {
    res.json(orders);
  });
});

app.post("/addOrder", (req, res) => {
  const { no_telp, alamat, kode_rumah_sakit } = req.body;
  const newOrder = new Order({
    no_telp: no_telp,
    alamat: alamat,
    kode_rumah_sakit: kode_rumah_sakit,
  });
  newOrder.save((err, book) => {
    if (err) return;
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

app.post("/findNearbyHospitals", (req, res) => {
  const { alamat } = req.body;

  Hospital.find({}).then((hospitals) => {
    const responses = [];
    let succesfulHospital = hospitals.length;
    hospitals.map((hospital) => {
      destination = `Rumah Sakit ${hospital.nama_rumah_sakit} ${hospital.kota_administrasi}`;
      hitUrl(
        getUrl(destination, alamat),
        destination,
        hospital.kode_rumah_sakit
      )
        .then((data) => {
          // data.success ? responses.push(data) : succesfulHospital--;
          responses.push(data);
          if (responses.length === hospitals.length) {
            res.json(
              responses.sort((a, b) => a.result.distance - b.result.distance)
            );
          }
        })
        .catch((err) => {
          console.log(err);
        });
    });
  });
});

const getUrl = (destination, alamat) => {
  return `https://maps.googleapis.com/maps/api/distancematrix/json?units=metric&origins=${alamat}&destinations=${destination}&key=${process.env.GOOGLE_API_KEY}`;
};

const hitUrl = (url, destination, kodeRumahSakit) => {
  return axios
    .get(url)
    .then((result) => {
      // console.log(JSON.stringify(result, null, 4));
      return {
        success: true,
        result: constructResponse(result.data, destination, kodeRumahSakit),
      };
    })
    .catch((error) => {
      return {
        success: false,
        result: {
          nama_rumah_sakit: destination,
          kode_rumah_sakit: kodeRumahSakit,
          distance: -1,
          duration: -1,
        },
      };
    });
};

const constructResponse = (result, destination, kodeRumahSakit) => {
  return {
    nama_rumah_sakit: destination,
    kode_rumah_sakit: kodeRumahSakit,
    distance: result.rows[0].elements[0].distance.value,
    duration: result.rows[0].elements[0].duration.value,
  };
};

const port = process.env.PORT || 80;
app.listen(port, () => {
  console.log(`Server started at http://localhost:${port}`);
});
