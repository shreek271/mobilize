module ProductsHelper
	def get_price(product)
		product.price - ((product.discount*product.price)/100).round
	end
end
