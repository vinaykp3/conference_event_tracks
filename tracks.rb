# available_slot_times = [9]

# 9 - 12
# break - 12- 1
# 1 - 4

# [60, 45, 30, 45, 45, 5, 60, 45, 30, 30, 45, 60 , 60,45, 30, 30, 60, 30, 30]
require 'date'
proposal_time_categories = {
"60"=> ["Writing Fast Tests Against Enterprise Rails 60min", "Communicating Over Distance 60min", "Rails Magic 60min", "Ruby on Rails: Why We Should Move On 60min", "Ruby on Rails Legacy App Maintenance 60min"], 
"45"=>["Overdoing it in Python 45min", "Ruby Errors from Mismatched Gem Versions 45min", "Common Ruby Errors 45min", "Accounting-Driven Development 45min", "Pair Programming vs Noise 45min", "Clojure Ate Scala (on my project) 45min"], 
"30"=>["Lua for the Masses 30min", "Woah 30min", "Sit Down and Write 30min", "Programming in the Boondocks of Seattle 30min", "Ruby vs. Clojure for Back-End Development 30min", "A World Without HackerNews 30min", "User Interface CSS in Rails Apps 30min"], 
"5"=>["Rails for Python Developers"]
}
sessions = [
[60, "Writing Fast Tests Against Enterprise Rails 60min"],[45, "Overdoing it in Python 45min"], [30, "Lua for the Masses 30min"], [45, "Ruby Errors from Mismatched Gem Versions 45min"], [45,"Common Ruby Errors 45min"], [5, "Rails for Python Developers lightning"], [60, "Communicating Over Distance 60min"],[45, "Accounting-Driven Development 45min"], [30, "Woah 30min"], [30, "Sit Down and Write 30min"], [45, "Pair Programming vs Noise 45min"],[60, "Rails Magic 60min"], [60, "Ruby on Rails: Why We Should Move On 60min"], [45, "Clojure Ate Scala (on my project) 45min"], [30, "Programming in the Boondocks of Seattle 30min"], [30, "Ruby vs. Clojure for Back-End Development 30min"], [60, "Ruby on Rails Legacy App Maintenance 60min"],[30, "A World Without HackerNews 30min"], [30, "User Interface CSS in Rails Apps 30min"]
]
sessions = sessions.sort.reverse
lunch_start = 180
sessions_end_minutes = 480
start_time = Time.new(2022, 7, 8, 9, 00)
i = 0
tracks = [[], []]
tracks.each do |track|
	begin_time = 0
	index = 0
	time = start_time
	while(sessions.length != 0)
		if begin_time == lunch_start
			track << "#{time.strftime('%I:%M %p')}" + " LUNCHTIME"
			time = time + 60*60
			begin_time = begin_time + 60
		elsif begin_time >= sessions_end_minutes
			track << "#{time.strftime('%I:%M %p')}" + " NetWorkingEvent"
			break
		elsif begin_time != lunch_start && begin_time < sessions_end_minutes
			element = sessions.shift()
			track << "#{time.strftime('%I:%M %p')} " + element[1]
			index = index + 1
			time = time + (element[0]*60)
			begin_time = begin_time + element[0]
		end
	end
	pp "Track#{i}"
	pp " #{track}"
	i = i+1
end
