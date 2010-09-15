class InviteMailer < ActionMailer::Base
  default :from => "from@example.com"

  def welcome_email(user)
    @user = user
    @url = "http://meet.com/login"
    mail(:to=>user.email,
         :subject=>"Hello world")
  end
end
