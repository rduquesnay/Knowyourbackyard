class Videoparser

  def self.get_src(embed)
    breakup = embed.split(" ")
    src=""
    breakup.each do |segment|
      if segment[/src=/]
        src=/\”(.*)\”/.match(segment)[1]
      end
    end
  end

  def self.get_embed(src)
    "<iframe src=\"#{src}\" width=\"600\" height=\"800\" frameborder=\"0\" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>" 
  end

end
