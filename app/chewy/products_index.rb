class ProductsIndex < Chewy::Index

	define_type Product  do
		field :name, :price, :cor, :descr
		
	end
end
