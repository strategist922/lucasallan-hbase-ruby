require 'test_helper'
require 'fixtures/sample_hbase'

class ComplianceTest < ActiveSupport::TestCase

  include ActiveModel::Lint::Tests

  def setup
    @model = SampleHbase.new
  end

  test "model_name.human uses I18n" do begin
    I18n.backend.store_translations :en, :activemodel => { :models => { :sample_hbase => "My Sample Hbase" } }
    assert_equal "My Sample Hbase", model.class.model_name.human ensure
      I18n.reload!
    end
  end
end