# == Schema Information
#
# Table name: users
#
#  id                                                              :integer          not null, primary key
#  created_at                                                      :datetime         not null
#  updated_at                                                      :datetime         not null
#  email                                                           :string
#  #<ActiveRecord::ConnectionAdapters::PostgreSQL::TableDefinition :string
#

class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true

  has_many(
    :short_urls,
    class_name: "ShortenedUrl",
    primary_key: :id,
    foreign_key: :user_id
  )

  has_many(
    :visits,
    class_name: "Visit",
    primary_key: :id,
    foreign_key: :user_id
  )

end
