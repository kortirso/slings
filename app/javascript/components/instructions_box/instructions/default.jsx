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
                    <div className='cell medium-6 large-4'>
                        <div className='instr' onClick={this._setPage.bind(this, 1)}>
                            <img src='/images/category_images/ergo-sling.jpg' alt='' />
                            <p>Инструкция к эрго-рюкзаку (слингу-рюкзаку)</p>
                        </div>
                    </div>
                    <div className='cell medium-6 large-4'>
                        <div className='instr' onClick={this._setPage.bind(this, 2)}>
                            <img src='/images/category_images/mai-sling.jpg' alt='' />
                            <p>Инструкция к май-слингу</p>
                        </div>
                    </div>
                    <div className='cell medium-6 large-4'>
                        <div className='instr' onClick={this._setPage.bind(this, 3)}>
                            <img src='/images/category_images/twins.jpg' alt='' />
                            <p>Инструкция к слингу-рюкзаку для двойни</p>
                        </div>
                    </div>
                </div>
            </div>
        );
    }
}