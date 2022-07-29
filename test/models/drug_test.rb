# frozen_string_literal: true

require 'test_helper'

class DrugTest < ActiveSupport::TestCase
  test 'should not save an empty drug' do
    drug = Drug.new
    assert_not drug.valid?
    assert_not_empty drug.errors[:brand_name], 'no validation error for brand name present'
    assert_not_empty drug.errors[:generic_name], 'no validation error for generic name present'
    assert_not_empty drug.errors[:laboratory], 'no validation error for laboratory present'
  end

  test 'should not save a drug with fields greater than 50' do
    drug = Drug.new(brand_name: 'a' * 51, generic_name: 'a' * 501, laboratory: 'a' * 51)
    assert_not drug.valid?, 'doctor is valid with fields character greater than 50'
    assert_not_empty drug.errors[:brand_name], 'no validation error for brand_name greater than 50'
    assert_not_empty drug.errors[:generic_name], 'no validation error for generic_name greater than 500'
    assert_not_empty drug.errors[:laboratory], 'no validation error for laboratory greater than 50'
  end

  test 'valid drug' do
    drug = Drug.new(brand_name: 'Rails', generic_name: 'Railsmycin', laboratory: 'RubyLab')
    assert drug.valid?
  end
end
