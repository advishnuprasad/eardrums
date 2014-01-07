class DevelopmentMailInterceptor
  def self.delivering_email(message)
    message.subject = "#{message.to} #{message.subject} - #{message.cc}"
    message.to = "vishnu.prasad@strata.co.in"
    message.cc = ""
  end
end