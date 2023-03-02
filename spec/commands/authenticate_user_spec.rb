# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength
describe AuthenticateUser do
  subject(:context) { described_class.call(username, password) }

  before do
    @invalid_email = 'connor@neslo.co'

    @user = create(:user, email: 'chughes@neslotech.co.za', password: '123123')
    @inactive_user = create(:user, email: 'test@neslotech.co.za', password: '123123')
  end

  describe '.call' do
    context 'when the context is successful' do
      let(:username) { 'correct_user' }
      let(:password) { 'correct_password' }

      it 'succeeds authentication' do
        expect(context).to be_success
      end
    end

    describe 'POST authenticate' do
      it 'authenticates user with correct password and email' do
        post :authenticate, params: { email: 'chughes@neslotech.co.za', password: '123123', role: :admin, format: :json }

        expect(response).to have_http_status :ok
        expect(json['auth_token']).not_to be_nil
      end
    end

    context 'when the context is not successful' do
      let(:username) { 'wrong_user' }
      let(:password) { 'wrong_password' }

      it 'fails' do
        expect(context).to be_failure
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
