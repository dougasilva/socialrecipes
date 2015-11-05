class Recipe < ActiveRecord::Base
  validates :name, :kitchen, :type_of_food, :preference, :ingredients,
            :preparation, presence: true

  has_attached_file :foto, styles: { medium: '300x300>', thumb: '100x100>' }
  validates_attachment :foto, content_type: { content_type: ['image/jpg',
                                                             'image/jpeg',
                                                             'image/png',
                                                             'image/gif'] }
end
