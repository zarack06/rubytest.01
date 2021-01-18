require "rubygems"
require "itms_automation"
require "httparty"
require "report_builder"
#require "webdrivers"
require "selenium-webdriver"
$browser_type = ENV["BROWSER"] || "firefox"

begin
  $driver = case $browser_type
  when "chrome"
    Selenium::WebDriver.for(:chrome)
  when "safari"
    Selenium::WebDriver.for(:safari)
  when "internet_explorer"
    Selenium::WebDriver.for(:internet_explorer)
  when "chrome_headless"
    Selenium::WebDriver.for(:chrome, :desired_capabilities => Selenium::WebDriver::Remote::Capabilities.chrome(chromeOptions: { args: %w(headless) }))
  when "remote"
    if ENV['SERVER_URL'].nil? || ENV['REMOTE_BROWSER'].nil?
      puts "\nMissing SERVER_URL : SERVER_URL=http//SERVER_URL:4444/wd/hub"
      puts "\nMissing REMOTE_BROWSER: REMOTE_BROWSER=browser_name"
      Process.exit(0)
    else
      caps = Selenium::WebDriver::Remote::Capabilities.new
      caps["browserName"] = ENV["REMOTE_BROWSER"]
      caps["enableVNC"] = false
      caps["enableVideo"] = false
      caps["resolution"] = ENV["resolution"] unless ENV["resolution"]
      Selenium::WebDriver.for(:remote, :url => ENV["SERVER_URL"], :desired_capabilities => caps)
  end
  else
    Selenium::WebDriver.for(:firefox)
  end
rescue Exception => e
  puts e.message
  Process.exit(0)
end