class Contact < MailForm::Base
  attribute :name,       :validate => true
  attribute :email,      :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :subject,    :validate => true
  attribute :deadline,   :validate => true
  attribute :message
  attribute :attach_file

  def headers
    {
      :subject => %("#{subject}"),
      :to => "support@inbank.atlassian.net",
      :from => %("#{name}" <#{email}>)
    }
  end
end