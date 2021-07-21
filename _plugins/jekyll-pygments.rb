# frozen_string_literal: true
module Jekyll

  class PygmentsBlock < Liquid::Block
    include Liquid::StandardFilters

    # The regular expression syntax checker. Start with the language specifier.
    # Follow that by zero or more space separated options that take one of three
    # forms: name, name=value, or name="<quoted list>"
    #
    # <quoted list> is a space-separated list of numbers
    SYNTAX = %r!^([a-zA-Z0-9.+#_-]+)((\s+\w+(=(\w+|"([0-9]+\s)*[0-9]+"))?)*)$!.freeze

    def initialize(tag_name, markup, tokens)
      super
      if markup.strip =~ SYNTAX
        @lang = Regexp.last_match(1).downcase
        @options = parse_options(Regexp.last_match(2))
      else
        raise SyntaxError, <<~MSG
Syntax Error in tag 'pygments' while parsing the following markup:

#{markup}

Valid syntax: pygments <lang> [options]
MSG
      end
    end

    LEADING_OR_TRAILING_LINE_TERMINATORS = %r!\A(\n|\r)+|(\n|\r)+\z!.freeze
    
    def render(context)
        prefix = context["highlighter_prefix"] || ""
        suffix = context["highlighter_suffix"] || ""
        code = super.to_s.gsub(LEADING_OR_TRAILING_LINE_TERMINATORS, "")

      Jekyll::External.require_with_graceful_fail("pygments") unless defined?(Pygments)

      output = Pygments.highlight(
        code,
        :lexer   => @lang,
        :options => @options
      )

      if output.nil?
        Jekyll.logger.error <<~MSG
There was an error highlighting your code:

#{code}

While attempting to convert the above code, Pygments.rb returned an unacceptable value.
This is usually a timeout problem solved by running `jekyll build` again.
MSG
        raise ArgumentError, "Pygments.rb returned an unacceptable value "\
                             "When attempting to highlight some code."
      end

      # output.sub('<div class="highlight"><pre>', "").sub('</pre></div>', "")
      rendered_output = add_code_tag(output)
      prefix + rendered_output + suffix
    end

    private

    OPTIONS_REGEX = %r!(?:\w="[^"]*"|\w=\w|\w)+!.freeze

    def parse_options(input)
      options = {}
      return options if input.empty?

      # Split along 3 possible forms -- key="<quoted list>", key=value, or key
      input.scan(OPTIONS_REGEX) do |opt|
        key, value = opt.split("=")
        # If a quoted list, convert to array
        if value&.include?('"')
          value.delete!('"')
          value = value.split
        end
        options[key.to_sym] = value || true
      end

      # options[:linenos] = "inline" if options[:linenos] == true
      options
    end

    def add_code_tag(code)
      code_attributes = [
        "class=\"language-#{@lang.to_s.tr("+", "-")}\"",
        "data-lang=\"#{@lang}\"",
      ].join(" ")
      "<figure class=\"highlight\"><pre><code #{code_attributes}>"\
      "#{code.chomp}</code></pre></figure>"
    end
  end
end

Liquid::Template.register_tag('pygments', Jekyll::PygmentsBlock)
