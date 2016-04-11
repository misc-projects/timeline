$(document).ready(function() {

	$("body").on('change', "input[name='calendar[leap]']", function() {
		if ($(this).is(':checked')) {
            $("input[name='calendar[leap_year_num]']").prop('disabled', false);
            $("input[name='calendar[leap_year_num]']").parent('.field').animate({'opacity': 1});
        } else {
        	$("input[name='calendar[leap_year_num]']").prop('disabled', true);
        	$("input[name='calendar[leap_year_num]']").parent('.field').animate({'opacity': 0.3});
        }
	});

	function monthFields() {
		var ndays = $("#calendar_days_in_month").val()


		$("body").on('click', "#populate-month-button", function() {
			var input = $("#calendar_months_in_year")
			if (!input.val()) {
				input.addClass('has-error')
				input.nextAll('.error-message').remove();
        		input.after('<div class="error-message">need at least 1 month</div>');
			} else {
				console.log(input.val())
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
			};
		});		

		$("body").on('click', "#reset-month-button", function() {
			// clear out all months
			$(".remove-month-link").trigger("click");

			$(".simple-months").removeClass("hidden");
			$("#months").addClass("hidden");

			
		});

		// filling fields, month number and day
		function numberMonths() {
			$(".month-number-field").each(function( index ) {
				$(this).val(index + 1); 
			});

			$(".month-day-field").val(ndays);
			$(".month-number-field").attr('readonly', true);
		};

		// reorder months after remove and insertion
		$("body").on('cocoon:after-remove', "#months", numberMonths)
		$("body").on('cocoon:after-insert', "#months", numberMonths)
	
	};

	monthFields();

});
