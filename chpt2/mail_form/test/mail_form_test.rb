require 'test_helper'
require 'fixtures/sample_mail'

class MailForm::Test < ActiveSupport::TestCase
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
