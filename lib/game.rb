class Game < ActiveRecord::Base
    belongs_to :leaderboard
    belongs_to :player



end