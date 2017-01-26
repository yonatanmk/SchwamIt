import simulateIfPresent from './simulateIfPresent';

let clickButton = (buttonId, wrapper) => {
  let button = wrapper.find(`#${buttonId}`);
  simulateIfPresent(button, 'click', { button: 0 });
}

export default clickButton;
