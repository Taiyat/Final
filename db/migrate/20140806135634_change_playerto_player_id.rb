class ChangePlayertoPlayerId < ActiveRecord::Migration
  def change
    remove_column :players, :player, :string
    add_column :players, :player_id, :integer
  end
end
