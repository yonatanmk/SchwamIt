import React, { Component } from 'react';

class Review extends Component {
  constructor(props) {
    super(props)
    this.state = {}
  }

  render() {
    let body = null;
    let like = null;
    let dislike = null;
    let edit = null;
    let destroy = null;

    if (this.props.body) {
      body = <p>{this.props.body}</p>
    }
    if (this.props.currentUserId) {
      like = <u onClick={this.props.handleUpVote}> Like</u>
      dislike = <u onClick={this.props.handleDownVote}> Dislike</u>
    }
    if (this.props.currentUserId === this.props.user.id) {
      edit = <u><a href={`/items/${this.props.itemId}/reviews/${this.props.id}/edit`} > Edit Review</a></u>
      destroy = <u onClick={this.props.handleDeleteReview}> Delete Review</u>
    }
    return(
      <div>
        <p>{this.props.rating}/5 - {this.props.user.username}</p>
        {body}
        <p>
          {this.props.score}
          {like}
          {dislike}
          {edit}
          {destroy}
        </p>
      </div>
    )
  }
}

export default Review;
