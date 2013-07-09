module PagesHelper

  def make_page_title(controller_path, action_name)
    scope = ['pages']
    scope += controller_path.split('/')
    page_title = I18n.t(action_name, scope: scope)
    if page_title.include? "translation missing"
      nil
    else
      page_title
    end
  end
end
