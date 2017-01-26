import React from 'react';

const SearchForm = props => {
  let handleChange = (event) => props.handleSearch(event.target.value);

  return(
    <div className='content-box'>
      <input type='text' onChange={handleChange} placeholder="Search" />
    </div>
  );
};

export default SearchForm;
