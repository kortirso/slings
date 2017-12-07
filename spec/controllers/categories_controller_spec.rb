RSpec.describe CategoriesController, type: :controller do
    describe 'GET #index' do
        let!(:categories) { create_list(:category, 2) }
        before { get :index }

        it 'renders index view' do
            expect(response).to render_template :index
        end
    end

    describe 'GET #show' do
        let!(:category) { create :category }
        before { get :show, params: { id: category.friendly_id } }

        it 'assigns the requested category to @category' do
            expect(assigns(:category)).to eq category
        end

        it 'renders show view' do
            expect(response).to render_template :show
        end
    end
end
