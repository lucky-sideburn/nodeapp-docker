const express = require('express');
const fs = require('fs');

// Constants
const PORT = 8080;
const HOST = '0.0.0.0';

// App
const app = express();
var data = '';

fs.readFile('/opt/config/DATA/world.conf', 'utf8', function(err, contents) {
    console.log(contents);
    data = contents;
});

app.get('/', (req, res) => {
  res.writeHead(200, { 'Content-Type': 'text/html' });
  res.write('<h1>Freaky Hours!</h1>');
  res.write('<h2>VAR1=' + process.env.VAR1 + '</h2><br>');
  res.write('<h2>VAR2=' + process.env.VAR2 + '</h2><br>');
  res.write('<h2>Content of /opt/config/DATA/world.conf=' + data + '</h2>');
});

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);
