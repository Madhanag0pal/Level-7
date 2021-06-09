class HomeController < ApplicationController
  skip_before_action :ensuer_user_logged_in

  def index
    if current_user
      redirect_to todos_path
    else
      render "index"
    end
  end
end
