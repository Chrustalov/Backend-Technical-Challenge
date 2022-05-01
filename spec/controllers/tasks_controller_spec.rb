require 'rails_helper'

RSpec.describe TasksController, type: :controller do

  let!(:member) { create(:member) }
  let!(:task) { create(:task, member_id: member.id) }

  describe 'GET #index' do
    before { get :index }

    it 'returns http status success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      expect(response).to render_template('index')
    end
  end

  describe 'GET #new' do
    it 'renders the #new view, responds successfully' do
      get :new
      expect(response).to be_successful
      expect(response).to render_template :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new member' do
        expect do
          post :create, params: { task: attributes_for(:task, member_id: member.id) }
        end.to change(Task, :count).by(1)
      end
    end

    context 'with invalid params' do
      it 'has invalid params' do
        post :create, params: { task: attributes_for(:task, name: 'p') }

        expect(response).to be_successful
        expect(response).to render_template(:new)
      end
    end
  end
end
