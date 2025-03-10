class Attraction < ApplicationRecord

  has_many :rides
  has_many :users, through: :rides


  has_many :rides
  has_many :users, through: :rides

  def take_ride
    if self.user.tickets < self.attraction.tickets && self.user.height < self.attraction.min_height
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif self.user.height < self.attraction.min_height
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    elsif self.user.tickets < self.attraction.tickets
     "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif self.user.tickets > self.attraction.tickets
         self.user.tickets -= self.attraction.tickets
         self.user.nausea += self.attraction.nausea_rating
         self.user.happiness += self.attraction.happiness_rating
         self.user.save
      end
    end

end
