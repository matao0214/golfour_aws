class TrainingRecordsController < ApplicationController
  def index
    @training_posts = TrainingPost.all
    @training_contents = TrainingContent.all
    @user = User.all
    rank_tasks(@training_posts)
  end
  
  def show
    @training_posts = current_user.training_posts
    @training_contents = TrainingContent.where(training_post_id: @training_posts)
    rank_tasks(@training_posts)
  end

  private

  def rank_tasks(training_posts)
    all_task = {
      "球が上手く当たらない" => :task_ball_dont_hits_club,
      "スライスする" => :task_slice,
      "フックする" => :task_hook,
      "飛距離が出ない" => :task_ball_dont_fly_far,
      "クラブの番手を変えても飛距離が変わらない" => :task_flight_distance_dont_change,
      "ダフってしまう" => :task_get_duffed, "その他" => :task_other
    }
    number_of_tasks = {}
    all_task.each { |key, value| number_of_tasks[key] = training_posts.count(value) }
    @tasks_desc = number_of_tasks.sort_by{ | k, v | -v }.to_h
  end
end
