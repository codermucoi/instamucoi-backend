# frozen_string_literal: true

require 'rails_helper'

describe 'Registration', type: :request do
  describe 'POST #create' do
    context 'with invalid params' do
      it 'returns 422 - email blank' do
        post '/users/sign_up', params: attributes_for(:user).except(:email)

        expect(response).to have_http_status :unprocessable_entity
        expect(response_errors).to eq "Email can't be blank"
      end
    end

    context 'with valid params' do
      it 'creates a new user' do
        expect do
          post '/users/sign_up', params: attributes_for(:user)
        end.to change(User, :count).by 1

        expect(response).to have_http_status :ok
        expect(response_message).to eq 'Signed up successfully'
      end

      it 'responds access token and refresh token in response headers' do
        post '/users/sign_up', params: attributes_for(:user)

        expect(response).to have_http_status :ok
        expect(response.headers['Access-Token']).to be_present
        expect(response.headers['Expire-At']).to be_present
        expect(response.headers['Refresh-Token']).to be_present
      end

      it 'returns 422 - email has already been taken' do
        user = create :user
        expect do
          post '/users/sign_up', params: attributes_for(:user, email: user.email)
        end.not_to change User, :count

        expect(response).to have_http_status :unprocessable_entity
        expect(response_errors).to eq 'Email has already been taken'
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'with invalid params' do
      it 'returns 401 - missing access token' do
        create :user
        delete '/users/delete'

        expect(response).to have_http_status :unauthorized
        expect(response_errors).to eq 'Access token is missing in the request'
      end

      it 'returns 401 - invalid access token' do
        create :user
        delete '/users/delete', headers: { 'Authorization': 'Bearer 123213' }

        expect(response).to have_http_status :unauthorized
        expect(response_errors).to eq 'Invalid access token'
      end

      it 'returns 401 - expired access token' do
        user = create :user
        expired_access_token = jwt_and_refresh_token(user, 'user', true)[0]

        delete '/users/delete', headers: { 'Authorization': "Bearer #{expired_access_token}" }

        expect(response).to have_http_status :unauthorized
        expect(response_errors).to eq 'Access token expired'
      end
    end

    context 'with valid params' do
      it 'returns 200 - successfully deleted' do
        user = create :user
        access_token = jwt_and_refresh_token(user, 'user')[0]

        delete '/users/delete', headers: { 'Authorization': "Bearer #{access_token}" }

        expect(response).to have_http_status :ok
        expect(parsed_response['message']).to eq 'Account deleted successfully'
      end
    end
  end
end
