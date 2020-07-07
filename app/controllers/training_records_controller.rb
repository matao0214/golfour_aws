class TrainingRecordsController < ApplicationController

  def show
    @training_posts = current_user.training_posts
    @training_tasks = TrainingTask.where(training_post_id: @training_posts)
    @training_contents = TrainingContent.where(training_post_id: @training_posts)
  end
   
end
