class Search
	API_KEY = "?api_key=bKhpkXW0XbuXQCjZiwh4EeMFvHjtGQ8QXzDfEKzF&"
	API_BASE = "https://api.fda.gov/drug/event.json"

	def search_adverse(query)
		@result = API_BASE + API_KEY + 'search=reactionmeddrapt:"' + query + '"&limit=5"'
	end

	def search_drugs(query)
		@result_brand = API_BASE + API_KEY + 'search=patient.drug.openfda.brand_name:"' + query + '"&limit=5"'
		@result_generic = API_BASE + API_KEY + 'search=patient.drug.openfda.generic_name:"' + query + '"&limit=5"'
	end

end
