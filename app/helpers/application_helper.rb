# frozen_string_literal: true

module ApplicationHelper
  def alert_generator msg
    js add_gritter(msg, title: "Insta Friends", sticky: false, time: 2000)
  end
  
  def alerts
    alert = (flash[:alert] || flash[:error] || flash[:notice])

    if alert
      alert_generator alert
    end
  end
end
