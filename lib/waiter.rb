require 'pry'

class Waiter
    attr_reader(:name, :exp_yr)

    @@all = []

    def initialize(name, exp_yr)
        @name = name
        @exp_yr = exp_yr
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select do |meal|
            meal.waiter == self
        end
    end

    def customers
        self.meals.map do |meal|
            meal.customer
        end
    end

    def tips
        self.meals.map do |meal|
            meal.tip
        end
    end

    def largest_tip
        self.tips.max
    end

    def best_tipper
        best_tipped_meal = self.meals.select do |meal|
            meal.tip == self.tips.max
        end
        best_tipped_meal[0].customer
    end
end
