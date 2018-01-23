const express = require('express');
const path = require('path');
const app = express();
const translate = require('google-translate-api');
const bodyParser = require('body-parser');

app.use(bodyParser.json())

app.get('/', function (req, res) {
  res.json({
    code: 200,
    data: "This is translator api"
  })
});

app.post('/translate', function(req, res){
  const options = {};
  if (req.body.from)
    options.from = req.body.from;
  if (req.body.to)
    options.to = req.body.to;
  translate(req.body.text, options).then(result => {
      res.json({
        code: 200,
        data: result
      })
  }).catch(err => {
      res.json({
        code: 400,
        error: err
      })
  });
})

app.listen(process.env.PORT);