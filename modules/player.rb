class Player
  attr_accessor :name, :life, :max_life
  def initialize(name)
    @name = name
    @life = 3 # initial number of life
    @max_life = 3
  end

  def take_life
    # for incorrect answer, take 1 life at a time
    @life -= 1
  end
end
