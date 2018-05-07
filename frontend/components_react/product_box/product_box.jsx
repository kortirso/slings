import React from 'react';
import defaultImage from 'images/product.jpg';
const $ = require("jquery");

export default class ProductBox extends React.Component {
  constructor() {
    super();
    this.state = {
      product: {image_content: null, model: '', caption: []}
    }
  }

  componentWillMount() {
    this._fetchProduct()
  }

  _prepareImage() {
    let product = this.state.product
    console.log(product)
    if(product.image_content != null) return <img src={product.image_content} alt={product.name} />
    return <img src={defaultImage} alt='empty image' className='empty' />
  }

  // api calls
  _fetchProduct() {
    $.ajax({
      method: 'GET',
      url: `${this.props.product_id}.json`,
      success: (data) => {
        console.log(data)
        this.setState({product: data.product})
      }
    })
  }

  _addProduct() {
    $.ajax({
      method: 'POST',
      url: `/positions?product_id=${this.state.product.id}.json`,
      success: (data) => {
        $('#cart_amount').text(data)
      }
    })
  }

  _prepareCaption() {
    return this.state.product.caption.map((line, index) => {
      return <p key={index}>{line}</p>
    })
  }

  // renders
  render() {
    let product = this.state.product
    return (
      <div className='current_product'>
        <h2>{product.name}</h2>
        <div className='grid-x'>
          <div className='cell small-12 medium-4'>
            <div className='product_block'>
              <div className='image_block'>
                {this._prepareImage()}
              </div>
            </div>
          </div>
          <div className='cell small-12 medium-8'>
            <div>{this._prepareCaption()}</div>
            <p>Цена - {product.price} руб.</p>
            <button className='button' onClick={this._addProduct.bind(this, product)}>Купить</button>
          </div>
        </div>
      </div>
    )
  }
}