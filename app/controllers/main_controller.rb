class MainController < ApplicationController

  def main
    categories = Category.all
    @categoryNames = Array.new
    for c in categories do
      @categoryNames.append(c.name)
    end
    if @categoryNames.empty?
      @categoryNames.append("Run rake:db seed in controller to load categories")
    end

    # Keyword from search bar
    query = params[:query]
    sort = params[:sort]

    # Checks if search query is present
    if query && query != ""
      @products = Array.new

      #Search based upon selected indexed fields
      queryResults = Product.search_query(query)

      # ElasticSearch returns products as JSON
      # Retrieves products from the database using their id
      queryResults.each do |result|
        @products.append(Product.product_id(result.id).first)
    end

    # If no query, display all products
    else
      @products = Product.all
    end

    if sort == t('sortby.lowtohigh')
      @products = @products.order("products.price ASC")
    elsif sort == t('sortby.hightolow')
      @products = @products.order("products.price DESC")
    elsif sort == t('sortby.newlistings')
      @products = @products.order("products.created_at DESC")
    elsif sort == t('sortby.oldlistings')
        @products = @products.order("products.created_at ASC")
    end
  end

end
