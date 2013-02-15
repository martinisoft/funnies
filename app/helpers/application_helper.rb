module ApplicationHelper
  # Public: What controller are we using?
  #
  # Examples
  #
  #   controller_class (When in PostsController)
  #   # => 'posts'
  #
  # Returns a downcased, named controller
  def controller_class
    controller.class.name.match(/(.+)Controller/)[1].downcase
  end

  # Public: Conditional admin navigation links
  #
  # Displays New Post or Comic link based on current controller
  def admin_nav_link
    if controller_class == "posts"
      link_to "New Post", new_post_path
    else
      link_to "Add Comic", new_comic_path
    end
  end

  # Public: Intercom application settings
  #
  # Returns a hash of settings Intercom expects based on if the user is logged
  # in or not
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
