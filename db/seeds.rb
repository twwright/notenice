require_relative "../app/models/user.rb"
require_relative "../app/models/drug.rb"
require_relative "../app/models/sideeffect.rb"
User.create(username: "tnwright", name: "Nina", email: "tnwright@gmail.com", birthday: DateTime.new(1954,10,02), password: "password", terms_of_service: true)
Drug.create(name: "Advil", dosage: 500, dosage_unit: "mg")
SideEffect.create(title: "Nausea", description: "Stomach doesn't sit quite right", user_id: 1, drug_id: 1)
