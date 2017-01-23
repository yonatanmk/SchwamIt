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
    if (this.props.currentUser) {
      like = <div className="button success" onClick={this.props.handleUpVote}>
              <i className="fa fa-thumbs-o-up" aria-hidden="true"></i>
             </div>
      dislike = <div className="button alert" onClick={this.props.handleDownVote}>
                  <i className="fa fa-thumbs-o-down" aria-hidden="true"></i>
                </div>
      if (this.props.currentUser.id === this.props.user.id) {
        edit = <div className="button">
                 <a href={`/items/${this.props.itemId}/reviews/${this.props.id}/edit`} >Edit Review</a>
               </div>
        destroy = <div className="button" onClick={this.props.handleDeleteReview}>Delete Review</div>
      }
    }
    return(
      <div>
        <p>{this.props.rating}/5 - {this.props.user.username}</p>
        {body}
        <div>
          {this.props.score}
          {like}
          {dislike}
          {edit}
          {destroy}
        </div>
      </div>
    )
  }
}

export default Review;
