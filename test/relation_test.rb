require 'test_helper'


class RelationTest < ActiveSupport::TestCase
	test 'receive only 3 parameters' do
		run_generator %w(usuario has_many task)
		
	end
	
end
