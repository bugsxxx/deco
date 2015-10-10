class Product

  

  include Mongoid::Document
  field :name, type: String
  field :price, type: BigDecimal
  field :cor, type: String 

  embeds_many :criticas

  update_index('products#product'){self}


#metodo para o search com o elasticsearch
  def self.search(keyword)

  	product_id = ProductsIndex::Product.query(
  		term:{
  			name:keyword

  		}

  	).map { |result|  
  				result.attributes["id"]

  			}
  			self.find(product_id)
  	
  end



end
