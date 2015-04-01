request = require 'request'

token = process.env.SLACK_TOKEN
channel = encodeURIComponent process.env.SLACK_CHANNEL

module.exports = (robot) ->
  robot.hear //, (msg) ->
    user = encodeURIComponent msg.message.user.name
    text = encodeURIComponent msg.message.text
    icon = encodeURIComponent "http://www.paper-glasses.com/api/twipi/#{user}"
    request.get "https://slack.com/api/chat.postMessage?token=#{token}&channel=#{channel}&text=#{text}&pretty=1&username=#{user}&icon_url=#{icon}&link_names=1"
