class Notifier < ActionMailer::Base
  include Resque::Mailer
  if LibraryGroup.site_config.try(:url)
    uri = Addressable::URI.parse(LibraryGroup.site_config.url)
    default_url_options[:host] = uri.host
    default_url_options[:port] = uri.port
  else
    default_url_options[:host] = 'library.example.jp'
    default_url_options[:port] = 80
  end

  def message_notification(message_id)
    message = Message.find(message_id)
    I18n.locale = message.receiver.locale.try(:to_sym) || I18n.default_locale
    from = "#{LibraryGroup.system_name(message.receiver.locale)} <#{LibraryGroup.site_config.email}>"
    if message.subject
      subject = message.subject
    else
      subject = I18n.t('message.new_message_from_library', :library => LibraryGroup.system_name(message.receiver.user.locale))
    end
    if message.sender
      @sender_name = message.sender.full_name
    else
      @sender_name = LibraryGroup.system_name(message.receiver.locale)
    end
    @message = message
    @locale = message.receiver.locale
    mail(:from => from, :to => message.receiver.email, :subject => subject)
  end
end
