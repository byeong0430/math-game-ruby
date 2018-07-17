class Question
  attr_accessor :number
  def initialize
    @number = {}
  end

  def generate_2_random_number
    # generate two random integers between 1 and 20
    2.times.map { Random.rand(1..20) }
  end

  def add_numbers
    # add the two numbers and push number1, number2, and the sum result to initial `number` hash
    numbers = generate_2_random_number
    answer = numbers.inject(0, :+)
    
    @number[:number1] = numbers[0]
    @number[:number2] = numbers[1]
    @number[:answer] = answer
    puts @number
  end
end
