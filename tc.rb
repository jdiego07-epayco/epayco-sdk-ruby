require 'epayco-sdk-ruby'

Epayco.apiKey = 'c40acc8a877f180bf312c79aae0503f7'
Epayco.privateKey = 'b13e95ea247b7cbe1f41724a1cb86d91'
Epayco.lang = 'ES'
Epayco.test = false

# credit_info = {
#   "card[number]" => "5240521756556621",
#   "card[exp_year]" => "2027",
#   "card[exp_month]" => "02",
#   "card[cvc]" => "049"
# }

# begin
#   token = Epayco::Token.create credit_info
# rescue Epayco::Error => e
#   puts e
# end

# customer_info = {
#   token_card: token[:id],
#   name: "Juan Diego",
#   last_name: "Vargas Posada", #This parameter is optional
#   email: "diego.vargas@payco.co",
#   phone: "3042462218",
#   default: false
# }

# begin
#   customer = Epayco::Customers.create customer_info
# rescue Epayco::Error => e
#   puts e
# end

payment_info = {
  # token_card: token[:id],
  # customer_id: customer[:data][:customerId],
  token_card: "0a7c4d1e8b3956e40645052",
  customer_id: "077407e10171531365d57fc",
  doc_type: "CC",
  doc_number: "1194418306",
  name: "Juan Diego",
  last_name: "Vargas Posada",
  email: "diego.vargas@payco.co",
  bill: rand(999999).to_s,
  description: "SDK RUBY Pruebas ePayco TC",
  value: "1",
  tax: "0",
  tax_base: "1",
  ip: "181.134.247.50",  #This is the client's IP, it is required
  url_response: "http://diego.dev-plugins.info/respuesta.html",
  url_confirmation: "http://diego.dev-plugins.info/confirmacion.php",
  use_default_card_customer: false,
  currency: "COP",
  extra1: "",
  extra2: "",
  extra3: "",
  extra4: "",
  extra5: "",
  extra6: "",
  extra7: "",
  extra8: "",
  extra9: "",
  extra10: ""
}

begin
  pay = Epayco::Charge.create payment_info
rescue Epayco::Error => e
  puts e
end

puts pay