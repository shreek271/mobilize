class OrderMailer < ApplicationMailer

  def send_new_order_email(order)
  	@order = order
  	mail( :to => "sanoj.kumar928@gmail.com", :subject => 'New Order from #{@order.user.name}' )
  end

end
