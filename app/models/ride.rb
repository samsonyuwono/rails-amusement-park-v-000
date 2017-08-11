class Ride < ActiveRecord::Base

  belongs_to :attraction
  belongs_to :user

  def take_ride
    if enough_tickets? && tall_enough?
      ride_accepted
    else
      print_issue
    end
  end

  def ride_accepted
    update_tickets
    update_nausea
    update_happiness
    self.user.save
   "Thanks for riding the #{self.attraction.name}!"
  end

  def enough_tickets?
     self.user.tickets >= self.attraction.tickets
  end

  def tall_enough?
    self.user.height >= self.attraction.min_height
  end

  def update_tickets
    self.user.tickets -= self.attraction.tickets
  end

  def update_nausea
    self.user.nausea += self.attraction.nausea_rating
  end

  def update_happiness
    self.user.happiness += self.attraction.happiness_rating
  end

  def ticket_issue
    enough_tickets? ? "" : " You do not have enough tickets to ride the #{attraction.name}."
  end

  def height_issue
    tall_enough? ? "" : " You are not tall enough to ride the #{attraction.name}."
  end

  def print_issue
    "Sorry." + ticket_issue + height_issue
  end

end
