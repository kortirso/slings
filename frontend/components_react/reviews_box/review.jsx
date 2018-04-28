import React from 'react';
import defaultImage from 'images/profile.jpg';

export default class Review extends React.Component {
  _prepareImage(review) {
    if(review.image != '') return <img src={review.image} alt={'Фото от ' + review.name} />;
    return <img src={defaultImage} alt='empty image' className='empty' />
  }

  render() {
    let review = this.props.review;
    return (
      <div className='review'>
        <div className='image_block'>
          {this._prepareImage(review)}
        </div>
        <div className='text_block'>
          <p>{review.body}</p>
          <p>{review.name}</p>
        </div>
      </div>
    );
  }
}