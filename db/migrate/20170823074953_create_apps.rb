class CreateApps < ActiveRecord::Migration[5.0]
  def change
    create_table :apps do |t|
    	t.string :name
    	t.string :url
    	t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
