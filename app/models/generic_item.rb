class GenericItem < ActiveRecord::Base

  belongs_to :place
  belongs_to :player

  def materialize
    GenericItem.create(
      name: ::Namer.generic_name,
      is_magical: rand(5) == 1
    )
  end

end
