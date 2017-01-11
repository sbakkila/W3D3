class Tagging < ActiveRecord::Base

  belongs_to(
    :urls,
    class_name: "ShortenedUrl",
    foreign_key: :short_url_id,
    primary_key: :id
  )

  # belongs_to(
  #   :topics,
  #   class_name: "ShortenedUrl",
  #   foreign_key: :short_url_id,
  #   primary_key: :id
  # )

end
