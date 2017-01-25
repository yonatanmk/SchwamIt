import ReviewList from 'components/ReviewList';
import Review from 'components/Review';

describe('ReviewList', () => {
  let wrapper;
  let currentUser;
  let reviews;
  let users;
  let item;

  beforeEach(() => {
    users = [
      {
        id: 1,
        username: "Tommy"
      },
      {
        id: 2,
        username: "Jason"
      }
    ]
    currentUser = users[0]
    item = {
      id: 1,
      title: "Power Rangers",
      description: "Go Go",
      user: currentUser
    }
    reviews = [
      {
        id: 1,
        rating: 5,
        body: "Cool beans",
        user: users[0]
      },
      {
        id: 2,
        rating: 3,
        body: "It's okay.",
        user: users[1]
      }
    ]
    spyOn(ReviewList.prototype, 'componentDidMount').and.callThrough();
    spyOn(ReviewList.prototype, 'handleDeleteReview').and.callThrough();
    spyOn(ReviewList.prototype, 'handleVote').and.callThrough();
    wrapper = mount(<ReviewList />);
  });

  it('should invoke componentDidMount', () => {
    expect(ReviewList.prototype.componentDidMount).toHaveBeenCalled();
  });

  it('should have the initial state', () => {
    expect(wrapper.state()).toEqual({
      currentUser: null,
      reviews: [],
      users: [],
      itemId: null
    });
  });

  it('should have the given state', () => {
    wrapper.setState({
      currentUser: currentUser,
      reviews: reviews,
      users: users,
      itemId: item.id
    })

    expect(wrapper.state()).toEqual({
      currentUser: currentUser,
      reviews: reviews,
      users: users,
      itemId: item.id
    });
  });

  describe('handleVote', () => {
    beforeEach(() => {
      setTimeout(() => {
        wrapper.setState({
          currentUser: currentUser,
          reviews: reviews,
          users: users,
          itemId: item.id
        });
      },0)
    });
    it('should be invoked when the Like button is pushed', done => {
      setTimeout(() => {
        console.log(wrapper.state().reviews)
        let pagaraph = wrapper.find({id: "like-2"})
        console.log(paragraph)
        // expect(wrapper.find('p')).to.have.length(3);
        done();
      }, 0);
    })
  });

});
