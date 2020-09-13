module PagesHelper
	WORDS = IO.readlines('/usr/share/dict/words').map do |x|
		x.strip!
		x.downcase!
		x unless x[/[^a-z]/]
	end.tap(&:compact!)

	def hipsum
		rand(20..40).times.map { WORDS.sample }.join(' ').capitalize
	end
end
