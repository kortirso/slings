import React from 'react'
import Product from 'components_react/products_box/product'
const $ = require("jquery")

export default class LastProductsBox extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      productsList: props.products
    }
  }

  _prepareProductsList() {
    return this.state.productsList.map((product) => {
      return <Product product={product} key={product.id} />
    })
  }

  render() {
    return (
      <div>
        <h2>Наши новинки</h2>
        <div className='catalog'>
          <div className='products grid-x'>
            {this._prepareProductsList()}
          </div>
        </div>
      </div>
    )
  }
}