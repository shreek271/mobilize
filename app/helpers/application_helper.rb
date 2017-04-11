module ApplicationHelper

  def flash_class flash_type
    case flash_type.to_sym
    when :success
      "alert-success"
    when :error, :alert, :danger
      "alert-danger"
    when :notice
      "alert-info"
    else
      "alert-warning"
    end
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def render_errors(object)
    render "shared/error_messages", object: object
  end

end
