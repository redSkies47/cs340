/*
    SETUP for a simple web app
*/
// Express
var express = require('express');   // We are using the express library for the web server
var app     = express();            // We need to instantiate an express object to interact with the server in our code
app.use(express.static('public'));
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

/*
    ROUTES
*/

// Our Index.html page
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
app.post('/Genres', function(req, res){
    // Capture the incoming data and parse it back to a JS object
    let data = req.body;

    // Capture NULL values
    let genreID = parseInt(data['input-genre-id']);
    if (isNaN(genreID))
    {
        genreID = 'NULL'
    }

    // Create the query and run it on the database
    query2 = `INSERT INTO Genres (genre_id, genre) VALUES (${genreID}, '${data['input-genre-name']}');`;
    db.pool.query(query2, function(error, rows, fields){

        // Check to see if ther was an error
        if (error) {
            
            // Log the error to the terminal so we know what went wrong, and send the visitor an HTTP response 400 indicating it was a bad request.
            console.log(error)
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


// READ operation for Ratings
app.get('/Ratings', function(req, res)
{  
    let query3 = 'SELECT * FROM `Ratings`;';  // Define our query

    db.pool.query(query3, function(error, rows, fields){   

        res.render('ratings', {data: rows});                 
    })                                                      
});


// CREATE operation for Ratings
app.post('/Ratings', function(req, res){
    // Capture the incoming data and parse it back to a JS object
    let data = req.body;

    // Capture NULL values
    let ratingID = parseInt(data['input-rating-id']);
    if (isNaN(ratingID))
    {
        ratingID = 'NULL'
    }

    // Create the query and run it on the database
    query4 = `INSERT INTO Ratings (rating_id, rating_description) VALUES (${ratingID}, '${data['input-rating-description']}');`;
    db.pool.query(query4, function(error, rows, fields){

        // Check to see if ther was an error
        if (error) {
            
            // Log the error to the terminal so we know what went wrong, and send the visitor an HTTP response 400 indicating it was a bad request.
            console.log(error)
            res.sendStatus(400);
        }
         // If there was no error, we redirect back to our Ratings route, which automatically runs the SELECT * FROM Genres and
        // presents it on the screen
        else
        {
            res.redirect('/Ratings')
        }
    })
});


// READ operation for Tickets
app.get('/Tickets', function(req, res)
{  
    let query5 = 'SELECT * FROM `Tickets`;';  // Define our query

    db.pool.query(query5, function(error, rows, fields){   

        res.render('tickets', {data: rows});                 
    })                                                      
});

// // CREATE operation for Tickets under construction!
// app.post('/Ratings', function(req, res){
//     // Capture the incoming data and parse it back to a JS object
//     let data = req.body;

//     // Capture NULL values
//     let ratingID = parseInt(data['input-rating-id']);
//     if (isNaN(ratingID))
//     {
//         ratingID = 'NULL'
//     }

//     // Create the query and run it on the database
//     query6 = `INSERT INTO Ratings (rating_id, rating_description) VALUES (${ratingID}, '${data['input-rating-description']}');`;
//     db.pool.query(query6, function(error, rows, fields){

//         // Check to see if ther was an error
//         if (error) {
            
//             // Log the error to the terminal so we know what went wrong, and send the visitor an HTTP response 400 indicating it was a bad request.
//             console.log(error)
//             // res.send(JSON.stringify(error));
//             res.sendStatus(400);
//         }
//          // If there was no error, we redirect back to our Ratings route, which automatically runs the SELECT * FROM Genres and
//         // presents it on the screen
//         else
//         {
//             res.redirect('/Ratings')
//         }
//     })
// });


// READ operation for Ticket Types
app.get('/Ticket_Types', function(req, res)
{  
    // let query7 = 'SELECT * FROM `Tickets_Types`;';  // Define our query
    let query7 = 'SELECT ticket_type_id, ticket_type_name, ticket_price FROM `Ticket_Types`;';

    db.pool.query(query7, function(error, rows, fields){   

        res.render('ticket_types', {data: rows});                 
    })                                                      
});


// CREATE operation for Tickets Types
app.post('/Ticket_Types', function(req, res){
    // Capture the incoming data and parse it back to a JS object
    let data = req.body;

    // Capture NULL values
    let typeID = parseInt(data['input-type-id']);
    if (isNaN(typeID))
    {
        typeID = 'NULL'
    }

    let typePrice = parseFloat(data['input-ticket-price']);
    if (isNaN(typePrice))
    {
        typePrice = 'NULL'
    }

    // Create the query and run it on the database
    query8 = `INSERT INTO Ticket_Types (ticket_type_id, ticket_type_name, ticket_price) VALUES (${typeID}, '${data['input-type-name']}', ${typePrice});`;
    db.pool.query(query8, function(error, rows, fields){

        // Check to see if ther was an error
        if (error) {
            
            // Log the error to the terminal so we know what went wrong, and send the visitor an HTTP response 400 indicating it was a bad request.
            console.log(error)
            // res.send(JSON.stringify(error));
            res.sendStatus(400);
        }
         // If there was no error, we redirect back to our Ratings route, which automatically runs the SELECT * FROM Genres and
        // presents it on the screen
        else
        {
            res.redirect('/Ticket_Types')
        }
    })
});


// READ operation for Movies
app.get('/Movies', function(req, res)
{  
    let query9 = 'SELECT * FROM `Movies`;';  // Define our query

    db.pool.query(query9, function(error, rows, fields){   

        res.render('movies', {data: rows});                 
    })                                                      
});


// READ operation for Shows
app.get('/Shows', function(req, res)
{  
    let query11 = 'SELECT * FROM `Shows`;';  // Define our query

    db.pool.query(query11, function(error, rows, fields){   

        res.render('shows', {data: rows});                 
    })                                                      
});


// READ operation for Items
app.get('/Items', function(req, res)
{  
    let query13 = 'SELECT * FROM `Items`;';  // Define our query

    db.pool.query(query13, function(error, rows, fields){   

        res.render('items', {data: rows});                 
    })                                                      
});


// READ operation for Concessions_has_Items - 1 table loading all
app.get('/Concessions', function(req, res)
    {  
        let query14 = "SELECT concession_details_id AS ID, concessions_id, item_id FROM `Concessions_has_Items`;";
        let query15 = "SELECT * FROM `Concessions`;";            // Define our query

        db.pool.query(query14, function(error, rows, fields){    // Execute the query

            res.render('concessions', {data: rows});            // Render the concessions.hbs file, and also send the renderer
        })                                                      // an object where 'data' is equal to the 'rows' we
    });                                                         // received back from the query

// READ operation for Concessions_has_Items - attempt of 2 tables loading
// app.get('/Concessions', function(req, res)
//     {  
//         let query14 = "SELECT concession_details_id AS ID, concessions_id, item_id FROM `Concessions_has_Items`;";
//         let query15 = "SELECT concessions_id AS cid, saledatime, price, employee_id FROM `Concessions`;";            // Define our query

//         // Use SELECT * to populate Concessions_has_Items
//         // db.pool.query(query14, function(error, rows, fields){    // Execute the query

//         //     res.render('concessions', {data: rows});
//         // }) 
        
//         // Use SELECT * to populate Concessions too
//         db.pool.query(query15, function(error, rows, fields){    // Execute the query

//             res.render('concessions', {data: rows});
//         }) 
//     });


// CREATE operation for Concessions_has_Items
app.post('/Concessions', function(req, res){
    // Capture the incoming data and parse it back to a JS object
    let data = req.body;

    // Capture NULL values
    let conDetailsID = parseInt(data['input-conDetailsID']);
    if (isNaN(conDetailsID))
    {
        conDetailsID = 'NULL'
    }

    let concessions_id = parseInt(data['input-concession-id']);
    if (isNaN(concessions_id))
    {
        concessions_id = 'NULL'
    }

    let items_id = parseInt(data['input-item-id']);
    if (isNaN(items_id))
    {
        items_id = 'NULL'
    }

    // Create the query and run it on the database
    query16 = `INSERT INTO Concessions_has_Items (concession_details_id, concessions_id, item_id) VALUES (${conDetailsID}, ${concessions_id}, ${items_id});`;
    db.pool.query(query16, function(error, rows, fields){

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
            res.redirect('/Concessions')
        }
    })
});


// DELETE operation for Concession_has_Items
app.delete('/delete-con-has-ajax/', function(req,res,next){
    let data = req.body;
    let conDetailsID = parseInt(data.ID)
    // let deleteConcessionItemsID = parseInt(data.id);
    // let deleteConcession_has_Items = `DELETE FROM Concessions_has_Items WHERE concessions_id = ?`;
    // let deleteConcessions= `DELETE FROM Concessions WHERE concession_id = ?`;
  
  
    // Run the 1st query
    db.pool.query([conDetailsID], function(error, rows, fields){
        if (error) {

        // Log the error to the terminal so we know what went wrong, and send the visitor an HTTP response 400 indicating it was a bad request.
        console.log(error);
        res.sendStatus(400);
        }

        else
        {
            // Success
            res.sendStatus(204);

        }
    });
});


// READ operation for Employees
app.get('/Employees', function(req, res)
{  
    let query17 = 'SELECT * FROM `Employees`;';  // Define our query

    db.pool.query(query17, function(error, rows, fields){   

        res.render('employees', {data: rows});                 
    })                                                      
});

/*
    LISTENER
*/
app.listen(PORT, function(){            // This is the basic syntax for what is called the 'listener' which receives incoming requests on the specified PORT.
    console.log('Express started on http://localhost:' + PORT + '; press Ctrl-C to terminate.')
});