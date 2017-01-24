class UserMailer < ApplicationMailer
  default from: 'schwammy@schwamit.com'

  def review_email(user, item)
    @user = user
    @item = item
    @url  = "http://localhost:3000/items/#{@item.id}"
    mail(
      to: @user.email,
      subject: "#{@item.title} has been reviewed."
    )
  end
end
