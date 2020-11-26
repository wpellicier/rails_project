module ApplicationHelper

  # Returns a page's full title.
  def full_title(page_title = '')
    base_title = "Eval: Peer Evaluation"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end
