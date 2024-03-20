var express = require("express");
var app = express();
var uuid = require("node-uuid");
require("dotenv").config();

var { Pool } = require("pg");
var conString = process.env.DB; // Your database connection string from the environment variable
// console.log(conString);

// Create a new pool instance
var pool = new Pool({
  connectionString: conString,
});

app.get("/api/status", function (req, res) {
  res.json({ message: "Static response" });
});

// Routes
app.get("/api/status", function (req, res) {
  pool.query("SELECT now() as time", (err, result) => {
    if (err) {
      console.error("Query error", err.stack);
      return res.status(500).send("Error running query");
    }
    res.json({
      request_uuid: uuid.v4(),
      time: result.rows[0].time,
    });
  });
});

// catch 404 and forward to error handler
app.use(function (req, res, next) {
  var err = new Error("Not Found");
  err.status = 404;
  next(err);
});

// error handlers

// development error handler
// will print stacktrace
if (app.get("env") === "development") {
  app.use(function (err, req, res, next) {
    res.status(err.status || 500);
    res.json({
      message: err.message,
      error: err,
    });
  });
}

// production error handler
// no stacktraces leaked to user
app.use(function (err, req, res, next) {
  res.status(err.status || 500);
  res.json({
    message: err.message,
    error: {},
  });
});

module.exports = app;
