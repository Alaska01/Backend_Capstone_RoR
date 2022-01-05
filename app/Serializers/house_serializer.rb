# HotelSerializer
class HouseSerializer
  def initialize(house)
    @house = house
  end

  def as_json
    {
      id: house.id,
      house_name: house.house_name,
      house_description: house.house_description,
      images: house.images
    }
  end

  private

  attr_reader :house
end
