class Book < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy

  validates :title, presence:true
  validates :body, presence:true, length:{maximum:200}

  scope :latest, -> {order(created_at: :desc)}
  scope :highest, -> {order(rate: :desc)}

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  # 検索
  def self.looks(search, word, range = "Book")
    case search
    when "partial_match" then
      value = "%#{word}%"
    when "forward_match" then
      value = "#{word}%"
    when "backward_match" then
      value = "%#{word}"
    when "exact_match" then
      value = "#{word}"
    else
      return @books = Book.all
    end

    case range
    when "Book" then
      @books = Book.where("title LIKE?", value)
    when "Tag" then
      @books = Book.where("tag LIKE?", value)
    end
  end
end
