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
end
