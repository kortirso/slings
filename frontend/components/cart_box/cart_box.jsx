import React from 'react';
import Position from 'components/cart_box/position';

export default class CartBox extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            cart_id: props.cart_id,
            positionsList: []
        }
    }

    componentWillMount() {
        this._fetchPositionsList();
    }

    _fetchPositionsList() {
        $.ajax({
            method: 'GET',
            url: `${this.state.cart_id}.json`,
            success: (data) => {
                this.setState({positionsList: data.positions});
            }
        });
    }

    _preparePositionsList() {
        return this.state.positionsList.map((position) => {
            return (
                <Position position={position} key={position.id} />
            );
        });
    }

    render() {
        return (
            <div>
                <h2>Корзина</h2>
                <div className='positions'>
                    <table>
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
                </div>
            </div>
        );
    }
}