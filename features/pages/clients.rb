class Client

    def new_client
        @body_client=
        {
            "name": Faker::Name.name,
            "cpf": Faker::CPF.numeric,
            "address": Faker::Address.street_address
    }.to_json
    return @body_client
    end



end