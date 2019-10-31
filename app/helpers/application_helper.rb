module ApplicationHelper
  def flash_message
    flash.map do |key, value|
      level_class = case key
        when 'notice' then "alert alert-info"
        when 'success' then "alert alert-success"
        when 'error' then "alert alert-danger"
        when 'alert' then "alert alert-warning"
      end 
      content_tag :div, class: level_class do
       [ value, button_tag ].join('').html_safe
      end
    end.join('').html_safe

  end

  def button_tag
    content_tag :button, class: "close", type: 'button' do
      [
        content_tag(:span, "x"),
        content_tag(:span, "Close")   #dodac klasy na zamykanie i javascript 
      ].join('').html_safe
    end
  end
end

  # <div class="<%= flash_class(key) %>">
  #  <%= value %>
  #  <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
  #  <% end %>
  # </div>