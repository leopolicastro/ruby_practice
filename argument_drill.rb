class House
  attr_reader :address, :square_feet, :num_bedrooms, :num_baths, :cost, :short_sale, :has_tenants
 
  def initialize(args)
    @address = args[:address]
    @square_feet = args[:square_feet]
    @num_bedrooms = args.fetch(:num_bedrooms){ 3 }
    @num_baths = args.fetch(:num_baths){ 2 }
    @cost = args.fetch(:cost){ 320_000 }
    @down_payment = args.fetch(:down_payment){ 0.20 }
    @sold = args.fetch(:sold){ false }
    @short_sale = args.fetch(:short_sale){ false }
    @has_tenants = args.fetch(:has_tenants){ false }
  end
 
  def obscure_address
    @address.sub(/\A\d*/, '****')
  end
 
  def buy!(money, good_credit)
    @sold = true if money >= down_payment && good_credit
  end
 
  def down_payment
    cost * @down_payment
  end
 
  def to_s
    "#{obscure_address} : #{square_feet} sq. ft., #{num_bedrooms} bed, #{num_baths} bath. $#{cost}"
  end
end
 
full = House.new({address: "13452454 ADSFADSFA"})
 
p full