# == Schema Information
#
# Table name: shortened_urls
#
#  id         :integer          not null, primary key
#  long_url   :string           not null
#  short_url  :string
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'securerandom'

class ShortenedUrl < ActiveRecord::Base
  validates :user_id, :long_url, presence: true

  def self.random_code
    random_code = SecureRandom.urlsafe_base64
    until !self.exists?(short_url: random_code)
      random_code = SecureRandom.urlsafe_base64
    end
    random_code
  end

  def self.create_for_user_and_long_url!(user, long_url)
    self.create!(user_id: user.id, short_url: self.random_code, long_url: long_url)
  end

  belongs_to(
    :user,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id
    )

  has_many(
    :visits,
    class_name: "Visit",
    primary_key: :id,
    foreign_key: :short_url_id
  )

  has_many(
    :visitors,
    through: :visits,
    source: :visitor
  )

  has_many(
    :num_uniques,
    Proc.new { distinct },
    through: :visits,
    source: :visitor
  )

  def num_clicks
    count = 0
    self.visits.each { count += 1 }
    count
  end

  def num_uniques_count
    self.num_uniques.count
  end


  def num_recent_uniques
    visits.where('created_at > ?', 10.minutes.ago).count
  end


end
