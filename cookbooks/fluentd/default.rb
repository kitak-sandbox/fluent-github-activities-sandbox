[
  'fluentd',
  'fluent-plugin-mongo',
  'fluent-plugin-github-activities',
  'bson_ext'
].each do |name|
  gem_package name do
    gem_binary 'gem2.0'
  end
end
