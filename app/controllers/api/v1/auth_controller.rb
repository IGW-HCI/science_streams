class Api::V1::AuthController < ApplicationController
  http_basic_authenticate_with name: "user", password: "password"
  def login
    render json: { token: "abc123" }
  end
end
