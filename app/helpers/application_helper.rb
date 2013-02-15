module ApplicationHelper
  def controller_class
    controller.class.name.match(/(.+)Controller/)[1].downcase
  end

  def admin_nav_link
    if controller_class == "posts"
      link_to "New Post", new_post_path
    else
      link_to "Add Comic", new_comic_path
    end
  end

  def intercom_settings
    settings = {}
    if current_user
      user_data = {
        email: "#{current_user.email}",
        created_at: current_user.created_at.to_i
      }
      settings.merge!(user_data)
    end
    settings.merge({ app_id: "7s0jlswz" })
  end
end
