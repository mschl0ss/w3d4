# == Schema Information
#
# Table name: responses
#
#  id               :bigint           not null, primary key
#  user_id          :integer
#  answer_choice_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Response < ApplicationRecord
  validate :not_duplicate_response

  belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: 'AnswerChoice'

  belongs_to :respondent,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'User'

  

  has_one :question,
    through: :answer_choice,
    source: :question

  def sibling_responses
    q = question
    q.responses.where.not(id: self.id)
  end

  def respondent_already_answered?
    sibs = self.sibling_responses
    #self comes with a user_id
    #loop through those siblings and see if that user_id shows up again
    for sib in sibs
      return true if sib.user_id == user_id
    end
    false
  end

  def not_duplicate_response
    if respondent_already_answered?
      # errors.add(:respondent, "Respondent already has a response logged ")
      errors[:respondent] << "Cannot answer twice"
    end
  end
end
