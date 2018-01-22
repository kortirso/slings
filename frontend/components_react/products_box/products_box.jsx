import React from 'react';
import Product from 'components_react/products_box/product';

export default class ProductsBox extends React.Component {

    constructor(props) {
        super(props);
        this.state = {
            categorySlug: props.category.slug,
            categoryName: props.category.name,
            productsList: [],
            nextPage: 1
        }
    }

    componentWillMount() {
        this._fetchProductsList();
    }

    _fetchProductsList() {
        $.ajax({
            method: 'GET',
            url: `${this.state.categorySlug}.json?page=${this.state.nextPage}`,
            success: (data) => {
                this.setState({productsList: this.state.productsList.concat(data.products), nextPage: data.next_page});
            }
        });
    }

    _prepareProductsList() {
        return this.state.productsList.map((product) => {
            return (
                <Product product={product} key={product.id} />
            );
        });
    }

    _showMoreProductsButton() {
        if(this.state.nextPage != null) return <a className='button' onClick={this._fetchProductsList.bind(this)}>Показать больше товаров</a>;
    }

    render() {
        if(this.state.productsList.length == 0) return <h2>В данной категории нет товаров</h2>;
        return (
            <div>
                <h2>{this.state.categoryName}</h2>
                <div className='catalog'>
                    <div className='products grid-x'>
                        {this._prepareProductsList()}
                    </div>
                </div>
                {this._showMoreProductsButton()}
            </div>
        );
    }
}