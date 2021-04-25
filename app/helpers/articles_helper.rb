module ArticlesHelper

  def show_main_categories(categories)
    if categories.length() > 3
      categories.collect do |category|
        if !category_latest(category.name).nil?
          content_tag(:a, :href => "/categories/#{category.id}", class: ["flex-grow-1", "category-articles", "pt-3"], style: "background: url('#{category_latest(category.name).image}')") do
            concat content_tag(:h5, "#{category.name}")
            concat(content_tag(:div, nil,  class: ["d-flex", "h-75", "align-items-end"]) do
                content_tag(:div) do
                content_tag(:h3, "#{category_latest(category.name).title}")
              end
            end )
          end
        end
      end.join.html_safe
    end
  end

  def display_articles(articles, category)
    counter = 0
    articles.collect do |article|
      content_tag(:article, class:["col-6", "d-flex", "overflow-hidden", "article-block"]) do
        if counter <= 1
          concat content_tag(:img, nil, src: "#{article.image}", class: "img-fluid")
          concat(content_tag(:div, class: ["category-info", "p-3"]) do
            content_tag(:h3, "#{category.name}") +
            content_tag(:h4, "#{article.title}") +
            content_tag(:p, "#{article.text}") +
            link_to("#{article.user.name}", article.user) + " " +
            vote_btn(article)
          end)    
          counter += 1
        else
          concat(content_tag(:div, class: ["category-info", "p-3"]) do
            content_tag(:h3, "#{category.name}") +
            content_tag(:h4, "#{article.title}") +
            content_tag(:p, "#{article.text}") +
            link_to("#{article.user.name}", article.user) + " " +
            vote_btn(article)
          end)
          concat content_tag(:img, nil, src: "#{article.image}", class: "img-fluid")
          counter < 3 ? counter += 1 : counter = 0
        end
      end
    end.join.html_safe
  end
end
