  module MyAuthlogicI18nAdapter
    def t(key, options = {})
      # you will have key which will be something like: "error_messages.password_invalid"
      # you will also have options[:default], which will be the default english version of the message
      # do whatever you want here with the arguments passed to you.
    end
  end

  Authlogic::I18n.extend MyAuthlogicI18nAdapter
