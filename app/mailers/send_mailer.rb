class SendMailer < ApplicationMailer
  default from: "ne201218@senshu-u.jp"
  # def published_email(automail)
  #   @automail = automail
  #   mail to: automail.email  #新規登録されたメールアドレス
  # end
  def published_email
    @automail = params[:automail]
    mail(
      subject: 'ご登録ありがとうございます',
      to: @automail.email
    )
  end
end
