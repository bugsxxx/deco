class CoresWorker 

	#include sidekiq::Worker 

	def perform(exemplo_id)
		exemplo = sidekiqexemplo.find(exemplo_id)

	  uri = URI.parse("http://pygments.appspot.com/")
      request = Net::HTTP.post_form(URI.parse('http://pygments.simplabs.com/'), { 'lang' => exemplo.tipo, 'code' => exemplo.codigo })
      exemplo.update(codigo: request.body)
	end
	
	
end