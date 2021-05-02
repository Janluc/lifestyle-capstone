module UsersHelper
  def user_articles(articles)
    articles.collect do |article|
      content_tag(:a, href: "/categories/#{article.category.id}", class: %w[col-6 text-center]) do
        concat content_tag(:h3, article.title.to_s)
        concat content_tag(:p, article.category.name.to_s)
      end
    end.join.html_safe
  end
end
