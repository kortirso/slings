import React from 'react'
import defaultImage from 'images/product.jpg'
const $ = require("jquery")

export default class Product extends React.Component {
  _prepareImage(product) {
    if(product.image_content != null) return <img src={product.image_content} alt={product.name} />
    return <img src={defaultImage} alt='empty image' className='empty' />
  }

  // api calls
  _addProduct(product) {
    $.ajax({
      method: 'POST',
      url: `/positions?product_id=${product.id}.json`,
      success: (data) => {
        $('#cart_amount').text(data)
      }
    })
  }

  // renders
  render() {
    let product = this.props.product
    return (
      <div className='cell small-12 medium-6 large-3'>
        <div className='sling_block'>
          <a href={'/products/' + product.slug}>
            <div className='sling_image'>
              {this._prepareImage(product)}
            </div>
            <div className='sling_text'>
              <div className='sling_name'>
                {product.short_name}
              </div>
              {product.model != '' &&
                <div className='sling_name'>
                  {product.model}
                </div>
              }
              <div className='sling_price'>
                {product.price + ' руб.'}
              </div>
            </div>
          </a>
          <button className='button' onClick={this._addProduct.bind(this, product)}>Купить</button>
        </div>
      </div>
    )
  }
}