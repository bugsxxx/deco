class Product


	
  include Mongoid::Document
  field :name, type: String
  field :price, type: BigDecimal
  field :cor, type: String 




end
