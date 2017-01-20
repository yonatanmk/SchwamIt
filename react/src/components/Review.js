import React, { Component } from 'react';

class Review extends Component {
  constructor(props) {
    super(props)
    this.state = {}
  }

  render() {
    return(
      <h4>{this.props.body}</h4>
    )
  }
}

export default Review;
