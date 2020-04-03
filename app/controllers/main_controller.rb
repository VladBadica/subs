class MainController < ApplicationController
  def main
    query = params[:query]
    # Checks if search query is present
    if query
      #Search for multi-query fields on the selected indexed fields
      @products = Product.__elasticsearch__.search(
        query: {
          multi_match: {
            query: params[:query],
            fields: ['name', 'description']
          }
        }
      ).results

      # JSON layout to display products
      # NEEDS CHANGING
      # render json: {
      #   results: @products.results,
      #   total: @products.total
      # }
    # If no query, display all products
    else
      @products = Product.all
      #@posts = Post.search_published(query)
    end
  end
end
