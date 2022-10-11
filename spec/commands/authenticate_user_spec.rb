describe AuthenticateUser do
  subject(:context) { described_class.call(username, password) }

  describe '.call' do
    context 'when the context is successful' do
      let(:username) { 'correct_user' }
      let(:password) { 'correct_password' }

      it 'succeeds authentication' do
        expect(context).to be_success
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