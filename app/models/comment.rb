class Comment < ApplicationRecord
  include ActionView::RecordIdentifier
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :comments, foreign_key: :parent_id, dependent: :destroy
  belongs_to :parent, optional: true, class_name: "Comment"
  has_rich_text :body
  validates :body, presence: { message: 'Comentário não pode ser em branco' }

  after_create_commit do
    broadcast_append_to [commentable, :comments], target: "#{dom_id(parent || commentable)}_comments", partial: "comments/comment_with_replies"
  end
  after_update_commit do
    broadcast_replace_to self
  end
  after_destroy_commit do
    broadcast_remove_to self
    broadcast_action_to self, action: :remove, target: "#{dom_id(self)}_with_comments"
  end
end
