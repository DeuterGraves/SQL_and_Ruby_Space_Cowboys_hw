require_relative("./models/bounty.rb")
require("pry")

# write this next
Bounty.delete_all

bounty1 = Bounty.new({
  "name" => "Truffles",
  "species" => "Zerpblat",
  "bounty_value" => 800,
  "danger_level" => "high"
  })

bounty2 = Bounty.new({
  "name" => "Della",
  "species" => "Nerbonk",
  "bounty_value" => 1000,
  "danger_level" => "astronomically high"
  })

bounty3 = Bounty.new({
  "name" => "Mina",
  "species" => "Flundifferer",
  "bounty_value" => 200,
  "danger_level" => "low"
  })

bounty1.save()
bounty2.save()
bounty3.save()

bounties = Bounty.all()

p bounty1
p bounty2
p bounty3

bounty1.bounty_value = 900
# jamie says - "hrm. she's still very sneaky."  he feels I'm not being objective enough in my valuation of the aliens, who are named after our cats.
bounty1.update()
bounty2.species = "Thrashasher"
bounty2.update()
bounty3.danger_level = "extremely low - may demand cuddles"
bounty3.update()

p Bounty.find(63)

binding.pry
nil
