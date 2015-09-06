class Post
    attr_accessor :title, :body, :comment
   def initialize(title, body, comment) 
       @title = title
       @body = body
       @comment = comment
    end
    def average_length
        words = body.split(" ")
        words.inject(0){|mem,value| mem += value.length}/words.count.to_f
    end
    def total_words
        words = [title,body,comment]
        words.join(" ").split(" ").count
    end
end

send = Post.new("I love you", "Hello World!", "raz dwa trzy")
puts send.title
puts send.body
puts send.average_length
puts send.total_words