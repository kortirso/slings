import React from 'react'
import defaultImage from 'images/profile.jpg'

export default class Review extends React.Component {
  _prepareImage(review) {
    if(review.image_contente != null) return <img src={`data:image/jpg;base64,${review.image_content}`} alt={'Фото от ' + review.name} />
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
    )
  }
}