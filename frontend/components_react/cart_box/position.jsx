import React from 'react';
import defaultImage from 'images/product.jpg';
const $ = require("jquery");

export default class Position extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            position: props.position
        }
    }

    _prepareImage(product) {
        if(product.image != '') return <img src={product.catalog_image} alt={product.name} />;
        return <img src={defaultImage} alt='empty image' className='empty' />;
    }

    // api calls
    _positionChange(type) {
        let mode = this._selectUrl(type);
        $.ajax({
            method: 'POST',
            url: `/${mode}/${this.state.position.id}.json`,
            success: (data) => {
                $('#cart_amount').text(data.positions_amount)
                $('#amount').text(data.cart_amount)
                this.setState({position: data.position})
            }
        })
    }

    _selectUrl(type) {
        switch(type) {
            case 'plus':
                return 'plus'
            case 'minus':
                return 'minus'
            case 'full':
                return 'full'
        }
    }

    // actions
    _deletePosition() {
        this.props.onDeletePosition(this.state.position.id)
    }

    // prerender functions
    _calcSumm(position) {
        let price = position.product.price
        if(this.state.position.full) price = price + position.product.additional_price
        return price * this.state.position.count
    }

    _fullOrder(position) {
        if(position.product.additional_price != 0) {
            return (
                <div className='check_box'>
                    <label htmlFor={'full_' + position.id}>Полная комплектация (+{position.product.additional_price} руб.)</label>
                    <input type='checkbox' value='true' id={'full_' + position.id} defaultChecked={this.state.position.full} name={'full_' + position.id} onChange={this._positionChange.bind(this, 'full')} />
                </div>
            )
        } else {
            return false
        }
    }

    _prepareDownButton() {
        if(this.state.position.count != 1) return <a className='count_button button_down' onClick={this._positionChange.bind(this, 'minus')}></a>
        else return false
    }

    // render
    render() {
        let position = this.state.position;
        return (
            <tr id={'position_' + position.id}>
                <td>
                    {this._prepareImage(position.product)}
                </td>
                <td>
                    <p>{position.product.name}</p>
                    {this._fullOrder(position)}
                </td>
                <td className='change_count'>
                    {this._prepareDownButton()}
                    <span className='count'>{this.state.position.count}</span>
                    <a className='count_button button_up' onClick={this._positionChange.bind(this, 'plus')}></a>
                </td>
                <td className='amount'>{this._calcSumm(position)}</td>
                <td>
                    <button className='button_delete' onClick={this._deletePosition.bind(this)}></button>
                </td>
            </tr>
        )
    }
}