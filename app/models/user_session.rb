class UserSession
	include ActiveModel::Validations
	include ActiveModel::Conversion
	extend ActiveModel::Naming
	extend ActiveModel::Translation

	attr_accessor :email, :password

	def persisted?
		false
	end

end	