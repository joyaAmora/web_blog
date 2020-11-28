class Post < ApplicationRecord
    belongs_to :member

    validates_presence_of :title, :body

    def created_signature
        "Created at #{self.created_at.strftime("%Y-%m-%d")} by #{self.member.email}"
    end
end
