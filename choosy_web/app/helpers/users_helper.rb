module UsersHelper
	def show_first(pair)
		if pair.votes_first == 0
			return 0
		end
		@votes_total = pair.votes_first + pair.votes_second
		@percent = (pair.votes_first.to_f / @votes_total.to_f * 100).to_i
		return @percent
	end

	def show_second(pair)
		if pair.votes_second == 0
			return 0
		end
		@votes_total = pair.votes_first + pair.votes_second
		@percent = (pair.votes_second.to_f / @votes_total.to_f * 100).to_i
		return @percent
	end
end
