import React from 'react';
import image1 from 'images/category_images/ergo-sling.jpg';
import image2 from 'images/category_images/mai-sling.jpg';
import image3 from 'images/category_images/twins.jpg';

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
                            <img src={image1} alt='Инструкция к эрго-рюкзаку' />
                            <p>Инструкция к эрго-рюкзаку (слингу-рюкзаку)</p>
                        </div>
                    </div>
                    <div className='cell medium-6 large-4'>
                        <div className='instr' onClick={this._setPage.bind(this, 2)}>
                            <img src={image2} alt='Инструкция к май-слингу' />
                            <p>Инструкция к май-слингу</p>
                        </div>
                    </div>
                    <div className='cell medium-6 large-4'>
                        <div className='instr' onClick={this._setPage.bind(this, 3)}>
                            <img src={image3} alt='Инструкция к слингу-рюкзаку для двойни' />
                            <p>Инструкция к слингу-рюкзаку для двойни</p>
                        </div>
                    </div>
                </div>
            </div>
        );
    }
}