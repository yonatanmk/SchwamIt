import React from 'react';

const SearchForm = props => {
  let handleChange = (event) => props.handleSearch(event.target.value);

  let addItem = null;
  if (props.signedIn) {
    addItem = <u><a href="/items/new">Add a new Thing</a></u>;
  } else {
    addItem = <p>Sign in to Submit a Thing</p>;
  }

  return(
    <div className='content-box'>
      <h1>All The Nineties Things</h1>
      <input type='text' onChange={handleChange} placeholder="Search" />
      {addItem}
    </div>
  );
};

export default SearchForm;
