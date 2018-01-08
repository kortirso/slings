import React from 'react';

export default class Default extends React.Component {
    _setPage(page) {
        this.props.onPageClick(page);
    }

    render() {
        return (
            <div>
                <h2>Страница инструкций</h2>
                <div className='grid-x instructions'>
                    <div className='cell small-4'>
                        <div className='instr' onClick={this._setPage.bind(this, 1)}>
                            <img src='/images/category_images/ergo-sling.jpg' alt='' />
                            <p>Инструкция для слинг-рюкзака</p>
                        </div>
                    </div>
                    <div className='cell small-4'>
                        <div className='instr' onClick={this._setPage.bind(this, 2)}>
                            <img src='/images/category_images/mai-sling.jpg' alt='' />
                            <p>Инструкция для май-рюкзака</p>
                        </div>
                    </div>
                    <div className='cell small-4'>
                        <div className='instr' onClick={this._setPage.bind(this, 3)}>
                            <img src='/images/category_images/twins.jpg' alt='' />
                            <p>Инструкция для слинг-рюкзака для двойни</p>
                        </div>
                    </div>
                </div>
            </div>
        );
    }
}