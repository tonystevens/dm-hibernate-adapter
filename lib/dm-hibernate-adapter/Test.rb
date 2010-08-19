require 'rubygems'
require 'dm-core'

DataMapper::Logger.new($stdout, :debug)

DataMapper.setup(:default, 'mysql://root:root@localhost/exercises')

class Post
  include DataMapper::Resource

  property :id,         Serial   # An auto-increment integer key
  property :title,      String   # A varchar type string, for short strings
  property :body,       Text     # A text block, for longer string data.
  property :created_at, DateTime # A DateTime, for any date you might like.
end

DataMapper.finalize

require  'dm-migrations'

DataMapper.auto_migrate!

DataMapper.auto_upgrade!

@post = Post.create(
  :title      => "My first DataMapper post",
  :body       => "A lot of text ...",
  :created_at => Time.now
)

@post.save

