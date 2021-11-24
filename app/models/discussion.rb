class Discussion < ApplicationRecord

     belongs_to :user, class_name: "user", foreign_key: "user_id"
     belongs_to :assistance, class_name: "assistant", foreign_key: "assistant_id"
end
