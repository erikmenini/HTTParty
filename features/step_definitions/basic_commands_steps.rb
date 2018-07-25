
Given("I wanna include a new client") do
	@body = @Client.new_client
end

When("I post his datas") do
	@responsePOST = HTTParty.post(@base_url_client,  :body => @body,  :headers => {"Content-Type" => 'application/json'})	
end

Then("i should validate the response code {int}") do |code|
	expect(@responsePOST.code).to eq(code)
end

Given("I do a GET in the endpoint client with id {int}") do |id|
	@responseGET = HTTParty.get(@base_url_client + "#{id}",  :headers => {"Content-Type" => 'application/json'})
  end
  
Then("i should see all the clients") do
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
	
	Then("i do a get to check the post") do
		bodyget = JSON.parse (@body)
		expect(@responsePOST["name"]).to eq (bodyget["name"])
		expect(@responsePOST["cpf"]).to eq (bodyget["cpf"])
		expect(@responsePOST["address"]).to eq (bodyget["address"])
	end