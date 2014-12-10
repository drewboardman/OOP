require 'pry'

class Post
  attr_accessor :title, :body, :comment

  def initialize(title, body, comment = nil)
    @title = title
    @body = body
    @comment = comment
  end

  def average_body
    words = @body.split
    words.inject(0) {|total, word| total += word.length}/words.count.to_f
  end

  def word_count
    [@title, @body, @comment].inject(0) do |words, section|
      words += section.split.count
    end
  end
end

testerino = Post.new("First Post", "This is to test the average length of words
  in my testerino no copyrino please.")
puts testerino.average_body

second = Post.new("Second Post", "This is my second post", "Hopefully the inject works")
puts second.word_count

binding pry