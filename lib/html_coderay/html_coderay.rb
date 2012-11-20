class HtmlCoderay < Redcarpet::Render::HTML
  def block_code(code, language)
    CodeRay.scan(code, language).div(:css => :class)
  end
end
