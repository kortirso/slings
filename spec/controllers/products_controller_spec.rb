RSpec.describe ProductsController, type: :controller do
    describe 'GET #show' do
        let(:product) { create :product }
        before { get :show, params: { id: product.friendly_id } }

        it 'assigns the requested product to @product' do
            expect(assigns(:product)).to eq product
        end

        it 'renders show view' do
            expect(response).to render_template :show
        end
    end
end