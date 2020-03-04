class Game < ActiveRecord::Base
    belongs_to :leaderboard
    has_many :players

end