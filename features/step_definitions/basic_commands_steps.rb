
Given("I wanna include a new client") do
	@body = @Client.new_client
	puts @body
end

When("I post his datas") do
	@responsePOST = HTTParty.post(@base_url_client,  :body => @body,  :headers => {"Content-Type" => 'application/json'})	
end

Then("i should validate the response code {int}") do |code|
	puts @responsePOST.body
	expect(@responsePOST.code).to eq(code)
end


Given("I do a GET in the endpoint client with id {int}") do |id|
	@responseGET = HTTParty.get(@base_url_client + "#{id}",  :headers => {"Content-Type" => 'application/json'})
  end
  
  
Then("i should see all the clients") do
	puts @responseGET
	expect(@responseGET.code).to eq(200)
  end

Given("I edit the name the data of one client") do
	@body = @Client.new_client
	@bodyPUT = JSON.parse (@body)
end
  
When("I do a put in the API for this the id {int}") do |id|
	@responsePUT = HTTParty.put(@base_url_client+ "#{id}", :body => @body, :headers => {"Content-Type" => 'application/json'})
end
  
Then("i should validate the data") do
	expect(@responsePUT.code).to eq 200
 	expect(@responsePUT["name"]).to eq (@bodyPUT["name"])
	expect(@responsePUT["cpf"]).to eq (@bodyPUT["cpf"])
	expect(@responsePUT["address"]).to eq (@bodyPUT["address"])
end

Given("I delete the client with id {int}") do |id|
	@responseDELETE = HTTParty.delete(@base_url_client+ "#{id}", :headers => {"Content-Type" => 'application/json'})
  end
  
  Then("the response should be nil") do
	expect(@responseDELETE["id"]).to eq nil
  end