require_relative 'helper.rb'

Before do |feature|
  ## variable which loads the data file according to the environment
  CONFIG ||= YAML.load_file(File.dirname(__FILE__) +
           "/config/#{ENVIRONMENT_TYPE}.yaml")

  I18n.config.available_locales = :en

  ## configure the chosen browser
  Capybara.configure do |config|
    config.default_driver = :selenium
  end

  ## set default max wait
  Capybara.default_max_wait_time = 60

  ## maximize browser
  unless BROWSER.eql?('poltergeist')
    Capybara.current_session.driver.browser.manage.window.maximize
  end
end

After do |scenario|
  ## take screenshot if scenario fail
  if scenario.failed?
    Helper.new.take_screenshot(scenario.name, 'screenshots/test_failed')
  end
end
