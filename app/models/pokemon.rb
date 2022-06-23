class Pokemon < ApplicationRecord
  def self.search(search)
      Pokemon.where(name: search.tr('ぁ-ん','ァ-ン'))
  end
end
