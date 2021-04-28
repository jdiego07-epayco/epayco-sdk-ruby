require 'epayco-sdk-ruby'

Epayco.apiKey = 'c40acc8a877f180bf312c79aae0503f7'
Epayco.privateKey = 'b13e95ea247b7cbe1f41724a1cb86d91'
Epayco.lang = 'ES'
Epayco.test = false

credit_info = {
  "card[number]" => "5240521756556621",
  "card[exp_year]" => "2027",
  "card[exp_month]" => "02",
  "card[cvc]" => "049"
}

begin
  token = Epayco::Token.create credit_info
rescue Epayco::Error => e
  puts e
end

customer_info = {
  token_card: token[:id],
  name: "Juan Diego",
  last_name: "Vargas Posada", #This parameter is optional
  email: "diego.vargas@payco.co",
  phone: "3042462218",
  default: false
}

begin
  customer = Epayco::Customers.create customer_info
rescue Epayco::Error => e
  puts e
end

namePlan = 'SuscripcionRUBY-' + rand(99).to_s

plan_info = {
  id_plan: namePlan,
  name: namePlan,
  description: namePlan,
  amount: 1,
  currency: "cop",
  interval: "month",
  interval_count: 1,
  trial_days: 7
}

begin
  plan = Epayco::Plan.create plan_info
rescue Epayco::Error => e
  puts e
end

subscription_info = {
  id_plan: plan[:data][:id_plan],
  customer: customer[:data][:customerId],
  token_card: token[:id],
  doc_type: "CC",
  doc_number: "1194418306",
  url_confirmation: "http://diego.dev-plugins.info/confirmacion.php",
  method_confirmation: "POST"
}

begin
  sub = Epayco::Subscriptions.create subscription_info
rescue Epayco::Error => e
  puts e
end

subscription_info = {
  id_plan: plan[:data][:id_plan],
  customer: customer[:data][:customerId],
  token_card: token[:id],
  url_response: "http://diego.dev-plugins.info/respuesta.html",
  url_confirmation: "http://diego.dev-plugins.info/confirmacion.php",
  doc_type: "CC",
  doc_number: "1194418306",
  ip: "181.134.247.50"  #This is the client's IP, it is required
}

begin
  pay = Epayco::Subscriptions.charge subscription_info
rescue Epayco::Error => e
  puts e
end

puts pay