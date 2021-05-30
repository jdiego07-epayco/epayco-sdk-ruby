require 'epayco-sdk-ruby'

Epayco.apiKey = 'c40acc8a877f180bf312c79aae0503f7'
Epayco.privateKey = 'b13e95ea247b7cbe1f41724a1cb86d91'
Epayco.lang = 'ES'
Epayco.test = false

# "bankCode": "1040", "bankName": "BANCO AGRARIO"
# "bankCode": "1052", "bankName": "BANCO AV VILLAS"
# "bankCode": "1013", "bankName": "BANCO BBVA COLOMBIA S.A."
# "bankCode": "1032", "bankName": "BANCO CAJA SOCIAL"
# "bankCode": "1066", "bankName": "BANCO COOPERATIVO COOPCENTRAL"
# "bankCode": "1051", "bankName": "BANCO DAVIVIENDA"
# "bankCode": "1001", "bankName": "BANCO DE BOGOTA"
# "bankCode": "1023", "bankName": "BANCO DE OCCIDENTE"
# "bankCode": "1062", "bankName": "BANCO FALABELLA "
# "bankCode": "1012", "bankName": "BANCO GNB SUDAMERIS"
# "bankCode": "1006", "bankName": "BANCO ITAU"
# "bankCode": "1060", "bankName": "BANCO PICHINCHA S.A."
# "bankCode": "1002", "bankName": "BANCO POPULAR"
# "bankCode": "1058", "bankName": "BANCO PROCREDIT"
# "bankCode": "1065", "bankName": "BANCO SANTANDER COLOMBIA"
# "bankCode": "1007", "bankName": "BANCOLOMBIA"
# "bankCode": "1061", "bankName": "BANCOOMEVA S.A."
# "bankCode": "1009", "bankName": "CITIBANK "
# "bankCode": "1292", "bankName": "CONFIAR COOPERATIVA FINANCIERA"
# "bankCode": "1551", "bankName": "DAVIPLATA"
# "bankCode": "1507", "bankName": "NEQUI"
# "bankCode": "1019", "bankName": "SCOTIABANK COLPATRIA"

pse_info = {
  bank: "1551",
  invoice: rand(999999).to_s,
  description: "SDK RUBY Pruebas ePayco Split PSE",
  value: "1",
  tax: "0",
  tax_base: "1",
  currency: "COP",
  type_person: "0",
  doc_type: "CC",
  doc_number: "1194418306",
  name: "Juan Diego",
  last_name: "Vargas Posada",
  email: "diego.vargas@payco.co",
  country: "CO",
  cell_phone: "3042462218",
  ip: "181.134.247.50",  #client's IP, it is required
  url_response: "http://diego.dev-plugins.info/respuesta.html",
  url_confirmation: "http://diego.dev-plugins.info/confirmacion.php",
  method_confirmation: "POST",
  splitpayment:"true",
  split_app_id:"93006",
  split_merchant_id:"93006",
  split_type: "01",
  split_primary_receiver:"93006",
  split_primary_receiver_fee: "0",
  split_rule:"multiple",#si se envía este parámetro el campo split_receivers se vuelve obligatorio
  split_receivers:[
    {:id =>'9898', :total => '3', :iva => '0', :base_iva => '3', :fee => '1'},
    {:id =>'515360', :total => '3', :iva => '0', :base_iva => '3', :fee => '1'}
  ],
  #Extra params: These params are optional and can be used by the commerce
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
  pse = Epayco::Bank.create pse_info
rescue Epayco::Error => e
  puts e
end

puts pse