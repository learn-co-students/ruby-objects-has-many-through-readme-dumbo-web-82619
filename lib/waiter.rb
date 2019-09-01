class Waiter
  attr_reader :name, :years_ex
  @@all = []

  def initialize(name, years_ex)
    @name = name
    @years_ex = years_ex
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal(customer, total, tip = 0)
    Meal.new(customer, self, total, tip)
  end

  def meals
    Meal.all.select do |meal|
      meal.waiter == self
    end
  end

  def best_tipper
    high_tip = meals.max do |meal_a, meal_b|
      meal_a.tip <=> meal_b.tip
    end
    high_tip.customer
  end

end