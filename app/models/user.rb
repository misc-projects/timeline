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
									{ abbrev: "GRE",
										name: "Gregorian",
										leap: true,
										leap_year_num: 4,
										months_in_year: 12,
										week_length: 7,
										days_in_week: ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"],
										hours_in_day: 24,
										year_length: 365.2425,
										global_anchor: 0,
										global_scale: 1,
										eras_attributes: [{ number: 1,
																				abbrev: "BCE",
																				name: "Before Common Era",
																				direction: false,
																				anchor: 0	},
																			{ number: 2,
																				abbrev: "CE",
																				name: "Common Era",
																				direction: true,
																				anchor: 0	}],
										months_attributes: [{ number: 1, 
																					name: "January",
																					days_normal: 31,
																					days_leap: 31 },
																				{ number: 2,
																					name: "February",
																					days_normal: 28,
																					days_leap: 29},
																				{ number: 3,
																					name: "March",
																					days_normal: 31,
																					days_leap: 31 },
																				{ number: 4,
																					name: "April",
																					days_normal: 30,
																					days_leap: 30 },
																				{ number: 5,
																					name: "May",
																					days_normal: 31,
																					days_leap: 31 },
																				{ number: 6,
																					name: "June",
																					days_normal: 30,
																					days_leap: 30 },
																				{ number: 7,
																					name: "July",
																					days_normal: 31,
																					days_leap: 31 },
																				{ number: 8,
																					name: "August",
																					days_normal: 31,
																					days_leap: 31 },
																				{ number: 9,
																					name: "September",
																					days_normal: 30,
																					days_leap: 30 },
																				{ number: 10,
																					name: "October",
																					days_normal: 31,
																					days_leap: 31 },
																				{ number: 11,
																					name: "November",
																					days_normal: 30,
																					days_leap: 30 },	
																				{ number: 12,
																					name: "December",
																					days_normal: 31,
																					days_leap: 31 }]
									}
								}
			calendar = self.calendars.build(params[:calendar])
			calendar.save
		end
end

