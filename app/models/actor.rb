# == Schema Information
#
# Table name: actors
#
#  id         :integer          not null, primary key
#  bio        :text
#  dob        :date
#  image      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Actor < ApplicationRecord
  validates(:name, presence: true)
  has_many(:characters)
  has_many(:filmography, :through => "characters", :source => "movie", :foreign_key => "movie_id")
  def characters
    key = self.id

    the_many = Character.where({ :actor_id => key })

    return the_many
  end

 
end
