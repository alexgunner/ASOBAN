class Carousel < ApplicationRecord
	has_attached_file :pic1, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :pic1, content_type: /\Aimage\/.*\z/

	has_attached_file :pic2, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :pic2, content_type: /\Aimage\/.*\z/

  	has_attached_file :pic3, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :pic3, content_type: /\Aimage\/.*\z/
end
