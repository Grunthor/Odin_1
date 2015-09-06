#Update the code to give the player a default height of 58 and a default weight of 175.
#Updated refactor3.rb
class HockeyPlayer
  attr_reader :height, :weight
  def initialize(args)
    @height = args.fetch(:height)
    @weight = args.fetch(:weight)
  end
end

class Stick
  attr_reader :height, :weight
  def initialize(args)
    @height = args.fetch(:height,58)
    @weight = args.fetch(:weight,175)
  end

  def player
    @player ||= HockeyPlayer.new(:height => height, :weight => weight)
  end

  def length
    player_height - 10
  end

  def player_height
    player.height
  end

  def flex
    player.weight / 2
  end
end

s = Stick.new(:height => 60, :weight => 210)
p s.length
p s.flex