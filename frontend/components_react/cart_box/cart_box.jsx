import React from 'react';
import Position from 'components_react/cart_box/position';
const $ = require("jquery");

export default class CartBox extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            cart: props.cart,
            positionsList: [],
            coupon: ''
        }
    }

    componentWillMount() {
        this._fetchPositionsList()
    }

    _changeCoupon(event) {
        this.setState({coupon: event.target.value})
    }

    // api calls
    _fetchPositionsList() {
        $.ajax({
            method: 'GET',
            url: `carts.json`,
            success: (data) => {
                this.setState({positionsList: data.positions, coupon: data.cart.coupon_name})
            }
        })
    }

    // actions
    _deletePosition(position_id) {
        $.ajax({
            method: 'DELETE',
            url: `/positions/${position_id}.json`,
            success: (data) => {
                $('#cart_amount').text(data.positions_amount)
                $('#amount').text(data.cart_amount)
                this.setState({positionsList: data.positions})
            }
        })
    }

    _onCouponAdd() {
        if(this.state.coupon == '') return null 
        $.ajax({
            method: 'GET',
            url: `carts/add_coupon/${this.state.coupon}.json`,
            success: (data) => {
                $('#amount').text(data.cart.summ)
                this.setState({positionsList: data.positions})
            }
        })
    }

    // renders
    _preparePositionsList() {
        return this.state.positionsList.map((position) => {
            return (
                <Position position={position} key={position.id} onDeletePosition={this._deletePosition.bind(this)} />
            )
        })
    }

    render() {
        return (
            <div>
                <h2>Корзина</h2>
                <div className='positions'>
                    <table className='cart'>
                        <thead>
                            <tr>
                                <th>Фото</th>
                                <th>Название</th>
                                <th>Количество</th>
                                <th>Цена (руб.)</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            {this._preparePositionsList()}
                        </tbody>
                    </table>
                    <div id='coupon'>
                        <span>Скидочный купон - </span>
                        <input type='text' onChange={this._changeCoupon.bind(this)} value={this.state.coupon} />
                        <a onClick={this._onCouponAdd.bind(this)} className='button price_button'>Применить</a>
                    </div>
                    <div id='total_summ'>
                        <p>Итоговая сумма - <span id='amount'>{this.state.cart.summ}</span> руб.</p>
                    </div>
                    <p>После оформления и оплаты заказа мы отправляем заявку на пошив, через 5 - 10 дней (в зависимости от загруженности) заказ будет доставлен по месту назначения.</p>
                </div>
            </div>
        )
    }
}