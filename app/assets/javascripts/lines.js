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


    /* DATA FORMAT
      array of events as JSON objects
        [{event_json), {}, ...]
      */


    /* TODO
          map date to y-axis
          map arcs to x-axis if option selected?
          */


    function addEventToTimeline() {
      // D3 MAGIC (add node to data, etc)
    };

    function showEventDetail() {
      // show details on hover
    };

    $(document).on("ajax:success", "#event-form", function(status, data, xhr){
      addEventToTimeline();
    });
   };

  displayTimeline();

});