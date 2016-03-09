$(document).ready(function() {

	$('#form-modal').on('shown.bs.modal', function() {

        $("#event-tag-field").tagit( {
        	allowSpaces: true
        });

        // adds class to single input element
        // $("#event-tag-field").data("ui-tagit").tagInput.addClass("tag-element");
    })

    
});