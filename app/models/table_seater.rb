class TableSeater
  def initialize(people)
    @people = people
    p @people.length-2
  end

  def arrange_every_other
    i = 0
    first_half = []
    second_half = []

    @people.each do |person|
      if  i%2 == 0
        first_half << person
      else
        second_half << person
      end
      i += 1
    end
    first_half.concat(second_half)
  end

  def arrange_every_third
    first_third = []
    second_third = []
    last_third = []
    i = 0

    @people.each do |person|
      if i%3 == 0
        first_third << person
      elsif i%3 == 1
        second_third << person
      else
        last_third << person
      end
      i += 1
    end
    first_third.concat(second_third).concat(last_third)
  end
end