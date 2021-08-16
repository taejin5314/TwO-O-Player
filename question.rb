class Question
  def initialize
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    @answer = (@num1 + @num2).to_s
    "What does #{@num1} plus #{@num2} eqaul?"
  end

  def check(number)
    @answer == number
  end
end