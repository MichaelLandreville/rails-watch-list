class Movie < ApplicationRecord
  has_many :bookmarks

  before_destroy :check_for_bookmarks_references

  private

  def check_for_bookmarks_references
    if bookmarks.any?
      errors.add(:base, "Cannot delete movie if it is referenced in at least one bookmark.")
      throw :abort # Prevents the deletion
    end
end
