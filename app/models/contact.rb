class Contact < MailForm::Base
  attribute :name,       :validate => true
  attribute :email,      :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :subject,    :validate =>  true
  attribute :message
  attribute :attach_file
  attribute :deadline,   :validate => true

  def headers
    {
      :subject => %("#{subject}"),
      :to => "terna@bk.ru",
      :from => %("#{name}" <#{email}>)
    }
  end
end