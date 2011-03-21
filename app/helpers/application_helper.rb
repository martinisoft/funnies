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
end
