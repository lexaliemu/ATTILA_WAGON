module ActivitiesHelper
  def activities
    PublicActivity::Activity.order("created_at desc")
  end
end
