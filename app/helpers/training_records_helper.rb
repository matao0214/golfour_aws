module TrainingRecordsHelper
  def graph_of_training_hits_group_by_day_of_month
    column_chart @training_contents.group_by_day_of_month(:created_at).sum(:training_hits), label: "打球数", messages: {empty: "練習記録を投稿してみよう！"}, xtitle: "日", ytitle: "球"
  end

  def graph_of_training_time_group_by_day_of_month
    column_chart @training_contents.group_by_day_of_month(:created_at).sum(:training_time), label: "練習時間", messages: {empty: "練習記録を投稿してみよう！"}, xtitle: "日", ytitle: "時間"
  end

  def graph_of_training_hits_group_by_month_of_year
    column_chart @training_contents.group_by_month_of_year(:created_at, format: "%b").sum(:training_hits), label: "打球数", messages: {empty: "練習記録を投稿してみよう！"}, xtitle: "", ytitle: "球" 
  end

  def graph_of_training_time_group_by_month_of_year
    column_chart @training_contents.group_by_month_of_year(:created_at, format: "%b").sum(:training_time), label: "練習時間", messages: {empty: "練習記録を投稿してみよう！"}, xtitle: "", ytitle: "時間"
  end

end
