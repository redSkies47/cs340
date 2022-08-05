function deleteConcessionHasItems(ID) {
    let link = '/delete-con-has-ajax/';
    let data = {
      id: ID
    };
  
    $.ajax({
      url: link,
      type: 'DELETE',
      data: JSON.stringify(data),
      contentType: "application/json; charset=utf-8",
      success: function(result) {
        deleteRow(ID);
      }
    });
  }
  
  function deleteRow(ID){
      let table = document.getElementById("concessions-has-table");
      for (let i = 0, row; row = table.rows[i]; i++) {
         if (table.rows[i].getAttribute("data-value") == ID) {
              table.deleteRow(i);
              break;
         }
      }
  }