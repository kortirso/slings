import React from 'react';
import Feedback from 'components/feedbacks_box/feedback';
import "foundation-sites";
const $ = require("jquery");

export default class FeedbacksBox extends React.Component {

    constructor() {
        super();
        this.state = {
            feedbacksList: []
        }
    }

    componentWillMount() {
        this._fetchFeedbacksList();
    }

    _fetchFeedbacksList() {
        $.ajax({
            method: 'GET',
            url: 'feedbacks.json',
            success: (data) => {
                this.setState({feedbacksList: data.feedbacks});
            }
        });
    }

    _prepareFeedbacksList() {
        return this.state.feedbacksList.map((feedback) => {
            return (
                <Feedback feedback={feedback} key={feedback.id} />
            );
        });
    }

    render() {
        return (
            <div className='feedbacks'>
                <h2>Отзывы наших клиентов</h2>
                <div className='grid-x'>
                    {this._prepareFeedbacksList()}
                </div>
            </div>
        );
    }
}