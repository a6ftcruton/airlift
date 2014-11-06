class VendorNotifier < ActionMailer::Base
  default from: "jgoulding2@gmail.com"

  def new_order_notification(user, order, vendor_order)
    @user = user
    @order = order
    @vendor_order = vendor_order
    mail( :to => "jimsuttonjimsutton@gmail.com",
#    mail( :to => user.email,
          :subject => "You have a new Airlift order!"
        )
  end
end
