import React from 'react'
import Product from 'components_react/products_box/product'
const $ = require("jquery")

export default class NoveltyBox extends React.Component {

    constructor() {
        super();
        this.state = {
            categoryName: 'Новинки',
            productsList: [],
            filteredList: [],
            sort: 'none',
            material: '0',
            collection: '0',
            nextPage: 1
        }
    }

    componentWillMount() {
        this._fetchProductsList()
    }

    _fetchProductsList() {
        $.ajax({
            method: 'GET',
            url: `categories.json?page=${this.state.nextPage}`,
            success: (data) => {
                this.setState({productsList: this.state.productsList.concat(data.products), filteredList: this._filterList(this.state.productsList.concat(data.products), this.state.sort, this.state.material, this.state.collection), nextPage: data.next_page})
            }
        })
    }

    _filterList(products, sort, material, collection) {
        let tempProductsList = products
        if(material != '0') {
            tempProductsList = tempProductsList.filter(function(product) {
                return product.material == material
            })
        }
        if(collection != '0') {
            tempProductsList = tempProductsList.filter(function(product) {
                return product.collection_name == collection
            })
        }
        if(sort == 'up') tempProductsList.sort(this._compare)
        else if(sort == 'down') tempProductsList.sort(this._reverseCompare)
        return tempProductsList
    }

    _compare(product1, product2) {
        const price1 = product1.price
        const price2 = product2.price

        let comparison = 0
        if(price1 > price2) {
            comparison = 1
        } else if(price1 < price2) {
            comparison = -1
        }
        return comparison
    }

    _reverseCompare(product1, product2) {
        const price1 = product1.price
        const price2 = product2.price

        let comparison = 0
        if(price1 < price2) {
            comparison = 1
        } else if(price1 > price2) {
            comparison = -1
        }
        return comparison
    }

    _prepareProductsList() {
        return this.state.filteredList.map((product) => {
            return (
                <Product product={product} key={product.id} />
            )
        })
    }

    _showMoreProductsButton() {
        if(this.state.nextPage != null) return <a className='button' onClick={this._fetchProductsList.bind(this)}>Показать больше товаров</a>
    }

    changeMaterial(event) {
        const productList = this._filterList(this.state.productsList, this.state.sort, event.target.value, this.state.collection)
        this.setState({filteredList: productList, material: event.target.value})
    }

    changeCollection(event) {
        const productList = this._filterList(this.state.productsList, this.state.sort, this.state.material, event.target.value)
        this.setState({filteredList: productList, collection: event.target.value})
    }

    changeSort(sort) {
        const productList = this._filterList(this.state.productsList, sort, this.state.material, this.state.collection)
        this.setState({filteredList: productList, sort: sort})
    }

    render() {
        if(this.state.productsList.length == 0) return <h2>В данной категории нет товаров</h2>
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
                    <div className='filter'>
                        <span>Коллекция</span>
                        <select onChange={this.changeCollection.bind(this)}>
                            <option value='0'>Все</option>
                            <option value='Базовая коллекция'>Базовая коллекция</option>
                            <option value='Весна-Лето 2018'>Весна-Лето 2018</option>
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
        )
    }
}