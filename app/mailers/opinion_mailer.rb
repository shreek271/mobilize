class OpinionMailer < ApplicationMailer
  def send_opinion_email(name, description)
    @name = name
    @description = description
    mail( :to => "sanoj.kumar928@gmail.com", :subject => 'Suggestions or Complaints' )
  end
end
