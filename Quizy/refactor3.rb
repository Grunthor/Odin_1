class HockeyPlayer2
  attr_reader :height, :weight
  def initialize(height, weight)
    @height = height
    @weight = weight
  end
end
class Stick2
  attr_reader :player
  def initialize(height, weight)
    @player = refactored(height,weight)
  end
  
  HockeyPlayer2 = Struct.new(:height,:weight)
  
  def refactored(height, weight)
      player = HockeyPlayer2.new(height, weight)
  end
  
  def length
    player.height - 10
  end

  def flex
    player.weight / 2
  end
end
# The same code as above.
class HockeyPlayer
  attr_reader :height, :weight
  def initialize(height, weight)
    @height = height
    @weight = weight
  end
end

class Stick
  attr_reader :player
  def initialize(player)
    @player ||= player
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

s = Stick2.new(60, 210)
p s.length
p s.flex
s = Stick.new(HockeyPlayer.new(60, 210))
p s.length
p s.flex