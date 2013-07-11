module PagesHelper

  def make_page_title(rel_path = controller_path, rel_name = action_name)
    scope = ['pages']
    scope += rel_path.split('/')
    page_title = I18n.t(rel_name, scope: scope)
    if page_title.include? "translation missing"
      nil
    else
      page_title
    end
  end

  def site_title
    '明和トレックポータル'
  end
end
