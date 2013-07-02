module ApplicationHelper
  
  def pretty_date(date)
    date.strftime('%B %e, %Y @ %l:%M %p') if date.present?
  end
  
end
