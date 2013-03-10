# encoding: utf-8

class Timer

	def initialize(base_time)

		@base_time = base_time
	end

	def get_base_to_now_time 
		
		# 処理
		end_time = Time.now

		return ((end_time - @base_time)*1000).round
	end
end