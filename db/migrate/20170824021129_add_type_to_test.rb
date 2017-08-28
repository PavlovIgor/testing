class AddTypeToTest < ActiveRecord::Migration[5.0]
  def change
  	add_column :tests, :type, :string
  end
end
