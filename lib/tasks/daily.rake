namespace :daily do
  desc "Sends all daily emails"
    task :send_email => :environment do
      # all daily emails should be in this task
      ToDoMailer.daily_list.deliver_now
  end
end
