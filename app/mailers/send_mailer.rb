class SendMailer < ApplicationMailer
  # def published_email(automail)
  #   @automail = automail
  #   mail to: automail.email  #新規登録されたメールアドレス
  # end
  def published_email
    @automail = params[:user]
    mail(
      from: '"小杉プロジェクト" <ne201218@senshu-u.jp>',
      subject: 'ご登録ありがとうございます',
      to: @automail.email
    )
  end
end
