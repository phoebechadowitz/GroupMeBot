class RecieversController < ApplicationController
  before_action :set_reciever, only: %i[ show edit update destroy ]
  protect_from_forgery with: :null_session
  require 'faraday'
  # GET /recievers or /recievers.json
  def index
    @recievers = Reciever.all
  end

  # GET /recievers/1 or /recievers/1.json
  def show
  end

  # GET /recievers/new
  def new
    @reciever = Reciever.new
  end

  # GET /recievers/1/edit
  def edit
  end
  #curl -X POST -d '{"attachments":"", "avatar_url": "https://i.groupme.com/123456789", "created_at": 1302623328, "group_id": "1234567890", "id": "1234567890", "name": "John", "sender_id": "12345", "sender_type": "user", "source_guid": "GUID", "system": false, "text": "someone send the kings cup rules", "user_id": "1234567890"}' -H 'Content-Type: application/json' http://localhost:3000/index
  # POST /recievers or /recievers.json
  def create
    text = params[:text]
    if text.include? "kings cup"
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
  end

  # PATCH/PUT /recievers/1 or /recievers/1.json
  def update
    respond_to do |format|
      if @reciever.update(reciever_params)
        format.html { redirect_to reciever_url(@reciever), notice: "Reciever was successfully updated." }
        format.json { render :show, status: :ok, location: @reciever }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reciever.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recievers/1 or /recievers/1.json
  def destroy
    @reciever.destroy!

    respond_to do |format|
      format.html { redirect_to recievers_url, notice: "Reciever was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reciever
      @reciever = Reciever.find(params[:id])
    end
end
