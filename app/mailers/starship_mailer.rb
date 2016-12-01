class StarshipMailer < ApplicationMailer
  default from: 'chandleryang76@gmail.com'

  def starship_created_email(starship)
    @starship = starship
    mail(to: @starship.email, subject: 'Starship Created')
  end
end
