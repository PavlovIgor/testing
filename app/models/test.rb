class Test < ApplicationRecord
	belongs_to :page

	validate :strategy_validate

	def start
		strategy_type.constantize.new(self).start
	end


private
	before_save do 
		self.strategy_type = "RequestCodeTest"
	end

	after_create do
		self.update_attributes(:file_path => create_file)
	end

	before_destroy do
		remove_file
	end


	def strategy_validate
		strategy_fields.each do |i|
			if not send(i).present?
				errors.add(i, 'can\'t be blank')
			end
		end
	end

	def strategy_fields
		"RequestCodeTest".constantize.attrs
	end

	def create_file
		file_path = "spec/users_tests/user_"+page.app.user.id.to_s+"_app_"+page.app.id.to_s+"_page_"+page.id.to_s+"_test_"+id.to_s+"_spec.rb"
		out_file = File.new(file_path, "w")
		out_file.puts("RequestCodeTest".constantize.new(self).test_code)
		out_file.close
		file_path
	end

	def remove_file
		File.delete(file_path)
	end

end