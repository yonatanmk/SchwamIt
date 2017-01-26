import React, { Component } from 'react';

class ItemList extends Component {
  constructor(props) {
    super(props);
    this.state = {
      items: null
    };

    this.componentDidMount = this.componentDidMount.bind(this);
    this.getItems = this.getItems.bind(this);
  }

  componentDidMount() {
    this.getItems();
    setInterval(this.getItems, 3000);
  }

  getItems () {
    fetch(`/api/v1/items`, {
      credentials: 'same-origin'
    })
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
        this.setState({
          items: body.items
        });
      });
  }

  render() {
    let items = '';
    if (this.state.items) {
      items = this.state.items.map((item) => {
        let className = 'small-2 large-4 column list-item-box';
        if (item == this.state.items[this.state.items.length - 1]) {
          className += ' end';
        }
        return (
          <div key={item.id} className={className}>
            <a href={`/items/${item.id}`}>
              <div className='list-item-content'>
                <p><b>{item.title}</b></p>
                <div>
                  <img src={item.image.url} alt="no image" className='index-item-image-box'/>
                </div>
              </div>
            </a>
          </div>
        );
      });
    }

    return(
      <div className='itemList'>
        {items}
      </div>
    );
  }
}

export default ItemList;
