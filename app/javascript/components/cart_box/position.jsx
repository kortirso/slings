import React from 'react';

export default class Position extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            position: props.position,
            positionFull: props.position.full,
            positionCount: props.position.count
        }
    }

    // actions
    _handleChangeFullness() {
        this.setState({positionFull: !this.state.positionFull});
    }

    // prerender functions
    _calcSumm(position) {
        let price = position.product.price;
        if(this.state.positionFull) price = price + position.product.additional_price;
        return price * position.count;
    }

    _fullOrder(position) {
        if(position.product.additional_price != 0) {
            return (
                <div className='check_box'>
                    <label htmlFor={'full_' + position.id}>Полная комплектация (+{position.product.additional_price} руб.)</label>
                    <input type='checkbox' value='true' id={'full_' + position.id} defaultChecked={this.state.positionFull} name={'full_' + position.id} onChange={this._handleChangeFullness.bind(this)} />
                </div>
            );
        }
    }

    // render
    render() {
        let position = this.state.position;
        return (
            <tr id={'position_' + position.id}>
                <td></td>
                <td>
                    <p>{position.product.name}</p>
                    {this._fullOrder(position)}
                </td>
                <td className='change_count'>
                    <span className='count' id={'count_' + position.id}>{this.state.positionCount}</span>
                </td>
                <td className='amount' id={'summ_' + position.id}>{this._calcSumm(position)}</td>
                <td>
                    <form className='button_to' method='post' action='/positions/7' data-remote='true'>
                        <input className='button_delete' value='' type='submit' />
                    </form>
                </td>
            </tr>
        );
    }
}