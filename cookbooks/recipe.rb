execute "Import public keys for install mongodb" do
  command "apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10"
end

execute "Create source list" do
  command "echo \"deb http://repo.mongodb.org/apt/ubuntu \"$(lsb_release -sc)\"/mongodb-org/3.0 multiverse\" > /etc/apt/sources.list.d/mongodb-org-3.0.list"
end

execute "Update apt-get" do
  command "apt-get update"
end

package 'mongodb-org'
package 'strace'
package 'make'
package 'ruby2.0'
package 'ruby2.0-dev'

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
