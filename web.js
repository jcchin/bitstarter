var express = require('express');
var fs = require('fs');

var app = express.createServer(express.logger());

app.get('/', function(request, response) {
  var string = String(fs.readFileSync("index.html"));
  response.send(string);
});

app.post('/', function(request, response) {
  var string = String(fs.readFileSync("about.html"));
  response.send(string);
});

var port = process.env.PORT || 8080;
app.listen(port, function() {
  console.log("Listening on " + port);
});
