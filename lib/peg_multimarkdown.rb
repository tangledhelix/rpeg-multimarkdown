require 'peg_multimarkdown.so'

# Front-end to fletcher penney's peg-multimarkdown implementation of MultiMarkdown
#
# A simple processor:
#   >>> puts MultiMarkdown.new("Hello, World.").to_html
#   <p>Hello, World.</p>
#
# With other stuff:
#   >>> puts MultiMarkdown.new("_Hello -- World!_", :smart, :filter_html).to_html
#   <p><em>Hello World!</em></p>
#
class PEGMultiMarkdown

  # Original MultiMarkdown formatted text.
  attr_reader :text

  # Set true to have smarty-like quote translation performed.
  attr_accessor :smart

  # Set true to have footnotes processed.
  attr_accessor :notes

  # Do not output <style> tags included in the source text.
  attr_accessor :filter_styles

  # Do not output any raw HTML included in the source text.
  attr_accessor :filter_html

  # Process MultiMarkdown inside of raw HTML
  attr_accessor :process_html

  # Markdown compatibility mode
  attr_accessor :compatibility

  # Included for compatibility with RedCloth's interface.
  attr_accessor :fold_lines

  # Create a new MultiMarkdown processor. The +text+ argument is a string
  # containing MultiMarkdown text. Variable other arguments may be supplied to
  # set various processing options:
  #
  # * <tt>:smart</tt> - Enable SmartyPants processing.
  # * <tt>:notes</tt> - Enable footnotes.
  # * <tt>:filter_styles</tt> - Do not output <style> tags included in the
  #   source text.
  # * <tt>:filter_html</tt> - Do not output raw HTML included in the
  #   source text.
  # * <tt>:process_html</tt> - Process MultiMarkdown code inside HTML tags.
  # * <tt>:compatibility</tt> - Process MultiMarkdown code in Markdown 
  #   compatibility mode.
  # * <tt>:fold_lines</tt> - RedCloth compatible line folding (not used).
  #
  def initialize(text, *extensions)
    @text = text
    @smart = true
    @notes = true
    @filter_styles = false
    @filter_html = false
    @process_html = false
    @compatibility = false
    extensions.each { |e| send("#{e}=", true) }
    if @compatibility
      @smart = false
      @notes = false
      @process_html = false
    end
  end

  alias to_s text

end

MultiMarkdown = PEGMultiMarkdown unless defined? MultiMarkdown
