class CreateTests < ActiveRecord::Migration[5.0]
  def change
    create_table :tests do |t|
    	t.string :name
    	t.string :page_code
    	t.belongs_to :page, index: true

      t.timestamps
    end
  end
end
