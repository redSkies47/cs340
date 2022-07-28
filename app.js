/*
    SETUP for a simple web app
*/
// Express
var express = require('express');   // We are using the express library for the web server
var app     = express();            // We need to instantiate an express object to interact with the server in our code
app.use(express.json())
app.use(express.urlencoded({extended: true}))

PORT        = 50505;                 // Set a port number at the top so it's easy to change in the future

// Database
var db = require('./database/db-connector')

//Handlebars
const { engine } = require('express-handlebars');
var exphbs = require('express-handlebars');     // Import express-handlebars
app.engine('.hbs', engine({extname: ".hbs"}));  // Create an instance of the handlebars engine to process templates
app.set('view engine', '.hbs');                 // Tell express to use the handlebars engine whenever it encounters a *.hbs file.

// // Static Files
// app.use(express.static('public'));

/*
    ROUTES
*/

app.get('/', function(req, res)
{
    res.render('start');                    // Note the call to render() and not send(). Using render() ensures the templating engine
});                                         // will process this file, before sending the finished HTML to the client.

// READ operation for Genres
app.get('/Genres', function(req, res)
{  
    let query1 = 'SELECT * FROM `Genres`;';  // Define our query

    db.pool.query(query1, function(error, rows, fields){    // Execute the query

        res.render('genres', {data: rows});                 // Render the concessions.hbs file, and also send the renderer
    })                                                      // an object where 'data' is equal to the 'rows' we
});  

// CREATE operation for Genres
app.post('/add-genre-form', function(req, res){
    // Capture the incoming data and parse it back to a JS object
    let data = req.body;

    // Capture NULL values
    let genreID = parseInt(data['input-genre-id']);
    if (isNaN(genreID))
    {
        genreID = 'NULL'
    }

    // Create the query and run it on the database
    query1 = `INSERT INTO Genres (genre_id, genre) VALUES (${genreID}, '${data['input-genre-name']}');`;
    db.pool.query(query1, function(error, rows, fields){

        // Check to see if ther was an error
        if (error) {
            
            // Log the error to the terminal so we know what went wrong, and send the visitor an HTTP response 400 indicating it was a bad request.
            console.log(error)
            // res.send(JSON.stringify(error));
            res.sendStatus(400);
        }
         // If there was no error, we redirect back to our Genres route, which automatically runs the SELECT * FROM Genres and
        // presents it on the screen
        else
        {
            res.redirect('/Genres')
        }
    })
});

// READ operation for Concessions_has_Items
app.get('/Concessions', function(req, res)
    {  
        let query1 = "SELECT concession_details_id AS ID, concessions_id, item_id FROM `Concessions_has_Items`;";
        let query2 = "SELECT * FROM `Concessions`;";            // Define our query

        db.pool.query(query1, function(error, rows, fields){    // Execute the query

            res.render('concessions', {data: rows});            // Render the concessions.hbs file, and also send the renderer
        })                                                      // an object where 'data' is equal to the 'rows' we
    });                                                         // received back from the query

/*
    LISTENER
*/
app.listen(PORT, function(){            // This is the basic syntax for what is called the 'listener' which receives incoming requests on the specified PORT.
    console.log('Express started on http://localhost:' + PORT + '; press Ctrl-C to terminate.')
});