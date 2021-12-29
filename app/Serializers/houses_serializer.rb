# HousesSerializer
class HousesSerializer
  def initialize(houses)
    @houses = houses
  end

  def as_json
    @houses.map do |house|
      {
        id: house.id,
        house_name: house.house_name,
        house_description: house.house_description,
        images: house.images
      }
    end
  end

  private

  attr_reader :houses
end
