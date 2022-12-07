class Comment < ApplicationRecord
  belongs_to :post,counter_cache: true
  belongs_to :user
  has_rich_text :body

  after_create_commit :notify_recepient
  before_destroy :cleanup_notifications
  has_noticed_notifications model_name: 'notification'

  private
  def notify_recepient
    return if post.user == user
    CommentNotification.with(comment: self, post: post).deliver_later(post.user)
  end

  def cleanup_notifications
   notifications_as_comment.destroy_all
  end
end
