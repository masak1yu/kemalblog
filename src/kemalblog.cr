require "kemal"
#require "kemal-pg"
require "pg"
require "pool/connection"
require "./kemalblog/*"
require "./kemalblog/models/*"

article = Article.new

["/", "/articles"].each do |path|
  get path do |env|
    articles = article.get_article_list
    render "src/kemalblog/views/index.ecr", "src/kemalblog/views/application.ecr"
  end
end

get "/articles/new" do |env|
  render "src/kemalblog/views/articles/new.ecr", "src/kemalblog/views/application.ecr"
end

post "/articles" do |env|
  title = env.params.body["title"]
  body = env.params.body["body"]
  article.insert_artile(title, body)
  env.redirect "/"
end

get "/articles/:id" do |env|
  id = env.params.url["id"].to_i32
  articles = article.get_article_by_id(id)
  render "src/kemalblog/views/articles/show.ecr", "src/kemalblog/views/application.ecr"
end

get "/articles/:id/edit" do |env|
  id = env.params.url["id"].to_i32
  articles = article.get_article_by_id(id)
  render "src/kemalblog/views/articles/edit.ecr", "src/kemalblog/views/application.ecr"
end

put "/articles/:id" do |env|
  id = env.params.url["id"].to_i32
  title = env.params.body["title"]
  body = env.params.body["body"]
  article.update_by_id(title, body, id)
  env.redirect "/"
end

delete "/articles/:id" do |env|
  id = env.params.url["id"].to_i32
  article.delete_by_id(id)
  env.redirect "/"
end

Kemal.run
