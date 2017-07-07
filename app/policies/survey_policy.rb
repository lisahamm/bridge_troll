class SurveyPolicy < ApplicationPolicy
  def permitted_attributes
    [
      :good_things,
      :bad_things,
      :appropriate_for_skill,
      :other_comments,
      :rsvp_id,
      :recommendation_likelihood
    ]
  end
end
