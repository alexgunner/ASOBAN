require 'test_helper'
require 'generators/asoban_migration/asoban_migration_generator'

class AsobanMigrationGeneratorTest < Rails::Generators::TestCase
  tests AsobanMigrationGenerator
  destination Rails.root.join('tmp/generators')
  setup :prepare_destination

  # test "generator runs without errors" do
  #   assert_nothing_raised do
  #     run_generator ["arguments"]
  #   end
  # end
end
