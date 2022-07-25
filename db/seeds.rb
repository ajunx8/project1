Planet.destroy_all
p1 = Planet.create :name => 'Earth', :fuel => 10000, :food => 10000, :gold => 10
p2 = Planet.create :name => 'Onyx 7', :fuel => 6000, :food => 2000, :gold => 1550
p3 = Planet.create :name => "TFX54", :fuel => 3200, :food => 500, :gold => 7650
p4 = Planet.create :name => 'Mars', :fuel => 1050, :food => 3000, :gold => 800
p5 = Planet.create :name => 'Venus', :fuel => 7050, :food => 1000, :gold => 7200
p6 = Planet.create :name => 'Neptune', :fuel => 4500, :food => 650, :gold => 650
p7 = Planet.create :name => 'Mercury', :fuel => 2000, :food => 250, :gold => 5400
p8 = Planet.create :name => 'Pluto', :fuel => 9600, :food => 50, :gold => 9500
puts "#{ Planet.count } planets."

Moon.destroy_all
m1 = Moon.create :name => 'Moon A', :fuel => 3000, :food => 550, :gold => 1250
m2 = Moon.create :name => 'Moon LS', :fuel => 250, :food => 250, :gold => 3200
m3 = Moon.create :name => 'Moon 4x', :fuel => 150, :food => 300, :gold => 2200
m4 = Moon.create :name => 'Moon Purple', :fuel => 850, :food => 40, :gold => 700
m5 = Moon.create :name => ('A'..'Z').to_a.sample + 3.times.map{rand(10)}.join, :fuel => rand(0..5000), :food => rand(0..5000), :gold => rand(0..5000)
puts "#{ Moon.count } moons."

User.destroy_all
u1 = User.create :email => 'jonesy@ga.co', :password => 'chicken', :admin => true
u2 = User.create :email => 'craigsy@ga.co', :password => 'chicken'
puts "#{ User.count } users."

# ASSOCIATIONS ########################################################################################
puts "Planets and Moons"
p1.moons << m1
p2.moons << m2 << m5
p3.moons << m3 << m4
########    
