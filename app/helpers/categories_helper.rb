module CategoriesHelper
    private
    def get_categories
      Category.all.collect
    end
end