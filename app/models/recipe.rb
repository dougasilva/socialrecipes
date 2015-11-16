class Recipe < ActiveRecord::Base
  validates :name, :kitchen, :type_of_food, :preference, :ingredients,
            :preparation, presence: true

  has_attached_file :foto, styles: { medium: '300x300>', thumb: '100x100>' },
                    :path => "specs/fotos/:basename.:extension",
                    :storage => :s3,
                    :s3_credentials => Rails.root.join("config/amazon_s3.yml"),
                    :bucket => "douglassocialrecipes"


  validates_attachment :foto, content_type: { content_type: ['image/jpg',
                                                             'image/jpeg',
                                                             'image/png',
                                                             'image/gif'] }
  belongs_to :kitchen
  belongs_to :type_of_food
  belongs_to :preference
end
