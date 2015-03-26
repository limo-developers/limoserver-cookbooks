module OpsWorks
  module RailsConfiguration
    def self.bundle(app_name, app_config, app_root_path)
      Chef::Log.info("Overwrite bundle method")

      if File.exists?("#{app_root_path}/Gemfile")
        Chef::Log.info("Gemfile detected. Running bundle install.")
        Chef::Log.info("sudo su - #{app_config[:user]} -c 'cd #{app_root_path} && /usr/local/bin/bundle install --path #{app_config[:home]}/.bundler/#{app_name} --without=#{app_config[:ignore_bundler_groups].join(' ')}'")
        Chef::Log.info(OpsWorks::ShellOut.shellout("sudo su - #{app_config[:user]} -c 'cd #{app_root_path} && /usr/local/bin/bundle config build.pg --without-pg && /usr/local/bin/bundle install --path #{app_config[:home]}/.bundler/#{app_name} --without=#{app_config[:ignore_bundler_groups].join(' ')}' 2>&1"))
      end
    end
  end
end
