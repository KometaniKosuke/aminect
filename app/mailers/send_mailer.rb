class SendMailer < ApplicationMailer
  # def published_email(automail)
  #   @automail = automail
  #   mail to: automail.email  #新規登録されたメールアドレス
  # end
  def published_email
    @automail = params[:user]
    user = User.find(@automail.user_id)
    @uid = user.uid
    @pass = params[:pass]
    mail(
      from: '"小杉プロジェクト" <ne201218@senshu-u.jp>',
      subject: 'Aminect会員登録のご案内（小杉プロジェクト）',
      to: @automail.email
    )
  end
end
