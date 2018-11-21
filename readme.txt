log.rb : this is the singleton file, it can have only one reference even if
multiple modules call it. I prefer calling it with the class level methods.
----
options.rb: this builds a command pattern. It takes apis and adds them to an
array. Since these api's have the command module included in proxies.rb,
i can can their execute methods. Once the execution is complete, it will take
care of closing the output file(responses.json).
----
proxies.rb: this module uses remote proxy for 3 seperate classes. I wrote a
module that does takes care of most of the work except for parsing, because
every response has different fields and the ones that I needed to use are different
on every class. Similarly I had to override some of the module's functions
inside the classes, the instructor was okay with this.

I didn't write a separate callback function in case the connection fails. All I
did was a basic try/catch loop. if the connection failed catch(rescue in ruby)
was executed. Instructor was also okay with this.
----
canadianAPI: the API i wrote myself. It has to take a JSON object argument
on the link http://127.0.0.1 on port 80 naturally. So the link is
http://127.0.0.1:80/. It only takes care of post requests on that link.
The argument should have a field called text. Otherwise the server will not
crash however it will send the ruby code into an infinite loop.

What this api does is takes a json object with field "text": "TEXT". If the text
contains basic swear words, replaces them with different words which can not be
considered swear words. The results are pretty funny. Then sends the response
back in same format, a JSON object with field "text": "TEXT".
----
To run:
your pc must have nodejs installed. navigate to the canadianAPI folder, and run
the command 'npm install'. This will install the required modules for the server
by using the package.json file. Once that's done, run the command 'sudo index.js'
this will run the server on your machine. Keep in mind this is the OS X way of
making the server work. Open another terminal window and simply run the command
'ruby main.rb'.
