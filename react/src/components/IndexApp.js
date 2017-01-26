import React, { Component } from 'react';
import ItemList from './ItemList';
import SearchForm from './SearchForm';

class IndexApp extends Component {
  constructor(props) {
    super(props);
    this.state = {
      query: ""
    };

    this.handleSearch = this.handleSearch.bind(this);
  }

  handleSearch (query) {
    this.setState({query});
  }

  render() {
    return(
      <div>
        <SearchForm handleSearch={this.handleSearch}/>
        <ItemList query={this.state.query}/>
      </div>
    );
  }
}

export default IndexApp;
