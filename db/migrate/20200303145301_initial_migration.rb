class InitialMigration < ActiveRecord::Migration[5.2]
  def change
    create_table :player do |t|
      t.string :name
    end

    create_table :game do |t|
      t.integer :player_id
      t.integer :time_played
      t.integer :score
      t.integer :enemies_killed
    end

    create_table :leaderboard do |t|
      t.integer :game_id
    end
  end
end
