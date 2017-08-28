class CreatePages < ActiveRecord::Migration[5.0]
  def change
    create_table :pages do |t|
    	t.string :name
    	t.string :url
    	t.belongs_to :app, index: true

      t.timestamps
    end
  end
end
