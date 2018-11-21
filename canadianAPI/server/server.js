const express = require('express');
const bodyParser = require('body-parser');

//-----------------------------POSSIBLE RESPONSES------------------------------
const OK = 200;
const CREATED = 201;
const SEE_OTHER = 303;
const BAD_REQUEST = 400;
const UNAUTHORIZED = 401;
const NOT_FOUND = 404;
const SERVER_ERROR = 500;
const NO_CONTENT = 204;
//-----------------------------POSSIBLE RESPONSES------------------------------
function serve()
{
  try
  {
    const app = express();
    app.locals.port = 80;
    setupRoutes(app);
    app.listen(80, function() {
      console.log(`listening on port 80`);
    });
  } catch (e)
  {
    console.error(e);
    console.log("Terminating program.");
    process.exit(1);
  }
}

function setupRoutes(app)
{
  app.use('',bodyParser.json())
  app.post('', replaceWords(app));
}


module.exports = {
  serve: serve
}

function replaceWords(app)
{
  return function(request,response)
  {
    let text = request.body.text;
    let censorship = { "fuck ": "fornicate ",
      "asshole": "jerk",
      "fucking": "loving",
      "bitch": "female dog",
      "fucker": "lover",
      "bastard": "gentleman",
      "shit ": "poop ",
      "shit.": "poop.",
      "shitty": "poopy",
      "ass ": "butt ",
      "dick ": "male reproductive organ ",
      "faggot": "homosexual",
      "fag ": "homo ",
      "fag.": "homo.",
      "bullshit": "poop",
      "slut": "sexually popular woman",
      "douche ": "female hygene product",
      "douchebag": "female hygene accesory",
      "fatass": "overweight person",
      "goddamn": "unfortunate",
      "damn": "unfortunate",
      "hoe": "lady",
      "jackass": "idiot",
      "piss": "urinate",
      "prick": "rude person"
    };
    String.prototype.replaceAll = function(search, replacement) {
      var target = this;
      return target.replace(new RegExp(search, 'g'), replacement);
    };
    replaceWordsHelper(censorship, text).
      then(function(fixedText)
    {
      let resp = {text: fixedText};
      response.setHeader('Content-Type', 'application/json');
      response.send({ text: fixedText });
    });
  }
}

function replaceWordsHelper(map, quote)
{
  let censorship = map
  let text = quote
  return new Promise(function(resolve,reject)
  {
    for(let i = 0 ; i < Object.keys(censorship).length + 1 ; i++)
    {
      if(i === Object.keys(censorship).length)
        resolve(text)
      else
        text = text.replaceAll(Object.keys(censorship)[i], censorship[Object.keys(censorship)[i]])
    }
  });
}
