class Book < ApplicationRecord


  class << self
    def search(query)
      rel = order("score")
      if query.present?
        rel = rel.where("title LIKE ? OR author LIKE ?",
         "%#{query}%", "%#{query}")
       end
       rel
     end
   end
end
