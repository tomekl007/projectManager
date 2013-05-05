require 'test_helper'

class NotifierTest < ActionMailer::TestCase
  test "task_succed" do
    mail = Notifier.task_succed
    assert_equal "Task succed", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "new_task" do
    mail = Notifier.new_task
    assert_equal "New task", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
