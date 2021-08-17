require 'epayco-sdk-ruby'
require './apiKeys.rb'

keys = ApiKeys.new

Epayco.apiKey = keys.publicKey
Epayco.privateKey = keys.privateKey
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
  description: "SDK RUBY Pruebas ePayco PSE",
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