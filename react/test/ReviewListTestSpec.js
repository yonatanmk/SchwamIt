import ReviewList from '../src/components/ReviewList';
import Review from '../src/components/Review';

describe('Review List', () => {
  let wrapper;

  afterEach(() => {
    wrapper.unmount();
  });

  beforeEach(() => {
    spyOn(global, 'fetch').and.callFake(url => {
      if (url.endsWith("json")) {
        return createResponseFromFixture('items/itemsIndex')
      }
    });
    spyOn(ReviewList.prototype, 'handleDeleteReview').and.callFake(id => {
      let ii = 0;
      let newReviews = [];
      let newUsers = [];
      for (let review of wrapper.state().reviews) {
        if (review.id != id) {
          newReviews.push(review);
          newUsers.push(wrapper.state().users[ii]);
        }
        ii++;
      }

      wrapper.setState({
        reviews: newReviews,
        users: newUsers
      });
    });
    spyOn(ReviewList.prototype, 'handleVote').and.callFake((action, review) => {
      if (action === "up_vote") {
        let newReviews = [];
        let id = review.id
        for (let review of wrapper.state().reviews) {
          if (review.id === id) {
            review.score++;
          }
          newReviews.push(review);
        }

        wrapper.setState({
          reviews: newReviews,
        });
      } else if (action === "down_vote") {
        let newReviews = [];
        let id = review.id
        for (let review of wrapper.state().reviews) {
          if (review.id === id) {
            review.score--;
          }
          newReviews.push(review);
        }

        wrapper.setState({
          reviews: newReviews,
        });
      }
    });
  })

  describe("visiting an item's show page", () => {
    beforeEach(() => {
      wrapper = mount(
        <ReviewList />
      );
    });

    it('shows the body, rating, and author of all reviews', done => {
      setTimeout(() => {
        let pageText = wrapper.text();
        expect(pageText).toMatch('Reviews');

        expect(pageText).toMatch('Awesome cartoon');
        expect(pageText).toMatch('Stupid kids');
        expect(pageText).toMatch('Great entertainment');

        expect(pageText).toMatch('TJ');
        expect(pageText).toMatch('Finster');

        expect(pageText).toMatch('5/5');
        expect(pageText).toMatch('1/5');
        expect(pageText).toMatch('4/5');

        done();
      },0)
    })
  })

  describe("upvoting a review", () => {
    beforeEach(() => {
      wrapper = mount(
        <ReviewList />
      );
    });
    it('increases the score by one', done => {
      setTimeout(() => {
        clickOn('#like-1', wrapper);
      },0)

      setTimeout(() => {
        let score = wrapper.find('#review-1-score').text();

        expect(score).toMatch('Score: 1');
        done();
      },0)
    })
  });

  describe("downvoting a review", () => {
    beforeEach(() => {
      wrapper = mount(
        <ReviewList />
      );
    });
    it('decreases the score by one', done => {
      setTimeout(() => {
        clickOn('#dislike-1', wrapper);
      },0)

      setTimeout(() => {
        let score = wrapper.find('#review-1-score').text();

        expect(score).toMatch('Score: -1');
        done();
      },0)
    })
  });

  describe("deleting a review", () => {
    beforeEach(() => {
      wrapper = mount(
        <ReviewList />
      );
    });
    it('removes the review', done => {
      setTimeout(() => {
        clickOn('#destroy-3', wrapper);
      },0)

      setTimeout(() => {
        let pageText = wrapper.text();

        expect(pageText).toMatch('Awesome cartoon');
        expect(pageText).toMatch('Stupid kids');
        expect(pageText).not.toMatch('Great entertainment');

        done();
      },0)
    })
  });

});
