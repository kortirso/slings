import React from 'react';

export default class Product extends React.Component {
    _prepareImage(product) {
        if(product.image != '') return <img src={product.catalog_image} alt={product.name} />;
        return <img src='/images/product.jpg' alt='empty image' className='empty' />;
    }

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
                            <form className='button_to' method='post' action={'/positions?product_id=' + product.id} data-remote='true'>
                                <input className='button' value='Купить' type='submit' />
                            </form>
                        </div>
                    </a>
                </div>
            </div>
        );
    }
}