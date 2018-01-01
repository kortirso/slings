import React from 'react';

export default class Position extends React.Component {
    render() {
        let position = this.props.position;
        console.log(position);
        return (
            <tr id={'position_' + position.id}>

            </tr>
        );
    }
}