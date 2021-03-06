require 'test_helper'
require 'fixtures/sample_hbase'

class HbaseTest < ActiveSupport::TestCase

  test 'sample_hbase should have email and name as attributes' do

    sample = SampleHbase.new
    sample.name = "Lucas"
    assert_equal "Lucas", sample.name
    sample.email = "lucas.allan@gmail.com"
    assert_equal "lucas.allan@gmail.com", sample.email
  end

  test 'sample_hbase can clear attributes using clear_ prefix' do
  sample = SampleHbase.new
  sample.name = "User"
  sample.email = "user@example.com"
  assert_equal "User", sample.name
  assert_equal "user@example.com", sample.email
  sample.clear_name
  sample.clear_email
  assert_nil sample.name
  assert_nil sample.email
  end

  test "can ask if an attribute is present or not" do
    sample = SampleHbase.new
    assert !sample.name?
    sample.name = "User"
    assert sample.name?
    sample.email = ""
    assert !sample.email?
  end

  test "should have id attribute" do
    sample = SampleHbase.new
    assert sample.id == nil
  end

  test "persisted should return true if id exist" do
    sample = SampleHbase.new
    sample.stubs(:id).returns(1232)
    assert sample.persisted?
  end

  test "persisted should return false if id don't exist" do
    sample = SampleHbase.new
    assert !sample.persisted?
  end
end
