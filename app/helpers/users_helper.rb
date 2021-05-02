module UsersHelper
  def user_articles(articles)
    articles.collect do |article|
      content_tag(:a, href: "/categories/#{article.category.id}", class: %w[col-6 text-center]) do
        concat content_tag(:h3, "#{article.title}")
        concat content_tag(:p, "#{article.category.name}")
      end
    end.join.html_safe
  end
end
