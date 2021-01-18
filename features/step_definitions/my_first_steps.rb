Given('the login page is opened successfully') do
    $driver.get("http://the-internet.herokuapp.com/login")
end 
When('user input username {string} and password {string}') do |string, string2|
    $driver.find_element(:id, 'username').send_keys(string)
    $driver.find_element(:id, 'password').send_keys(string2)
    $driver.find_element(:css, '[class="fa fa-2x fa-sign-in"]').click
end
Then('the message {string} should be displayed') do |want_resoult|
    message = $driver.find_element(:css, '#flash').text#.delete("\n")
    message = message.slice(0, message.length-4)
    want_resoult = want_resoult.slice(0,message.length)
    expect(message).to eql(want_resoult)
end