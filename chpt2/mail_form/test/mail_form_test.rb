require 'test_helper'
require 'fixtures/sample_mail'

class MailForm::Test < ActiveSupport::TestCase
    setup do
        ActionMailer::Base.deliveries.clear
    end

    test "delivers an email with attributes" do
        sample = SampleMail.new
        #Si,ulate data from the form
        sample.email = "user@example.com"
        sample.deliver

        assert_equal 1, ActionMailer::Base.deliveries.size
        mail = ActionMailer::Base.deliveries.last

        assert_equal ["user@example.com"], mail.from
        assert_match "Email: user@example.com", mail.body.encoded
    end

    test "sample mail has name and email as attributes" do
        sample = SampleMail.new
        sample.name = "User"
        assert_equal "User", sample.name
        sample.email = "user@example.com"
        assert_equal "user@example.com", sample.email

        sample.clear_name
        sample.clear_email
        assert_nil sample.name
        assert_nil sample.email

        sample2 = SampleMail.new
        assert !sample2.name?

        sample2.name = "User"
        assert sample2.name?

        sample2.email = ""
        assert !sample2.email?

        assert_equal false, sample.email.present?

    end

end
