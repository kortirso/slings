import React from 'react';
import defaultImage from 'images/product.jpg';
const $ = require("jquery");

export default class Product extends React.Component {
  _prepareImage(product) {
    if(product.image_content != null) return <img src={`data:image/jpg;base64,${product.image_content}`} alt={product.name} />;
    return <img src={defaultImage} alt='empty image' className='empty' />;
  }

  // api calls
  _addProduct(product) {
    $.ajax({
      method: 'POST',
      url: `/positions?product_id=${product.id}.json`,
      success: (data) => {
        $('#cart_amount').text(data);
      }
    });
  }

  // renders
  render() {
    let product = this.props.product;
    return (
      <div className='cell small-6 medium-6 large-3 end'>
        <div className='sling_block block'>
          <a href={'/products/' + product.slug}>
            <div className='sling_image'>
              {this._prepareImage(product)}
            </div>
            <div className='sling_text'>
              <div className='sling_name'>
                {product.short_name}
              </div>
              <div className='sling_price'>
                {product.price + ' руб.'}
              </div>
            </div>
          </a>
          <button className='button' onClick={this._addProduct.bind(this, product)}>Купить</button>
        </div>
      </div>
    );
  }
}