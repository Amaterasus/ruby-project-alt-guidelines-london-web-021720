class Leaderboard < ActiveRecord::Base
    has_one :game

    def self.set_ranking
        ranking = Leaderboard.all.sort_by { |id| id.game.score }.reverse
        rank = 1
        ranking.map do |game|
            game.rank = rank
            game.save
            rank += 1
        end
    end
end