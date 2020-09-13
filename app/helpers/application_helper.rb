module ApplicationHelper
	def truncate_text(str, len, suffix = '...')
		str.length > len ? str[0...len] + suffix : str if str
	end

	def active?(page)
		current_page?(page) ? 'active' : ''
	end
end
