module ApplicationHelper
  def markdown(content)
    @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, {
      autolink: true,
      space_after_headers: true,
      fenced_code_blocks: true,
      filter_html: true,
      hard_wrap: false,
      strikethrough: true,
      superscript: true,
      autolink: true,
      tables: true,
      no_intra_emphasis: true,
      underline: true,
      highlight: true,
      footnotes: true,
      tables: true
    })
    @markdown.render(content).html_safe
  end
end
