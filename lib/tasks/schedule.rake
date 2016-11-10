namespace :schedule do
  desc "I am short, but comprehensive description for my cool task"
    task work: :environment do
      @tasks = ToDo.all
      @tasks.each do |task|
        puts task if task.due?
      end
    end
end
