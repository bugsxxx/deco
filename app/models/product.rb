class Product

  

  include Mongoid::Document
  field :name, type: String
  field :price, type: BigDecimal
  field :cor, type: String 
  field :descr, type: String

  embeds_many :criticas

  update_index('products#product'){self}


#metodo para o search com o elasticsearch
  def self.search(keyword)

  	product_id = ProductsIndex::Product.query(
  		multi_match:{

  			#desta forma (multi_match em vez de term) possibilita a pesquisa em dois campos diferentes
  			query: keyword,
  			type: "phrase_prefix", #para apanhar resultados em que o termo a pesquisar esteja numa palavra maior,  
  			fields: [:name, :cor, :descr]

  			} #para poder ter um resultado mas simples tirando info por agora desnecessaria

  	).map { |result|  
  				result.attributes["id"]

  			}
  			self.find(product_id)
  	
  end



end
