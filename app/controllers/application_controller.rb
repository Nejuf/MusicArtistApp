class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

include SessionsHelper

  def flash_notice_now(message)
  	flash.now[:notices] ||= []
  	flash.now[:notices] << message.to_s
  end
  def flash_notice(messages)
    flash.now[:notices] = messages
  end

  def flash_errors_now(object)
  	flash.now[:errors] ||= []
  	flash.now[:errors] << object.full_messages.to_sentences
  end

  def flash_errors(object)
    flash.now[:errors] = [object.full_messages.to_sentences]
  end

end
