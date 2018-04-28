import React from 'react';
import defaultImage from 'images/profile.jpg';

export default class Feedback extends React.Component {
  _prepareImage(feedback) {
    if(feedback.image != '') return <img src={feedback.image} alt={'Фото от ' + feedback.name} />
    return <img src={defaultImage} alt='empty image' className='empty' />
  }

  _prepareBody(feedback) {
    return (
      <div className='review_text'>
        <p>{feedback.short_body}</p>
        {feedback.body != feedback.short_body &&
          <p className='link_reviews'><a href='/reviews'>Читать далее</a></p>
        }
      </div>
    )
  }

  render() {
    let feedback = this.props.feedback
    return (
      <div className='cell small-12 medium-6'>
        <div className='review_block'>
          <div className='review_icon'></div>
          {this._prepareBody(feedback)}
          <div className='review_author'>
            <div className='author_name'>{feedback.name}</div>
            <div className='author_image'>
              {this._prepareImage(feedback)}
            </div>
          </div>
        </div>
      </div>
    )
  }
}