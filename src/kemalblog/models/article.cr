require "./basemodel"

class Article < BaseModel
  def get_article_list
    result = @conn.exec({Int32, String, String}, "select id, title, body from articles")
    articles = result.to_hash
  end

  def insert_artile(title, body)
    params = [] of String
    params << title
    params << body
    @conn.exec("insert into articles(title, body) values($1::text, $2::text)", params)
  end

  def get_article_by_id(id)
    params = [] of Int32
    params << id
    result = @conn.exec({Int32, String, String}, "select id, title, body from articles where id = $1::int8", params)
    articles = result.to_hash
  end

  def update_by_id(title, body, id)
    params = [] of String | Int32
    params << title
    params << body
    params << id
    @conn.exec("update articles set title = $1::text, body = $2::text where id = $3::int8", params)
  end

  def delete_by_id(id)
    params = [] of Int32
    params << id
    @conn.exec("delete from articles where id = $1::int8", params)
  end
end