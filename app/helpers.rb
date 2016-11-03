module Helpers

  def current_user
    @current_user ||= User.get(session[:user_id])
  end

  def filter_available_spaces(available_on)
    @unfiltered_spaces = Space.all
    @spaces = []
    available_on = Date.parse(available_on)
    @unfiltered_spaces.each do |space|
      if (space.available_from <= available_on && available_on <= space.available_to)
        @spaces << space
      end
    end
    @spaces
  end

end
