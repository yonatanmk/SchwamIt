import React, { Component } from 'react';
import Review from './Review';

class ReviewList extends Component {
  constructor(props) {
    super(props)
    this.state = {
      reviews: [],
      itemId: null
    }
  }

  componentDidMount() {
    let newItemId = parseInt($('.item-title').first().attr("id"));

    fetch(`/api/v1/items/${newItemId}.json`)
      .then(response => {
        if (response.ok) {
          return response;
        } else {
          let errorMessage = `${response.status}, (${response.statusText})`;
          let error = new Error(errorMessage);
          throw(error);
        }
      })
      .then(response => response.json())
      .then(body => {
        let newReviews = body;
        debugger;
        this.setState({
          reviews: newReviews,
          itemId: newItemId
        });
      });
  }

  render() {
    let reviews = this.state.reviews.map((review) => {
      return(
        < Review
          key = { review.id }
          id = { review.id }
          rating = { review.rating }
          body = { review.body }
          score = { review.score }
        />
      )
    });
    return(
      <div>
        <h3>Reviews</h3>
        {reviews}
      </div>
    )
  }
}

export default ReviewList;
