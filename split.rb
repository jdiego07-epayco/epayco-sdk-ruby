require 'epayco-sdk-ruby'

Epayco.apiKey = '55b75fd6b1ef17eaf394fa985de6563c'
Epayco.privateKey = '9327203f56866f1ed1ef4f56272ee771'
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
  token_card: "0837e22f054270493229d03",
  customer_id: "0754200c0e6dd165e4c5344",  
  doc_type: "CC",
  doc_number: "1194418306",
  name: "Juan Diego",
  last_name: "Vargas Posada",
  email: "diego.vargas@payco.co",
  bill: rand(999999).to_s,
  description: "SDK RUBY Pruebas ePayco Split TC",
  value: "1",
  tax: "0",
  tax_base: "1",
  ip: "181.134.247.50",  #This is the client's IP, it is required
  url_response: "http://diego.dev-plugins.info/respuesta.html",
  url_confirmation: "http://diego.dev-plugins.info/confirmacion.php",
  use_default_card_customer: false,
  currency: "COP",
  splitpayment:"true",
  split_app_id:"515360",
  split_merchant_id:"515360",
  split_type: "02",
  split_primary_receiver:"515360",
  split_primary_receiver_fee: "0",
  split_rule:"multiple",#si se envía este parámetro el campo split_receivers se vuelve obligatorio
  split_receivers:[{:id =>'93006', :total => '1', :iva => '0', :base_iva => '1', :fee => '0'}],
#   split_receivers: JSON.generate({:id =>'P_CUST_ID_CLIENTE 1 RECEIVER', :total => '58000', :iva => '8000', :base_iva => '50000', :fee => '10'},
#      {:id =>'P_CUST_ID_CLIENTE 2 RECEIVER', :total => '58000', :iva => '8000', :base_iva => '50000', :fee => '10'}) #Puede añadir la cantidad de receptores que desee
# }
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