module ApplicationHelper
  def markdown
    # options = [:hard_wrap, :filter_html, :autolink, :no_intraemphasis, :fenced_code, :gh_blockcode]
    # syntax_highlighter(Redcarpet.new(text, *options).to_html).html_safe
    Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true)
  end

  def syntax_highlighter(html)
    doc = Nokogiri::HTML(html)
    doc.search("//pre[@lang]").each do |pre|
      pre.replace Albino.colorize(pre.text.rstrip, pre[:lang])
    end
    doc.to_s
  end
end
