$(document).ready(function() {
	console.log("loaded")
	// next button + validate
		// calendar name can't be empty
	// next
		// era names can't be empty
		// must have at least 2 eras, with direction
	// next
		// must have at least one month, with number of days
	// next
		// must have number of days + hours
		
	// populate months
	// TODO slider


	function multiStepForm() {
		$("body").on('click', ".next-step-button", function() {

			// insert validation here
			$("input[name=tab-radio]:checked").next().prop("checked", true);
		});

		$("body").on('click', ".back-step-button", function() {

			// insert validation here
			$("input[name=tab-radio]:checked").prev().prop("checked", true);
		});
	}

	function monthFields() {
		var ndays = $("#calendar_days_in_month").val()


		$("body").on('click', "#populate-month-button", function() {

			console.log("inside populate action")

			$("#months").removeClass("hidden");
			$(".simple-months").addClass("hidden");

			// clear out previous months
			$(".remove-month-link").trigger("click");
			
			// adding empty month fields
			var nmonth = $("#calendar_months_in_year").val();
			ndays = $("#calendar_days_in_month").val();

			for (var i = 0; i < nmonth; i++) {
				$(".add-month-link").trigger("click");
			};

		});		

		$("body").on('click', "#reset-month-button", function() {

			// clear out all months
			$(".remove-month-link").trigger("click");

			$(".simple-months").removeClass("hidden");
			$("#months").addClass("hidden");

			
		});

		$('.sortable-container').sortable({ 

		 	items: '.sortable',

	        update: function(e, ui) {
	            // ui.item.sortable is the model but it is not updated until after update
	            var oldIndex = ui.item.sortable.index;
	            // new Index because the ui.item is the node and the visual element has been reordered
	            var newIndex = ui.item.index();

	            numberMonths()
	        }    
		});
	
		// filling fields, month number and day
		function numberMonths() {
			$(".month-number-field").each(function( index ) {
				$(this).val(index + 1); 
			});

			$(".month-day-field").val(ndays);

			$(".month-number-field").attr('readonly', true);
			// $(".month-number-field").focus(function () {
            //    $(this).blur();
            // });
		};

		// reorder months after remove and insertion
		$("body").on('cocoon:after-remove', "#months", numberMonths)
		$("body").on('cocoon:after-insert', "#months", numberMonths)
	
	};

	multiStepForm();
	monthFields();

});
