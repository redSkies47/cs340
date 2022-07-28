// Get the objects we need to modify
let addGenreForm = document.getElementById('addGenres');

// Modify the objects we need
addGenreForm.addEventListener("submit", function (e) {
    
    // Prevent the form from submitting
    e.preventDefault();

    // Get form fields we need to get data from
    // let inputFirstName = document.getElementById("input-fname");
    // let inputLastName = document.getElementById("input-lname");
    // let inputHomeworld = document.getElementById("input-homeworld");
    // let inputAge = document.getElementById("input-age");
    let inputGenreID = document.getElementById('input-genre-id');
    let inputGenreName = document.getElementById('input-genre-name');

    // Get the values from the form fields
    // let firstNameValue = inputFirstName.value;
    // let lastNameValue = inputLastName.value;
    // let homeworldValue = inputHomeworld.value;
    // let ageValue = inputAge.value;
    let genreIDValue = inputGenreID.value;
    let genreNameValue = inputGenreName.value;

    // Put our data we want to send in a javascript object
    let data = {
        // fname: firstNameValue,
        // lname: lastNameValue,
        // homeworld: homeworldValue,
        // age: ageValue,
        genre_id: genreIDValue,
        genre: genreNameValue
    }
    
    // Setup our AJAX request
    var xhttp = new XMLHttpRequest();
    xhttp.open("POST", "/add-genre-ajax", true);
    xhttp.setRequestHeader("Content-type", "application/json");

    // Tell our AJAX request how to resolve
    xhttp.onreadystatechange = () => {
        if (xhttp.readyState == 4 && xhttp.status == 200) {

            // Add the new data to the table
            addRowToTable(xhttp.response);

            // Clear the input fields for another transaction
            // inputFirstName.value = '';
            // inputLastName.value = '';
            // inputHomeworld.value = '';
            // inputAge.value = '';
            inputGenreName = '';
        }
        else if (xhttp.readyState == 4 && xhttp.status != 200) {
            console.log("There was an error with the input.")
        }
    }

    // Send the request and wait for the response
    xhttp.send(JSON.stringify(data));

})


// Creates a single row from an Object representing a single record from 
// bsg_people
addRowToTable = (data) => {

    // Get a reference to the current table on the page and clear it out.
    // let currentTable = document.getElementById("people-table");
    let currentTable = document.getElementById("genre-table");

    // Get the location where we should insert the new row (end of table)
    let newRowIndex = currentTable.rows.length;

    // Get a reference to the new row from the database query (last object)
    let parsedData = JSON.parse(data);
    let newRow = parsedData[parsedData.length - 1]

    // Create a row and 4 cells
    let row = document.createElement("TR");
    let idCell = document.createElement("TD");
    // let firstNameCell = document.createElement("TD");
    // let lastNameCell = document.createElement("TD");
    // let homeworldCell = document.createElement("TD");
    // let ageCell = document.createElement("TD");
    let genreIDCell = document.createElement("TD");
    let genreNameCell = document.createElement("TD");

    // Fill the cells with correct data
    idCell.innerText = newRow.id;
    // firstNameCell.innerText = newRow.fname;
    // lastNameCell.innerText = newRow.lname;
    // homeworldCell.innerText = newRow.homeworld;
    // ageCell.innerText = newRow.age;
    genreIDCell.innerText = newRow.genre_id;
    genreNameCell.innerText = newRow.genre;

    // Add the cells to the row 
    // row.appendChild(idCell);
    // row.appendChild(firstNameCell);
    // row.appendChild(lastNameCell);
    // row.appendChild(homeworldCell);
    // row.appendChild(ageCell);
    row.appendChild(genreIDCell);
    row.appendChild(genreNameCell);
    
    // Add the row to the table
    currentTable.appendChild(row);
}