class ShopFilter
	def initialize
		Facility.all.each do |f|
			gen_attr_accessor f.name
		end
	end

	def gen_attr_accessor val
		singleton_class.class_eval { attr_accessor val.downcase }
		send("#{val.downcase}=", val.downcase)
	end
end
