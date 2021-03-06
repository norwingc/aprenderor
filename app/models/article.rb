class Article < ActiveRecord::Base
	belongs_to :user
	validates :title, presence: true
	validates :body, presence:true, length: { minimum: 20, :message => 'El cuerpo debe tener un minimo de 20 caracteres'  }
end
