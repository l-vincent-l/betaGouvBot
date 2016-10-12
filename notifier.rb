require 'date'

def notifications members, date
	by_date = members.group_by {|item| item[:end]}
	by_date.flat_map do |date,items|
		date = Date.parse date
		soon = (date - 10).iso8601
		late = (date - 1).iso8601
		who = items.map {|one| one[:id]}
		[{when:soon, who: who},{when:late, who: who}]
	end
end