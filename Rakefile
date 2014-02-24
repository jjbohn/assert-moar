require 'bundler/gem_tasks'
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'lib/assert_moar'
  t.libs << 'lib/minitest'
  t.test_files = FileList['test/lib/assert_moar/**/*_test.rb','test/lib/minitest/**/*_test.rb' ]
  t.verbose = true
end

task default: :test
