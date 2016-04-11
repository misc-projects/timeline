$(document).ready(function() {


  // dependent on D3
  function displayTimeline() {
    
    // get initial data
    $.ajax({
      type: "GET",
      url: line_path,
      dataType: "json",
      success: function(data){
        console.log(data)
      }        
    });

    function addEventToTimeline() {
      // D3 MAGIC (add node to data, etc)
    };

    $(document).on("ajax:success", "#event-form", function(status, data, xhr){
      addEventToTimeline();
    });
   };

  displayTimeline();

});