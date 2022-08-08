class ApplicationMailer < ActionMailer::Base
  default from:     "小杉プロジェクト"  #差出人の名前
          # reply_to: Rails.application.credentials.gmail[:automail_name] #差出人のメールアドレス
  layout 'mailer'
end
