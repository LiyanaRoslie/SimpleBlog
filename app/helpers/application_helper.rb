module ApplicationHelper

class CodeRayify < Redcarpet::Render::HTML
  language ||= :html
  def block_code(code, language)
    CodeRay.scan(code, language).div(:line_numbers => :inline)
  end
end

def markdown(text)
  coderayified = CodeRayify.new(:filter_html => false,
                                :hard_wrap => true)

  options = {
    :fenced_code_blocks => true,
    :no_intra_emphasis => true,
    :autolink => true,
    :lax_html_blocks => true,
    :space_after_headers => true,
    :underline => true,
    :highlight => true,
    :strikethrough => true,
    :superscript => true,
    :tables => true,
    :footnotes => true
  }
  markdown_to_html = Redcarpet::Markdown.new(coderayified, options)
  markdown_to_html.render(text).html_safe

end

end
