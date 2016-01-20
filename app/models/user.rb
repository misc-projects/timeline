class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :lines
  has_many :calendars
  
  after_create :create_default_calendar

	private
		def create_default_calendar
			params = { calendar: 
									{ user: self,
										abbrev: "GRE",
										name: "Gregorian",
										leap: true,
										leap_year_num: 4,
										months_in_year: 12,
										week_length: 7,
										days_in_week: ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"],
										year_length: 365.2425,
										global_anchor: 0,
										global_scale: 1,
										eras_attributes: [{ abbrev: "BCE",
																				name: "Before Common Era",
																				direction: -1,
																				anchor: 0	},
																			{ abbrev: "CE",
																				name: "Common Era",
																				direction: 1,
																				anchor: 0	}],
										months_attributes: [{ number: 1, 
																					name: "January",
																					length_in_days: 31,
																					leaper: false },
																				{ number: 2,
																					name: "February",
																					length_in_days: 28,
																					leaper: true },
																				{ number: 3,
																					name: "March",
																					length_in_days: 31,
																					leaper: false },
																				{ number: 4,
																					name: "April",
																					length_in_days: 30,
																					leaper: false },
																				{ number: 5,
																					name: "May",
																					length_in_days: 31,
																					leaper: false },
																				{ number: 6,
																					name: "June",
																					length_in_days: 30,
																					leaper: false },
																				{ number: 7,
																					name: "July",
																					length_in_days: 31,
																					leaper: false },
																				{ number: 8,
																					name: "August",
																					length_in_days: 31,
																					leaper: false },
																				{ number: 9,
																					name: "September",
																					length_in_days: 30,
																					leaper: false },
																				{ number: 10,
																					name: "October",
																					length_in_days: 31,
																					leaper: false },
																				{ number: 11,
																					name: "November",
																					length_in_days: 30,
																					leaper: false },	
																				{ number: 12,
																					name: "December",
																					length_in_days: 31,
																					leaper: false }]
									}
								}
			Calendar.create(params[:calendar])
		end
end

