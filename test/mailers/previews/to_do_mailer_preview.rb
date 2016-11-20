# Preview all emails at http://localhost:3000/rails/mailers/to_do_mailer
class ToDoMailerPreview < ActionMailer::Preview
  def daily_list
    ToDoMailer.daily_list
  end
end
