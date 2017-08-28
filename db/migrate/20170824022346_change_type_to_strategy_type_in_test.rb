class ChangeTypeToStrategyTypeInTest < ActiveRecord::Migration[5.0]
  def change
  	rename_column :tests, :type, :strategy_type
  end
end
