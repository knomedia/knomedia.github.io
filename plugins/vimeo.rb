module Jekyll
  class Vimeo < Liquid::Tag

    def initialize(name, id, tokens)
      super
      @id = id
    end

    def render(context)
      @id.gsub!(/\s/, '')
      %(<div class="embed-video-container"><iframe src="http://player.vimeo.com/video/#{@id}?title=0&amp;byline=0&amp;portrait=0"></iframe></div>)
    end
  end
end

Liquid::Template.register_tag('vimeo', Jekyll::Vimeo)
