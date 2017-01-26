
describe('Reviews section', () => {
  let wrapper;

  beforeEach(() => {
    spyOn(global, 'fetch').and.returnValue(
      createResponseFromFixture('bars/barsIndex')
    );
  });

  afterEach(() => {
    wrapper.unmount();
  });
});
