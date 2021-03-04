const instruments = document.querySelectorAll('.instrument-clickable');

const toggleActiveClass = (event) => {
  event.currentTarget.classList.toggle('active');
};

const toggleActiveOnClick = (instrument) => {
  instrument.addEventListener('click', toggleActiveClass);
};

instruments.forEach(toggleActiveOnClick);

export { toggleActiveClass };
export { toggleActiveOnClick };
