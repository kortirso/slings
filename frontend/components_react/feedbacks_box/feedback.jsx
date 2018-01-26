import React from 'react';
import defaultImage from 'images/profile.jpg';

export default class Feedback extends React.Component {
    _prepareImage(feedback) {
        if(feedback.image != '') return <img src={feedback.image} alt={'Фото от ' + feedback.name} />;
        return <img src={defaultImage} alt='empty image' className='empty' />
    }

    render() {
        let feedback = this.props.feedback;
        return (
            <div className='cell small-12 medium-6'>
                <div className='review_block'>
                    <div className='review_icon'></div>
                    <div className='review_text'>
                        <p>{feedback.body}</p>
                    </div>
                    <div className='review_author'>
                        <div className='author_name'>{feedback.name}</div>
                        <div className='author_image'>
                            {this._prepareImage(feedback)}
                        </div>
                    </div>
                </div>
            </div>
        );
    }
}