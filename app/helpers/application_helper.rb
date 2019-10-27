module ApplicationHelper
  def flash_message
    flash.each do |key, value|
      level_class = case key
        when 'notice' then "alert alert-info"
        when 'success' then "alert alert-success"
        when 'error' then "alert alert-danger"
        when 'alert' then "alert alert-warning"
      end 
      content_tag :div, class: level_class do
        value
      end
    end 

  end
end

  # <div class="<%= flash_class(key) %>">
  #  <%= value %>
  #  <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
  #  <% end %>
  # </div>