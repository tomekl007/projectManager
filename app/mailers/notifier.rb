class Notifier < ActionMailer::Base
  default from: "projectManager@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.task_succed.subject
  #
  def task_succed(task)

    @task = task
    @greeting = "Hi"
     task.project.users.each do |user|
       @user = user
       logger.info "sending email to #{user.name}"
       mail to: user.name , :subject => "task #{task.name} was just done"
     end


  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.new_task.subject
  #
  def new_task(task)

    @task = task
    @greeting = "Hi"
    task.project.users.each do |user|
      @user = user
      logger.info "sending email about new task to #{user.name}"
      mail to: user.name , :subject => "task #{task.name} was added to project"
    end
  end
end
