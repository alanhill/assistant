class ToDoMailer < ApplicationMailer
  def daily_list
    @to_dos = ToDo.all.where('completed = ?', false)
    mail(to: 'alan.hill@shopify.com', subject: 'Today\'s Tasks')
  end
end
