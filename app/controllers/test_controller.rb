class TestController < ApplicationController
  before_action :log_session_before
  after_action :log_session_after

  def alpha
    session.clear
    cookies.clear

    session["A"] = "A"
    cookies["A"] = "A"
  end

  def bravo
    session["B"] = "B"
    cookies["B"] = "B"
  end

  def charlie
    session["C"] = "C"
    cookies["C"] = "C"
    sleep 2
  end

  def delta
    session["D"] = "D"
    cookies["D"] = "D"
  end

  helper_method :cookie_keys
  helper_method :session_keys

  private

  def cookie_keys
    keys = []

    cookies.each do |cookie|
      keys.push cookie.first
    end

    keys.sort.join ","
  end

  def session_keys
    session.keys.sort.join ","
  end

  def log_session_before
    logger.debug "SESSION BEFORE:" + session_keys
    logger.debug "COOKIES BEFORE:" + cookie_keys
  end

  def log_session_after
    logger.debug "SESSION AFTER:" + session_keys
    logger.debug "COOKIES AFTER:" + cookie_keys
  end
end
