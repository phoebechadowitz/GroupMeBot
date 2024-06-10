class RecieversController < ApplicationController
  protect_from_forgery with: :null_session
  require 'faraday'

  $seconds = 3

  #curl -X POST -d '{"attachments":"", "avatar_url": "https://i.groupme.com/123456789", "created_at": 1302623328, "group_id": "1234567890", "id": "1234567890", "name": "John", "sender_id": "12345", "sender_type": "user", "source_guid": "GUID", "system": false, "text": "someone send the kings cup rules", "user_id": "1234567890"}' -H 'Content-Type: application/json' http://localhost:3000/index
  def create
    text = params[:text]
    if ((text.downcase.include? "kings cup") || (text.downcase.include? "king cup"))
      sleep($seconds)
      conn = Faraday.new(url: "https://api.groupme.com")
      post_data = {
        bot_id: "2c56ebec9bc1552a0e6e34f7ac",
        text: "",
        attachments: [
          {
            type: "image",
            url: "https://i.groupme.com/541x960.jpeg.5ed7625eb447467aa2b3844b267b9012"
          }
        ]
      }
      response = conn.post('/v3/bots/post') do |request| 
        request.headers['Content-Type'] = 'application/json'
        request.body = JSON.generate(post_data)
      end
    end
    $seconds = $seconds + 0.8
  end
end
