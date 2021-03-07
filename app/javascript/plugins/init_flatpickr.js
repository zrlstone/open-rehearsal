import flatpickr from "flatpickr";

const today = new Date();

const tomorrow = new Date(today);

tomorrow.setDate(tomorrow.getDate() + 1);


flatpickr('.datetime-input', {
                                enableTime: true,
                                minDate: tomorrow,
                                altInput: true,
                                altFormat: "F j, Y H:i",
                                minTime: "09:00",
                                maxTime: "22:30"
                              });


