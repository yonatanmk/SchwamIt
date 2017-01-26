import React, { Component } from 'react';

class Review extends Component {
  constructor(props) {
    super(props);
    this.state = {};
  }

  render() {
    debugger;
    let body = null;
    let like = null;
    let dislike = null;
    let edit = null;
    let destroy = null;

    if (this.props.body) {
      body = <p>{this.props.body}</p>;
    }
    if (this.props.currentUser) {
      like =  <div
                className="button upvote review-button"
                onClick={this.props.handleUpVote}
                id={`like-${this.props.id}`}
              >
                <i className="fa fa-thumbs-o-up" aria-hidden="true"></i>
             </div>;
      dislike = <div
                  className="button downvote review-button"
                  onClick={this.props.handleDownVote}
                  id={`dislike-${this.props.id}`}
                >
                  <i className="fa fa-thumbs-o-down" aria-hidden="true"></i>
                </div>;
      if (this.props.currentUser.id === this.props.user.id) {
        edit =  <div
                  className="button edit-review review-button"
                  id={`edit-${this.props.id}`}
                >
                  <a href={`/items/${this.props.itemId}/reviews/${this.props.id}/edit`}>
                    Edit Review
                  </a>
               </div>;
        destroy = <div
                    className="button delete-review review-button"
                    onClick={this.props.handleDeleteReview}
                    id={`destroy-${this.props.id}`}
                  >
                    Delete Review
                  </div>;
      }
    }

    let scoreClass="voteBox "
    if (this.props.score > 0) {
      scoreClass+="goodScore"
    } else if (this.props.score < 0) {
      scoreClass+="badScore"
    }
    else {
      scoreClass+="neutralScore"
    }

    return(
      <div className='review-box'>
        <div>
            <h4>Review by <img src={this.props.user.profile_photo.thumb.url}/> {this.props.user.username} </h4>
          <div className={scoreClass}>
            <h5 className='score-text'>Score: {this.props.score}</h5>
          </div>
          <h5>Rating: {this.props.rating}/5</h5>
          {body}
          <div className='review-buttons'>
            {like}
            {dislike}
            {edit}
            {destroy}
          </div>
        </div>
      </div>
    );
  }
}

export default Review;
