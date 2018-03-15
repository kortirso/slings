import React from 'react';
import Product from 'components_react/products_box/product';
const $ = require("jquery");

export default class ProductsBox extends React.Component {

    constructor(props) {
        super(props);
        this.state = {
            categorySlug: props.category.slug,
            categoryName: props.category.name,
            productsList: [],
            filteredList: [],
            sort: 'none',
            materials: '0',
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
                this.setState({productsList: this.state.productsList.concat(data.products), filteredList: this._filterList(this.state.productsList.concat(data.products)), nextPage: data.next_page});
            }
        });
    }

    _filterList(products) {
        return products
    }

    _prepareProductsList() {
        return this.state.filteredList.map((product) => {
            return (
                <Product product={product} key={product.id} />
            );
        });
    }

    _showMoreProductsButton() {
        if(this.state.nextPage != null) return <a className='button' onClick={this._fetchProductsList.bind(this)}>Показать больше товаров</a>;
    }

    changeMaterial(event) {
        this.setState({material: event.target.value})
    }

    changeSort(sort) {
        this.setState({sort: sort})
    }

    render() {
        if(this.state.productsList.length == 0) return <h2>В данной категории нет товаров</h2>;
        return (
            <div>
                <h2>{this.state.categoryName}</h2>
                <div className='filters'>
                    <div className='filter'>
                        <span>Сортировка по цене</span><a onClick={this.changeSort.bind(this, 'up')}>&#8593;</a><a onClick={this.changeSort.bind(this, 'down')}>&#8595;</a>
                    </div>
                    <div className='filter'>
                        <span>Материал</span>
                        <select onChange={this.changeMaterial.bind(this)}>
                            <option value='0'>Все</option>
                            <option value='Хлопок'>Хлопок</option>
                            <option value='Лён'>Лён</option>
                        </select>
                    </div>
                </div>
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