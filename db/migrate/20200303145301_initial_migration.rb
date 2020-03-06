class InitialMigration < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :name
    end

    create_table :games do |t|
      t.integer :player_id
      t.integer :time_played
      t.float :score
      t.integer :enemies_killed
      t.integer :leaderboard_id
    end

    create_table :leaderboards do |t|
      t.integer :rank
    end
  end
end
