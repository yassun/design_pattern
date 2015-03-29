class Icecream

  def get_name
  end

  def how_sweet
  end

end

class VanillaIcecream < Icecream

  def get_name
    "バニラアイスクリーム"
  end

  def how_sweet
    "バニラ味"
  end

end

class GreenTeeIcecream < Icecream

  def get_name
    "抹茶アイスクリーム"
  end

  def how_sweet
    "抹茶味"
  end

end

class CashewNutsTopping < Icecream
  def initialize(ice)
    @ice = ice
  end

  def get_name
    "カシューナッツトッピングの#{@ice.get_name}"
  end

  def how_sweet
    @ice.how_sweet
  end

end

cashe_vanila = CashewNutsTopping.new(VanillaIcecream.new)
green = GreenTeeIcecream.new

puts cashe_vanila.get_name
puts green.get_name
puts CashewNutsTopping.new(green).get_name

