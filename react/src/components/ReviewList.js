import React, { Component } from 'react';
import Review from './Review';

class ReviewList extends Component {
  constructor(props) {
    super(props)
    this.state = {
      currentUserId: null,
      reviews: [],
      users: [],
      itemId: null
    }

    this.handleVote = this.handleVote.bind(this);
  }

  handleVote(action, review) {
    let data = {
      review_id: review.id,
      current_user_id: this.state.currentUserId
    }
    let jsonStringData = JSON.stringify(data);

    fetch(`/api/v1/reviews/${review.id}/${action}`, {
      method: 'post',
      headers: { 'Content-Type': 'application/json' },
      body: jsonStringData
    })
      .then(response => {
        if (response.ok) {
          return response;
        } else {
          let errorMessage = `${response.status} (${response.statusText})`,
          error = new Error(errorMessage);
          throw(error);
        }
      })
      .then(response => {
        fetch(`/api/v1/items/${this.state.itemId}.json`)
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
            let newReviews = body.reviews;
            let newUsers = body.users;
            this.setState({
              reviews: newReviews,
              users: newUsers,
            });
          });
      })
      .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  handleDeleteReview(reviewId) {
    fetch(`/api/v1/reviews/${reviewId}`, {
      method: 'delete',
    })
      .then(response => {
        if (response.ok) {
          return response;
        } else {
          let errorMessage = `${response.status} (${response.statusText})`,
          error = new Error(errorMessage);
          throw(error);
        }
      })
      .then(response => {
        fetch(`/api/v1/items/${this.state.itemId}.json`)
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
            let newReviews = body.reviews;
            let newUsers = body.users;
            this.setState({
              reviews: newReviews,
              users: newUsers,
            });
          });
      })
      .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  componentDidMount() {
    let newItemId = parseInt($('.item-title').first().attr("id"));
    let newCurrentUserId = null;
    if (!($('.user-id').first().attr("id") == "")) {
      newCurrentUserId = parseInt($('.user-id').first().attr("id"));
    }

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
        let newReviews = body.reviews;
        let newUsers = body.users;
        this.setState({
          currentUserId: newCurrentUserId,
          reviews: newReviews,
          users: newUsers,
          itemId: newItemId
        });
      });
  }

  render() {
    let ii = -1;
    let reviews = this.state.reviews.map((review) => {
      ii ++;

      let handleUpVote = () => {
        return(
          this.handleVote('up_vote', review)
        )
      }

      let handleDownVote = () => {
        return(
          this.handleVote('down_vote', review)
        )
      }

      let handleDeleteReview = () => {
        return(
          this.handleDeleteReview(review.id)
        )
      }

      return(
        < Review
          key = { review.id }
          id = { review.id }
          rating = { review.rating }
          body = { review.body }
          score = { review.score }
          user = { this.state.users[ii] }
          handleUpVote = { handleUpVote }
          handleDownVote = { handleDownVote }
          handleDeleteReview = { handleDeleteReview }
          currentUserId = { this.state.currentUserId }
          itemId = { this.state.itemId }
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
