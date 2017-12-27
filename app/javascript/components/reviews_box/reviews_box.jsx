import React from 'react';
import Review from 'components/reviews_box/review';

export default class ReviewsBox extends React.Component {
    constructor() {
        super();
        this.state = {
            reviewsList: [],
            nextPage: 1
        }
    }

    componentWillMount() {
        this._fetchReviewsList();
    }

    _fetchReviewsList() {
        $.ajax({
            method: 'GET',
            url: `reviews.json?page=${this.state.nextPage}`,
            success: (data) => {
                this.setState({reviewsList: this.state.reviewsList.concat(data.reviews), nextPage: data.next_page});
            }
        });
    }

    _prepareProductsList() {
        return this.state.reviewsList.map((review) => {
            return (
                <Review review={review} key={review.id} />
            );
        });
    }

    render() {
        return (
            <div className='grid-x'>
                <div className='cell small-10 small-offset-1'>
                    <h2>Отзывы</h2>
                    {this._prepareProductsList()}
                </div>
            </div>
        );
    }
}